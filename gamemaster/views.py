import random
import math
from django.shortcuts import get_object_or_404, render
from django.core.urlresolvers import reverse_lazy
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView
from django.utils import timezone
from django.shortcuts import redirect
from operator import itemgetter
from players.models import *

def close(request):
    return render(request, 'closewindow.html')

ActionClasses = [
    AidAction,
    PrimogensAidAction,
    GhoulAidAction,
    InvestigateCharacterDowntimeActions,
    ConserveInfluence,
    ConserveDomain,
    InfluenceSteal,
    InfluenceDestroy,
    MentorAttribute,
    MentorDiscipline,
    MentorSpecialization,
    LearnAdvantage,
    LearnAttribute,
    LearnDiscipline,
    LearnSpecialization,
    InvestGhoul,
    InvestEquipment,
    InvestWeapon,
    InvestHerd,
    InvestHaven,
    NeglectDomain,
    PatrolDomain,
    KeepersQuestion,
    PrimogensQuestion,
    InvestigateCounterSpionage,
    InvestigateCharacterInfluence,
    InvestigateCharacterResources,
    InvestigatePhenomenon,
    InvestigateInfluence,    
    Rest,
    AssignXP,
    ]
    
AidClasses = [
    AidAction,
    PrimogensAidAction,
    GhoulAidAction]
    
ConserveClasses = [
    ConserveInfluence,
    ConserveDomain]
    
OtherClasses = [
    InfluenceSteal,
    InfluenceDestroy,
    MentorAttribute,
    MentorDiscipline,
    MentorSpecialization,    
    LearnAdvantage,
    LearnAttribute,
    LearnDiscipline,
    LearnSpecialization,
    InvestGhoul,
    InvestEquipment,
    InvestWeapon,
    InvestHerd,
    InvestHaven,
    NeglectDomain,
    PatrolDomain,
    KeepersQuestion,
    PrimogensQuestion,
    AssignXP]
    
InvestigateClasses = [
    InvestigateCharacterDowntimeActions,
    InvestigateCounterSpionage,
    InvestigateCharacterInfluence,
    InvestigateCharacterResources,
    InvestigatePhenomenon,
    InvestigateInfluence]    
    
    
def handle_influence():    
       for influence in Influence.objects.all():
    
        cam = fact_recievers(influence)
        
        wannabe_masters = []
        wannabe_contenders = [] 
        
        for action in InfluenceSteal.objects.filter(
            session=session,
            influence=influence,
            resolved=PENDING):
        
            hook = Hook.objects.get(name=action.name)
            
            lost_hooks = LostHook.objects.filter(
                session=session,
                character=action.character,
                hook__influence=influence)
                
            lost = lost_hooks != []
            
            char = (action.character,lost,action.result)
        
            level = action.character.influence_level(influence)
            if level == 0:
                action.character.add(hook)
                action.resolved = RESOLVED
            if level == 1:
                if action.character in wannabe_contenders:
                    wannabe_masters.append(char)
                else:    
                    wannabe_contenders.append(char)
            if level == 2:
                wannabe_masters.append(char)
                           
        if cam['master'] == None and wannabe_masters != []:
            wannabe_masters = sorted(wannabe_masters,key=itemgetter(1))
            wannabe_masters = sorted(wannabe_masters,key=itemgetter(2))
            wannabe_masters.reverse()

            new_master = wannabe_masters.pop()[0]
            prnt(new_master)
            
            actions = InfluenceSteal.objects.filter(
                session=session,
                influence=influence,
                resolved=PENDING,
                character=new_master)
               
            for action in actions:
                hook = Hook.objects.get(name=action.name)
                new_master.hooks.add(hook)
                action.resolved = RESOLVED
        
        cam = fact_recievers(influence)
        places = 2 - len(cam['contenders'])
        if cam['master'] == None:
            places += 1
        
        if places>0  and wannabe_contenders != []:
            wannabe_contenders = sorted(wannabe_contenders,key=itemgetter(1))
            wannabe_contenders = sorted(wannabe_contenders,key=itemgetter(2))
            
            new_contenders = wannabe_contenders[0:places]

            for new_contender in new_contenders:            
                actions = InfluenceSteal.objects.filter(
                    session=session,
                    influence=influence,
                    resolved=PENDING,
                    character=new_contender)
                    
                for action in actions:
                    hook = Hook.objects.get(name=action.name)
                    new_contender.hooks.extend(hook)
                    action.resolved = RESOLVED
    

def resolve_reports(request, session):
    for report in EventReport.objects.filter(session=session):
        report.resolve()
    for report in ChangeGoals.objects.filter(session=session):
        report.resolve()        
    return redirect('characters', session=session)

def resolve_actions(request, session):
    for ActionClass in AidClasses:
        for action in ActionClass.objects.filter(session=session):
            action.resolve()
            
    for ActionClass in ConserveClasses:
        for action in ActionClass.objects.filter(session=session):
            action.resolve()        

    for ActionClass in OtherClasses:
        for action in ActionClass.objects.filter(session=session):
            action.resolve()        
            
        
    return redirect('actions', session=session)
    

def resolve_investigation_actions(request, session):
 
    for ActionClass in InvestigateClasses:
        for action in ActionClass.objects.filter(session=session):
            action.resolve()        
            
    for action in Rest.objects.filter(session=session):
            action.resolve()  
        
    return redirect('actions', session=session)    
    
    
def resolve_feedings(request, session):
    feedings = Feeding.objects.filter(session=session)
    for feeding in feedings:
        feeding.resolve()
        
    domains = Domain.objects.all()
    for domain in domains:
        domain.resolve(session)    
        
    return redirect('feedings', session=session)

def resolve_characters(request, session):
   # for report in ExpDisciplineSpending.objects.filter(session=session):
   #     report.resolve()
   # for report in ExpAttributeSpending.objects.filter(session=session):
   #     report.resolve()
  #  for report in HealingReport.objects.filter(session=session):
  #      report.resolve()
    for char in Character.objects.all():
        char.resolve(session)
        
    return redirect('characters', session=session)




def resolve_action(request, pk):
    actions = []
    for ActionClass in ActionClasses:
        actions += list(ActionClass.objects.filter(pk=pk))
    for action in actions:
        action.resolve()
    print ("resolving")
    return redirect('action', pk)


def assign_influence(request):

    chars = {}
    for char in Character.objects.all():
        wants = InfluenceWant.objects.filter(character=char)
        total = 0
        for want in wants:
            want.final = False
            want.wanted += want.dislodged
            want.dislodged = 0
            want.save()
            total += want.wanted
            
        chars[char.name] = total
    
    inf_list = []
    for inf in Influence.objects.all():
        wants = InfluenceWant.objects.filter(influence=inf)
        inf_list.append((inf,wants.count()))    
    inf_list.sort(key=lambda inf:inf[1], reverse=True)
    
    print (inf_list)
    print (chars)
    
    masters = []
    mastered = []
    
    
    for inf in inf_list:
        wants = InfluenceWant.objects.filter(influence=inf[0])
        taken = [want for want in wants if want.wanted == 3 and want.elder]
        if taken != []:
            for take in taken:
                take.final = True
            mastered.append(inf) 
            pretenders = [{'want':want,
                            'total':chars[want.character.name],
                            'missing': not want.character in masters,
                            'age': age_to_number[want.character.age.name],
                            'rnd': random.random() } 
                            for want in wants if want.wanted == 3 and not want.elder]
            for w in pretenders:
                if not w['want'].final:
                    w['want'].wanted -= 1
                    w['want'].dislodged += 1
                    w['want'].save() 
        else:
            pretenders = [{'want':want,
                            'total':chars[want.character.name],
                            'missing': not want.character in masters,
                            'age': age_to_number[want.character.age.name],
                            'rnd': random.random() } 
                            for want in wants if want.wanted == 3 and not want.elder]
            if len(pretenders) > 0:
                pretenders.sort(key=inforder, reverse=True)
                mastering = pretenders[0]['want']
                mastering.final=True
                mastering.save()
                masters.append(mastering.character)
                mastered.append(inf)
                chars[mastering.character.name] -= 3
                for w in pretenders:
                    if not w['want'].final:
                        w['want'].wanted -= 1
                        w['want'].dislodged += 1
                        w['want'].save()
    
    for inf in inf_list:
        wants = InfluenceWant.objects.filter(influence=inf[0])
        pretenders = [{'want':want,
                        'total':chars[want.character.name],
                        'missing': not want.character in masters,
                        'age': age_to_number[want.character.age.name],
                        'rnd': random.random() } 
                        for want in wants if want.wanted == 2]
        if len(pretenders) > 0:
            pretenders.sort(key=inforder, reverse=True)
            mastering = pretenders[0]['want']            
            mastering.final=True
            mastering.save()

            if len(pretenders) > 1:
                mastering = pretenders[1]['want']            
                mastering.final=True
                mastering.save()
            
            if len(pretenders) > 2 and not inf in mastered:
                mastering = pretenders[2]['want']            
                mastering.final=True
                mastering.save()
            
            masters.append(mastering.character)
            chars[mastering.character.name] -= 2
            for w in pretenders:
                if not w['want'].final:
                    w['want'].wanted -= 1
                    w['want'].dislodged += 1
                    w['want'].save()    
    
    players = {}
    influences = {}
            
    for want in InfluenceWant.objects.all():
        want.final = True
        want.save()
        
    chars = []  
    for char in Character.objects.all():    
        dislodged = 0
        inf = []
        for want in InfluenceWant.objects.filter(character=char):
            inf.append({'name':want.influence.name, 'val': want.wanted})
            dislodged += want.dislodged
        inf.append({'name':'dislodged', 'val': dislodged})
        chars.append({'name':char.name, 'infls': inf})
    
    infls = []    
    for inf in Influence.objects.all():
        chrs = []
        for want in InfluenceWant.objects.filter(influence=inf):
            chrs.append({'name':want.character.name, 'val': want.wanted})
            print (chrs)
        infls.append( {'name':inf.name, 'chars': chrs})
                       
    return render(request, 'influence_want_list.html', {'chars':chars,'infls':infls})  
    
age_to_number = {'Novis':0,'Neonat':1,'Ancilla':2,'Äldste':3}    
    
def inforder(w):
    return (w['missing'],w['total'],w['age'],w['rnd'])
    
    
def assign_rumors(request, session):

    rumors = Rumor.objects.all()
    for rumor in rumors:
        rumor.recipients = []

    # for each <influence> in influences
    influences = Influence.objects.all()
    for influence in influences:

        # get all unassigned rumors, UR, in <influence>
        unassigned = Rumor.objects.filter(session=session,
                                          recipients=None,
                                          influence=influence,
                                     rumor_type=RUMOR_INFLUENCE)

        # get all characters that requires more rumors.
        
        
        characters = [h.master.all()[0] 
                      for h in Hook.objects.filter(influence=influence) 
                      if list(h.master.all()) != []
                      and h.master.all()[0].user != None]
        
        random.shuffle(characters)

        for rumor in unassigned:
            if len(characters) == 0:
                break
            character = characters.pop()
            rumor.recipients.add(character)
            rumor.save()

        def assign(rumor,characters):
            character = characters.pop()
            
            char_rumors = set(
                Rumor.objects.filter(session=session,
                                     recipients=character,
                                     influence=influence,
                                     rumor_type=RUMOR_INFLUENCE))
            if not rumor in char_rumors:        
                rumor.recipients.add(character)
                rumor.save()
                return characters
            else:
                recipient = False
                for char in characters:
                    char_rumors = set(
                        Rumor.objects.filter(session=session,
                                     recipients=character,
                                     influence=influence,
                                     rumor_type=RUMOR_INFLUENCE))
                    if not rumor in char_rumors:                 
                       recipient = True
                characters.append(character)
                if recipient:        
                    return assign(rumor,characters)    
                else:
                    return characters
                
        for rumor in unassigned:
            if len(characters) == 0:
                break
            characters = assign(rumor,characters)
            

        if len(characters) != 0:
            # when no more unique rumors assign already assigned rumors
            all_rumors = set(Rumor.objects.filter(
                session=session,
                influence=influence,
                rumor_type=RUMOR_INFLUENCE))

            for character in characters:
                char_rumors = set(
                    Rumor.objects.filter(session=session,
                                     recipients=character,
                                     influence=influence,
                                     rumor_type=RUMOR_INFLUENCE))
                rumors = all_rumors - char_rumors
                if len(rumors) > 0:
                    rumor = random.sample(rumors, 1)[0]
                    rumor.recipients.add(character)
                    rumor.save()

        # assign facts
        facts = Rumor.objects.filter(session=session,
                                     influence=influence,
                                     rumor_type=RUMOR_FACT)
                                     
        characters = [h.master.all()[0] 
              for h in Hook.objects.filter(influence=influence) 
              if list(h.master.all()) != []]
        

        
        for char in set(characters):
            if len([c for c in characters if c == char])>1:
                for fact in facts:
                    fact.recipients.add(char)
                    fact.save()

    # assign animal rumors
    animals = Rumor.objects.filter(session=session,
                                 rumor_type=RUMOR_ANIMAL)
                                 
    characters =  list(Character.objects.filter(disciplines__discipline__name="Animalism"))
    
    for i in range(1,math.ceil((len(characters)/len(animals)))):
        for rumor in animals:
            if len(characters) == 0:
                break
            character = characters.pop()
            rumor.recipients.add(character)
            rumor.save()

    return redirect('rumors', session=session)

def influence_list(request):
    influences = [fact_recievers(influence) for influence in Influence.objects.all()]
    data = {'influence_list':influences}    
    prnt(data)
    return render(request, 'influence_list.html', data)    
        

def character_sheet(request, session, char):
    session = get_object_or_404(Session, pk=session)
    character = Character.objects.get(pk=char)
    influences = character.get_influence_list()
    influence_list = [fact_recievers(influence) for influence in influences]
    data = {'session': session,
            'character': character,
            'rumor_list': Rumor.objects.filter(session=session,
                                               recipients=character),
            'influence_list':influence_list,
            'submitted': character.submitted(session),
            'request': request}
    return render(request, 'session.html', data)

def character(request, session, character):
    context = {
        'character': get_object_or_404(Character,id=character),
        'session': get_object_or_404(Character,id=character),
        'actions': Action.objects.filter(character=character,session=session),
        'disciplines': Action.objects.filter(character=character,session=session),
        'feedings': Feeding.objects.filter(character=character,session=session),
    }
    return render(request, 'character.html', context)

def character_display(request, character):
    return render(request, 'character_display.html',
                  {'character': Character.objects.get(pk=character)}) 

def toggle_session(request, session):
    session_obj = get_object_or_404(Session, id=session)
    session_obj.is_open = not session_obj.is_open
    session_obj.save()
    if session_obj.is_open:
        for goal in Goal.objects.all():
            goal.create_change(session_obj)
        if Feeding.objects.filter(session=session_obj.previous).exists():
            for feed in Feeding.objects.filter(session=session_obj.previous):
                feed.duplicate(session_obj)
    else:
        for char in Character.objects.all():
            char.status=0
            char.save()
        for update in StatusAssignment.objects.filter(session=session):
            update.target.status += update.status
            update.target.save()
    return redirect('sessions')


class SessionListView(ListView):
    model = Session
    template_name = 'list.html'

    def get_context_data(self, **kwargs):
        context = super(SessionListView, self).get_context_data(**kwargs)
        context['characters'] = Character.objects.all()
        context['type'] = 'sessions'
        context['sessions'] = self.object_list
        return context


class ActionListView(ListView):
    model = Action
    template_name = 'list.html'

    def get_queryset(self):
        self.session = get_object_or_404(Session, id=self.kwargs['session'])
        return Action.objects.filter(session=self.session)

    def get_context_data(self, **kwargs):
        context = super(ActionListView, self).get_context_data(**kwargs)
        session_name = get_object_or_404(Session,
                                         id=self.kwargs['session']).name
        context['session_name'] = session_name
        context['characters'] = Character.objects.all()
        context['action_types'] = ActionType.objects.all()
        context['type'] = 'actions'
        context['actions'] = self.object_list
        context['session_id'] = self.kwargs['session']
        return context

class RumorListView(ListView):
    model = Rumor
    template_name = 'list.html'

    def get_queryset(self):
        self.session = get_object_or_404(Session, id=self.kwargs['session'])
        return Rumor.objects.filter(session=self.session)

    def get_context_data(self, **kwargs):
        context = super(RumorListView, self).get_context_data(**kwargs)
        session_name = get_object_or_404(Session,
                                         id=self.kwargs['session']).name
        context['session_name'] = session_name
        context['characters'] = Character.objects.all()
        context['influences'] = Influence.objects.all()
        context['type'] = 'rumors'
        context['rumors'] = self.object_list
        context['session_id'] = self.kwargs['session']
        return context
  

class CharacterListView(ListView):
    model = Character
    template_name = 'list.html'

    def get_context_data(self, **kwargs):
        context = super(CharacterListView, self).get_context_data(**kwargs)
        session = get_object_or_404(Session, id=self.kwargs['session'])
        context['session'] = session
        context['clans'] = Clan.objects.all()
        context['ages'] = Age.objects.all()
        context['type'] = 'characters'
        for c in self.object_list:
            c.has_submitted = c.submitted(session)
        context['characters'] = self.object_list
        context['session_id'] = self.kwargs['session']
        return context


class DisciplineListView(ListView):
    model = ActiveDisciplines
    template_name = 'list.html'

    def get_queryset(self):
        self.session = get_object_or_404(Session, id=self.kwargs['session'])
        return ActiveDisciplines.objects.filter(session=self.session)

    def get_context_data(self, **kwargs):
        context = super(DisciplineListView, self).get_context_data(**kwargs)
        session_name = get_object_or_404(Session,
                                         id=self.kwargs['session']).name
        context['session_name'] = session_name
        context['type'] = 'disciplines'
        context['disciplines'] = self.object_list
        return context


class FeedingListView(ListView):
    model = Feeding
    template_name = 'list.html'

    def get_queryset(self):
        self.session = get_object_or_404(Session, id=self.kwargs['session'])
        return Feeding.objects.filter(session=self.session)

    def get_context_data(self, **kwargs):
        context = super(FeedingListView, self).get_context_data(**kwargs)
        session_name = get_object_or_404(Session,
                                         id=self.kwargs['session']).name
        context['session_name'] = session_name
        context['characters'] = Character.objects.all()
        context['domains'] = Domain.objects.all()
        context['type'] = 'feedings'
        context['feedings'] = self.object_list 
        context['session_id'] = self.kwargs['session']
        return context

class ActionUpdate(UpdateView):
    model = Action
    template_name = 'editor.html'
    fields = ['character', 'willpower','action_type', 'description', 'resolved']
    success_url = reverse_lazy('closewindow')

    def get_context_data(self, **kwargs):
        context = super(ActionUpdate, self).get_context_data(**kwargs)
        context['request'] = self.request
        context['enable_comments'] = True
        context['action_id'] = self.kwargs['pk']
        context['action_edit'] = True
        session = self.object.session
        character = self.object.character
        adisc = ActiveDisciplines.objects.filter(session=session,
                                                 character=character)
        if len(adisc) > 0:
            disc = adisc[0]
            context['extra_title'] = 'Active Disciplines'
            context['extra_data'] = ', '.join(
                [d.discipline.name for d in disc.disciplines.all()])
        return context


class FeedingUpdate(UpdateView):
    model = Feeding
    template_name = 'editor.html'
    fields = ['character', 'domain', 'feeding_points', 'discipline',
              'description', 'has_good_method','resolved']
    success_url = reverse_lazy('closewindow')

    def get_context_data(self, **kwargs):
        context = super(FeedingUpdate, self).get_context_data(**kwargs)
        context['request'] = self.request
        context['enable_comments'] = True
        return context


class CharUpdate(UpdateView):
    model = Character
    template_name = 'editor.html'
    success_url = reverse_lazy('closewindow')
    fields = ['name', 'user', 'clan', 'disciplines', 'titles', 'age',
              'resources']

    def get_context_data(self, **kwargs):
        context = super(CharUpdate, self).get_context_data(**kwargs)
        context['request'] = self.request
        return context


class RumorUpdate(UpdateView):
    model = Rumor
    template_name = 'editor.html'
    fields = ['influence', 'rumor_type', 'description', 'gm_note',
              'recipients']
    success_url = reverse_lazy('closewindow')

    def get_context_data(self, **kwargs):
        context = super(RumorUpdate, self).get_context_data(**kwargs)
        context['request'] = self.request
        return context
