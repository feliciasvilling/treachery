from django.db import models
from django.db.models import *
from django.contrib.auth.models import User
import random 

# Resolved states
UNRESOLVED = 'UNRESOLVED'
RESOLVED = 'RESOLVED'
PENDING = 'PENDING'
GM = 'GM'

NO_ACTIONS = 'NO_ACTIONS'
# Rumor Types
RUMOR_INFLUENCE = 'Influence'
RUMOR_FACT = 'Fact'
RUMOR_VAMPIRE = 'Character'
RUMOR_ANIMAL = 'Animal'
RUMOR_FACTION = 'Faction'
#DROP TABLE players_historicalcharacter

THEME_CHOICES = (
    ('Humanity', 'Humanity'),
    ('Clan Theme', 'Clan Theme'),
    ('Season Theme', 'Season Theme'),
    ('Nature', 'Nature'),
    ('Faction', 'Faction'),
    ) 
    
INFLUENCE_LEVELS = ['None','Lurker','Contender','Master']    



BLOOD_POOL = [0,0,0,0,45,35,25,15,10,9,8,7,6,5]
BLOOD_SPENDING = [0,0,0,0,10,8,6,5,4,3,2,2,2,1]

def toStrList(qrySet):
    return ','.join(map(str,list(qrySet))) 
    
def prnt(x):
    print("{}".format(x))
    return x    
    
def fact_recievers(influence):
    characters = [h.master
              for h in Hook.objects.filter(influence=influence) 
              if h.master]
    contenders = []
    lurkers = []
    master = None
    for char in set(characters):
        if len([c for c in characters if c == char])==1:
            lurkers.append(char)
        if len([c for c in characters if c == char])==2:
            contenders.append(char)
        if len([c for c in characters if c == char])==3:
            master = char
    return {'influence':influence, 
            'lurkers':lurkers,
            'contenders':contenders,
            'lurkers_name':[lur.name for lur in lurkers],
            'contenders_name':[con.name for con in contenders],
            'master':master}
    
class ActionType(Model):
    name = CharField(max_length=200)
    template = TextField(blank=True)
    no_roll = BooleanField(default=False)
    aid_action = BooleanField(default=False)
    
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
    name = CharField(max_length=200,default="Any Action")
    action_types = ManyToManyField(ActionType)
    count = PositiveIntegerField()
    
    def __str__(self):
        action_types = ' or '.join(a.name for a in self.action_types.all())
        return '{0}: {2} x {1}'.format(self.name,action_types, self.count)
        
class Season(Model):    
    name = CharField(max_length=200)
    theme = TextField()
    is_open = BooleanField(default=False)
    def __str__(self):
        return self.name        

class Influence(Model):
    name = CharField(max_length=200)
    
    def __str__(self):
        return self.name

class Population(Model):
    name = CharField(max_length=200)
    
    def __str__(self):
        return self.name      
        
class Specialization(Model):
    name = CharField(max_length=200)
    def __str__(self):
        return self.name
                   
class Title(Model):
    name = CharField(max_length=200)
    action_options = ManyToManyField(ActionOption, blank=True)
    def __str__(self):
        return self.name
        
class Age(Model):
    name = CharField(max_length=200)
    action_options = ManyToManyField(ActionOption, blank=True)
    generation = PositiveIntegerField(default=0)
    backgrounds = PositiveIntegerField(default=0)
    def __str__(self):
        return self.name
        
class Discipline(Model):
    name = CharField(max_length=200)    
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
        
class Attribute(Model):
    name = CharField(max_length=200)    
    def __str__(self):
        return self.name     
                    
class Advantage(Model):
    name = CharField(max_length=200)    
    costs = CharField(max_length=200) 
    humanity = BooleanField(default=False)
    def __str__(self):
        return self.name    
        
    def get_cost(self,value):
        return self.costs.split(",")[value]
                    
        
class Pronoun(Model):
    subjective = CharField(max_length=10)    
    objective  = CharField(max_length=10) 
    possessive = CharField(max_length=10) 
    def __str__(self):
        return self.subjective
        
class Weapon(Model):
    name = CharField(max_length=200)
    mod = PositiveIntegerField()
    damage_types = (("superficial","superficial"),("aggrevated","aggrevated"))
    damage_type = CharField(max_length=200,choices = damage_types)
    assets = PositiveIntegerField()
    ranged = BooleanField(default=False)
    
    def __str__(self):
        return '{} (cost {}, bonus {} {} {})'.format(
            self.name,
            self.assets,
            self.mod,
            self.damage_type,
            "ranged" if self.ranged else ""
            )              
        
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
        
class Aspect(Model):
    name = CharField(max_length=200)        
    def __str__(self):
        return self.name        
        
class Hook(Model):
    name = CharField(max_length=200)
    concept = CharField(max_length=200,blank=True)
    influence = ForeignKey(Influence,related_name='hooks')
    aspects = ManyToManyField(Aspect,blank=True)  
    master = ForeignKey('Character',blank=True,null=True,related_name='hooks')       
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
        

class Place(Model):        
    name = CharField(max_length=200)
    
            
class Domain(Model):
    name = CharField(max_length=200)
    feeding_capacity = PositiveIntegerField()
    status = CharField(max_length=200)
    owner = ForeignKey('Character', blank=True,null=True)
    influence = CharField(max_length=200)
    masquerade = CharField(max_length=200)
    population = ManyToManyField(Population, blank=True)
    place = ManyToManyField(Place, blank=True)
    allowed = ManyToManyField('Character', blank=True, related_name = "allowed_on")
    def __str__(self):
        population = ', '.join(d.name for d in self.population.all())
        return '{} - Feeding Points: {}, Status: {}, Masquerade: {}'.format(
            self.name, self.feeding_capacity, self.status, self.masquerade)
            
    def resolve(self,session):
        feedings = list(Feeding.objects.filter(session=session,domain=self))
        total_feed = sum([feed.feeding_points for feed in feedings])
        overfeeding = total_feed - self.feeding_capacity
        
        def get_incident_roll(feed):
            return feed.incident_roll
            
        for reciever in feedings:
            reciever.incidents=0
            reciever.save()
                
        if overfeeding>0:
            feedings = sorted(feedings,key=get_incident_roll)
            
            if overfeeding < 4:
                incidents = 1
            else: 
                if overfeeding < 10:
                    incidents = 2
                else:
                    incidents = 4   
                   
            incident_recivers = feedings[0:incidents]
             
            for reciver in incident_recivers:
                reciver.incidents = 1
                incidents -= 1
                reciver.save()
                
                
            if incidents > 0:
                additional_recivers = incident_recivers[0:incidents]
                for reciver in additional_recivers:
                    reciver.incidents += 1
                    incidents -= 1
                    reciver.save()

            if incidents > 0:
                additional_recivers = additional_recivers[0:incidents]
                for reciver in additional_recivers:
                    reciver.incidents += 1
                    incidents -= 1
                    reciver.save()

            if incidents > 0:
                additional_recivers = additional_recivers[0:incidents]
                for reciver in additional_recivers:
                    reciver.incidents += 1
                    incidents -= 1
                    reciver.save()
                    
                         
           # print("overfeeding {}\n{} have incidents at {}" .format(overfeeding,incident_recivers,self.name) )
            

                  
class Character(Model):
    name = CharField(max_length=200)
    pronoun = ForeignKey(Pronoun)
    user = OneToOneField(User, related_name='character', blank=True, null=True)
    picture = ImageField(blank=True,null=True)
    defined = BooleanField(default=False)
    
    nature  = ForeignKey(Nature,blank=True,null=True)
    sire    = ForeignKey('Character',blank=True,null=True)
    clan    = ForeignKey(Clan,blank=True,null=True)
    generation = PositiveIntegerField(default=13)  
    age     = ForeignKey(Age)
    titles  = ManyToManyField(Title, blank=True)
    status = IntegerField(default=0)
        
    specializations = ManyToManyField(Specialization, blank=True)    

    willpower  = PositiveIntegerField(default=0)
    blood      = PositiveIntegerField(default=10)
    
    superficial = PositiveIntegerField(default=0)
    aggravated = PositiveIntegerField(default=0)
    
    assets = PositiveIntegerField(default=0)    
    
    rituals = ManyToManyField(RitualRating, blank=True)
    relationships = ManyToManyField(Relationship, related_name='master', blank=True)
    political_faction = ForeignKey(PoliticalFaction, blank=True,null=True)
    concept = TextField(blank=True)     
        
    herd     = PositiveIntegerField(choices=((0,0),(1,1),(2,2),(3,3)),default=0)
    herd_description = TextField(blank=True)
    haven    = PositiveIntegerField(choices=((0,0),(1,1),(2,2),(3,3)),default=0)
    haven_description = TextField(blank=True)
    haven_domain = ForeignKey(Domain, blank=True, null=True)
    firearms = PositiveIntegerField(choices=((0,0),(1,1),(2,2),(3,3)),default=0)
    melee    = PositiveIntegerField(choices=((0,0),(1,1),(2,2),(3,3)),default=0)
        
    exp          = PositiveIntegerField(default=0)
    humanity_exp = PositiveIntegerField(default=0)
        
    additional_notes = TextField(blank=True)
          
    
    def info(self):
        inf = {
            'picture':self.picture,
            'character':self.name,
            'player':(self.user.first_name +" "+ self.user.last_name),
            'pronoun':self.pronoun,
            'sire':self.sire,
            'clan':self.clan,
            'age':self.age,
            'status':self.status,
            'titles':self.titles,
            'concept':self.concept,
            'goals': Goal.objects.filter(character=self,open_goal=True)
           }
        return inf
    
    def __str__(self):
        try:
            off_name = self.user.first_name + " " + self.user.last_name
        except:
            off_name = " " 
        if off_name == " ":
            off_name = str(self.user) 
        return '{} ({})'.format(self.name, off_name)
 
 
    def display_max_willpower(self):
        rat = AdvantageRating.objects.get(character=self,advantage__name='Willpower')
        return rat.display()
        
    def display_humanity(self):
        rat = AdvantageRating.objects.get(character=self,advantage__name='Humanity')
        return rat.display()        
       
    def display_disciplines(self):
        disps = list(DisciplineRating.objects.filter(character=self))
        disps = [disp.display() for disp in disps]        
        return "\n".join(disps)
        
    def display_attributes(self):
        disps = list(AttributeRating.objects.filter(character=self))
        disps = [disp.display() for disp in disps]        
        return "\n".join(disps)            
        
        
    def action_count(self, session):
        action_options = self.actions(session)
        count = 0
        for action_option in action_options:
            count += action_option.count        
        return count
        
    def actions(self, session):
        action_options = list(self.age.action_options.all())
        for title in self.titles.all():
            action_options.extend(list(title.action_options.all()))
        for ghoul in self.ghouls.filter(hook=None):
            action_options.append(ActionOption.objects.get(name="Aid Action (Ghoul)"))        
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
            
            
    
            
    def get_max_willpower(self):
        rat = AdvantageRating.objects.get(character=self,advantage__name='Willpower')
        return rat.value
        
    def get_humanity(self):
        rat = AdvantageRating.objects.get(character=self,advantage__name='Humanity')
        return rat.value
            
    def get_influences(self):
        return {inf.name:len(self.hooks.filter(influence=inf)) for inf in Influence.objects.all()}
        
        
    def get_influence_list(self):
        return [inf for inf in Influence.objects.all() if len(self.hooks.filter(influence=inf))>0]
    
    def influence_level(self,influence):    
        return len(self.hooks.filter(influence=influence))
        
    def asset_income(self):
        ratings = self.get_influences()
        weights = [0, 1, 5, 10]
        income = 0
        for influence, rating in ratings.items():
            income += weights[rating]
        return income + 2
        
    def get_backgrounds(self):   
        ghouls = sum([ghoul.level for ghoul in self.ghouls.all()])
        equipment = len(list(Equipment.objects.filter(owner=self)))
        return  {'haven': self.haven,
                 'herd': self.herd,
                 'ghouls': ghouls,
                 'equipment': equipment,
                 'firearms':self.firearms,
                 'melee':self.melee}
                 
    def background_cost(self):
        backs = sum([value for key,value in self.get_backgrounds().items()])
        return backs * 2
        
    def get_hooks(self):
        return ['{}: {} ({})' .format(h.influence, h.name, toStrList(h.aspects.all()))
             for h in Hook.objects.filter(master=self)]
             
    

    def resolve(self,session):
        self.assets += self.resource_income()
        self.assets -= self.background_cost()
        
        if not []==list(EventReport.objects.filter(session=session,character=self)):
            report = EventReport.objects.get(session=session,character=self)
            
            if not report.humanity_exp or report.humanity > 0:
                humanity = Advantage.objects.get(character=self,advantage__name='Humanity')
                if humanity.value==1:
                    result = random.randint(0, 10)  
                    if result != 10:
                        humanity.value -= 1
                        self.additional_notes += "lost humanity"
                else:    
                    result = 0
                    for die in range(0,humanity.value):
                        result += random.randint(0, 1)  
                    if self.clan.name == "Gangrel":
                        if humanity.value > 2:
                            if result < 3:
                                humanity.value -= 1
                                self.additional_notes += "lost humanity"
                        else:
                            if result < 2:
                                humanity.value -= 1
                                self.additional_notes += "lost humanity"
                    else:
                        if result < 2:
                            humanity.value -= 1
                            self.additional_notes += "lost humanity"
            else:
                if humanity.value_exp > 1:
                    humanity.value_exp -= 2
                    humanity.value += 1
            humanity.save      
            
class InfluenceWant(Model):
    character =  ForeignKey(Character) 
    influence =  ForeignKey(Influence)
    wanted = IntegerField(default=0)
    dislodged = IntegerField(default=0)
    final = BooleanField(default=False)
    elder = BooleanField(default=False)
    def __str__(self):
        
        info = ""
        if self.final:
            info += " Final"
        if self.elder:
            info += " Elder"
        if self.dislodged > 0:
            info += " Disloged: {}" .format(self.dislodged)            
        
    
        return '{} wants {} {}{}'\
            .format(self.character.name,self.influence,self.wanted,info)    
            
        
class Equipment(Model):
  owner = ForeignKey(Character,blank=True,null=True)
  name = CharField(max_length=200)
  specialization = ForeignKey(Specialization,null=True,blank=True)  
  def __str__(self):
        return '{} ({})'.format(self.name,self.specialization.name)    


class AdvantageRating(Model):
    character = ForeignKey(Character, null=True, blank=True)
    advantage = ForeignKey(Advantage, null=True, blank=True)
    learned = BooleanField(default=False)
    learning = BooleanField(default=False)  
    mentor = BooleanField(default=False)
    value = PositiveIntegerField(default=1)
    exp = PositiveIntegerField(default=0)    
    
    def __character__(self):
        return self.character
    def __str__(self):
        return  '{} {}'.format(self.advantage.name, str(self.value))
       
        
    def get_needed(self):
        needed = self.advantage.get_cost(self.value)
        #the table in the rule is for the level wanted, we use the existing 
        #level here, which compensates for lists being zero indexed.
        bonus = []
        return {'needed':needed,'bonus':bonus}
        
    def spending(self):
        if self.learned:
            need = self.get_needed()                            
            return "{} of {} XP needed for raise."\
             .format(self.exp,need['needed'])
        else:    
            return ""
    
    def display(self):
        return '{}{}'.format(self.value,self.spending()) 


class ExpAdvantageSpending(Model):
    character = ForeignKey('Character', 
        related_name='exp_adv_spending', blank=True,null=True)
    session = ForeignKey('Session', 
        related_name='exp_adv_spending', blank=True,null=True)

    advantage = ForeignKey(AdvantageRating)
    exp = BooleanField()
    
    def __str__(self):
        return '{}: {}'.format(
            self.session, 
            self.character) 
            
    def resolve(self):

        if self.advantage.advantage.humanity:
        
            if self.humanity_exp and self.character.humanity_exp > 0:
                self.advantage.humanity_exp += 1
                self.character.humanity_exp -= 1
            
            if self.advantage.humanity_exp >= self.advantage.get_needed()['needed']:
               self.advantage.value += 1
               self.advantage.humanity_exp -= self.advantage.get_needed()['needed']
               self.advantage.learned = False
                
            if self.advantage.humanity_exp < 0:
              self.advantage.humanity_exp = 0  
          
        else:  

            if self.exp and self.character.exp > 0:
                self.advantage.exp += 1
                self.character.exp -= 1
            
            if self.advantage.exp >= self.advantage.get_needed()['needed']:
               self.advantage.value += 1
               self.advantage.exp -= self.advantage.get_needed()['needed']
               self.advantage.learned = False
                
            if self.advantage.exp < 0:
              self.advantage.exp = 0   
            
        self.advantage.save()
       
ATTRIBUTE_TABLE =[0, 2, 3, 4, 5, 6, 6, 7, 7, 8]
        
class AttributeRating(Model):
    character = ForeignKey(Character, null=True, blank=True)
    attribute = ForeignKey(Attribute, null=True, blank=True)
    learned = BooleanField(default=False)
    learning = BooleanField(default=False)  
    elder_blood = BooleanField(default=False)
    mentor = BooleanField(default=False)
    value = PositiveIntegerField(default=1)
    exp = PositiveIntegerField(default=0)    
    
    def __character__(self):
        return self.character
    def __str__(self):
        return  '{} {}'.format(self.attribute.name, str(self.value))

    def bonuses(self):
        bonus = []
        if self.elder_blood:
            bonus += ["Elder Blood"]
        if self.mentor:
            bonus += ["Mentor"]
        return bonus
        
        
    def get_needed(self):
        needed = ATTRIBUTE_TABLE[self.value] 
        #the table in the rule is for the level wanted, we use the existing 
        #level here, which compensates for lists being zero indexed.
        
        bonus = self.bonuses()
        
        needed -= len(bonus)
        
        bonus = ','.join(bonus)
            
        if bonus != "":
           bonus = "({})".format(bonus)     
        return {'needed':needed,'bonus':bonus}
        
    def spending(self):
        if self.learned:
            need = self.get_needed()                            
            return "{} of {} XP needed for raise."\
             .format(self.exp,need['needed'],need['bonus'])
        else:    
            return ""
    
    def display(self):
        return '{} {}{}'.format(self.attribute.name, self.value,self.spending()) 
        
        
class ExpAttributeSpending(Model):
    character = ForeignKey('Character', 
        related_name='exp_atr_spending', blank=True,null=True)
    session = ForeignKey('Session', 
        related_name='exp_atr_spending', blank=True,null=True)

    attribute = ForeignKey(AttributeRating)
    exp = BooleanField()
    
    def __str__(self):
        return '{}: {}'.format(
            self.session, 
            self.character) 
            
    def resolve(self):
        if self.exp and self.character.exp > 0:
            self.attribute.exp += 1
            self.character.exp -= 1
        
        if self.attribute.exp >= self.attribute.get_needed()['needed']:
           self.attribute.value += 1
           self.attribute.exp -= self.attribute.get_needed()['needed']
           self.attribute.learned = False
           self.attribute.mentor = False
            
        if self.attribute.exp < 0:
           self.attribute.exp = 0    
            
        self.attribute.save()

class Ghoul(Model):
  name = CharField(max_length=200)
  level = PositiveIntegerField(choices=((1,1),(2,2),(3,3)),default=1)
  hook = OneToOneField(Hook,blank=True,null=True)
  specializations = ManyToManyField(Specialization, blank=True)
  master = ForeignKey(Character,related_name='ghouls',blank=True,null=True)
  
  def __str__(self):
        return '{} (Level: {},{},{}) ' .format(
            self.name,
            self.level,
            toStrList(self.specializations.all()),
            self.master, 
            )  
                    
DISPLINE_TABLE = [4,4,5,5,6,6,7,7,8,8]
         
class GhoulDisciplineRating(Model):
    ghoul = ForeignKey(Ghoul,related_name='disciplines')
    discipline = ForeignKey(Discipline, null=True, blank=True)
    value = PositiveIntegerField(default=1)    
    
    def __str__(self):
        return '{} {}'.format(self.discipline.name, self.value)
                
    def display(self):        
        return '{} {}'.format(self.discipline.name, self.value)
        
class DisciplineRating(Model):
    character   = ForeignKey(Character, null=True, blank=True)
    discipline  = ForeignKey(Discipline, null=True, blank=True,related_name="rating")
    value       = PositiveIntegerField(default=1)
    exp         = PositiveIntegerField(default=0)   
    learned     = BooleanField(default=False)
    learning    = BooleanField(default=False)
    elder_blood = BooleanField(default=False)
    in_clan     = BooleanField(default=False)
    mentor      = BooleanField(default=False)
 
    
    def __str__(self):
        return '{} {} exp: {}'.format(self.discipline.name, str(self.value),self.exp)
        
        
    def bonuses(self): 
        bonus = []
        if self.elder_blood:
            bonus += ["Elder Blood"]
        if self.mentor:
            bonus += ["Mentor"]
        if self.in_clan:
            bonus += ["Clan"]
        return bonus


    def get_needed(self):
        needed = DISPLINE_TABLE[self.value] 
        #the table in the rule is for the level wanted, we use the existing 
        #level here, which compensates for lists being zero indexed.
        bonus = self.bonuses()
        
        needed -= len(bonus)
        
            
        bonus = ','.join(bonus)
        if bonus != "":
           bonus = "({})".format(bonus)  
        return {'needed':needed,'bonus':bonus}
        
    def spending(self):
        if self.learned:
            need = self.get_needed()                            
            return "{} of {} XP needed for raise."\
             .format(self.exp,need['needed'],need['bonus'])
        else:    
            return ""
            
    def display(self):
        
        return '{} {}{}'.format(self.discipline.name, self.value,self.spending())
       
class ExpDisciplineSpending(Model):
    character = ForeignKey('Character', related_name='exp_dis_spending', blank=True,null=True)
    session = ForeignKey('Session', related_name='exp_dis_spending', blank=True,null=True)

    discipline = ForeignKey(DisciplineRating)
    exp = BooleanField()
    
    def __str__(self):
        return '{}: {}'.format(
            self.session, 
            self.character) 
            
    def resolve(self):
        if self.exp and self.character.exp > 0:
            self.discipline.exp += 1
            self.character.exp -= 1        

            
        if self.discipline.exp >= self.discipline.get_needed()['needed']:
        
           print ("{} raising {} from {}, cost {} have {}".format(
                self.character.name,
                self.discipline.discipline.name,
                self.discipline.value,
                self.discipline.get_needed()['needed'],
                self.discipline.exp))
                
           self.discipline.value += 1
           self.discipline.exp -= self.discipline.get_needed()['needed']
           self.discipline.learned = False
           self.discipline.mentor = False
           
        if self.discipline.exp < 0:
          self.discipline.exp = 0
           
        self.discipline.save()
       
       
class ElderPower(Model):
    name = CharField(max_length=200)
    discipline = ForeignKey(DisciplineRating,blank=True,null=True)
    description = TextField()
    def __str__(self):
        return self.name  

class InfluenceRating(Model):
    influence = ForeignKey(Influence)
    rating = PositiveIntegerField()
    character = ForeignKey(Character, related_name='influences')
    
    def __str__(self):
        return '[{}] {}: {:i}'.format(self.character, self.influence, self.rating)

# Session actions
class Session(Model):
    season = ForeignKey(Season,blank=True,null=True)
    name = CharField(max_length=200)
    previous = ForeignKey('Session',blank=True,null=True)
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

class Goal(Model):
    character = ForeignKey(Character, null=True, blank=True)
    theme = CharField(choices=THEME_CHOICES,max_length=20)
    belief = CharField(max_length=100)
    action = CharField(max_length=100)
    open_goal = BooleanField(default=True)
    def __str__(self):
        return 'Based on {}: {} believes that {} and will therefor {}.'.format(self.theme,self.character.name,self.belief,self.action)  
        
    def create_change(self,session):
        change = ChangeGoal.objects.create(
            character=self.character,
            session=session,
            goal=self,
            theme=self.theme,
            belief=self.belief,
            action=self.action,
            open_goal=self.open_goal)
        change.save()
        
class ChangeGoal(Model):
    character = ForeignKey(Character, related_name='change_goal', blank=True,null=True)
    session = ForeignKey(Session, related_name='change_goal', blank=True,null=True)    
    goal = ForeignKey(Goal)
    
    theme = CharField(choices=THEME_CHOICES,max_length=20)
    belief = CharField(max_length=100)
    action = CharField(max_length=100)
    open_goal = BooleanField(default=True)
    
        
    def __str__(self):
        return '{}: {}'.format(
            self.session, 
            self.character)   
                      
    def resolve(self):   
        self.goal.theme = self.theme
        self.goal.belief = self.belief
        self.goal.action = self.action        
        self.goal.save()

class Action(Model):
    result = PositiveIntegerField(default=0)
    action_type = ForeignKey(ActionType)
    character = ForeignKey(Character)
    session = ForeignKey(Session, related_name='actions')
    willpower = BooleanField(default=False,help_text="Do you want to spend a point of willpower for an automatic succses?")
    description = TextField(blank=True)
    resolved = CharField(
        max_length=20,
        choices=(
            (UNRESOLVED, 'Unresolved'), 
            (PENDING, 'Pending'), 
            (GM, 'Need GM attention'), 
            (RESOLVED, 'Resolved')),
        default=UNRESOLVED)
        
    def help_description(self):
        helpers = list(AidAction.objects.filter(helpee = self.character,session=self.session))\
                + list(PrimogensAidAction.objects.filter(
                    helpee = self.character, session=self.session))\
                + list(GhoulAidAction.objects.filter(
                    helpee = self.character, session=self.session))
        
        if len(helpers) == 0:
            lst = ""
        if len(helpers) == 1:
           lst = "{} is geting help from {}.\n" .format(self.character.name,helpers[0])
        if len(helpers) > 1:
            helper = helpers.pop()
            lst = "{} is getting help from {} and {}.\n" .format(
                self.character.name,
                ", ".join(helpers),
                helper)
        if self.willpower:
            lst += "{} spends willpower".format(self.character.name)
        return lst
        
    def resolve(self):
        if self.resolved == UNRESOLVED:
            if self.willpower:
                if self.character.willpower == 0:
                    self.willpower = False
                else:
                    self.character.willpower -= 1
                    self.character.save()
            self.save()    
            self.description = self.to_description() + self.help_description()\
                 + "\n\n"+ self.get_resolution()
            self.save()
        
    def get_resolution(self):
        return "X"    
        
    def get_att(self,attribute):    
        return AttributeRating.objects.get(attribute__name=attribute,character=self.character).value
        
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
    
        help_actions = list(AidAction.objects.filter(helpee=self.character,action=self.action_type,session=self.session))
        help_actions += list(PrimogensAidAction.objects.filter(helpee=self.character,action=self.action_type,session=self.session))
        help_actions += list(GhoulAidAction.objects.filter(helpee=self.character,action=self.action_type,session=self.session))
        help_result = 0
        for help in help_actions:
            help_roll = help.roll(1,attribute,specialization,discipline)
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
            helpers =" + {} from helpers {}" .format(help_result,[h.character.name for h in help_actions])
       
                 
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
    helpee = ForeignKey(
        Character,
        
        related_name="help",
        help_text="The person you are helping. (You are not allowed to chose your self.)")
    action = ForeignKey(
        ActionType,
        limit_choices_to={'no_roll': False, 'aid_action':False},
        help_text="What kind of action you are helping them with")
    name = CharField(
        max_length=200,
        blank=True,
        help_text="if the action is targeting a hook, you need to enter the name of the hook here.")
    def to_description(self):
        hook = 'on {}' .format(self.name) if self.name != "" else ""
        return '{} is helping {} with {} {}.' .format(            
            self.character.name,
            self.helpee.name,
            self.action.name,
            hook
            )
            
    def get_resolution(self):
        self.resolved = RESOLVED 
        self.save()
        return ""
        
        
class PrimogensAidAction(Action):
    helpee = ForeignKey(
        Character,
        related_name="primogen_help",
        help_text="Who do you want to help? (You may only choose members of your own clan.)")
    action = ForeignKey(
        ActionType,
        limit_choices_to={'no_roll': False, 'aid_action':False},
        help_text="What kind of action you are helping them with")
    name = CharField(
        max_length=200,
        blank=True,
        help_text="if the action is targeting a hook, you need to enter the name of the hook here.")
    def to_description(self):
        hook = 'on {}' .format(self.name) if self.name != "" else ""
        return '{} is helping their clanmember {} with {} {}.'.format(
            self.character.name,
            self.helpee.name,
            self.action.name,
            hook)
            
    def get_resolution(self):
        self.resolved = RESOLVED 
        self.save()
        return ""
            
class GhoulAidAction(Action):
    ghoul = ForeignKey(Ghoul)
    helpee = ForeignKey(
        Character,
        related_name="ghoul_help",
        help_text="Who do you want to help?")
    action = ForeignKey(
        ActionType,
        limit_choices_to={'no_roll': False, 'aid_action':False},
        help_text="What kind of action you are helping them with")
    name = CharField(
        max_length=200,
        blank=True,
        help_text="if the action is targeting a hook, you need to enter the name of the hook here.")
    
   
    def to_description(self):
        hook = 'on {}' .format(self.name) if self.name != "" else ""
        return '{} is helping {} with {} {}.'.format(
            self.ghoul.name,
            self.helpee.name,
            self.action.name,
            hook)          
    
    def get_att(self,attribute):    
        return self.ghoul.attributes.get(attribute__name=attribute).value
    
    def get_att(self,attribute):    
        return self.ghoul.disciplines.get(discipline__name=attribute).value    
            
    def roll(self,bonus,attribute,specialization,discipline):
    
        have_spec = False
        for spec in self.ghoul.specializations.all():
            if spec.name == specialization:
                have_spec = True
                
        dice = self.get_att(attribute) + \
               self.get_dis(discipline) + \
               (3 if have_spec else 0) + \
               (1 if self.willpower else 0)
                 
        result = help_result + bonus
        for die in range(0,dice):
            result += random.randint(0, 1)                 
            
        lst = "{} successes ({} {} + {} {}".format(
            result, 
            attribute, self.get_att(attribute), 
            discipline, self.get_dis(discipline),
            )
        if have_spec:
            lst += " + {}" .format(specialization)
        if self.willpower:
            lst += " + Willpower"    
        lst += ")"
        return (result,lst)
        
    def get_resolution(self):
        self.resolved = RESOLVED 
        self.save()
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
        self.resolved = RESOLVED 
        self.save()   
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
        
        feeds = Feeding.objects.filter(session=self.session,domain=self.domain,has_permission=False)
        
        for feed in feeds:
            stealth_roll = feed.roll("Mental","Stealth","---")
            detect_roll = self.roll(1,"Mental","Protection","Protean")
            if detect_roll >= stealth_roll:
                lst += "\n{} have been feeding on {} without permission."\
                  .format(feed.character.name,self.domain.name)
                  
        self.resolved = RESOLVED 
        self.save()
        return lst

        
class LostHook(Model):
    character = ForeignKey(Character)
    session = ForeignKey(Session, related_name='lost_hook')
    hook = ForeignKey(Hook)
    
    def __str__(self):
        return '[{}] {}: {}'.format(self.character, self.session, self.hook)
    
class InfluenceSteal(Action):
    name = CharField(max_length=200,help_text="What is the name of the hook you are trying to steal?")
    influence = ForeignKey(Influence,help_text="In what influence does the hook operate?")
    def to_description(self):
        return '{} is stealing {} in the influence {}.'.format(            
            self.character.name,
            self.name,
            self.influence.name)
            
    def get_resolution(self):
        targets = Hook.objects.filter(name=self.name,influence=self.influence)
        if targets == []:
            self.resolved = GM
            self.save()
            return "no hook matching the discription"
        else:
            target = targets[0]    
        stealth_roll = self.roll (1,"Social",self.influence.name,"Obfuscate")
        attack_roll = self.roll(1, "Social",self.influence.name,"Prescence")

        if target.master:
            conservation = list(ConserveInfluence.objects.filter(
                character=target.master,
                session=self.session,
                influence=self.influence))
        else:
            conservation = []
            
        if conservation == []:
            if target.master:
                defense_roll = self.roll_target(
                    target,0,"Social",self.influence.name,"Dominate")
            else:
                defense_roll = (0,"The hook had no master.")
                
        else:
            conserve_action = conservation[0]
            defense_roll   = conserve_action.roll(3,"Social",self.influence.name,"Dominate")
            detection_roll = conserve_action.roll(1,"Social",self.influence.name,"Auspex")
            if detection_roll[0] >= stealth_roll[0]:
                if attack_roll[0] < defense_roll[0]:
                    conserve_action.description += \
                    "{} rolls {} to prevent attacks, and {} to detect attacks. {} attempted to steal {} in the influence {}."\
                         .format(target.name, defense_roll[1], detection_roll[1],
                                 self.character.name,self.name,self.influence)
                    self.result = 0 
                else: 
                    conserve_action.description += \
                    "{} rolls {} to prevent attacks, and {} to detect attacks. {} stole {} in the influence {}."\
                         .format(target.name, defense_roll[1], detection_roll[1],
                                 self.character.name,self.name,self.influence)
                conserve_action.save()
                
        if attack_roll[0] >= defense_roll[0]:
            self.result = attack_roll[0]
            hook = Hook.objects.get(name=self.name)
            #target.hooks.remove(hook)
            target.save()
            if target.master:
                LostHook.objects.create(
                    character=target.master,
                    session=self.session,
                    hook=target)        
            self.resolved = PENDING
        else:
            self.resolved = RESOLVED
        self.save()    
        if target.master:
            lst = "{} rolls {} to steal the hook." .format(
                    self.character.name, attack_roll[1])    
            lst += "The master of {} rolls {} to resist." .format(
                    self.name, defense_roll[1])
            lst += "\n{} rolls {} to hide their involvement." .format(
                    self.character.name, stealth_roll[1])
        else:
            lst = "{} rolls {} to take control of the hook. The hook had no master.".format(
            self.character.name, attack_roll[1])    
        return lst

class InfluenceDestroy(Action): 
    name = CharField(max_length=200,help_text="What is the name of the hook you are trying to destroy?")
    influence = ForeignKey(Influence,help_text="In what influence does the hook operate?")
    def to_description(self):
        return '{} is destroying {} in the influence {}.'.format(            
            self.character.name,
            self.name,
            self.influence.name)
        
       
INF_TABLE = ['None','Lurker','Contender','Master']       
       
class InvestigateCharacterInfluence(Action): 
    target = ForeignKey(Character,related_name="investigate_influence",help_text="Which character are you interested in?")
    
    def to_description(self):
        return '{} is investigating {}\'s influence.'.format(            
            self.character.name,
            self.target.name)
  
    
    def get_resolution(self):
        investigation_roll = self.roll(1-self.target.haven,"Social","Investigation","Auspex")
        self.result = investigation_roll[0]
        lst = "{} rolls {}:\n" .format(self.character.name, investigation_roll[1])
        
            
        hooks = Hook.objects.filter(master=self.target)
        inf = dict()              
        for influence in Influence.objects.all():
            level = len(list(hooks.filter(influence=influence)))
            inf[influence.name] = INFLUENCE_LEVELS[level]
        
        infos = ["{} ({}, {})" .format(hook.name,hook.influence,inf[hook.influence.name]) for hook in hooks]
        
        random.shuffle(infos)
        infos.append("{} has no more hooks".format(self.target.name))
        lst += '\n'.join(infos[:self.result])

        self.resolved = RESOLVED
        self.save()        
        return lst
    
        
class InvestigateCharacterResources(Action): 
    target = ForeignKey(Character,related_name="investigate_assets",help_text="Which character are you interested in?")
  
    def to_description(self):
        return '{} is investigating {}\'s assets.'.format(
            self.character.name,
            self.target.name)              
            
    def get_resolution(self):
        investigation_roll = self.roll(1-self.target.haven,"Social","Investigation","Protean")
        self.result = investigation_roll[0]
        lst = "{} rolls {}.\n" .format(self.character.name, investigation_roll[1])
        
              
        feedings = Feeding.objects.filter(character=self.target,session=self.session)
       
        infos = ["{} have been feeding {} points on {} ({}).\n" .format(
                    self.target.name,f.feeding_points,f.domain.name,f.description) 
                 for f in feedings]
                 
        for equipment in Equipment.objects.filter(owner=self.target):
            infos.append("{} have a {}.\n".format(self.target.name,equipment))
        for ghoul in Ghoul.objects.filter(master=self.target):
            infos.append("{} have a ghoul ({}).\n".format(self.target.name,ghoul))
            
            
        infos.append( "{} have {} assets.\n" .format(self.target.name,self.target.assets))
        infos.append("{} have a haven of level {} ({}) in {}. You know where it is.\n" .format( self.target.name, self.target.haven,self.target.haven_description,self.target.haven_domain))
        
        if self.target.herd > 0:
            infos.append("{} have a herd of level {} ({}). You know how to find them.\n" .format( self.target.name, self.target.herd,self.target.herd_description))

        if self.target.firearms > 0:
            infos.append("{} have a firearm of level {}.\n" .format(self.target.name,self.target.firearms))

        if self.target.melee > 0:
            infos.append("{} have a melee weapon of level {}.\n" .format(self.target.name, self.target.melee))
        
        print (infos)
        
        random.shuffle(infos)
        infos.append("{} has no more resources".format(self.target.name))
        lst += '\n'.join(infos[:self.result])
        
        self.resolved = RESOLVED
        self.save()      
        return lst
        
class InvestigateCharacterDowntimeActions(Action): 
    target = ForeignKey(Character,related_name="investigate_downtime_actions",help_text="Which character are you interested in?")
    def to_description(self):
        return '{} is investigating {}\'s downtime actions.'.format(
            self.character.name,
            self.target.name,
            )
            
    def get_resolution(self):
        investigation_roll = self.roll(1-self.target.haven,"Mental","Investigation","Protean")
        defense_roll = self.roll_target(self.target,0,"Mental","Subterfugue","Obfuscate")
        
        lst = "{} rolls {}.\n" .format(self.character.name, investigation_roll[1])
        lst += "{} rolls {}.\n" .format(self.target.name, defense_roll[1])
        
        if investigation_roll[0] >= defense_roll[0]:
            lst += "{} is doing the following actions:".format(self.target)
            actions = Action.objects.filter(character=self.target, session=self.session)
            i = 1
            for action in actions:
                lst += "\n\n{}: " .format(i)
                lst += action.description
                i += 1
        else:
            lst += "\n\n Your investigation failed!"
            
        self.resolved = RESOLVED 
        self.save()
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
        
        self.roll = investigation_roll[0]        
       
        detected = ""
        
        for act in spy_actions:
            spy_roll = act.roll(1,"Mental","Subterfuge","Obfuscate")
            if spy_roll[0]<=investigation_roll[0]: 
                detected +="\n{} is doing {} on you. They rolled {} succes to try to hide it, but you caught them."\
                    .format(act.character.name,act.action_type,spy_roll[0])
        lst = "{} rolls {}.\n{}" .format(self.character.name, investigation_roll[1],detected)
        
        self.resolved = RESOLVED 
        self.save()
        return lst  
        
        
        
    
class InvestigatePhenomenon(Action): 
    phenonemon = TextField(help_text="Describe what you want to learn. The more detailed you are the more detailed the information you get will be.")
    def to_description(self):
        return '{} is investigating: {}'.format(self.character.name,self.phenonemon)
    def get_resolution(self):
        lst = "{} rolls {}." .format(self.character.name, self.roll(1,"Mental","Legwork","Dementation")[1])
        self.resolved = GM
        self.save()
        return lst  
        

        
    

class InvestigateInfluence(Action): 
    influence = ForeignKey(Influence,help_text="What influence area are you interested in?")
    def to_description(self):
        return '{} is investigating {}.'.format(self.character.name,self.influence.name)
    def get_resolution(self):
        inestigation_roll = self.roll(1,"Social",self.influence.name,"Auspex")
        self.result = inestigation_roll[0]
        
        lst = "{} rolls {}." .format(self.character.name, inestigation_roll[1])
                
        if self.result >= 1:
            self.result -= 1
            cam = fact_recievers(self.influence)
            lst += "\n"
            if cam['master']:
                lst += "\nMaster: {}" .format(cam['master'].name)            
            for contender in cam['contenders']:
                lst += "\nContender: {}" .format(contender.name)    
            
            hooks = list(Hook.objects.filter(influence=self.influence))
            my_hooks = list(self.character.hooks.filter(influence=self.influence))
            hooks = [hook for hook in hooks if hook not in my_hooks]
            random.shuffle(hooks)
            if self.result >= 1:
                lst += "\n\nHooks: "
                for hook in hooks[0:(self.result)]:
                    lst += "\n{} " .format(hook)
                    if hook.get_master() in cam['contenders']:
                        lst += "(Contender)"
                    else:
                        if hook.get_master() == cam['master']:
                            lst += "(Master)"
                        else:
                            if hook.get_master() == None:
                                lst += "(None)"
                            else:
                                lst += "(Lurker)"
                        
                    
        self.resolved = RESOLVED
        self.save()        
        return lst      
        
class LearnAdvantage(Action): 
    advantage = ForeignKey(Advantage,help_text="What advantage do you want to improve?")
    
    def to_description(self):
        return '{} is learning {}.' .format(
            self.character.name,
            self.advantage.name)
            
    def get_resolution(self):
        adv = self.character.advantages.get(advantage=self.advantage)
        adv.learned = True
        adv.learning = False
        
        lst = "{} trains succesfully.".format(self.character.name)
       
        self.resolved = RESOLVED
        self.save()
        adv.save()
        return lst    

class LearnAttribute(Action): 
    attribute = ForeignKey(Attribute,help_text="What attribute do you want to improve?")
    trainer = ForeignKey(Character,
                         related_name="AttributeTrainee",
                         blank=True,
                         null=True,
                         help_text="Do you have anyone to train you? If so, who?")
    blood = BooleanField(default=False,help_text="if you have someone to train you, do you drink of their blood?")
    def to_description(self):
        teacher = 'With {} as teacher.' .format(self.trainer.name) if self.trainer != None else ""
        return '{} is learning {}. {}' .format(
            self.character.name,
            self.attribute.name,
            teacher)
            
    def get_resolution(self):
        rat = self.character.attributes.get(attribute=self.attribute)
        rat.learned = True
        rat.learning = False
        
        if self.trainer == None:
            lst = "{} trains succesfully.".format(self.character.name)
        else:
            mentor_acts = list(MentorAttribute.objects.filter(
                session=self.session,
                character=self.trainer,
                student=self.character,
                attribute=self.attribute))
            if mentor_acts==[]:
                lst = "{} have not made a mentor action to train {} in {}"\
                    .format(self.trainer.name,self.character.name,self.attribute)
            else:  
                trainer = mentor_acts[0]
                trainer_value = trainer.character.attributes.get(attribute=self.attribute).value
                trainee_value = self.character.attributes.get(attribute=self.attribute).value
                if trainer_value > trainee_value:
                    rat.mentor = True
                    lst = "{} successfully trains {} in {}."\
                            .format(
                                trainer.character.name,
                                self.character.name,
                                self.attribute)
                    if trainer.blood and self.blood:
                        lst += "{} drinks the blood of {}."\
                             .format(self.character.name,trainer.character.name)
                        if trainer.character.age.name == "Elder":
                           rat.elder_blood = True                

                else:
                    lst = "{} is not competent to teach {} in {}. "\
                        .format(trainer.character.name,self.character.name,self.attribute)
        self.resolved = RESOLVED
        self.save()
        rat.save()
        return lst        
                                
class LearnDiscipline(Action): 
    discipline = ForeignKey(Discipline,help_text="What Discipline do you want to improve?")
    trainer = ForeignKey(Character,
                related_name="DisciplineTrainee",
                blank=True,
                null=True,
                help_text="Do you have anyone to train you? If so, who?")
    blood = BooleanField(default=False,help_text="if you have someone to train you, do you drink of their blood?")
    def to_description(self):
        teacher = 'With {} as teacher.' .format(self.trainer.name) if self.trainer != None else ""
        return '{} is learning {}. {}' .format(
            self.character.name,
            self.discipline.name,
            teacher)
            
    def get_resolution(self):
        dis = self.character.disciplines.get(discipline=self.discipline)
        dis.learned = True
        dis.learning = False
        if self.trainer == None:
            lst = "{} trains succesfully.".format(self.character.name)
        else:
            mentor_acts = list(MentorDiscipline.objects.filter(
                session=self.session,
                character=self.trainer,
                student=self.character,
                discipline=self.discipline))
            if mentor_acts==[]:
                lst = "{} have not made a mentor action to train {} in {}" .format(
                    self.trainer.name,
                    self.character.name,
                    self.discipline)
            else:    
                trainer = mentor_acts[0]
                trainer_dis = list(trainer.character.disciplines.filter(
                    discipline=self.discipline))
                if trainer_dis==[]:
                    lst = "{} does not have the discipline {}"\
                        .format(trainer.character.name,self.discipline)
                else:
                    trainer_value = trainer_dis[0].value
                    trainee_dis = list(self.character.disciplines.filter(
                        discipline=self.discipline))
                    if trainee_dis==[]:
                        trainee_value = 0
                    else:
                        trainee_value = trainee_dis[0].value  
                        
                    if trainer_value > trainee_value:
                        dis.mentor = True
                        lst = "{} successfully trains {} in {}." .format(
                                trainer.character.name,
                                self.character.name,
                                self.discipline)
                        if trainer.blood and self.blood:
                            lst += " {} drinks the blood of {}."\
                                 .format(self.character.name,trainer.character.name)
                        if trainer.character.age.name == "Elder":
                           dis.elder_blood = True     
                    else:
                        lst = "{} is not competent to teach {} in {}. "\
                            .format(trainer.character.name,self.character.name,self.discipline)
        self.resolved = RESOLVED
        self.save() 
        dis.save()        
        return lst
                    
class LearnSpecialization(Action): 
    new_specialization = ForeignKey(Specialization,related_name="learner",help_text="Which specialization do want to gain?")
    old_specialization = ForeignKey(Specialization,related_name="forgeter",help_text="Which specialization are you willing to give up?")
    trainer = ForeignKey(Character,
            related_name="SpecializationTrainee",
            blank=True,
            null=True,
            help_text="Do you have anyone to train you? If so, who?")        
            
    def to_description(self):
        teacher = 'With {} as teacher.'.format(self.trainer.name) if self.trainer != None else ""
        return '{} is learning {},replacing {}. {}' .format(
            self.character.name,
            self.new_specialization.name,
            self.old_specialization.name,
            teacher)
            
    def get_resolution(self):
        if self.character.age.name == "Neonate":
            cost = 1
        else: 
            cost = 2
            
        trainee_specializations = list(self.character.specializations.all())
        success = True
                            
        if not self.old_specialization in trainee_specializations:
            lst = "{} does not have the specialization {}"\
                .format(self.character.name,self.old_specialization)    
            success = False
        else:        
            if self.trainer == None:
                if self.character.age.name == "Neonate":
                    lst = "{} trains succesfully.".format(self.character.name)
                else:
                    lst = "Ancilla needs mentorship from a Neonate to change specializations."
                    sucess = False
            else:
                mentor_acts = list(MentorSpecialization.objects.filter(
                    session=self.session,
                    character=self.trainer,
                    student=self.character,
                    specialization=self.new_specialization))
                if mentor_acts==[]:
                    lst = "{} have not made a mentor action to train {} in {}" .format(
                        self.trainer.name,
                        self.character.name,
                        self.new_specialization)
                    if self.character.age.name == "Neonate":
                        lst = "{} trains succesfully.".format(self.character.name)
                    else:
                        lst = "Ancilla needs mentorship from a Neonate to change"++\
                            " specializations."
                        sucess = False
                else:
                    trainer = mentor_acts[0]
                    trainer_specializations = list(trainer.character.specializations.all())
                    if not (self.new_specialization in trainer_specializations):
                        lst = "{} does not have the specialization {}"\
                            .format(trainer.character.name,self.new_specialization)
                        if self.character.age.name == "Neonate":
                            lst = "{} trains succesfully.".format(self.character.name)
                        else:
                            lst = "Ancilla needs mentorship from a Neonate to"++\
                                " change specializations."
                        sucess = False
                    else:
                        lst = "{} successfully trains {} in {}. " .format(
                            trainer.character.name,
                            self.character.name,
                            self.new_specialization)
                        cost -= 1
        if success:
            self.character.exp -= cost
            self.character.specializations.remove(self.old_specialization)
            self.character.specializations.add(self.new_specialization)
            self.character.save()
        self.resolved = RESOLVED
        self.save()           
        return lst
            
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
        ghouls = list(self.character.ghouls.filter(name=self.name))
        if ghouls == []:
            ghoul = Ghoul.objects.create(
                name=self.name,
                level=1)                
            pot = Discipline.objects.get(name="Potence")
            new_rat = DisciplineRating.objects.create(discipline=pot)
            ghoul.disciplines.add(new_rat)
            
            hooks = list(self.character.hooks.filter(name=self.name))
            if hooks != []:
                ghoul.hook = hooks[0]
                lst = "The hook is turned into a ghoul."
            else:
                lst = "The ghoul is created."
            self.character.ghouls.add(ghoul)
        else:
            ghoul = ghouls[0]
            if ghoul.level == 3:
                return "{} is allready at max level (3)" .format(ghoul.name)
            lst = "The level of the ghoul is raised."
            ghoul.level += 1
        ghoul.specializations.add(self.specialization)
        
        rat = list(ghoul.disciplines.filter(discipline=self.discipline))
        if rat==[]:
            new_rat = DisciplineRating.objects.create(discipline=self.discipline)
            ghoul.disciplines.add(new_rat)
        else:
            new_rat = rat[0]
            new_rat.value += 1
            new_rat.save() 
        self.resolved = RESOLVED
        ghoul.save()
        self.save()   
        return lst
  
class InvestEquipment(Action):
    name = CharField(max_length=200,help_text="What kind of equipment is it?")
    specialization = ForeignKey(Specialization,help_text="What specialization should it give as bonus?")
    def to_description(self):
        return '{} is investing in the equipment {}, which is used for {}.'.format(
            self.character.name,
            self.name,
            self.specialization.name)
    def get_resolution(self):
        equipment = Equipment.objects.create(
            name=self.name,
            specialization = self.specialization)
        self.character.equipment.add(equipment)
        self.resolved = RESOLVED
        self.save()
        return "Equipment is acquierd."

class InvestWeapon(Action):
    weapon = CharField(choices=[('melee weapons','melee weapons'),('firearms','firearms')],max_length=20)
    def to_description(self):
        return '{} is investing in {}.'.format(            
            self.character.name,
            self.weapon)
    def get_resolution(self):
        if self.weapon == 'firearms':
            if self.character.firearms == 3:
                lst = "The max level (3) for firearms is allready achieved."
            else:
                self.character.firearms += 1
                lst = "Level of firearms is raised."
        else:
            if self.character.melee == 3:
                lst = "The max level (3) for melee weapons is allready achieved."
            else:
                self.character.melee += 1
                lst = "Level of melee weapons is raised."
        self.resolved = RESOLVED
        self.save()
        print (lst)
        return lst

class InvestHerd(Action):
    def to_description(self):
        return '{} is investing in their herd.'.format(
            self.character.name)
    def get_resolution(self):
        if self.character.herd == 3:
            lst = "The max level (3) for herd is allready achieved."
        else:
            self.character.herd += 1
            lst = "Level of herd raised."
        self.resolved = RESOLVED
        self.character.save()
        self.save()
        return lst
    
class InvestHaven(Action): 
    def to_description(self):
        return '{} is investing in their haven.'.format(
            self.character.name)
    def get_resolution(self):
        if self.character.haven == 3:
            lst = "The max level (3) for haven is allready achieved."
        else:
            self.character.haven += 1
            lst = "Level of haven raised."
        self.resolved = RESOLVED
        self.character.save()
        self.save()
        return lst    
    

class MentorAttribute(Action): 
    attribute = ForeignKey(Attribute,help_text="What attribute do you want to help your student improve?")
    student   = ForeignKey(Character,related_name="attribute_teacher",help_text="Who do you want to mentor?")
    blood = BooleanField(default=True,help_text="Do you give of your blood to your student?")
    def to_description(self):
        if self.blood:
            blood = " and offering their blood"
        else:
            blood = ""
        return '{} is mentoring {} on {}{}.'.format(            
            self.character.name,
            self.student.name,
            self.attribute,
            blood)
    def get_resolution(self):
        self.resolved = RESOLVED
        self.save()
        return ""

class MentorDiscipline(Action): 
    discipline = ForeignKey(Discipline,help_text="What discipline do you want to help your student improve?")
    student    = ForeignKey(Character,related_name="discipline_teacher",help_text="Who do you want to mentor?")
    blood = BooleanField(default=True,help_text="Do you give of your blood to your student?")

    def to_description(self):
        if self.blood:
            blood = " and offering their blood"
        else:
            blood = ""
        return '{} is mentoring {} on {}{}.'.format(            
            self.character.name,
            self.student.name,
            self.discipline,
            blood)
    def get_resolution(self):
        self.resolved = RESOLVED
        self.save()
        return ""
        
class MentorSpecialization(Action): 
    specialization = ForeignKey(Specialization,help_text="What specialization do you want to help your student acquire?")
    student        = ForeignKey(Character,related_name="specialization_teacher",help_text="Who do you want to mentor?")
    def to_description(self):
        return '{} is mentoring {} on {}.'.format(            
            self.character.name,
            self.student.name,
            self.specialization)
    def get_resolution(self):
        self.resolved = RESOLVED
        self.save()
        return ""

class Rest(Action):
    def to_description(self):
        return '{} is resting.' .format(self.character.name)
    def get_resolution(self):
        self.character.willpower = self.character.get_max_willpower()
        self.character.save()
        self.resolved = RESOLVED
        self.save()
        return "You now have max willpower."
        
class NeglectDomain(Action):
    domain = ForeignKey(Domain,help_text="Which domain do want to get an additional problem?")
    def to_description(self):
        return '{} is neglecting {}.' .format(
            self.character.name,
            self.domain.name)
            
    def get_resolution(self):
        self.resolved = RESOLVED
        self.save()
        return ""   
        
class PatrolDomain(Action):
    domain = ForeignKey(Domain,help_text="Which domain do want to get one less problem?")
    def to_description(self):
        return '{} is patroling {}.' .format(
            self.character.name,
            self.domain.name)
    def get_resolution(self):
        self.resolved = RESOLVED
        self.save()
        return ""    
        
class KeepersQuestion(Action):
    target = ForeignKey(Character,help_text="Who do you want to question?")
    question = TextField()
    def to_description(self):
        return '{} asked their visitor {}: {}' .format(
            self.character.name,
            self.target.name,
            self.question) 
    def get_resolution(self):
        self.resolved = GM
        self.save()
        return ""
        
class PrimogensQuestion(Action):
    target = ForeignKey(Character,help_text="Who do you want to question? (You may only choose members of your own clan.)")
    question = TextField()
    def to_description(self):
        return '{} asked their clanmember {}: {}' .format(
            self.character.name,
            self.target.name,
            self.question)
    def get_resolution(self):
        self.resolved = GM
        self.save()
        return ""   
                               

class AssignXP(Action):
    target = ForeignKey(Character,help_text="Who do you want to revard for providing the juciest gossip?")
    def to_description(self):
        return '{} is revarding {}.' .format(self.character.name,self.target.name)
    def get_resolution(self):
        self.target.exp += 2
        self.target.save()
        self.resolved = RESOLVED
        self.save()
        return ""



class EventReport(Model):
    character = ForeignKey(Character, related_name='event', blank=True,null=True)
    session = ForeignKey(Session, related_name='event', blank=True,null=True)

    open_goal1  = BooleanField(default=False)
    open_goal2  = BooleanField(default=False)
    hidden_goal = BooleanField(default=False)
    
     
    humanity   = IntegerField(default=0)
    willpower  = IntegerField(default=0)
    blood      = IntegerField(default=0)
    assets  = IntegerField(default=0)
    
    superficial = IntegerField(default=0)
    aggravated = IntegerField(default=0)   
    
                
    def __str__(self):
        return '{}: {}'.format(
            self.session, 
            self.character) 
            
    def resolve(self):
        char = self.character
           
        goal = Goal.objects.filter(character=char)   
           
        if self.open_goal1:
            if goal[0].theme == "Humanity":
                char.humanity_exp += 1
            else:
                char.exp += 1
        if self.open_goal2:
            if goal[1].theme == "Humanity":
                char.humanity_exp += 1
            else:
                char.exp += 1                    
        if self.hidden_goal:
            if goal[2].theme == "Humanity":
                char.humanity_exp += 1
            else:
                char.exp += 1        
            
        char.assets -= self.assets
        humanity = Advantage.objects.get(character=self,advantage__name='Humanity')
        humanity.value -= self.humanity
        char.blood -= self.blood
        
        char.willpower -= self.willpower
        char.superficial += self.superficial
        char.aggravated += self.aggravated
              
        char.save()    
                         
class StatusAssignment(Model):
    assigner = ForeignKey(Character, related_name='status_assignment')
    target   = ForeignKey(Character, related_name='status_assigned')
    session  = ForeignKey(Session)
    status   = IntegerField(default=0, choices=[(-1,-1),(0,0),(1,1)])
    
    def __str__(self):
        return '{}: {} from {} in {}'.format(
            self.target.name,
            self.status,
            self.assigner.name,
            self.session
            )      
                  
                               
class HealingReport(Model):
    character = ForeignKey(Character, related_name='healing', blank=True,null=True)
    session = ForeignKey(Session, related_name='healing', blank=True,null=True)

    superficial = PositiveIntegerField(default=0)
    aggravated = PositiveIntegerField(default=0)            
    
    def __str__(self):
        return '{}: {}'.format(
            self.session, 
            self.character) 
            
    def resolve(self):
        char = self.character
           
        char.superficial -= self.superficial
        char.blood -= 1 * self.superficial
        char.aggravated -= self.aggravated
        char.willpower -= self.aggravated
        char.blood -= 5 * self.aggravated
        
        char.save() 

class Feeding(Model):
    character = ForeignKey(Character)
    session = ForeignKey(Session, related_name='feedings')
    domain = ForeignKey(Domain,help_text="Where do you want to feed?")
    feeding_points = PositiveIntegerField(help_text="How many feeding points do you want to take from this domain?")
    discipline = ForeignKey(Discipline, blank=True, null=True,help_text="What discipline (if any) do you use to feed?")
    description = TextField(help_text="Describe how go about feeding.")
       
    has_good_method = BooleanField(default=True)
    
    incidents = PositiveIntegerField(default=0)
    incident_roll = PositiveIntegerField(default=0)
    
    resolved = CharField(
        max_length=10,
        choices=((UNRESOLVED, 'Unresolved'), (PENDING, 'Pending'), (
            RESOLVED, 'Resolved')),
        default=UNRESOLVED)
        
    def duplicate(self,session):
        new = Feeding.objects.create(
            character =self.character,
            session = session,
            domain = self.domain,
            feeding_points = self.feeding_points,
            discipline = self.discipline,
            description = self.description,
               
            has_good_method = self.has_good_method,
            has_permission = self.has_permission 
        )    
        new.save()
    
    def __str__(self):
        return '[{}] {}: {}points from {}'.format(
            self.session.name, 
            self.character,
            self.feeding_points, 
            self.domain)
            
    def has_permission(self):
        return self.domain.allowed.filter(pk=self.character.id).exists()
            
    def resolve(self):
        if self.is_overfeeding():
            dice = 5
            if self.has_permission():
                dice -= 2
            if self.has_good_method:
                dice -= 1
            if self.discipline != None:
                dice -= 1
            if self.character.get_humanity() < 6:
                dice += 1
            if self.character.get_humanity() < 4:
                dice += 1
            if self.character.clan.name == "Nosferatu":
                dice += 2
                
            result = 0
            for die in range(0,dice):
                result += random.randint(0, 10)
            self.incident_roll = result
            self.save()      
            print("{}: {} of {}".format(self.character.name,self.incident_roll,dice))
            
            
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
       

   


class ActiveDisciplines(Model):
    character = ForeignKey(Character)
    session = ForeignKey(Session, related_name='active_disciplines')
    disciplines = ManyToManyField(Discipline, blank=True,help_text="Which disciplines do you want to use during the downtime?")
    
    def __str__(self):
        disciplines = ', '.join(d.name for d in self.disciplines.all())
        return '[{}] {}: {}'.format(self.session.name, self.character, disciplines)



class Rumor(Model):
    influence = ForeignKey(Influence, blank=True,null=True)
    canonFact = ForeignKey(CanonFact, blank=True,null=True)
    session = ForeignKey(Session, related_name='rumors')
    recipients = ManyToManyField(
        Character,
        blank=True,
        related_name='rumors')
    description = TextField()
    gm_note = TextField(blank=True)
    rumor_type = CharField(
        max_length=15,
        choices=((RUMOR_INFLUENCE, 'Influence'), 
                 (RUMOR_ANIMAL, 'Animal'), 
                 (RUMOR_FACTION, 'Faction'), 
                 (RUMOR_FACT, 'Fact'), 
                 (RUMOR_VAMPIRE, 'Character')),
        default=RUMOR_INFLUENCE)
    def __str__(self):
        return '[{}] {} - {}: {}'.format(self.session.name, self.influence,
                                     self.rumor_type, self.description)
                                     
    

