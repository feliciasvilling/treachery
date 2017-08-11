from django.contrib.auth.forms import AuthenticationForm
from django import forms
from django.forms.models import BaseModelFormSet
from django.forms import ModelForm
from players.models import *
from django.forms import *
import django.forms

class LoginForm(AuthenticationForm):
    def confirm_login_allowed(self, user):
        super(LoginForm, self).confirm_login_allowed(user)
#        if not user.is_staff and not hasattr(user, 'character'):
#            raise forms.ValidationError(
#                "This account has no character. Please wait for a GM to add one.",
#                code='no_character', )


class StatusForm(Form):
    target   = ModelChoiceField(Character.objects.all(), widget=TextInput)
    status   = TypedChoiceField(initial=0, empty_value=0, coerce=int, choices=[(1,1),(0,0),(-1,-1)])
    
    def fill_save(self,char,session):
        v = self.cleaned_data
        stat = StatusAssignment.objects.create(
            target=v['target'],
            assigner=char,
            session=session,
            status=v['status'])
        stat.save()
            
def StatusFormSet():
    n = Character.objects.all().count()
    return formset_factory(StatusForm, extra=n, max_num=n)

class ReportForm(Form):
    
    open_goal1_text = CharField(
        widget=Textarea(attrs={'cols': '40', 'rows': '3'}),
        required=False,
        disabled=True,    
        label='Open Goal:')
    open_goal1 = BooleanField(initial=False, required=False,
        label='Did you work on this goal?')
    
    open_goal2_text = CharField(
        widget=Textarea(attrs={'cols': '40', 'rows': '3'}),
        required=False,
        disabled=True,     
        label='Open Goal:')
    open_goal2 = BooleanField(initial=False, required=False,
        label='Did you work on this goal?')

    hidden_goal_text = CharField(
        widget=Textarea(attrs={'cols': '40', 'rows': '3'}),
        required=False,
        disabled=True,      
        label='Hidden Goal:')
    hidden_goal = BooleanField(initial=False, required=False,
        label='Did you work on this goal?')
    
    superficial = IntegerField(initial=0, 
            label = 'Did you take any superficial damage?')
    aggravated  = IntegerField(initial=0, 
            label = 'Did you take any aggrevated damage?')        
    assets      = IntegerField(initial=0, 
            label = 'Did you pay any assets?')
    willpower   = IntegerField(initial=0, 
            label = 'Did you pay any willpower points?')
    blood       = IntegerField(initial=0, 
            label = 'Did you pay any blood?')        
    humanity    = IntegerField(initial=0, 
            label = 'Did you lose any humanity?')
            
    def fill_save(self,char,session):
        v = self.cleaned_data     
        
        EventReport.objects.filter(character=char,session=session).delete()
        
        report = EventReport.objects.create(
            
            open_goal1  = v['open_goal1'],
            open_goal2  = v['open_goal2'],
            hidden_goal = v['hidden_goal'],
             
            humanity    = v['humanity'],
            willpower   = v['willpower'],
            blood       = v['blood'],
            assets      = v['assets'],
            
            superficial = v['superficial'],
            aggravated  = v['aggravated'],
           )

        report.character = char
        report.session = session
        report.save()

  
        


def healing_report_form(char,session):

   # HealingReport.objects.filter(character=char,session=session)

    class _HealingForm(Form):

        superficial = IntegerField(initial=0)
        aggravated = IntegerField(initial=0)  
        
                           
        def save(self):
            v = self.cleaned_data
            HealingReport.objects.filter(character=char,session=session).delete()
            
            healing = HealingReport.objects.create(
                superficial = v['superficial'],
                aggravated = v['aggravated'],
                )
            healing.character = char
            healing.session = session  
            healing.save()    
    return _HealingForm



def exp_spending_form(char,session):
    
    # disciplines
    
    learns = LearnDiscipline.objects.filter(character=char,session=session)
    new_learnables = [learn.discipline for learn in learns]
    
    for learn in new_learnables:
        new_trait = list(DisciplineRating.objects.filter(
            character=char,
            discipline=learn))
        if new_trait == []:
            new = DisciplineRating.objects.create(
                character = char,
                discipline=learn,
                value=0,
                learned=True,
                learning=True,
                )
            new.save()
        else:
            if not new_trait[0].learned:
                new_trait[0].learned = True
                new_trait[0].learning = True
                new_trait[0].save()
    
    learnables = DisciplineRating.objects.filter(character=char).exclude(learned=False) 
       
    class _ExpDispForm(Form):
        discipline = ModelChoiceField(queryset=learnables,disabled=False)
        exp = BooleanField(initial=True,required=False)
        help = CharField(max_length=200,required=False)
        
        def save(self):
            v = self.cleaned_data
            print ("saving \n{}" .format(v))
            if 'discipline' in v:
                ExpDisciplineSpending.objects.filter(
                    character=char,
                    session=session,
                    discipline=v['discipline']
                    ).delete()
                    
                spend = ExpDisciplineSpending.objects.create(
                    discipline = v['discipline'],
                    exp = v['exp'],
                    )
                spend.character = char
                spend.session = session  
                spend.save()  
                
    # attributes 
     
    learns = LearnAttribute.objects.filter(character=char,session=session)
    new_learnables = [learn.attribute for learn in learns]
    
    for learn in new_learnables:
        new_trait = list(AttributeRating.objects.filter(
            character=char,
            attribute=learn))
        if new_trait == []:
            new = AttributeRating.objects.create(
                character=char,
                attribute=learn,
                value=0,
                learned=True,
                learning=True,
                )
            new.save()
        else:
            if not new_trait[0].learned:
                new_trait[0].learned = True
                new_trait[0].learning = True
                new_trait[0].save()
    
    learnables = AttributeRating.objects.filter(character=char).exclude(learned=False) 
       
    class _ExpAttrForm(Form):
        attribute = ModelChoiceField(queryset=learnables,disabled=False)
        exp = BooleanField(initial=True,required=False)
        help = CharField(max_length=200,required=False)
        
        def save(self):
            v = self.cleaned_data
            if 'attribute' in v:
                ExpAttributeSpending.objects.filter(
                    character=char,
                    session=session,
                    attribute=v['attribute']
                    ).delete()
                    
                spend = ExpAttributeSpending.objects.create(
                    attribute = v['attribute'],
                    exp = v['exp'],
                    )
                spend.character = char
                spend.session = session  
                spend.save() 
                
    #advantages
                
    learns = LearnAdvantage.objects.filter(character=char,session=session)
    new_learnables = [learn.advantage for learn in learns]
    
    for learn in new_learnables:
        new_trait = list(AdvantageRating.objects.filter(
            character=char,
            advantage=learn))
        if new_trait == []:
            new = AdvantageRating.objects.create(
                character=char,
                advantage=learn,
                value=0,
                learned=True,
                learning=True,
                )
            new.save()

        else:
            if not new_trait[0].learned:
                new_trait[0].learned = True
                new_trait[0].learning = True
                new_trait[0].save()            
                
    learnables = AdvantageRating.objects.filter(character=char).exclude(learned=False)  
              
    class _ExpAdvForm(Form):
        advantage = ModelChoiceField(queryset=learnables,disabled=False)
        exp = BooleanField(initial=True,required=False)
        help = CharField(max_length=200,required=False)
        
        def save(self):
            v = self.cleaned_data
            if 'advantage' in v:
                ExpAdvantageSpending.objects.filter(
                    character=char,
                    session=session,
                    advantage=v['advantage']
                    ).delete()
                    
                spend = ExpAdvantageSpending.objects.create(
                    advantage = v['advantage'],
                    exp = v['exp'],
                    )
                spend.character = char
                spend.session = session  
                spend.save()

    return {'disciplines':_ExpDispForm, 
            'attributes':_ExpAttrForm, 
            'advantages':_ExpAdvForm}

# Session submit forms
class SessionFormSet(BaseModelFormSet):
    def __init__(self, *args, **kwargs):
        initial = kwargs.pop('initial')
        self.user = initial['user']
        self.character = initial['character']
        self.session = initial['session']
        super(SessionFormSet, self).__init__(*args, **kwargs)

    def fill_save(self,char,session):
        self.save_existing_objects(commit=True)  # deletes objects
        instances = self.save(commit=False)
        for instance in instances:
            instance.session = session
            instance.character = char
            instance.save()
        self.save_m2m()



        
class ChangeGoalFormSet(SessionFormSet):
    def __init__(self, *args, **kwargs):
        super(ChangeGoalFormSet, self).__init__(*args, **kwargs)
        self.queryset = ChangeGoal.objects.filter(
            character=self.character,
            session=self.session)
        self.max_num = 3
        self.extra = 3    
        

     

class DisciplineActivationFormSet(SessionFormSet):
    def __init__(self, *args, **kwargs):
        super(DisciplineActivationFormSet, self).__init__(*args, **kwargs)
        self.queryset = ActiveDisciplines.objects.filter(
            character=self.character,
            session=self.session)
        self.max_num = 1
        for form in self.forms:
            form.fields['disciplines'].queryset =\
                Discipline.objects.filter(rating__character=self.user.character).exclude(rating__learning=True)


class FeedingFormSet(SessionFormSet):
    def __init__(self, *args, **kwargs):
        super(FeedingFormSet, self).__init__(*args, **kwargs)
        self.queryset = Feeding.objects.filter(character=self.character,
                                               session=self.session)
        self.max_num = 3
        self.extra = 3
        for form in self.forms:
            form.fields[
                'discipline'].queryset = Discipline.objects.filter(rating__character=self.user.character).exclude(rating__learning=True)

class ActionFormSet(SessionFormSet):
    def __init__(self, *args, **kwargs):
        super(ActionFormSet, self).__init__(*args, **kwargs)
        self.queryset = Action.objects.filter(character=self.character,
                                              session=self.session)

        if self.session.is_special:
            action_count = 2
            actions = [self.session.action_set]
        else: 
            action_count = self.character.action_count(self.session)
            actions = self.character.actions(self.session)
            
        self.extra = action_count
        self.max_num = self.extra
        # otherwise django might populate the forms with actions that
        # doest match their action_type queryset
        i = 0
                
        for action in actions:
            for j in range(action.count):
                form = self.forms[i]
                # we could use form.initial to look at previous values. However
                # matching the action to the option is hard.
                form.fields['action_type'].queryset = action.action_types.all()
                form.title = action.name
                i = i + 1
                
class DomainForm(ModelForm):
    class Meta:
        model = Domain
        fields = ['allowed']       
        widgets = {'allowed':CheckboxSelectMultiple}

class CharacterForm2(ModelForm):
    class Meta:
        model = Character 
        exclude = ['user','exp','humanityExp','SpecialExp','health','blood','rituals']
       


class CharacterForm(Form):
    name = CharField(max_length=200)
    pronoun = ModelChoiceField(queryset=Pronoun.objects.all(),empty_label=None)
   # picture = 
    age     = ModelChoiceField(queryset=Age.objects.all(),empty_label=None)
    clan    = ModelChoiceField(queryset=Clan.objects.all(),empty_label=None)
    sire    = ModelChoiceField(queryset=Character.objects.all(),required=False)
    nature  = ModelChoiceField(queryset=Nature.objects.all(),empty_label=None)
    
    titles = 	ModelMultipleChoiceField(queryset=Title.objects.all(),required=False)
    domains = 	ModelMultipleChoiceField(queryset=Domain.objects.all(),required=False)
    political_faction = ModelChoiceField(queryset=PoliticalFaction.objects.all(),empty_label=None)
    
    concept = CharField(
        widget=Textarea(attrs={'col':15,'rows':1}),
        required=False,
        )
    
    social_rating = IntegerField(initial=0)
    mental_rating = IntegerField(initial=0)
    physical_rating = IntegerField(initial=0)


    specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    
    discipline1 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    discipline1_rating = IntegerField(initial=0)
    discipline2 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    discipline2_rating = IntegerField(initial=0)
    discipline3 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    discipline3_rating = IntegerField(initial=0)
    discipline4 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    discipline4_rating = IntegerField(initial=0)
    discipline5 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    discipline5_rating = IntegerField(initial=0)
    discipline6 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    discipline6_rating = IntegerField(initial=0)

    humanity   = IntegerField(initial=0)
    willpower  = IntegerField(initial=0)
    generation = IntegerField(initial=13) 
    
     
    haven   = IntegerField(initial=0)
    haven_description = CharField()
    haven_domain = ModelChoiceField(queryset=Domain.objects.all())
    
    
    herd    = IntegerField(initial=0)
    herd_description = CharField(required=False)
    melee_weapons   = IntegerField(initial=0)
    firearms = IntegerField(initial=0)
       
    hook1_name        = CharField(required=False)
    hook1_concept        = CharField(required=False)
    hook1_influence   = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    hook1_aspects  = ModelMultipleChoiceField(queryset=Aspect.objects.all(),required=False)
    
    hook2_name        = CharField(required=False)
    hook2_concept        = CharField(required=False)
    hook2_influence   = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    hook2_aspects  = ModelMultipleChoiceField(queryset=Aspect.objects.all(),required=False)
    
    hook3_name        = CharField(required=False)
    hook3_concept        = CharField(required=False)
    hook3_influence   = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    hook3_aspects  = ModelMultipleChoiceField(queryset=Aspect.objects.all(),required=False)
    
    hook4_name        = CharField(required=False)
    hook4_concept        = CharField(required=False)
    hook4_influence   = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    hook4_aspects  = ModelMultipleChoiceField(queryset=Aspect.objects.all(),required=False)
    
    
    hook5_name        = CharField(required=False)
    hook5_concept        = CharField(required=False)
    hook5_influence   = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    hook5_aspects  = ModelMultipleChoiceField(queryset=Aspect.objects.all(),required=False)
    
    hook6_name        = CharField(required=False)
    hook6_concept     = CharField(required=False)
    hook6_influence   = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    hook6_aspects  = ModelMultipleChoiceField(queryset=Aspect.objects.all(),required=False)
    
# relationships    
    


    equipment1_name = CharField(required=False)
    equipment1_influence = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    equipment2_name = CharField(required=False)
    equipment2_influence = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    equipment3_name = CharField(required=False)
    equipment3_influence = ModelChoiceField(queryset=Influence.objects.all(),required=False)
    
    ghoul1_name = CharField(required=False)
    ghoul1_level = IntegerField(initial=0)
    ghoul1_specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    ghoul1_discipline1 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul1_discipline1_rating = IntegerField(initial=0)
    ghoul1_discipline2 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul1_discipline2_rating = IntegerField(initial=0)
    ghoul1_discipline3 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul1_discipline3_rating = IntegerField(initial=0)
    
    ghoul2_name = CharField(required=False)
    ghoul2_level = IntegerField(initial=0)
    ghoul2_specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    ghoul2_discipline1 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul2_discipline1_rating = IntegerField(initial=0)
    ghoul2_discipline2 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul2_discipline2_rating = IntegerField(initial=0)
    ghoul2_discipline3 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul2_discipline3_rating = IntegerField(initial=0)
    
    ghoul3_name = CharField(required=False)
    ghoul3_level = IntegerField(initial=0)
    ghoul3_specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    ghoul3_discipline1 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul3_discipline1_rating = IntegerField(initial=0)
    ghoul3_discipline2 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul3_discipline2_rating = IntegerField(initial=0)
    ghoul3_discipline3 = ModelChoiceField(queryset=Discipline.objects.all(),required=False)
    ghoul3_discipline3_rating = IntegerField(initial=0)
    
    additional_notes = CharField(widget=Textarea(attrs={'col':15,'rows':5}),required=False)




excludedFields  = ['character','action_type','session','description','resolved','result']

no_roll_excluded = ['willpower','helpers']
aid_excluded = ['helpers']
class ActionForm(ModelForm):

    class Meta:
        model = Action
        exclude = excludedFields    
    
class AidActionForm(ActionForm):

    class Meta:
        model = AidAction
        exclude = excludedFields + aid_excluded
    action_type = "Aid Action"   
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['helpee'].queryset = Character.objects.exclude(pk=character.id)
     
    
class GhoulAidActionForm(ActionForm):
    class Meta:
        model = GhoulAidAction
        exclude = excludedFields + aid_excluded        
    action_type = "Aid Action (Ghoul)"
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['ghoul'].queryset = Ghoul.objects.filter(master=character)     
        
class PrimogensAidActionForm(ActionForm):
    class Meta:
        model = PrimogensAidAction
        exclude = excludedFields + aid_excluded
    action_type = "Aid Action (Primogen)"  
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['helpee'].queryset = Character.objects.filter(clan=character.clan).exclude(pk=character.id)
    
class ConserveInfluenceForm(ActionForm):
    class Meta:
        model = ConserveInfluence
        exclude = excludedFields
    action_type = "Conserve (Influence)"
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['influence'].queryset = Influence.objects.filter(hooks__master=character).distinct()
        

class ConserveDomainForm(ActionForm):
    class Meta:
        model = ConserveDomain
        exclude = excludedFields
    action_type = "Conserve (Domain)"

class InfluenceStealForm(ActionForm):
    class Meta:
        model = InfluenceSteal
        exclude = excludedFields
    action_type = "Acquire (Influence)"
        
class InfluenceDestroyForm(ActionForm):
    class Meta:
        model = InfluenceDestroy
        exclude = excludedFields
    action_type = "Destroy (Influence)"

class InvestigateCharacterInfluenceForm(ActionForm):
    class Meta:
        model = InvestigateCharacterInfluence
        exclude = excludedFields +['hooks']
    action_type = "Investigate (Character: Influence)"
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['target'].queryset = Character.objects.exclude(pk=character.id)
        
class InvestigateCharacterResourcesForm(ActionForm):
    class Meta:
        model = InvestigateCharacterResources
        exclude = excludedFields
    action_type = "Investigate (Character: Resources)"
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['target'].queryset = Character.objects.exclude(pk=character.id)
        
            
class InvestigateCharacterDowntimeActionsForm(ActionForm):
    class Meta:
        model = InvestigateCharacterDowntimeActions
        exclude = excludedFields
    action_type = "Investigate (Character: Downtime Actions)"
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['target'].queryset = Character.objects.exclude(pk=character.id)
        
class InvestigateCounterSpionageForm(ActionForm):
    class Meta:
        model = InvestigateCounterSpionage
        exclude = excludedFields
    action_type = "Investigate (Counterespionage)"

class InvestigatePhenomenonForm(ActionForm):
    class Meta:
        model = InvestigatePhenomenon
        exclude = excludedFields
    action_type = "Investigate (Phenomenon)"
        
class InvestigateInfluenceForm(ActionForm):
    class Meta:
        model = InvestigateInfluence
        exclude = excludedFields
    action_type = "Investigate (Influence)"

class LearnAdvantageForm(ActionForm):
    class Meta:
        model = LearnAdvantage
        exclude = excludedFields + no_roll_excluded
    action_type = "Learn (Advantage)"

class LearnAttributeForm(ActionForm):
    class Meta:
        model = LearnAttribute
        exclude = excludedFields + no_roll_excluded
    action_type = "Learn (Attribute)"

class LearnDisciplineForm(ActionForm):
    class Meta:
        model = LearnDiscipline
        exclude = excludedFields + no_roll_excluded
    action_type = "Learn (Discipline)"

class LearnSpecializationForm(ActionForm):
    class Meta:
        model = LearnSpecialization
        exclude = excludedFields + no_roll_excluded
    action_type = "Learn (Specialization)"
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['old_specialization'].queryset = character.specializations
        self.fields['new_specialization'].queryset = Specialization.objects.exclude(character=character)
        if character.age.name == 'Ancilla':
            self.fields['trainer'].queryset = Character.objects.filter(age__name='Neonate')
    

class InvestGhoulForm(ActionForm):
    class Meta:
        model = InvestGhoul
        exclude = excludedFields + no_roll_excluded
    action_type = "Invest (Ghoul)"
        
class InvestEquipmentForm(ActionForm):
    class Meta:
        model = InvestEquipment
        exclude = excludedFields + no_roll_excluded
    action_type = "Invest (Equipment)"

class InvestWeaponForm(ActionForm):
    class Meta:
        model = InvestWeapon
        exclude = excludedFields + no_roll_excluded
    action_type = "Invest (Weapon)"

class InvestHerdForm(ActionForm):
    class Meta:
        model = InvestHerd
        exclude = excludedFields + no_roll_excluded
    action_type = "Invest (Herd)"
        
class InvestHavenForm(ActionForm):
    class Meta:
        model = InvestHaven
        exclude = excludedFields + no_roll_excluded
    action_type = "Invest (Haven)"

class MentorAttributeForm(ActionForm):
    class Meta:
        model = MentorAttribute
        exclude = excludedFields + no_roll_excluded
    action_type = "Mentor (Attribute)"

class MentorDisciplineForm(ActionForm):
    class Meta:
        model = MentorDiscipline
        exclude = excludedFields + no_roll_excluded
    action_type = "Mentor (Discipline)"
    
class MentorSpecializationForm(ActionForm):
    class Meta:
        model = MentorSpecialization
        exclude = excludedFields + no_roll_excluded
    action_type = "Mentor (Specialization)"

class RestForm(ActionForm):
    class Meta:
        model = Rest
        exclude = excludedFields + no_roll_excluded
    action_type = "Rest"
    
class AssignXPForm(ActionForm):
    class Meta:
        model = AssignXP
        exclude = excludedFields + no_roll_excluded
    action_type = "Assign (XP)"
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']
        self.fields['target'].queryset = Character.objects.exclude(pk=character.id)    
        
class NeglectDomainForm(ActionForm):
    class Meta:
        model = NeglectDomain
        exclude = excludedFields + no_roll_excluded
    action_type = "Neglect (Domain)"        

class PatrolDomainForm(ActionForm):
    class Meta:
        model = PatrolDomain
        exclude = excludedFields + no_roll_excluded
    action_type = "Patrol (Domain)"  
    
class KeepersQuestionForm(ActionForm):
    class Meta:
        model = KeepersQuestion
        exclude = excludedFields + no_roll_excluded
    action_type = "Question (Keeper)"  

class PrimogensQuestionForm(ActionForm):
    class Meta:
        model = PrimogensQuestion
        exclude = excludedFields + no_roll_excluded
    action_type = "Question (Primogen)"  
    def __init__(self, *args, **kwargs):
        super(ActionForm, self).__init__(*args, **kwargs)
        initial = kwargs.pop('initial')
        character = initial['character']              
        self.fields['target'].queryset = Character.objects.filter(clan=character.clan).exclude(pk=character.id)
                            
                            
formTable = {
    'Aid Action':AidActionForm, 
    'Aid Action (Primogen)':PrimogensAidActionForm,
    'Aid Action (Ghoul)':GhoulAidActionForm,
    'Conserve (Influence)':ConserveInfluenceForm,
    'Conserve (Domain)':ConserveDomainForm,
    'Acquire (Influence)':InfluenceStealForm,
    'Destroy (Influence)':InfluenceDestroyForm,
    'Investigate (Character: Influence)':InvestigateCharacterInfluenceForm,
    'Investigate (Character: Resources)':InvestigateCharacterResourcesForm,
    'Investigate (Character: Downtime Actions)':InvestigateCharacterDowntimeActionsForm,
    'Investigate (Counterespionage)':InvestigateCounterSpionageForm,
    'Investigate (Phenomenon)':InvestigatePhenomenonForm,
    'Investigate (Influence)':InvestigateInfluenceForm,
    'Learn (Advantage)':LearnAdvantageForm,
    'Learn (Attribute)':LearnAttributeForm,
    'Learn (Discipline)':LearnDisciplineForm,
    'Learn (Specialization)':LearnSpecializationForm,
    'Invest (Ghoul)':InvestGhoulForm,
    'Invest (Equipment)':InvestEquipmentForm,
    'Invest (Weapon)':InvestWeaponForm,
    'Invest (Herd)':InvestHerdForm,
    'Invest (Haven)':InvestHavenForm,
    'Mentor (Attribute)':MentorAttributeForm,
    'Mentor (Discipline)':MentorDisciplineForm,
    'Mentor (Specialization)':MentorSpecializationForm,
    'Rest':RestForm,
    'Neglect (Domain)':NeglectDomainForm,
    'Patrol (Domain)':PatrolDomainForm,
    'Question (Primogen)':PrimogensQuestionForm,
    'Question (Keeper)':KeepersQuestionForm,
    'Assign (XP)':AssignXPForm,
    }
        
        
ACTION_TYPES = [
    'Aid Action', 
    'Aid Action (Primogen)',
    'Aid Action (Ghoul)',
    'Conserve (Influence)',
    'Conserve (Domain)',
    'Acquire (Influence)',
    'Destroy (Influence)',
    'Investigate (Character: Influence)',
    'Investigate (Character: Resources)',
    'Investigate (Character: Downtime Actions)',
    'Investigate (Counterespionage)',
    'Investigate (Phenomenon)',
    'Investigate (Influence)',
    'Learn (Advantage)',
    'Learn (Attribute)',
    'Learn (Discipline)',
    'Learn (Specialization)',
    'Invest (Ghoul)',
    'Invest (Equipment)',
    'Invest (Weapon)',
    'Invest (Herd)',
    'Invest (Haven)',
    'Mentor (Attribute)',
    'Mentor (Discipline)',
    'Mentor (Specialization)',
    'Rest',
    'Neglect (Domain)',
    'Patrol (Domain)',
    'Question (Primogen)',
    'Question (Keeper)',
    'Assign (XP)',
    ]        
         
PASSIVE_ACTION_TYPES = [
    'Investigate (Counterespionage)',
    'Invest (Weapon)',
    'Invest (Herd)',
    'Invest (Haven)',
    'Rest'
    ]          
                
def actionToForm(action):
    #try:
        return formTable[str(action.action_type)]
   # except KeyError:
   #     return ActionForm
    
    
    
    
                  
