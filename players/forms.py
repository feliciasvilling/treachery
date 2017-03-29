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


# Session submit forms
class SessionFormSet(BaseModelFormSet):
    def __init__(self, *args, **kwargs):
        initial = kwargs.pop('initial')
        self.user = initial['user']
        self.character = initial['character']
        self.session = initial['session']
        super(SessionFormSet, self).__init__(*args, **kwargs)

    def fill_save(self):
        self.save_existing_objects(commit=True)  # deletes objects
        instances = self.save(commit=False)
        for instance in instances:
            instance.session = self.session
            instance.character = self.character
            instance.save()
        self.save_m2m()




def report_form(char,session):
    class _ReportForm(Form):
        open_goal1_text = CharField(
            required=False,
            disabled=True,
            initial=char.open_goal1, 
            label='Open Goal 1:')
        open_goal1 = BooleanField(required=False,label='Did you work on this goal?')
        
        open_goal2_text = CharField(
            required=False,
            disabled=True,
            initial=char.open_goal2, 
            label='Open Goal 2:')
        open_goal2 = BooleanField(required=False,label='Did you work on this goal?')

        hidden_goal_text = CharField(
            required=False,
            disabled=True,
            initial=char.hidden_goal, 
            label='Hidden Goal:')
        hidden_goal = BooleanField(required=False,label='Did you work on this goal?')

        humantiy_goal = BooleanField(required=False,label='where any of the goals you worked on a humanity goal?')
        
        bashing = IntegerField(initial=0, label = 'Did you take any bashing damage?')
        lethal = IntegerField(initial=0, label = 'Did you take any lethal damage?')
        aggravated = IntegerField(initial=0, label = 'Did you take any aggrevated damage?')
        
        
        resources = IntegerField(initial=0, label = 'Did you pay any resources?')
        willpower_points = IntegerField(initial=0, label = 'Did you pay any willpower points?')
        willpower_dots = IntegerField(initial=0, label = 'Did you pay any willpower dots?')
        blood = IntegerField(initial=0, label = 'Did you pay any blood?')
        
        
        humanity = IntegerField(initial=0, label = 'Did you lose any humanity?')
                
        def fill_save(self):
            v = self.cleaned_data
            
            
            EventReport.objects.filter(character=char,session=session).delete()
            
            report = EventReport.objects.create(
                
                open_goal1  = v['open_goal1'],
                open_goal2  = v['open_goal2'],
                hidden_goal = v['hidden_goal'],
                
                humanity_exp = v['humantiy_goal'],
                 
                humanity   = v['humanity'],
                willpower_dots  = v['willpower_dots'],
                willpower_points  = v['willpower_points'],
                blood      = v['blood'],
                resources  = v['resources'],
                
                bashing = v['bashing'],
                lethal = v['lethal'],
                aggravated = v['aggravated'],
               )
   
            report.character = char
            report.session = session
            report.save()
        
    return _ReportForm
    
    
def set_goal_form(char,session):
    class _SetGoal(Form):

        open_goal1  = CharField(
            initial = char.open_goal1,
            widget=Textarea(
                attrs={'col':15,'rows':3}),
                required=False,
                )
        open_goal2  = CharField(
            initial = char.open_goal2,
                widget=Textarea(
                attrs={'col':15,'rows':3}),
                required=False,
                )
        hidden_goal = CharField(
            initial = char.hidden_goal,
            widget=Textarea(
                attrs={'col':15,'rows':3}),
                required=False,
                )
                           
        def fill_save(self):
            v = self.cleaned_data
            ChangeGoals.objects.filter(character=char,session=session).delete()
            
            goals = ChangeGoals.objects.create(
                open_goal1 = v['open_goal1'],
                open_goal2 = v['open_goal2'],
                hidden_goal = v['hidden_goal'],
                )
            goals.character = char
            goals.session = session  
            goals.save()    
    return _SetGoal

def healing_report_form(char,session):
    class _HealingForm(Form):

        bashing = IntegerField(initial=0)
        lethal = IntegerField(initial=0)
        aggravated = IntegerField(initial=0)  
        
                           
        def save(self):
            v = self.cleaned_data
            HealingReport.objects.filter(character=char,session=session).delete()
            
            healing = HealingReport.objects.create(
                bashing = v['bashing'],
                lethal = v['lethal'],
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
        new_disp = list(DisciplineRating.objects.filter(
            character=char,
            discipline=learn))
        if new_disp == []:
            new = DisciplineRating.objects.create(
                discipline=learn,
                value=0,
                learned=True,
                learning=True,
                )
            new.save()
            char.disciplines.add(new)
            char.save()
        else:
            if not new_disp[0].learned:
                new_disp[0].learned = True
                new_disp[0].learning = True
                new_disp[0].save()
    
    learnables = char.disciplines.exclude(learned=False) 
       
    class _ExpDispForm(Form):
        discipline = ModelChoiceField(queryset=learnables,disabled=False)
        exp = BooleanField(initial=False,required=False)
        special_exp = IntegerField(initial=0)
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
                    special_exp = v['special_exp'],
                    )
                spend.character = char
                spend.session = session  
                spend.save()  
                
    # attributes 
     
    learns = LearnAttribute.objects.filter(character=char,session=session)
    new_learnables = [learn.attribute for learn in learns]
    
    for learn in new_learnables:
        new_disp = list(AttributeRating.objects.filter(
            character=char,
            attribute=learn))
        if new_disp == []:
            new = AttributeRating.objects.create(
                attribute=learn,
                value=0,
                learned=True,
                learning=True,
                )
            new.save()
            char.attributes.add(new)
            char.save()
        else:
            if not new_disp[0].learned:
                new_disp[0].learned = True
                new_disp[0].learning = True
                new_disp[0].save()
    
    learnables = char.attributes.exclude(learned=False) 
       
    class _ExpAttrForm(Form):
        attribute = ModelChoiceField(queryset=learnables,disabled=False)
        exp = BooleanField(initial=False,required=False)
        special_exp = IntegerField(initial=0)
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
                    special_exp = v['special_exp'],
                    )
                spend.character = char
                spend.session = session  
                spend.save() 

    return {'disciplines':_ExpDispForm, 'attributes':_ExpAttrForm}





class DisciplineActivationFormSet(SessionFormSet):
    def __init__(self, *args, **kwargs):
        super(DisciplineActivationFormSet, self).__init__(*args, **kwargs)
        self.queryset = ActiveDisciplines.objects.filter(
            character=self.character,
            session=self.session)
        self.max_num = 1
        self.can_delete = False
        for form in self.forms:
            form.fields[
                'disciplines'].queryset = self.user.character.disciplines.all()


class FeedingFormSet(SessionFormSet):
    def __init__(self, *args, **kwargs):
        super(FeedingFormSet, self).__init__(*args, **kwargs)
        self.queryset = Feeding.objects.filter(character=self.character,
                                               session=self.session)
        self.max_num = 3
        self.extra = 3
        self.can_delete = False
        for form in self.forms:
            form.fields[
                'discipline'].queryset = self.user.character.disciplines.all()

class ActionFormSet(SessionFormSet):
    def __init__(self, *args, **kwargs):
        super(ActionFormSet, self).__init__(*args, **kwargs)
        self.queryset = Action.objects.filter(character=self.character,
                                              session=self.session)
        self.can_delete = False

        if self.session.is_special:
            action_count = 2
            self.extra = action_count
            self.max_num = self.extra
            i = 0
            for action in [self.session.action_set]:
                for j in range(action.count):
                    form = self.forms[i]
                    # we could use form.initial to look at previous values. However
                    # matching the action to the option is hard.
                    form.fields['action_type'].queryset = action.action_types.all()
                    i = i + 1          

        else: 
            action_count = self.character.action_count(self.session)
            self.extra = action_count
            self.max_num = self.extra
            # otherwise django might populate the forms with actions that
            # doest match their action_type queryset
            i = 0
            for action in self.character.actions(self.session):
                for j in range(action.count):
                    form = self.forms[i]
                    # we could use form.initial to look at previous values. However
                    # matching the action to the option is hard.
                    form.fields['action_type'].queryset = action.action_types.all()
                    form.title = action.name
                    i = i + 1
                



class CharacterForm2(ModelForm):
    class Meta:
        model = Character 
        exclude = ['user','exp','humanityExp','SpecialExp','health','blood','rituals']
       


class CharacterForm(Form):
    name = CharField(max_length=200)
    
    age     = ModelChoiceField(queryset=Age.objects,empty_label=None)
    clan    = ModelChoiceField(queryset=Clan.objects,empty_label=None)
    sire    = ModelChoiceField(queryset=Character.objects,required=False)
    nature  = ModelChoiceField(queryset=Nature.objects,empty_label=None)
    demeanor= ModelChoiceField(queryset=Nature.objects,empty_label=None)

    titles = 	ModelMultipleChoiceField(queryset=Title.objects,required=False)
    
   # canon_fact        = ModelMultipleChoiceField(queryset=CanonFact.objects,required=False)
    political_faction = ModelChoiceField(queryset=PoliticalFaction.objects,empty_label=None)
    
    concept = CharField(
        widget=Textarea(attrs={'col':15,'rows':1}),
        required=False,
        )
    
    social_rating = IntegerField(initial=0)
    mental_rating = IntegerField(initial=0)
    physical_rating = IntegerField(initial=0)


    specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    
    discipline1 = ModelChoiceField(queryset=Discipline.objects,required=False)
    discipline1_rating = IntegerField(initial=0)
    discipline2 = ModelChoiceField(queryset=Discipline.objects,required=False)
    discipline2_rating = IntegerField(initial=0)
    discipline3 = ModelChoiceField(queryset=Discipline.objects,required=False)
    discipline3_rating = IntegerField(initial=0)
    discipline4 = ModelChoiceField(queryset=Discipline.objects,required=False)
    discipline4_rating = IntegerField(initial=0)
    discipline5 = ModelChoiceField(queryset=Discipline.objects,required=False)
    discipline5_rating = IntegerField(initial=0)
    discipline6 = ModelChoiceField(queryset=Discipline.objects,required=False)
    discipline6_rating = IntegerField(initial=0)

    humanity   = IntegerField(initial=7)
    willpower  = IntegerField(initial=0)
    generation = IntegerField(initial=13) 
       
    hook1_name        = CharField(required=False)
    hook1_concept        = CharField(required=False)
    hook1_influence   = ModelChoiceField(queryset=Influence.objects,required=False)
    hook1_attributes  = ModelMultipleChoiceField(queryset=HookAttribute.objects,required=False)
    
    hook2_name        = CharField(required=False)
    hook2_concept        = CharField(required=False)
    hook2_influence   = ModelChoiceField(queryset=Influence.objects,required=False)
    hook2_attributes  = ModelMultipleChoiceField(queryset=HookAttribute.objects,required=False)
    
    hook3_name        = CharField(required=False)
    hook3_concept        = CharField(required=False)
    hook3_influence   = ModelChoiceField(queryset=Influence.objects,required=False)
    hook3_attributes  = ModelMultipleChoiceField(queryset=HookAttribute.objects,required=False)
    
    hook4_name        = CharField(required=False)
    hook4_concept        = CharField(required=False)
    hook4_influence   = ModelChoiceField(queryset=Influence.objects,required=False)
    hook4_attributes  = ModelMultipleChoiceField(queryset=HookAttribute.objects,required=False)
    
    
    hook5_name        = CharField(required=False)
    hook5_concept        = CharField(required=False)
    hook5_influence   = ModelChoiceField(queryset=Influence.objects,required=False)
    hook5_attributes  = ModelMultipleChoiceField(queryset=HookAttribute.objects,required=False)
    
    hook6_name        = CharField(required=False)
    hook6_concept     = CharField(required=False)
    hook6_influence   = ModelChoiceField(queryset=Influence.objects,required=False)
    hook6_attributes  = ModelMultipleChoiceField(queryset=HookAttribute.objects,required=False)
    
   
# boons
  
# relationships    
    
    open_goal1  = CharField(widget=Textarea(attrs={'col':15,'rows':3}),required=False)
    open_goal2  = CharField(widget=Textarea(attrs={'col':15,'rows':3}),required=False)
    hidden_goal = CharField(widget=Textarea(attrs={'col':15,'rows':3}),required=False)
    
    herd    = IntegerField(initial=0)
    haven   = IntegerField(initial=0)

    weapons   = ModelMultipleChoiceField(queryset=Weapon.objects,required=False)

    equipment1_name = CharField(required=False)
    equipment1_influence = ModelChoiceField(queryset=Influence.objects,required=False)
    equipment2_name = CharField(required=False)
    equipment2_influence = ModelChoiceField(queryset=Influence.objects,required=False)
    equipment3_name = CharField(required=False)
    equipment3_influence = ModelChoiceField(queryset=Influence.objects,required=False)
    
    ghoul1_name = CharField(required=False)
    ghoul1_level = IntegerField(initial=0)
    ghoul1_specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    ghoul1_discipline1 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul1_discipline1_rating = IntegerField(initial=0)
    ghoul1_discipline2 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul1_discipline2_rating = IntegerField(initial=0)
    ghoul1_discipline3 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul1_discipline3_rating = IntegerField(initial=0)
    
    ghoul2_name = CharField(required=False)
    ghoul2_level = IntegerField(initial=0)
    ghoul2_specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    ghoul2_discipline1 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul2_discipline1_rating = IntegerField(initial=0)
    ghoul2_discipline2 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul2_discipline2_rating = IntegerField(initial=0)
    ghoul2_discipline3 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul2_discipline3_rating = IntegerField(initial=0)
    
    ghoul3_name = CharField(required=False)
    ghoul3_level = IntegerField(initial=0)
    ghoul3_specializations = ModelMultipleChoiceField(queryset=Specialization.objects,required=False)
    ghoul3_discipline1 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul3_discipline1_rating = IntegerField(initial=0)
    ghoul3_discipline2 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul3_discipline2_rating = IntegerField(initial=0)
    ghoul3_discipline3 = ModelChoiceField(queryset=Discipline.objects,required=False)
    ghoul3_discipline3_rating = IntegerField(initial=0)
    
    additional_notes = CharField(widget=Textarea(attrs={'col':15,'rows':5}),required=False)




excludedFields  = ['character','action_type','session','description','resolved']

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
    
    
    
class GhoulAidActionForm(ActionForm):
    class Meta:
        model = GhoulAidAction
        exclude = excludedFields + aid_excluded
    action_type = "Ghoul Aid Action"  
        
class PrimogensAidActionForm(ActionForm):
    class Meta:
        model = PrimogensAidAction
        exclude = excludedFields + aid_excluded
    action_type = "Primogenens Aid Action"  

class ConserveInfluenceForm(ActionForm):
    class Meta:
        model = ConserveInfluence
        exclude = excludedFields
    action_type = "Conserve (Influence)"

class ConserveDomainForm(ActionForm):
    class Meta:
        model = ConserveDomain
        exclude = excludedFields
    action_type = "Conserve (Domain)"

class InfluenceForgeForm(ActionForm):
    class Meta:
        model = InfluenceForge
        exclude = excludedFields
    action_type = "Influence (Forge)"

class InfluenceStealForm(ActionForm):
    class Meta:
        model = InfluenceSteal
        exclude = excludedFields
    action_type = "Influence (Steal)"
        
class InfluenceDestroyForm(ActionForm):
    class Meta:
        model = InfluenceDestroy
        exclude = excludedFields
    action_type = "Influence (Destroy)"

class InvestigateCharacterInfluenceForm(ActionForm):
    class Meta:
        model = InvestigateCharacterInfluence
        exclude = excludedFields +['hooks']
    action_type = "Investigate (Character: Influence)"

class InvestigateCharacterResourcesForm(ActionForm):
    class Meta:
        model = InvestigateCharacterResources
        exclude = excludedFields
    action_type = "Investigate (Character: Resources)"
        
class InvestigateCharacterDowntimeActionsForm(ActionForm):
    class Meta:
        model = InvestigateCharacterDowntimeActions
        exclude = excludedFields
    action_type = "Investigate (Character: Downtime Actions)"

class InvestigateCounterSpionageForm(ActionForm):
    class Meta:
        model = InvestigateCounterSpionage
        exclude = excludedFields
    action_type = "Investigate (Counter spionage)"

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
        
class NeglectDomainForm(ActionForm):
    class Meta:
        model = NeglectDomain
        exclude = excludedFields + no_roll_excluded
    action_type = "Neglegera domän"        

class PatrolDomainForm(ActionForm):
    class Meta:
        model = PatrolDomain
        exclude = excludedFields + no_roll_excluded
    action_type = "Patrullera domän"  
    
class KeepersQuestionForm(ActionForm):
    class Meta:
        model = KeepersQuestion
        exclude = excludedFields + no_roll_excluded
    action_type = "Elysiemästarens fråga"  

class PrimogensQuestionForm(ActionForm):
    class Meta:
        model = PrimogensQuestion
        exclude = excludedFields + no_roll_excluded
    action_type = "Primogenens fråga"  
                    
formTable = {
    'Aid Action':AidActionForm, 
    'Primogenens Aid Action':PrimogensAidActionForm,
    'Ghoul Aid Action':GhoulAidActionForm,
    'Conserve (Influence)':ConserveInfluenceForm,
    'Conserve (Domain)':ConserveDomainForm,
    'Influence (Forge)':InfluenceForgeForm,
    'Influence (Steal)':InfluenceStealForm,
    'Influence (Destroy)':InfluenceDestroyForm,
    'Investigate (Character: Influence)':InvestigateCharacterInfluenceForm,
    'Investigate (Character: Resources)':InvestigateCharacterResourcesForm,
    'Investigate (Character: Downtime Actions)':InvestigateCharacterDowntimeActionsForm,
    'Investigate (Counter spionage)':InvestigateCounterSpionageForm,
    'Investigate (Phenomenon)':InvestigatePhenomenonForm,
    'Investigate (Influence)':InvestigateInfluenceForm,
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
    'Neglegera domän':NeglectDomainForm,
    'Patrullera domän':PatrolDomainForm,
    'Primogenens fråga':PrimogensQuestionForm,
    'Elysiemästarens fråga':KeepersQuestionForm,
    
    }
                
def actionToForm(action):
    try:
        return formTable[str(action.action_type)]
    except KeyError:
        return ActionForm
    
    
    
    
                  
