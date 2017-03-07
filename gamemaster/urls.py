from django.conf.urls import patterns, url

from gamemaster import views
from django.contrib.admin.views.decorators import staff_member_required

urlpatterns = [
    url(r'^closewindow$',
        views.close,
        name='closewindow'),
    
    url(r'^$',
        staff_member_required(views.SessionListView.as_view()),
        name='sessions'),
    
    url(r'^session/(?P<session>\d+)/toggle$',
        staff_member_required(views.toggle_session),
        name='toggle_session'),
    
    url(r'^session/(?P<session>\d+)/actions$',
        staff_member_required(views.ActionListView.as_view()),
        name='actions'),
        
    url(r'^session/(?P<session>\d+)/actions/resolve$',
        staff_member_required(views.resolve_actions),
        name='resolve_actions'),
    
    url(r'^session/(?P<session>\d+)/feedings$',
        staff_member_required(views.FeedingListView.as_view()),
        name='feedings'),
    
    url(r'^session/(?P<session>\d+)/disciplines$',
        staff_member_required(views.DisciplineListView.as_view()),
        name='disciplines'),
    
    url(r'^session/(?P<session>\d+)/characters$',
        staff_member_required(views.CharacterListView.as_view()),
        name='characters'),
    
    url(r'^session/(?P<session>\d+)/rumors$',
        staff_member_required(views.RumorListView.as_view()),
        name='rumors'),
    
    url(r'^action/(?P<pk>\d+)$',
        staff_member_required(views.ActionUpdate.as_view()),
        name='action'),
    
    url(r'^feeding/(?P<pk>\d+)$',
        staff_member_required(views.FeedingUpdate.as_view()),
        name='feeding'),
    
    url(r'^character/(?P<character>\d+)$',
        staff_member_required(views.character_display),
        name='character'),
    
    url(r'^rumor/(?P<pk>\d+)$',
        staff_member_required(views.RumorUpdate.as_view()),
        name='rumor'),
    
    url(r'^rumor/(?P<session>\d+)/assign$',
        staff_member_required(views.assign_rumors),
        name='assign_rumors'),
]
