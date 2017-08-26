# -*- coding: utf-8 -*-

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic
from django.contrib.auth.decorators import login_required, user_passes_test
from django.db import models
from formtools.wizard.views import SessionWizardView
from django.utils.decorators import method_decorator
from django.forms.models import (modelformset_factory,modelform_factory,model_to_dict)
from django.contrib.auth import logout
from django.core.exceptions import PermissionDenied
from django.shortcuts import redirect
from django.core import serializers
from players import forms
from players.models import *
from django.forms import formset_factory,CheckboxSelectMultiple,HiddenInput,CheckboxInput,Select,RadioSelect, TextInput,Textarea

def logout_view(request):
    logout(request)
    return redirect('login')
    
def undefined_character(request):
    if hasattr(request.user,'character'):
        return not request.user.character.defined
    else:
        return False
        
MELEETABLE = ['','Knife','Machete','Sword']
FIREARMSTABLE = ['','Light Gun','Heavy Gun','Assult Rifle']        
    
@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def profile(request):
    if undefined_character(request):
       return redirect('make character')
    character = request.user.character
    goals = Goal.objects.filter(character=character)
    ghouls = Ghoul.objects.filter(master=character)
    attributes = AttributeRating.objects.filter(character=character)
    disciplines = DisciplineRating.objects.filter(character=character)
    advantages = AdvantageRating.objects.filter(character=character)
    equipments = Equipment.objects.filter(owner=character)
   
    return render(request, 'profile.html',
                  {'character': character,
                   'attributes':attributes,
                   'disciplines':disciplines,
                   'advantages':advantages,
                   'flaw':character.get_flaw(),
                   'blood_max':BLOODTABLE[character.generation],
                   'ghouls':ghouls,
                   'ghouls_name': [g.name for g in ghouls],
                   'melee_name':MELEETABLE[character.melee],
                   'firearms_name':FIREARMSTABLE[character.firearms],
                   'equipments_name': [e.name for e in equipments],
                   'equipments': equipments,
                   'season': Season.objects.get(is_open=True),
                   'goals':goals})
                   
@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def influences(request):
    if undefined_character(request):
       return redirect('make character')
    character = request.user.character
         
    influences = character.get_influence_list()
    influence_list = [fact_recievers(influence) for influence in influences]
    return render(request, 'influences.html',
                  {'character': character,
                   'influence_list': influence_list,
                   })


@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def sessions(request):
    if undefined_character(request):
       return redirect('make character')
    character = request.user.character
    session_state = []
    for session in Session.objects.order_by('name').all():
        state = session.resolved_state(character)
        session_state.append({'state': state, 'session': session})
         
    return render(request, 'sessions.html',
                  {'character': character,
                   'session_list': session_state})
                   
                   
@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def domains(request):
    if undefined_character(request):
       return redirect('make character')
    character = request.user.character
    
    domain_list = Domain.objects.all()
         
    return render(request, 'domains.html',
                  {'character': character,
                   'domain_list': domain_list})                   
                   
@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def domain(request,dom):
    if undefined_character(request):
       return redirect('make character')
    character = request.user.character
    domain = Domain.objects.get(pk=dom)
    if request.method == 'POST':
        form = forms.DomainForm(request.POST, instance=domain)
        if form.is_valid():
            form.save()
            return redirect('domains')
    else:
        form = forms.DomainForm(instance=domain)     
    return render(request, 'domain.html',
                  {'character': character,
                   'domain': domain,
                   'form':form})   
                   
                   
@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def characters(request):
    if undefined_character(request):
       return redirect('make character')
    character = request.user.character
    session_state = []
    for session in Session.objects.order_by('name').all():
        state = session.resolved_state(character)
        session_state.append({'state': state, 'session': session})
         
    characters = Character.objects.exclude(user=None)
    character_list = [char.info() for char in characters]

    return render(request, 'characters.html',
                  {'character': character,
                   'characters': character_list,
                   'session_list': session_state})
                   
@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def assign_status(request,):
    if undefined_character(request):
       return redirect('make character')
    else:   
        character = request.user.character
       
    if Session.objects.filter(is_open=True).exists()\
    and character.titles.filter(name='Harpya').exists():
        session = Session.objects.get(is_open=True)
    else:
       return redirect('characters') 
    
    stats = StatusAssignment.objects.filter(session=session)

    def get_old_stat(char):
    
        if stats.filter(target=char,assigner=character).exists():
            return stats.get(target=char,assigner=character).status
        else:
            return 1
        
    character_list = [{'target':char,'status': get_old_stat(char)} for char in Character.objects.all()]
        
    if request.method == 'POST':
        formset = forms.StatusFormSet()(request.POST,initial=character_list)
        if formset.is_valid():
            StatusAssignment.objects.filter(assigner=character,session=session).delete()
            for form in formset:            
                form.fill_save(character, session)
            return redirect('profile')        
    else:
        formset = forms.StatusFormSet()(initial=character_list)
        
            
    data = {'character': character,'forms':formset, 'session':session.id}
    
    return render(request, 'assign_status.html', data)

@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def session(request, session):
    session = get_object_or_404(Session, pk=session)
    character = request.user.character
    data = {'session': session,
            'character': character,
            'rumor_list': Rumor.objects.filter(session=session,
                                               recipients=character),
            'submitted': character.submitted(session),
            'request': request}
    return render(request, 'session.html', data)


@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def wizard(request, session):
    character = request.user.character
    data = {
        'user': request.user,
        'character': character,
        'session':get_object_or_404(Session,pk=session)
    }
             
   
    if not data['session'].is_open:
        raise PermissionDenied('Session closed')
        

    session = [
    
            forms.ReportForm,
            
            modelformset_factory(
                ChangeGoal,
                formset=forms.ChangeGoalFormSet,
                fields=['theme','belief','action','open_goal','goal'],
                widgets={'open_goal':HiddenInput,
                         'goal':HiddenInput,
                         'theme':Select,
                         'belief':TextInput(attrs={'size': 41}),
                         'action':TextInput(attrs={'size': 40})}),
                
            modelformset_factory(
                ActiveDisciplines,
                formset=forms.DisciplineActivationFormSet,
                fields=['disciplines'],
                widgets={'disciplines':CheckboxSelectMultiple}),
                
            modelformset_factory(
                Feeding,
                formset=forms.FeedingFormSet,
                fields=['domain', 'feeding_points', 'discipline', 'description'],
                widgets={'description':Textarea(attrs={'rows': 5})}),
                
            modelformset_factory(
                Action,
                formset=forms.ActionFormSet,
                fields=['action_type'])
        ]
        
    if data['session'].is_special:
        session = [
            modelformset_factory(
                ChangeGoal,
                formset=forms.ChangeGoalFormSet,
                fields=['theme','belief','action','open_goal','goal'],
                widgets={'open_goal':HiddenInput,
                         'goal':HiddenInput,
                         'theme':Select,
                         'belief':TextInput(attrs={'size': 41}),
                         'action':TextInput(attrs={'size': 40})}),
        
            modelformset_factory(
                ActiveDisciplines,
                formset=forms.DisciplineActivationFormSet,
                fields=['disciplines'],
                widgets={'disciplines':CheckboxSelectMultiple}),
                
            modelformset_factory(
                Feeding,
                formset=forms.FeedingFormSet,
                fields=['domain', 'feeding_points', 'discipline', 'description'],
                widgets={'description':Textarea(attrs={'rows': 5})}),
                
            modelformset_factory(
                Action,
                formset=forms.ActionFormSet,
                fields=['action_type'])
        ]     
            
    return SubmitWizard.as_view(session,
        initial_dict=data)(request, **data)

WIZARD_TEMPLATES = ['submit_wizard.html',
             'goals.html',
             'submit_wizard.html',
             
             'submit_wizard.html',
             'submit_wizard.html']
             

             
class SubmitWizard(SessionWizardView):
    template_name = 'submit_wizard.html'
    
    
    def get_template_names(self):
        step = int(self.steps.current)
        if self.initial_dict['session'].is_special:
            step += 1
        return [WIZARD_TEMPLATES[step]]
    
    def done(self, form_list, **kwargs):
        
        char = kwargs['character']
        session =  kwargs['session']
    
        learns = DisciplineRating.objects.filter(learning=True,character=char)
        for learn in learns:
            learn.learning = False
            learn.learned = False
            learn.save()
        
        learns = AttributeRating.objects.filter(learning=True,character=char)
        for learn in learns:
            learn.learning = False
            learn.learned = False
            learn.save()  
             
        learns = AdvantageRating.objects.filter(learning=True,character=char)
        for learn in learns:
            learn.learning = False
            learn.learned = False
            learn.save()  
            
        for action in Action.objects.filter(session=session, character=char):
            action.description = ""
            action.save()
        
            
        for f in form_list:
            f.fill_save(char,session)
        return redirect('action details', session= kwargs['session'].id)
        
    def get_form_initial(self, step):
        init = self.initial_dict
        if int(step)==0\
        and EventReport.objects.filter(
                character=init['character'], session=init['session']).exists()\
        and Goal.objects.filter(character=init['character']).exists():            
            report = model_to_dict(EventReport.objects.get(
                character=init['character'], session=init['session']))
            goal = Goal.objects.filter(character=init['character'])
            report.update({'open_goal1_text':goal[0],
                           'open_goal2_text':goal[1],
                           'hidden_goal_text':goal[2]})
        else:
           report = init    
        return init

    def get_context_data(self, form, **kwargs):
        context = super(SubmitWizard, self).get_context_data(form=form, **kwargs)
        char = self.initial_dict['character']
        season = Season.objects.get(is_open=True)
                                                             
        themes = [{'title': "Season Theme", 'text': season.theme},
                  {'title': "Clan Theme", 'text': char.clan.theme},
                  {'title': "Nature", 'text': char.nature},
                  {'title': "Political Faction", 'text': char.political_faction}
                 ]
        step = int(self.steps.current)
        
        if self.initial_dict['session'].is_special:
            step += 1      
            print ('is special {}'.format(step))
        
        if step == 0:
            context.update({'stepTitle': 'After Event Report'})
        elif step == 1:
            context.update({'stepTitle': 'Set New Goals'})
            context.update({'help_texts': themes})
        elif step == 2:
            context.update({'stepTitle': 'Active Disciplines'})
            
        elif step == 3:
            context.update({'stepTitle': 'Feeding'})
        elif step == 4:
            context.update({'stepTitle': 'Actions'})
            context.update({'help_texts': ActionType.help_texts()})
        return context

@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def actionDetails(request, session):
    session = get_object_or_404(Session, pk=session)
    character = request.user.character
    actions = Action.objects.filter(session=session, character=character)
    if len(actions)==0:
        return redirect('exp',session=session.id)
    actionForms = [forms.actionToForm(action) for action in actions ]
    data = {'session': session,
            'character': character,
            'actions':actions
            }     
    return ActionWizard.as_view(actionForms,
        initial_dict=data)(request, **data)     


class ActionWizard(SessionWizardView):
    template_name = 'action_details.html'

    def done(self, form_list, **kwargs):
        for (f,action) in zip(form_list,kwargs['actions']):
            form = f.save(commit=False)
            form.character = kwargs['character']
            form.session = kwargs['session']
            form.action_type = action.action_type            
            form.action_ptr = action
            form.save()            
            form.description = form.to_description()        
            form.save()
        Action.objects.filter(description="",character=form.character).delete()
        session= kwargs['session']
        if session.is_special:
            return redirect('profile')
        
        else:
            return redirect('exp', session= session.id)
        
    def get_form_initial(self, step):
        #action = self.initial_dict['actions'][int(step)]
        #if action.action_type == 'Aid Action (Ghoul)':
        return self.initial_dict    
        
    def get_context_data(self, form, **kwargs):
        context = super(ActionWizard, self).get_context_data(form=form,**kwargs)
        context.update({'stepTitle': str(form.action_type)})
        return context
        
def spend_exp(request, session):
    session = get_object_or_404(Session, pk=session)
    
    character = request.user.character 
    event = EventReport.objects.get(character=character,session=session)
  
    form = forms.exp_spending_form(character,session)
    disps = [{'discipline':rat,'exp':False, 'help':rat.spending()} 
             for rat in DisciplineRating.objects.filter(character=character,learned=True)]
    attrs = [{'attribute':rat,'exp':False, 'help':rat.spending()} 
             for rat in AttributeRating.objects.filter(character=character,learned=True)]
    advs = [{'advantage':rat,'exp':False, 'help':rat.spending()} 
             for rat in AdvantageRating.objects.filter(character=character,learned=True)]
    
    print (advs)
    form_set_disciplines = formset_factory(form['disciplines'], extra=0)
    form_set_attributes  = formset_factory(form['attributes'], extra=0)
    form_set_advantages  = formset_factory(form['advantages'], extra=0)  
    
    if request.method == 'POST':
        form_set_disciplines = form_set_disciplines(request.POST, prefix="disciplines")
        form_set_attributes  = form_set_attributes(request.POST, prefix="attributes")
        form_set_advantages  = form_set_advantages(request.POST, prefix="advantages")
        if form_set_disciplines.is_valid()\
        and form_set_attributes.is_valid()\
        and form_set_advantages.is_valid():
            for form in form_set_disciplines:                
                form.save()
            for form in form_set_attributes:
                form.save()    
            for form in form_set_advantages:
                form.save()    
            return redirect('healing', session=session.id)   
        else:
            print ("not valid \n{}\n{}"\
             .format(form_set_disciplines.errors,form_set_attributes.errors))
    else:
        if (disps==[] and attrs==[] and advs==[]):
            return redirect('healing', session=session.id)

        form_set_disciplines = form_set_disciplines(initial = disps, prefix="disciplines")
        form_set_attributes  = form_set_attributes(initial = attrs, prefix="attributes")
        form_set_advantages  = form_set_advantages(initial = advs, prefix="advantages")
                  
    goal = Goal.objects.filter(character=character)   
                      
    exp = character.exp
    humanity_exp = character.humanity_exp
    if event.open_goal1:
        if goal[0].theme == "Humanity":
                humanity_exp += 1
        else:                
            exp+=1
    if event.open_goal2:
        if goal[1].theme == "Humanity":
                humanity_exp += 1
        else:                
            exp+=1
    if event.hidden_goal:
        if goal[2].theme == "Humanity":
                humanity_exp += 1
        else:                
            exp+=1   
                  
    data = {
            'discipline_forms':form_set_disciplines,
            'attribute_forms':form_set_attributes,
            'advantage_forms':form_set_advantages,
            'exp':exp,
            'humanity_exp':humanity_exp,
            }
    return render(request, 'exp_spending.html', data)                  

        
                                
def healing(request, session):
    session = get_object_or_404(Session, pk=session)
    character = request.user.character 
    event = EventReport.objects.get(character=character,session=session)
    feedings = Feeding.objects.filter(character=character,session=session)
    actions = Action.objects.filter(character=character,session=session)
    
    
    superficial = character.superficial + event.superficial
    aggravated = character.aggravated + event.aggravated
    
    blood = character.blood
    for feed in feedings:
        blood += feed.feeding_points
    blood -= 25
    
    if "Rest" in [action.action_type for action in actions]:
        willpower = character.get_max_willpower()
    else:
        willpower = character.willpower
    
    for action in actions:
        if action.willpower:
            willpower -= 1
    
    if superficial+aggravated==0:   
        if character.titles.filter(name='Harpya').exists():
            return redirect('assign status') 
        else:
            return redirect('profile')
    
    damage = {
        'superficial':superficial, 
        'aggravated':aggravated}
    
        
    form = forms.healing_report_form(character,session)(initial=damage)
    
    data = {
        'superficial':superficial, 
        'aggravated':aggravated, 
        'blood':blood,
        'willpower':willpower,
        'form': form
        }
    
    if request.method == 'POST':
        form = forms.healing_report_form(character,session)(request.POST,initial=damage)
        if form.is_valid():
            form.save()
            if character.titles.filter(name='Harpya').exists():
                return redirect('assign status') 
            else:
                return redirect('profile')   
    else:                             
        return render(request, 'healing.html', data)                  
                                                             


BLOODTABLE = [0,0,0,0,45,35,25,15,10,9,8,7,6,5]


@login_required
@user_passes_test(lambda u: not u.is_superuser, login_url='/gm/')
def make_character(request):
    ch = request.user.character
    sessions = Session.objects.all()
    
    session = Session.objects.get(is_open=True)
            
    if  request.method == 'POST':
       
        form = forms.CharacterForm(request.POST)
        if form.is_valid():   
            f = form.cleaned_data
            
            Goal.objects.filter(character=ch).delete()
            AdvantageRating.objects.filter(character=ch).delete()
            AttributeRating.objects.filter(character=ch).delete()
            DisciplineRating.objects.filter(character=ch).delete()
         
            gen = f['generation']           
           
            
        #    ch.name    = f['name']
        #    ch.age     = f['age']
        #    ch.clan    = f['clan']
            ch.sire    = f['sire']
            ch.nature  = f['nature']
            ch.pronoun = f['pronoun']
            ch.concept = f['concept']
            ch.political_faction = f['political_faction']
                         
            ch.firearms  = f['firearms']    
            ch.melee    = f['melee_weapons'] 
            ch.herd  = f['herd']
            ch.haven = f['haven']
            ch.herd_description  = f['herd_description']
            ch.haven_description = f['haven_description']
            ch.haven_domain = f['haven_domain']
            
            ch.exp          = 0
            ch.humanity_exp = 0      
            
           
            ch.superficial = 0
            ch.aggravated = 0
            ch.blood      = BLOODTABLE[gen]
            
            ch.generation = gen
            
            ch.additional_notes = f['additional_notes']
            ch.defined = True
            ch.save()
            
            if f['feeding_restriction'] != None:
                FeedingRestriction.objects.create(
                    population = f['feeding_restriction'],
                    character=ch
                    )
                    
            goal = Goal.objects.create(
                character = ch,
                theme = 'Humanity',
                belief = "",
                action = "",
                open_goal = True)
            goal.create_change(session)
                
            goal = Goal.objects.create(
                character = ch,
                theme = 'Clan Theme',
                belief = "",
                action = "",
                open_goal = True)
            goal.create_change(session)
                
            goal = Goal.objects.create(
                character = ch,
                theme = 'Nature',
                belief = "",
                action = "",
                open_goal = False)
            goal.create_change(session)
                     
            AdvantageRating.objects.create(
                advantage=Advantage.objects.get(name="Willpower"),
                value=f['willpower'],
                character=ch
                )   
            AdvantageRating.objects.create(
                advantage=Advantage.objects.get(name="Humanity"),
                value=f['humanity'],
                character=ch
                )     
               
            if f['discipline_1'] != None:
                DisciplineRating.objects.create(
                    discipline=f['discipline_1'],
                    value=f['discipline_1_rating'],
                    character=ch
                    )
            
            if f['discipline_2'] != None:
                DisciplineRating.objects.create(
                    discipline=f['discipline_2'],
                    value=f['discipline_2_rating'],
                    character=ch
                    )
                
            if f['discipline_3'] != None:
                dis = DisciplineRating.objects.create(
                    discipline=f['discipline_3'],
                    value=f['discipline_3_rating'],
                    character=ch
                    )
            
            if f['discipline_4'] != None:
                DisciplineRating.objects.create(
                    discipline=f['discipline_4'],
                    value=f['discipline_4_rating'],
                    character=ch
                    )                
                
            if f['discipline_5'] != None:
                DisciplineRating.objects.create(
                    discipline=f['discipline_5'],
                    value=f['discipline_5_rating'],
                    )
            
            if f['discipline_6'] != None:
                DisciplineRating.objects.create(
                    discipline=f['discipline_6'],
                    value=f['discipline_6_rating'],
                    character=ch
                    )
            
            
            if f['hook_1_name'] != "":
                hook = Hook.objects.create(
                    concept=f['hook_1_concept'],
                    name=f['hook_1_name'],
                    influence=f['hook_1_influence'],
                    character=ch
                    )
                for attribute in f['hook_1_aspects']:
                    hook.aspects.add(attribute)    
                    hook.save()   
            
            if f['hook_2_name'] != "":
                hook = Hook.objects.create(
                    concept=f['hook_2_concept'],
                    name=f['hook_2_name'],
                    influence=f['hook_2_influence'],
                    character=ch
                    )
                for attribute in f['hook_2_aspects']:
                    hook.aspects.add(attribute)    
                    hook.save()
                
            if f['hook_3_name'] != "":
                hook = Hook.objects.create(
                    concept=f['hook_3_concept'],
                    name=f['hook_3_name'],
                    influence=f['hook_3_influence'],
                    character=ch
                    )
                for attribute in f['hook_3_aspects']:
                    hook.aspects.add(attribute)    
                    hook.save()   
            
            if f['hook_4_name'] != "":
                hook = Hook.objects.create(
                    concept=f['hook_4_concept'],
                    name=f['hook_4_name'],
                    influence=f['hook_4_influence'],
                    character=ch
                    )
                for attribute in f['hook_4_aspects']:
                    hook.aspects.add(attribute)    
                    hook.save()

            if f['hook_5_name'] != "":
                hook = Hook.objects.create(
                    concept=f['hook_5_concept'],
                    name=f['hook_5_name'],
                    influence=f['hook_5_influence'],
                    character=ch
                    )
                for attribute in f['hook_5_aspects']:
                    hook.aspects.add(attribute)    
                    hook.save()   
            
            if f['hook_6_name'] != "":
                hook = Hook.objects.create(
                    name=f['hook_6_name'],
                    influence=f['hook_6_influence'],
                    character=ch
                    )
                for attribute in f['hook_6_aspects']:
                    hook.aspects.add(attribute)    
                    hook.save() 
            
            if f['equipment_1_name'] != "":
                equ = Equipment.objects.create(
                    name=f['equipment_1_name'],
                    specialization=f['equipment_1_specialization'],
                    owner=ch
                    )
                
            if f['equipment_2_name'] != "":
                equ = Equipment.objects.create(
                    name=f['equipment_2_name'],
                    specialization=f['equipment_2_specialization'],
                    owner=ch
                    )
                
            if f['equipment_3_name'] != "":
                equ = Equipment.objects.create(
                    name=f['equipment_3_name'],
                    specialization=f['equipment_3_specialization'],
                    owner=ch
                    )
                
            if f['ghoul_1_name'] != "":
                ghoul = Ghoul.objects.create(
                    name=f['ghoul_1_name'],
                    level=f['ghoul_1_level'],
                    master=ch)
                for spec in f['ghoul_1_specializations']:
                    ghoul.specializations.add(spec)
                if f['ghoul_1_discipline1'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_1_discipline1'],
                        value = f['ghoul_1_discipline1_rating'],
                        ghoul = ghoul
                    )
                if f['ghoul_1_discipline2'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_1_discipline2'],
                        value = f['ghoul_1_discipline2_rating'], 
                        ghoul = ghoul
                    )
                if f['ghoul_1_discipline3'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_1_discipline3'],
                        value = f['ghoul_1_discipline3_rating'], 
                        ghoul = ghoul
                    )
                ghoul.save()
                disp = list(ghoul.disciplines.filter(discipline__name="Potence"))
                if disp == []:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = Discipline.objects.get(name="Potence"),
                        value = 1, 
                    )
                    ghoul.disciplines.add(disp_rate)
                else:
                    disp[0].value += 1 
                    disp[0].save()       
            
            if f['ghoul_2_name'] != "":
                ghoul = Ghoul.objects.create(
                    name=f['ghoul_2_name'],
                    level=f['ghoul_2_level'],
                    master=ch)
                for spec in f['ghoul_1_specializations']:
                    ghoul.specializations.add(spec)
                if f['ghoul_2_discipline1'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_2_discipline1'],
                        value = f['ghoul_2_discipline1_rating'],
                        ghoul = ghoul
                    )
                if f['ghoul_2_discipline2'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_2_discipline2'],
                        value = f['ghoul_2_discipline2_rating'],
                        ghoul = ghoul 
                    )
                if f['ghoul_2_discipline3'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_2_discipline3'],
                        value = f['ghoul_2_discipline3_rating'],
                        ghoul = ghoul 
                    )
                ghoul.save()
                disp = list(ghoul.disciplines.filter(discipline__name="Potence"))
                if disp == []:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = Discipline.objects.get(name="Potence"),
                        value = 1, 
                    )
                    ghoul.disciplines.add(disp_rate)
                else:
                    disp[0].value += 1 
                    disp[0].save()

            if f['ghoul_3_name'] != "":
                ghoul = Ghoul.objects.create(
                    name=f['ghoul_3_name'],
                    level=f['ghoul_3_level'],
                    master=ch)
                for spec in f['ghoul_1_specializations']:
                    ghoul.specializations.add(spec)
                if f['ghoul_3_discipline1'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_3_discipline1'],
                        value = f['ghoul_3_discipline1_rating'],
                        ghoul = ghoul 
                    )
                if f['ghoul_3_discipline2'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_3_discipline2'],
                        value = f['ghoul_3_discipline2_rating'], 
                        ghoul = ghoul
                    )
                if f['ghoul_3_discipline3'] != None:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = f['ghoul_3_discipline3'],
                        value = f['ghoul_3_discipline3_rating'], 
                        ghoul = ghoul
                    )
                ghoul.save()
                disp = list(ghoul.disciplines.filter(discipline__name="Potence"))
                if disp == []:
                    disp_rate = DisciplineRating.objects.create(
                        discipline = Discipline.objects.get(name="Potence"),
                        value = 1, 
                    )
                    ghoul.disciplines.add(disp_rate)
                else:
                    disp[0].value += 1 
                    disp[0].save()
                    
            if f['character_1'] != None:
                dis = Relationship.objects.create(
                    other_character=f['character_1'],
                    description=f['complicated_relationship_1'],
                    blood_bond=f['blood_bond_to_you_1'],
                    complicated= True,
                    character=ch
                    )
                    
            if f['character_2'] != None:
                dis = Relationship.objects.create(
                    other_character=f['character_2'],
                    description=f['complicated_relationship_2'],
                    blood_bond=f['blood_bond_to_you_2'],
                    complicated= True,
                    character=ch
                    )
                    
            if f['character_3'] != None:
                dis = Relationship.objects.create(
                    other_character=f['character_3'],
                    description=f['complicated_relationship_3'],
                    blood_bond=f['blood_bond_to_you_3'],
                    complicated= True,
                    character=ch
                    )
            if f['character_4'] != None:
                dis = Relationship.objects.create(
                    other_character=f['character_4'],
                    description=f['complicated_relationship_4'],
                    blood_bond=f['blood_bond_to_you_4'],
                    complicated= True,
                    character=ch
                    )
            if f['character_5'] != None:
                dis = Relationship.objects.create(
                    other_character=f['character_5'],
                    description=f['complicated_relationship_5'],
                    blood_bond=f['blood_bond_to_you_5'],
                    complicated= True,
                    character=ch
                    )
            if f['character_6'] != None:
                dis = Relationship.objects.create(
                    other_character=f['character_6'],
                    description=f['complicated_relationship_6'],
                    blood_bond=f['blood_bond_to_you_6'],
                    complicated= True,
                    character=ch
                    )
                          
                
                
            AttributeRating.objects.create(
                attribute =Attribute.objects.get(name='Social'),
                value= f['social_rating'],
                character=ch
                )
            
            AttributeRating.objects.create(
                attribute =Attribute.objects.get(name='Physical'),
                value= f['physical_rating'],
                character=ch
                )
            
            AttributeRating.objects.create(
                attribute =Attribute.objects.get(name='Mental'),
                value= f['mental_rating'],
                character=ch
                )
            
            for spec in f['specializations']:
                ch.specializations.add(spec)
            
            for title in f['titles']:
                ch.titles.add(title)

     
            ch.user = request.user   
            ch.save()   
            return redirect('profile')
        else:
           print('is not valid :(')
           print(form.errors)        
             
    else:
        form = forms.CharacterForm()
    
    return render(request, 'character.html', {'form': form, 'ch':ch})


