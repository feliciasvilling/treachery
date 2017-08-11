from django.contrib import admin
from simple_history.admin import SimpleHistoryAdmin

from players.models import *

# Admin interface


@admin.register(Character)
class CharacterAdmin(admin.ModelAdmin):
    exclude = ('rituals','boons','frenzyTriggers','relationships',
    'canon_fact','concept','attributes','disciplines')
    filter_horizontal = ('titles','specializations')
   # radio_fields = {"clan": admin.HORIZONTAL,'age': admin.HORIZONTAL}
    
admin.site.register(ChangeGoal)       
admin.site.register(EventReport)  
admin.site.register(HealingReport)  
admin.site.register(LostHook) 
admin.site.register(Pronoun) 
admin.site.register(Discipline)

admin.site.register(Place)
admin.site.register(Attribute)

admin.site.register(ExpDisciplineSpending)
admin.site.register(ExpAttributeSpending)
admin.site.register(ExpAdvantageSpending)


@admin.register(AttributeRating)
class AttributeRatingAdmin(admin.ModelAdmin):
    list_display = ('attribute','value','learned','exp','mentor','elder_blood','character')


@admin.register(DisciplineRating)
class DisciplineRatingAdmin(admin.ModelAdmin):
    list_display = ('discipline','value','learned','exp','mentor','elder_blood','character')

admin.site.register(GhoulDisciplineRating)


@admin.register(Ghoul)
class GhoulAdmin(admin.ModelAdmin):
    list_display = ('name','level') 

admin.site.register(Equipment)
admin.site.register(Title)
admin.site.register(CanonFact)
admin.site.register(PoliticalFaction)
admin.site.register(Boon)
admin.site.register(Relationship)
admin.site.register(Age)
admin.site.register(Goal)

@admin.register(Hook)
class HookAdmin(admin.ModelAdmin):
    list_display = ('name','influence','concept','master') 


admin.site.register(InfluenceWant)
admin.site.register(Season)
admin.site.register(Aspect)
admin.site.register(Nature)
admin.site.register(Specialization)
admin.site.register(Ritual)
admin.site.register(RitualRating)
admin.site.register(ActionType)
admin.site.register(Action)
admin.site.register(Domain)
admin.site.register(Session)
admin.site.register(Feeding)
admin.site.register(ActiveDisciplines)
admin.site.register(InfluenceRating)
admin.site.register(Population)
admin.site.register(Influence)
admin.site.register(Clan)
admin.site.register(ActionOption)
admin.site.register(Rumor)

admin.site.register(ElderPower)
admin.site.register(Weapon)
admin.site.register(AidAction)
admin.site.register(ConserveInfluence)
admin.site.register(ConserveDomain)
admin.site.register(InfluenceSteal)
admin.site.register(InfluenceDestroy)
admin.site.register(InvestigateCharacterInfluence)
admin.site.register(InvestigateCharacterResources)
admin.site.register(InvestigateCharacterDowntimeActions)
admin.site.register(InvestigateCounterSpionage)
admin.site.register(InvestigatePhenomenon)
admin.site.register(InvestigateInfluence)
admin.site.register(LearnDiscipline)
admin.site.register(LearnAttribute)
admin.site.register(LearnSpecialization)
admin.site.register(InvestGhoul)
admin.site.register(InvestEquipment)
admin.site.register(InvestWeapon)
admin.site.register(InvestHerd)
admin.site.register(InvestHaven)
admin.site.register(Rest)

admin.site.register(AssignXP)
admin.site.register(NeglectDomain)
admin.site.register(PatrolDomain)
admin.site.register(KeepersQuestion)
admin.site.register(PrimogensQuestion)
admin.site.register(PrimogensAidAction)

admin.site.register(StatusAssignment)  
admin.site.register(Advantage)
admin.site.register(AdvantageRating)


