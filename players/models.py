from django.db import models
from django.db.models import *
from django.contrib.auth.models import User
import random 
# Resolved states
UNRESOLVED = 'UNRESOLVED'
RESOLVED = 'RESOLVED'
PENDING = 'PENDING'
NO_ACTIONS = 'NO_ACTIONS'
# Rumor Types
RUMOR_UNRELIABLE = 'Unreliable'
RUMOR_RELIABLE = 'Reliable'
RUMOR_FACT = 'Fact'
RUMOR_VAMPIRE = 'Vampire'
#DROP TABLE players_historicalcharacter
def toStrList(qrySet):
    return ','.join(map(str,list(qrySet))) 
class ActionType(Model):
    name = CharField(max_length=200)
    template = TextField(blank=True)
    
    def help_texts():
        help_texts = []
        for action_type in ActionType.objects.order_by('name').all():
            if action_type.template:
                help_texts.append({
                    'title': action_type.name,
                    'text': action_type.template
                })
        return help_texts
    def __str__(self):
        return self.name

class ActionOption(Model):
    action_types = ManyToManyField(ActionType)
    count = PositiveIntegerField()
    
    def __str__(self):
        action_types = ' or '.join(a.name for a in self.action_types.all())
        return '[{}]{}'.format(action_types, self.count)

class Influence(Model):
    name = CharField(max_length=200)
    
    def __str__(self):
        return self.name

class Population(Model):
    name = CharField(max_length=200)
    
    def __str__(self):
        return self.name
class ElderPower(Model):
    name = CharField(max_length=200)
    
    description = TextField()
    def __str__(self):
        return self.name

class Discipline(Model):
    name = CharField(max_length=200)
    
    def __str__(self):
        return self.name
        
class DisciplineRating(Model):
    discipline = ForeignKey(Discipline, null=True, blank=True)
    value = PositiveIntegerField(default=1)
    elder_powers = ManyToManyField(ElderPower, blank=True)
    learned = BooleanField(default=False)
    elder_blood = BooleanField(default=False)
    in_clan = BooleanField(default=False)
    mentor = BooleanField(default=False)
    exp = PositiveIntegerField(default=0)    
    
    def __str__(self):
        return '{} {}'.format(self.discipline.name, str(self.value))
        
class Attribute(Model):
    name = CharField(max_length=200)
    
    def __str__(self):
        return self.name
        
class AttributeRating(Model):
    attribute = ForeignKey(Attribute, null=True, blank=True)
    learned = BooleanField(default=False)
    elder_blood = BooleanField(default=False)
    mentor = BooleanField(default=False)
    value = PositiveIntegerField(default=1)
    exp = PositiveIntegerField(default=0)    
    
    def __character__(self):
        try:
            masters = Character.objects.filter(attributes = self)
            master = ','.join([m.name for m in masters])
        except IndexError:
            master = ""
        return master
    def __str__(self):
        return  '{} {}'.format(self.attribute.name, str(self.value))
        
class Specialization(Model):
    name = CharField(max_length=200)
    def __str__(self):
        return self.name
        
class Weapon(Model):
    name = CharField(max_length=200)
    mod = PositiveIntegerField()
    damage_types = (("bash","bash"),("lethal","lethal"),("aggrevated","aggrevated"))
    damage_type = CharField(max_length=200,choices = damage_types)
    resources = PositiveIntegerField()
    ranged = BooleanField(default=False)
    
    def __str__(self):
        return '{} (cost {}, bonus {} {} {})'.format(
            self.name,
            self.resources,
            self.mod,
            self.damage_type,
            "ranged" if self.ranged else ""
            )
            
class Title(Model):
    name = CharField(max_length=200)
    action_options = ManyToManyField(ActionOption, blank=True)
    def __str__(self):
        return self.name
        
class Age(Model):
    name = CharField(max_length=200)
    action_options = ManyToManyField(ActionOption, blank=True)
    def __str__(self):
        return self.name
        
class Clan(Model):
    name = CharField(max_length=200)
    theme = TextField(blank=True)
    clan_disciplines = ManyToManyField(Discipline, blank=True)
    def __str__(self):
        return self.name
        
class PoliticalFaction(Model):
    name = CharField(max_length=200)
    description = TextField(blank=True)    
    def __str__(self):
        return self.name
        
class CanonFact(Model):
    name = CharField(max_length=200)
    description = TextField()    
    def __str__(self):
        return self.name        
        
class Nature(Model):
    name = CharField(max_length=200)    
    def __str__(self):
        return self.name        
        
class Relationship(Model):
    character = ForeignKey('Character', related_name='relationship')
    complicated = BooleanField()
    description = TextField()
    blood_bond = PositiveIntegerField(choices=((0,0),(1,1),(2,2),(3,3)),default=0)    
    def __str__(self):
        return 'to {}' .format(self.character.name)
        
class Ritual(Model):
    name = CharField(max_length=200)
    level = PositiveIntegerField(default=1)
    description = TextField()    
    def __str__(self):
        return self.name
        
class RitualRating(Model):
    ritual = ForeignKey(Ritual)
    exp = BooleanField(default=False)
    invested = PositiveIntegerField(default=0)        
    
    def __str__(self):
        return '{} {}'.format(self.ritual.name, str(self.invested))
class HookAttribute(Model):
    name = CharField(max_length=200)    
    
    def __str__(self):
        return self.name        
        
class Hook(Model):
    name = CharField(max_length=200)
  #  description = CharField(max_length=200,blank=True)
    influence = ForeignKey(Influence)
    attributes = ManyToManyField(HookAttribute,blank=True)  
    def __master__(self):
        try:
            master = Character.objects.filter(hooks__name = self.name)[0].name
            print (str(master))
        except IndexError:
            master = ""
        return master
    __master__.admin_order_field = 'master__name'
        
    def __str__(self):
        return self.name
        
class Boon(Model):
    signer = ForeignKey('Character')
    SIZE_CHOICES = (
      ('trivial', 'trivial'),
      ('liten', 'liten'),
      ('enkel', 'enkel'),
      ('stor', 'stor'),
      ('livs', 'livs'),
    ) 
    size = CharField(choices=SIZE_CHOICES,max_length=10,default="enkel")
    number = PositiveIntegerField(default=1)
    
    def __str__(self):
        return str(self.number) +" "+self.size + " från " + self.signer.name          
        
        
      
class Equipment(Model):
  name = CharField(max_length=200)
  specialization = ForeignKey(Specialization,null=True,blank=True)
  
  def __str__(self):
        return '{} ({})'.format(self.name,self.specialization.name)
  
class Ghoul(Model):
  name = CharField(max_length=200)
  level = PositiveIntegerField(choices=((1,1),(2,2),(3,3)),default=1)
  hook = OneToOneField(Hook,blank=True,null=True)
  disciplines = ManyToManyField(DisciplineRating, blank=True)
  specializations = ManyToManyField(Specialization, blank=True)
  
  def __str__(self):
        return '{} (Level: {},Potence 1,{},{}) ' .format(
            self.name,
            self.level,
            toStrList(self.disciplines.all()), 
            toStrList(self.specializations.all()))
            
class Domain(Model):
    name = CharField(max_length=200)
    feeding_capacity = PositiveIntegerField()
    status = CharField(max_length=200)
   # incidents = PositiveIntegerField(default=0)
    influence = CharField(max_length=200)
    masquerade = CharField(max_length=200)
    population = ManyToManyField(Population, blank=True)
    def __str__(self):
        population = ', '.join(d.name for d in self.population.all())
        return '{} - Feeding Points: {}, Status: {}, Influence: {}, Masquerade: {}, Population: [{}]'.format(
            self.name, self.feeding_capacity, self.status, self.influence,
            self.masquerade, population)
            
                  
class Character(Model):
    name = CharField(max_length=200)
    user = OneToOneField(
                        User,
                        related_name='character',
                        blank=True,
                        null=True)
    
    nature  = ForeignKey(Nature,related_name='+')
    demeanor= ForeignKey(Nature,related_name='+')
    sire    = ForeignKey('Character',blank=True,null=True)
    clan    = ForeignKey(Clan,blank=True,null=True)
    generation = PositiveIntegerField(default=13)  
    age     = ForeignKey(Age)
    titles  = ManyToManyField(Title, blank=True)
    
    open_goal1  = TextField(blank=True)
  #  open_goal1_humanity  = BooleanField(default=False)
    open_goal2  = TextField(blank=True)
  #  open_goal1_humanity  = BooleanField(default=False)
    hidden_goal = TextField(blank=True)
  #  hidden_goal_humanity = BooleanField(default=False)
    
    attributes  = ManyToManyField(AttributeRating,    blank=True)
    specializations = ManyToManyField(Specialization, blank=True)
    disciplines = ManyToManyField(DisciplineRating,   blank=True)
    
    humanity   = PositiveIntegerField(default=7)
    willpower  = PositiveIntegerField(default=0)
    #max_willpower  = PositiveIntegerField(default=0)
    blood      = PositiveIntegerField(default=10)
    
    health  = PositiveIntegerField(default=0)   
  #  bashing = PositiveIntegerField(default=0)
  #  lethal = PositiveIntegerField(default=0)
  #  aggravated = PositiveIntegerField(default=0)
    
  #  domains = ManyToManyField(Domain,blank=True, related_name='owner')
  
    hooks  = ManyToManyField(Hook,  blank=True, related_name='master')
    resources  = PositiveIntegerField(default=0)
    
    
    rituals     = ManyToManyField(RitualRating,       blank=True)
    boons  = ManyToManyField(Boon,  blank=True)
    frenzyTriggers = TextField(blank=True)
    relationships = ManyToManyField(Relationship, related_name='master', blank=True)
    canon_fact        = ManyToManyField(CanonFact, blank=True)
    political_faction = ForeignKey(PoliticalFaction, blank=True,null=True)
    concept = TextField(blank=True)
        
    
    
    
    herd  = PositiveIntegerField(choices=((0,0),(1,1),(2,2),(3,3)),default=0)
    haven = PositiveIntegerField(choices=((0,0),(1,1),(2,2),(3,3)),default=0)
    equipment = ManyToManyField(Equipment, blank=True)
    weapons   = ManyToManyField(Weapon,    blank=True)
    ghouls    = ManyToManyField(Ghoul,     blank=True)
        
    exp          = PositiveIntegerField(default=0)
    humanity_exp = PositiveIntegerField(default=0)
    special_exp  = PositiveIntegerField(default=0)
    
    
    additional_notes = TextField(blank=True)
          
    
    def __str__(self):
        return '{} ({})'.format(self.name, self.user)
    def action_count(self, session):
        action_options = self.actions(session)
        count = 0
        for action_option in action_options:
            count += action_option.count
        return count
    def actions(self, session):
        action_options = list(self.age.action_options.all())
        extra_actions  = ExtraAction.objects.filter(character=self, session=session)
        for extra_action in extra_actions:
            action_options.extend(extra_action.action_options.all())
        for title in self.titles.all():
            action_options.extend(list(title.action_options.all()))
        return action_options
    def submitted(self, session):
        actions  = Action.objects.filter(character=self, session=session)
        feedings = Feeding.objects.filter(character=self, session=session)
        active_disciplines = ActiveDisciplines.objects.filter(character=self,
                                                              session=session)
        if len(actions) + len(feedings) + len(active_disciplines) > 0:
            return {'disc': active_disciplines,
                    'feed': feedings,
                    'actions': actions}
        else:
            return False
            
    def get_influences(self):
        return {inf.name:len(self.hooks.filter(influence=inf)) for inf in Influence.objects.all()}
            
        
    def resource_income(self):
        ratings = self.get_influences()
        weights = [0, 1, 5, 10]
        income = 0
        for influence, rating in ratings.items():
            income += weights[rating]
        return income
        
    def get_backgrounds(self):   
        ghouls = sum([ghoul.level for ghoul in self.ghouls.all()])
        equipment = len(list(self.equipment.all()))
        weapons = sum([weapon.resources for weapon in self.weapons.all()])
        return  {'haven': self.haven,
                 'herd': self.herd,
                 'ghouls': ghouls,
                 'equipment': equipment,
                 'weapons': weapons}
        
    def background_cost(self):
        return sum([value for key,value in self.get_backgrounds().items()])
    def get_hooks(self):
        return ['{}: {} ({})' .format(h.influence, h.name, toStrList(h.attributes.all()))
             for h in self.hooks.all()]
             

    def resolve(self):
        self.resources += self.resource_income()
        self.resources -= self.background_cost()
        if self.humanity_exp==0:
            if self.humanity==1:
                result = random.randint(0, 10)  
                if result != 10:
                    self.humanity -= 1
                    self.additional_notes += "lost humanity"
            else:    
                result = 0
                for die in range(0,self.humanity):
                    result += random.randint(0, 1)  
                    if self.clan.name == "Gangrel" and self.humanity > 2:
                        if result < 3:
                            self.humanity -= 1
                            self.additional_notes += "lost humanity"

                    else:
                        if result == 0:
                            self.humanity -= 1
                            self.additional_notes += "lost humanity"

        self.save                 
    

class InfluenceRating(Model):
    influence = ForeignKey(Influence)
    rating = PositiveIntegerField()
    character = ForeignKey(Character, related_name='influences')
    
    def __str__(self):
        return '[{}] {}: {:i}'.format(self.character, self.influence, self.rating)

# Session actions
class Session(Model):
    name = CharField(max_length=200)
    is_open = BooleanField(default=True)
    is_special = BooleanField(default=False)
    action_set = ForeignKey(ActionOption,blank=True,null=True)
    feeding_domains = ManyToManyField(Domain, blank=True)
    
    def __str__(self):
        return '[{}] {}'.format('open' if self.is_open else 'closed', self.name)
    def submitted(self):
        return [i for i in list(Character.objects.all()) if i.submitted(self)]
    def resolved_state(self, character):
        """
            Checks all actions and feedings,
            priority is pending > unresolved > resolved
        """
        state = RESOLVED
        actions = list(Action.objects.filter(character=character,
                                             session=self))
        actions.extend(list(Feeding.objects.filter(character=character,
                                                   session=self)))
        if len(actions) == 0:
            return NO_ACTIONS
        for a in actions:
            if a.resolved == PENDING:
                return a.resolved
            elif a.resolved == UNRESOLVED:
                state = UNRESOLVED
        return state

class Action(Model):
    action_type = ForeignKey(ActionType)
    character = ForeignKey(Character)
    session = ForeignKey(Session, related_name='actions')
    helpers = ManyToManyField(
        Character,
        related_name="allowedHelp", 
        blank=True, 
        help_text="People who you excpect help from on this action. (warning: they might betray you.) (Hold down Ctrl to select multiple choices.)")
    willpower = BooleanField(default=False,help_text="Do you want to spend a point of willpower for an automatic succses?")
    description = TextField(blank=True)
    resolved = CharField(
        max_length=10,
        choices=((UNRESOLVED, 'Unresolved'), (PENDING, 'Pending'), (
            RESOLVED, 'Resolved')),
        default=UNRESOLVED)
    
    def resolve(self):
        self.description = self.to_description() +"\n\n"+ self.get_resolution()
        self.resolved = PENDING
        self.save()
        
    def get_resolution(self):
        return "X"    
        
    def get_att(self,attribute):    
        return self.character.attributes.get(attribute__name=attribute).value
        
    def get_dis(self,discipline):   
        activated = list(ActiveDisciplines.objects.filter(character=self.character,session=self.session))
        if activated==[]:
            return 0
        else:    
            active = activated[0]
            disp = list(active.disciplines.filter(discipline__name=discipline))
            if disp==[]:
                return 0
            else:
                return disp[0].value
                
                
    def roll(self,bonus,attribute,specialization,discipline):
    
        helpers = list(self.helpers.all())
        help_actions = list(AidAction.objects.filter(helpee=self.character,action=self.action_type,session=self.session))
        help_actions += list(PrimogensAidAction.objects.filter(helpee=self.character,action=self.action_type,session=self.session))
        help_result = 0
        for help in help_actions:
            if help.character in helpers:
                help_roll = self.roll_target(1,help.character,attribute,specialization,discipline)
                if help.betrayal:
                    help_result -= help_roll[0]
                else:
                    help_result += help_roll[0]
                help.description += "\n"+ help_roll[1]
                help.save()
                
        have_spec = False
        for spec in self.character.specializations.all():
            if spec.name == specialization:
                have_spec = True
                
        dice = self.get_att(attribute) + \
                 self.get_dis(discipline) + \
                 (3 if have_spec else 0) + \
                 (1 if self.willpower else 0)
                 
        result = help_result + bonus
        for die in range(0,dice):
            result += random.randint(0, 1)                 
            
        if help_result==0:
            helpers = ""
        else:
            helpers =" + {} from helpers {}" .format(help_result,[h.name for h in helpers])
       
                 
        lst = "{} successes ({} {} + {} {}{}".format(
            result, 
            attribute, self.get_att(attribute), 
            discipline, self.get_dis(discipline),
            helpers)
        if have_spec:
            lst += " + {}" .format(specialization)
        if self.willpower:
            lst += " + Willpower"    
        lst += ")"
        return (result,lst)
        
    def roll_target(self,target,bonus,attribute,specialization,discipline):
        attribute_value = target.attributes.get(attribute__name=attribute).value
   
        activated = list(ActiveDisciplines.objects.filter(character=target,session=self.session))
        if activated==[]:
            discipline_value = 0
        else:    
            active = activated[0]
            disp = list(active.disciplines.filter(discipline__name=discipline))
            if disp==[]:
                discipline_value = 0
            else:
                discipline_value = disp[0].value    
           
            
        have_spec = False
        for spec in target.specializations.all():
            if spec.name == specialization:
                have_spec = True
                
        dice = attribute_value + \
                 discipline_value + \
                 (3 if have_spec else 0)
                 
        result = bonus
        for die in range(0,dice):
            result += random.randint(0, 1)                 
                 
        lst = "{} successes ({} {} + {} {} ".format(
            result, 
            attribute, attribute_value, 
            discipline, discipline_value)
        if have_spec:
            lst += " + {}" .format(specialization)
        lst += ")"
        return (result,lst)
    def to_description(self):
        return '{} '.format(self.action_type)
    def __str__(self):
        return '[{}] {}: {}'.format(self.session.name, self.character,
                                self.action_type)
                                
                               
class AidAction(Action):
    helpee = ForeignKey(Character,related_name="help",help_text="The person you are helping. (You are not allowed to chose your self.)")
    action = ForeignKey(ActionType,help_text="What kind of action you are helping them with")
    name = CharField(max_length=200,blank=True,help_text="if the action is targeting a hook, you need to enter the name of the hook here.")
    betrayal = BooleanField(default=False,help_text="Do you want to betray them rather than help them?")
    def to_description(self):
        betrayal = '{} is betraying {}.' .format(
            self.character.
            name,self.helpee.name) 
        hook = 'on {}' .format(self.name) if self.name != "" else ""
        return '{} is helping {} with {} {}.\n {}' .format(            
            self.character.name,
            self.helpee.name,
            self.action.name,
            hook,
            betrayal if self.betrayal else ""
            )
            
    def get_resolution(self):
        return ""
class ConserveInfluence(Action): 
    influence = ForeignKey(Influence,help_text="Which of your influences are you trying to conserve? (Warning: Don't choose an influence where you have no hooks.)")
    def to_description(self):
        return '{} is conserving {}.'.format(            
            self.character.name,
            self.influence.name)
          
    def get_resolution(self):
      #  lst = "{} rolls {} to prevent attacks." .format(self.character.name, self.roll(1, "Social",self.influence.name,"Dominate")[1])
      #  lst += "\n{} rolls {} to detect attacks." .format(self.character.name, self.roll (1,"Social",self.influence.name,"Auspex")[1])        
        return ""    

class ConserveDomain(Action): 
    domain = ForeignKey(Domain,help_text="Which domain are you trying to conserve?")
    def to_description(self):
        return '{} is conserving {}.'.format(            
            self.character.name,
            self.domain.name)
    def get_resolution(self):
        detect_roll = self.roll (1,"Mental","Protection","Protean")
        feed_actions = list(Feeding.objects.filter(domain=self.domain,session=self.session))
        detected = ""
        for feed in feed_actions:
            feed_roll = self.roll_target(feed.character,0,"Mental","Stealth","---")
            if True: #feed_roll[0]<=detect_roll[0]:
                detected += "\n{} is feeding on {}. {}"\
                    .format(feed.character.name,self.domain.name,feed.description)
        lst = "{} rolls {} to prevent problems."\
             .format(self.character.name, 
                self.roll(1,"Mental","Protection","Animalism")[1])
        
        feeds = Feeding.objects.filter(session=self.session,domain=self.domain)
        
        for feed in feeds:
            stealth_roll = feed.roll("Mental","Stealth","---")
            detect_roll = self.roll(1,"Mental","Protection","Protean")
            if detect_roll >= stealth_roll:
                lst += "\n{} have been feeding on {}."\
                  .format(feed.character.name,self.domain.name)
        
      #  lst += "\n{} rolls {} to detect poaching. {}" .format(self.character.name, detect_roll[1],detected)        
        return lst

class InfluenceForge(Action): 
    name = CharField(max_length=200,help_text="What is the name of the new hook?")
    influence = ForeignKey(Influence,help_text="In what influence area do you want to create a new hook? (warning: you may not take this action unless you have performed a Investigate Influence actiona for the influence area before. If you want to create a new influence area contact the gamemasters directly.)")
    def to_description(self):
        return '{} is forging {} in the influence {}.'.format(            
            self.character.name,
            self.name,
            self.influence.name)
            
    def get_resolution(self):
        lst = "{} rolls {} to to create a hook." .format(self.character.name, self.roll(1, "Social",self.influence.name,"Prescence")[1])
     #   lst += "\n{} rolls {} to hide their involvement." .format(self.character.name, self.roll (1, "Social","Subterfuge","Obfuscate")[1])        
        return lst
        
class InfluenceSteal(Action):
    name = CharField(max_length=200,help_text="What is the name of the hook you are trying to steal?")
    influence = ForeignKey(Influence,help_text="In what influence does the hook operate?")
    def to_description(self):
        return '{} is stealing {} in the influence {}.'.format(            
            self.character.name,
            self.name,
            self.influence.name)
            
    def get_resolution(self):
        targets = list(Character.objects.filter(hooks__name=self.name))
        if targets==[]:
            return "no hook matching the discription"
        else:
            target = targets[0]    
        stealth_roll = self.roll (1,"Social",self.influence.name,"Obfuscate")
        attack_roll = self.roll(1, "Social",self.influence.name,"Prescence")
        conservation = list(ConserveInfluence.objects.filter(
                character=target,
                session=self.session,
                influence=self.influence))
        
        if conservation == []:
            defense_roll = self.roll_target(target,0,"Social",self.influence.name,"Dominate")
        else:
            conserve_action = conservation[0]
            defense_roll   = conserve_action.roll(3,"Social",self.influence.name,"Dominate")
            detection_roll = conserve_action.roll(1,"Social",self.influence.name,"Auspex")
            if detection_roll[0] >= stealth_roll[0]:
                if attack_roll[0] < defense_roll[0]:
                    conserve_action.description += "{} rolls {} to prevent attacks, and {} to detect attacks. {} attempted to steal {} in the influence {}."\
                         .format(target.name, defense_roll[1], detection_roll[1], self.character.name,self.name,self.influence)
                else: 
                    conserve_action.description += "{} rolls {} to prevent attacks, and {} to detect attacks. {} stole {} in the influence {}."\
                         .format(target.name, defense_roll[1], detection_roll[1],self.character.name,self.name,self.influence)
                conserve_action.save()
        
        print(target.name)
        lst = "{} rolls {} to steal the hook." .format(self.character.name, attack_roll[1])
        lst += "The owner of {} rolls {} to resist." .format(self.name, defense_roll[1])
        lst += "\n{} rolls {} to hide their involvement." .format(self.character.name, stealth_roll[1])        
        return lst

class InfluenceDestroy(Action): 
    name = CharField(max_length=200,help_text="What is the name of the hook you are trying to destroy?")
    influence = ForeignKey(Influence,help_text="In what influence does the hook operate?")
    def to_description(self):
        return '{} is destroying {} in the influence {}.'.format(            
            self.character.name,
            self.name,
            self.influence.name)
        
class InfluencePriority(Model):
    name = CharField(max_length=200)
    cost = PositiveIntegerField()
    influence = ForeignKey(Influence,blank=True,null=True)
    def __str__(self):
        influence = ' ({})'.format(self.influence.name) if self.influence != None else "" 
        return '{}{} ({} successes)'.format(self.name,influence, str(self.cost)) 
       
class InvestigateCharacterInfluence(Action): 
    target = ForeignKey(Character,related_name="investigate_influence",help_text="Which character are you interested in?")
    
   
    priority1 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority1")
    priority2 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority2")
    priority3 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority3")
    priority4 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority4")
    priority5 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority5")
    priority6 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority6")
    priority7 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority7")
    priority8 = ForeignKey(InfluencePriority,blank=True,null=True,related_name="priority8")
    hooks = TextField(blank=True)
    def to_description(self):
        priorities = '{},{},{},{},{},{},{},{}' .format(
            self.priority1,
            self.priority2,
            self.priority3,
            self.priority4,
            self.priority5,
            self.priority6,
            self.priority7,
            self.priority8)
        return '{} is investigating {}\'s influence. \n Priorities: {} \n with hooks: {}'.format(            
            self.character.name,
            self.target.name,
            priorities,
            self.hooks)
    
    def get_resolution(self):
        lst = "{} rolls {}." .format(self.character.name, self.roll(1,"Social","Investigation","Auspex")[1])
        return lst
    
class ResourcePriority(Model):
    name = CharField(max_length=200)
    cost = PositiveIntegerField()
    def __str__(self):       
        return '{} ({} successes)'.format(self.name, str(self.cost)) 
        
class InvestigateCharacterResources(Action): 
    target = ForeignKey(Character,related_name="investigate_resources",help_text="Which character are you interested in?")
  
    priority1 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority1")
    priority2 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority2")
    priority3 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority3")
    priority4 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority4")
    priority5 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority5")
    priority6 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority6")
    priority7 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority7")
    priority8 = ForeignKey(ResourcePriority,blank=True,null=True,related_name="priority8")
    def to_description(self):
        priorities = '{},{},{},{},{},{},{},{}' .format(
            self.priority1,
            self.priority2,
            self.priority3,
            self.priority4,
            self.priority5,
            self.priority6,
            self.priority7,
            self.priority8)
        return '{} is investigating {}\'s resources. \n Priorities: {}'.format(
            self.character.name,
            self.target.name,
            priorities)
            
    def get_resolution(self):
        lst = "{} rolls {}." .format(self.character.name, self.roll(1,"Mental","Investigation","Protean")[1])     
        return lst        
            
class InvestigateCharacterDowntimeActions(Action): 
    target = ForeignKey(Character,related_name="investigate_downtime_actions",help_text="Which character are you interested in?")
    def to_description(self):
        return '{} is investigating {}\'s downtime actions.'.format(
            self.character.name,
            self.target.name,
            )
            
    def get_resolution(self):
        lst = "{} rolls {}." .format(self.character.name, self.roll(1,"Mental","Investigation","Protean")[1])
        lst += "{} rolls {}." .format(self.target.name, self.roll_target(self.target,0,"Mental","Subterfugue","Obfuscate")[1])
        return lst        
    
class InvestigateCounterSpionage(Action):
    pass
    def to_description(self):
        return '{} is doing counter espionage.' .format(self.character.name)
    def get_resolution(self):
        spy_actions = list(InvestigateCharacterInfluence.objects.filter(target=self.character,session=self.session))
        spy_actions += list(InvestigateCharacterResources.objects.filter(target=self.character,session=self.session))
        spy_actions += list(InvestigateCharacterDowntimeActions.objects.filter(target=self.character,session=self.session))
        
        investigation_roll = self.roll(1,"Mental","Investigation","Protean")
        
        print(str(investigation_roll[1]))
        
        detected = ""
        
        for act in spy_actions:
            spy_roll = act.roll(1,"Mental","Subterfuge","Obfuscate")
            if spy_roll[0]<=investigation_roll[0]: 
                detected +="\n{} is doing {} on you. They rolled {} succes to try to hide it, but you caught them."\
                    .format(act.character.name,act.action_type,spy_roll[0])
            
            
        print(detected)
        lst = "{} rolls {}.\n{}" .format(self.character.name, investigation_roll[1],detected)
        return lst  
        
        
        
    
class InvestigatePhenomenon(Action): 
    phenonemon = TextField(help_text="Describe what you want to learn. The more detailed you are the more detailed the information you get will be.")
    def to_description(self):
        return '{} is investigating: {}'.format(self.character.name,self.phenonemon)
    def get_resolution(self):
        lst = "{} rolls {}." .format(self.character.name, self.roll(1,"Mental","Legwork","Dementation")[1])
        return lst  

class InvestigateInfluence(Action): 
    influence = ForeignKey(Influence,help_text="What influence area are you interested in?")
    def to_description(self):
        return '{} is investigating {}.'.format(self.character.name,self.influence.name)
    def get_resolution(self):
        lst = "{} rolls {}." .format(self.character.name, self.roll(1,"Social",self.influence.name,"Auspex")[1])
        return lst      

class LearnAttribute(Action): 
    attribute = ForeignKey(Attribute,help_text="What attribute do you want to improve?")
    trainer = ForeignKey(Character,
                         related_name="AttributeTrainee",
                         blank=True,
                         null=True,
                         help_text="Do you have anyone to train you? If so, who?")
    def to_description(self):
        teacher = 'With {} as teacher.' .format(self.trainer.name) if self.trainer != None else ""
        return '{} is learning {}. {}' .format(
            self.character.name,
            self.attribute.name,
            teacher)
            
    def get_resolution(self):
        return "no roll"
    def get_resolution(self):
        if self.trainer == None:
            return "{} trains succesfully.".format(self.character.name)
        mentor_acts = list(MentorAttribute.objects.filter(session=self.session,character=self.trainer,student=self.character,attribute=self.attribute))
        if mentor_acts==[]:
            return "{} have not made a mentor action to train {} in {}" .format(self.trainer.name,self.character.name,self.attribute)
        else:  
            trainer = mentor_acts[0]
            trainer_value = trainer.character.attributes.get(attribute=self.attribute).value
            trainee_value = self.character.attributes.get(attribute=self.attribute).value
            print(str(trainer_value))
            if trainer_value > trainee_value:
                return "{} successfully trains {} in {}. "\
                    .format(trainer.character.name,self.character.name,self.attribute)
            else:
                return "{} is not competent to teach {} in {}. "\
                    .format(trainer.character.name,self.character.name,self.attribute)
                
                                
class LearnDiscipline(Action): 
    discipline = ForeignKey(Discipline,help_text="What Discipline do you want to improve?")
    trainer = ForeignKey(Character,
                related_name="DisciplineTrainee",
                blank=True,
                null=True,
                help_text="Do you have anyone to train you? If so, who?")
    def to_description(self):
        teacher = 'With {} as teacher.' .format(self.trainer.name) if self.trainer != None else ""
        return '{} is learning {}. {}' .format(
            self.character.name,
            self.discipline.name,
            teacher)
    def get_resolution(self):
        if self.trainer == None:
            return "{} trains succesfully.".format(self.character.name)
        mentor_acts = list(MentorDiscipline.objects.filter(session=self.session,character=self.trainer,student=self.character,discipline=self.discipline))
        if mentor_acts==[]:
            return "{} have not made a mentor action to train {} in {}" .format(self.trainer.name,self.character.name,self.discipline)
        else:    
            trainer = mentor_acts[0]
            trainer_dis = list(trainer.character.disciplines.filter(discipline=self.discipline))
            if trainer_dis==[]:
                return "{} does not have the discipline {}"\
                    .format(trainer.character.name,self.discipline)
            trainer_value = trainer_dis[0].value
            trainee_dis = list(self.character.disciplines.filter(discipline=self.discipline))
            if trainee_dis==[]:
                trainee_value = 0
            else:
                trainee_value = trainee_dis[0].value  
                
            if trainer_value > trainee_value:
                return "{} successfully trains {} in {}. "\
                    .format(trainer.character.name,self.character.name,self.discipline)
            else:
                return "{} is not competent to teach {} in {}. "\
                    .format(trainer.character.name,self.character.name,self.discipline)
                
class LearnSpecialization(Action): 
    new_specialization = ForeignKey(Specialization,related_name="learner",help_text="Which specialization do want to gain?")
    old_specialization = ForeignKey(Specialization,related_name="forgeter",help_text="Which specialization are you willing to give up?")
    trainer = ForeignKey(Character,
            related_name="SpecializationTrainee",
            blank=True,
            null=True,
            help_text="Do you have anyone to train you? If so, who?")        
    def to_description(self):
        teacher = 'With {} as teacher.' .format(self.trainer.name) if self.trainer != None else ""
        return '{} is learning {},replacing {}. {}' .format(
            self.character.name,
            self.new_specialization.name,
            self.old_specialization.name,
            teacher)
    def get_resolution(self):
        if self.trainer == None:
            return "{} trains succesfully.".format(self.character.name)
        mentor_acts = list(MentorSpecialization.objects.filter(session=self.session,character=self.trainer,student=self.character,specialization=self.new_specialization))
        if mentor_acts==[]:
            return "{} have not made a mentor action to train {} in {}" .format(self.trainer.name,self.character.name,self.new_specialization)
        else:
            trainer = mentor_acts[0]
            trainer_specializations = list(trainer.character.specializations.all())
            if not (self.new_specialization in trainer_specializations):
                return "{} does not have the specialization {}"\
                    .format(trainer.character.name,self.new_specialization)
            trainee_specializations = list(self.character.specializations.all())
                    
            if not self.old_specialization in trainee_specializations:
                return "{} does not have the specialization {}"\
                    .format(self.character.name,self.old_specialization)
            else:
                return "{} successfully trains {} in {}. "\
                    .format(trainer.character.name,self.character.name,self.new_specialization)
            
class InvestGhoul(Action):
    name = CharField(max_length=200,help_text="What is the name of the ghoul you want to create, or improve?")
    discipline = ForeignKey(Discipline,help_text="What discipline should the ghoul gain a level in?")
    specialization = ForeignKey(Specialization,help_text="What specialization should the ghould gain?")
    def to_description(self):
        return '{} is investing in the ghoul {}, which is getting {} and {}.'.format(
            self.character.name,
            self.name,
            self.discipline.name,
            self.specialization.name)
    def get_resolution(self):
        return "no roll"
  
class InvestEquipment(Action):
    name = CharField(max_length=200,help_text="What kind of equipment is it?")
    specialization = ForeignKey(Specialization,help_text="What specialization should it give as bonus?")
    def to_description(self):
        return '{} is investing in the equipment {}, which is used for {}.'.format(
            self.character.name,
            self.name,
            self.specialization.name)
    def get_resolution(self):
        return "no roll"

class InvestWeapon(Action):
    weapon = ForeignKey(Weapon,help_text="What weapon do you want to acqire?")
    def to_description(self):
        return '{} is investing in the weapon {}.'.format(            
            self.character.name,
            self.weapon.name)
    def get_resolution(self):
        return "no roll"

class InvestHerd(Action):
    def to_description(self):
        return '{} is investing in their herd.'.format(
            self.character.name)
    def get_resolution(self):
        return "no roll"
    
class InvestHaven(Action): 
    def to_description(self):
        return '{} is investing in their haven.'.format(
            self.character.name)
    def get_resolution(self):
        return "no roll"

class MentorAttribute(Action): 
    attribute = ForeignKey(Attribute,help_text="What attribute do you want to help your student improve?")
    student   = ForeignKey(Character,related_name="attribute_teacher",help_text="Who do you want to mentor?")
    def to_description(self):
        return '{} is mentoring {} on {}.'.format(            
            self.character.name,
            self.student.name,
            self.attribute)
    def get_resolution(self):
        return "no roll"

class MentorDiscipline(Action): 
    discipline = ForeignKey(Discipline,help_text="What discipline do you want to help your student improve?")
    student    = ForeignKey(Character,related_name="discipline_teacher",help_text="Who do you want to mentor?")
    def to_description(self):
        return '{} is mentoring {} on {}.'.format(            
            self.character.name,
            self.student.name,
            self.discipline)
    def get_resolution(self):
        return "no roll"
            
class MentorSpecialization(Action): 
    specialization = ForeignKey(Specialization,help_text="What specialization do you want to help your student acquire?")
    student        = ForeignKey(Character,related_name="specialization_teacher",help_text="Who do you want to mentor?")
    def to_description(self):
        return '{} is mentoring {} on {}.'.format(            
            self.character.name,
            self.student.name,
            self.specialization)
    def get_resolution(self):
        return "no roll"

class Rest(Action):
    def to_description(self):
        return '{} is resting.' .format(self.character.name)
    def get_resolution(self):
        return "no roll"
        
class NeglectDomain(Action):
    domain = ForeignKey(Domain,help_text="Which domain do want to get an additional problem?")
    def to_description(self):
        return '{} is neglecting {}.' .format(
            self.character.name,
            self.domain.name)
            
    def get_resolution(self):
        return "no roll"      
        
class PatrolDomain(Action):
    domain = ForeignKey(Domain,help_text="Which domain do want to get one less problem?")
    def to_description(self):
        return '{} is patroling {}.' .format(
            self.character.name,
            self.domain.name)
    def get_resolution(self):
        return "no roll"        
            
class KeepersQuestion(Action):
    target = ForeignKey(Character,help_text="Who do you want to question?")
    question = TextField()
    def to_description(self):
        return '{} asked their visitor {}: {}' .format(
            self.character.name,
            self.target.name,
            self.question) 
    def get_resolution(self):
        return "no roll"
        
class PrimogensQuestion(Action):
    target = ForeignKey(Character,help_text="Who do you want to question? (You may only choose members of your own clan.)")
    question = TextField()
    def to_description(self):
        return '{} asked their clanmember {}: {}' .format(
            self.character.name,
            self.target.name,
            self.question)
    def get_resolution(self):
        return "no roll"
                               
class PrimogensAidAction(Action):
    helpee = ForeignKey(Character,related_name="primogen_help",help_text="Who do you want to help? (You may only choose members of your own clan.)")
    action = ForeignKey(ActionType,help_text="What kind of action you are helping them with")
    name = CharField(max_length=200,blank=True,help_text="if the action is targeting a hook, you need to enter the name of the hook here.")
    betrayal = BooleanField(default=False,help_text="Do you want to betray rather than help?")
    def to_description(self):
        betrayal = '{} is betraying {}.' .format(
            self.character.
            name,self.helpee.name) 
        hook = 'on {}' .format(self.name) if self.name != "" else ""
        return '{} is helping their clanmember {} with {} {}.\n {}'.format(
            self.character.name,
            self.helpee.name,
            self.action.name,
            hook,
            betrayal if self.betrayal else "")

class Feeding(Model):
    character = ForeignKey(Character)
    session = ForeignKey(Session, related_name='feedings')
    domain = ForeignKey(Domain,help_text="Where do you want to feed?")
    feeding_points = PositiveIntegerField(help_text="How many feeding points do you want to take from this domain?")
    discipline = ForeignKey(DisciplineRating, blank=True, null=True,help_text="What discipline (if any) do you use to feed?")
    description = TextField(help_text="Describe how go about feeding.")
    resolved = CharField(
        max_length=10,
        choices=((UNRESOLVED, 'Unresolved'), (PENDING, 'Pending'), (
            RESOLVED, 'Resolved')),
        default=UNRESOLVED)
    
    def __str__(self):
        return '[{}] {}: .formatd in {}'.format(
            self.session.name, 
            self.character,
            self.feeding_points, 
            self.domain)
    def is_overfeeding(self):
        feedings = list(Feeding.objects.filter(session=self.session,
                                               domain=self.domain))
        sum = 0
        for feeding in feedings:
            sum += feeding.feeding_points
            if sum > self.domain.feeding_capacity:
                return True
        return False
       
       
    def get_att(self,attribute):    
        return self.character.attributes.get(attribute__name=attribute).value
        
    def get_dis(self,discipline):   
        activated = list(ActiveDisciplines.objects.filter(character=self.character,session=self.session))
        if activated==[]:
            return 0
        else:    
            active = activated[0]
            disp = list(active.disciplines.filter(discipline__name=discipline))
            if disp==[]:
                return 0
            else:
                return disp[0].value
                
                
    def roll(self,attribute,specialization,discipline):
                  
        have_spec = False
        for spec in self.character.specializations.all():
            if spec.name == specialization:
                have_spec = True
                
        dice = self.get_att(attribute) + \
                 self.get_dis(discipline) + \
                 (3 if have_spec else 0)
                 
        result = 0
        for die in range(0,dice):
            result += random.randint(0, 1)                 
            
       
                 
        lst = "{} successes ({} {} + {} {}".format(
            result, 
            attribute, self.get_att(attribute), 
            discipline, self.get_dis(discipline))
        if have_spec:
            lst += " + {}" .format(specialization)    
        lst += ")"
        return (result,lst)   
       
    def resolve(self):
        pass
   


class ActiveDisciplines(Model):
    character = ForeignKey(Character)
    session = ForeignKey(Session, related_name='active_disciplines')
    disciplines = ManyToManyField(DisciplineRating, blank=True,help_text="Which disciplines do you want to use during the downtime? (Hold down Ctrl to select multiple choices.)")
    
    def __str__(self):
        disciplines = ', '.join(d.discipline.name for d in self.disciplines.all())
        return '[{}] {}: {}'.format(self.session.name, self.character, disciplines)

class ExtraAction(Model):
    character = ForeignKey(Character, related_name='+')
    session = ForeignKey(Session, related_name='+')
    action_options = ManyToManyField(ActionOption)
    description = TextField()
    
    def __str__(self):
        action_options = ', '.join(str(d) for d in self.action_options.all())
        return '[{}] +{} to {}'.format(self.session.name, action_options,
                                   self.character)

class Rumor(Model):
    influence = ForeignKey(Influence, blank=True,null=True)
    canonFact = ForeignKey(CanonFact, blank=True,null=True)
    session = ForeignKey(Session, related_name='rumors')
    recipients = ManyToManyField(Character,
                                        blank=True,
                                        related_name='rumors')
    description = TextField()
    gm_note = TextField(blank=True)
    rumor_type = CharField(
        max_length=15,
        choices=((RUMOR_UNRELIABLE, 'Unreliable'), (
            RUMOR_RELIABLE, 'Reliable'), (RUMOR_FACT, 'Fact'), (RUMOR_VAMPIRE,
                                                                'Vampire')),
        default=RUMOR_UNRELIABLE)
    def __str__(self):
        return '[{}] {} - {}: {}'.format(self.session.name, self.influence,
                                     self.rumor_type, self.description)
                                     
    

