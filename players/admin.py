from django.contrib import admin
from simple_history.admin import SimpleHistoryAdmin

from players.models import *

# Admin interface

class AttributeRatingInline(admin.TabularInline):
    model = Character.attributes.through
    extra = 0
    min_num = 3
    can_delete = False
    
class DisciplineRatingInline(admin.TabularInline):
    model = Character.disciplines.through
    extra = 0

class HooksInline(admin.TabularInline):
    model = Character.hooks.through
    extra = 1    
    
class GhoulsInline(admin.TabularInline):
    model = Character.ghouls.through
    extra = 1       
    
@admin.register(Character)
class CharacterAdmin(admin.ModelAdmin):
    exclude = ('rituals','boons','frenzyTriggers','relationships',
    'canon_fact','concept','attributes','disciplines')
    filter_horizontal = ('titles','specializations','hooks')
   # radio_fields = {"clan": admin.HORIZONTAL,'age': admin.HORIZONTAL}
    inlines = [AttributeRatingInline, DisciplineRatingInline,GhoulsInline]
    
admin.site.register(Discipline, SimpleHistoryAdmin)
admin.site.register(DisciplineRating, SimpleHistoryAdmin)
admin.site.register(Attribute, SimpleHistoryAdmin)

AttributeRating


@admin.register(AttributeRating)
class AttributeRatingAdmin(admin.ModelAdmin):
    list_display = ('attribute','value','learned','exp','mentor','elder_blood','__character__')

@admin.register(Ghoul)
class GhoulAdmin(admin.ModelAdmin):
    list_display = ('name','level') 

admin.site.register(Equipment, SimpleHistoryAdmin)
admin.site.register(Title, SimpleHistoryAdmin)
admin.site.register(CanonFact, SimpleHistoryAdmin)
admin.site.register(PoliticalFaction, SimpleHistoryAdmin)
admin.site.register(Boon, SimpleHistoryAdmin)
admin.site.register(Relationship, SimpleHistoryAdmin)
admin.site.register(Age, SimpleHistoryAdmin)

@admin.register(Hook)
class HookAdmin(admin.ModelAdmin):
    list_display = ('name','influence','__master__') 

admin.site.register(HookAttribute, SimpleHistoryAdmin)
admin.site.register(Nature, SimpleHistoryAdmin)
admin.site.register(Specialization, SimpleHistoryAdmin)
admin.site.register(Ritual, SimpleHistoryAdmin)
admin.site.register(RitualRating, SimpleHistoryAdmin)
admin.site.register(ActionType, SimpleHistoryAdmin)
admin.site.register(Action, SimpleHistoryAdmin)
admin.site.register(Domain, SimpleHistoryAdmin)
admin.site.register(Session, SimpleHistoryAdmin)
admin.site.register(Feeding, SimpleHistoryAdmin)
admin.site.register(ActiveDisciplines, SimpleHistoryAdmin)
admin.site.register(InfluenceRating, SimpleHistoryAdmin)
admin.site.register(Population, SimpleHistoryAdmin)
admin.site.register(Influence, SimpleHistoryAdmin)
admin.site.register(Clan, SimpleHistoryAdmin)
admin.site.register(ActionOption, SimpleHistoryAdmin)
admin.site.register(ExtraAction, SimpleHistoryAdmin)
admin.site.register(Rumor, SimpleHistoryAdmin)

admin.site.register(ElderPower, SimpleHistoryAdmin)
admin.site.register(Weapon, SimpleHistoryAdmin)
admin.site.register(AidAction, SimpleHistoryAdmin)
admin.site.register(ConserveInfluence, SimpleHistoryAdmin)
admin.site.register(ConserveDomain, SimpleHistoryAdmin)
admin.site.register(InfluenceForge, SimpleHistoryAdmin)
admin.site.register(InfluenceSteal, SimpleHistoryAdmin)
admin.site.register(InfluenceDestroy, SimpleHistoryAdmin)
admin.site.register(InvestigateCharacterInfluence, SimpleHistoryAdmin)
admin.site.register(InvestigateCharacterResources, SimpleHistoryAdmin)
admin.site.register(InvestigateCharacterDowntimeActions, SimpleHistoryAdmin)
admin.site.register(InvestigateCounterSpionage, SimpleHistoryAdmin)
admin.site.register(InvestigatePhenomenon, SimpleHistoryAdmin)
admin.site.register(InvestigateInfluence, SimpleHistoryAdmin)
admin.site.register(LearnDiscipline, SimpleHistoryAdmin)
admin.site.register(LearnAttribute, SimpleHistoryAdmin)
admin.site.register(LearnSpecialization, SimpleHistoryAdmin)
admin.site.register(InvestGhoul, SimpleHistoryAdmin)
admin.site.register(InvestEquipment, SimpleHistoryAdmin)
admin.site.register(InvestWeapon, SimpleHistoryAdmin)
admin.site.register(InvestHerd, SimpleHistoryAdmin)
admin.site.register(InvestHaven, SimpleHistoryAdmin)
admin.site.register(Rest, SimpleHistoryAdmin)

admin.site.register(NeglectDomain, SimpleHistoryAdmin)
admin.site.register(PatrolDomain, SimpleHistoryAdmin)
admin.site.register(KeepersQuestion, SimpleHistoryAdmin)
admin.site.register(PrimogensQuestion, SimpleHistoryAdmin)
admin.site.register(PrimogensAidAction, SimpleHistoryAdmin)
    
admin.site.register(InfluencePriority, SimpleHistoryAdmin)
admin.site.register(ResourcePriority, SimpleHistoryAdmin)




