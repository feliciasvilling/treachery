from django.conf.urls import patterns, url

from players import views

urlpatterns = [
    url(r'^$',
        views.profile,
        name='profile'),
    url(r'^logout$',
        views.logout_view,
        name='logout'),
    url(r'^profile$',
        views.profile,
        name='profile'),
    url(r'^session/(?P<session>\d+)$',
        views.session,
        name='session'),
    url(r'^session/submit/(?P<session>\d+)$',
        views.wizard,
        name='wizard'),
    url(r'^session/submit/(?P<session>\d+)/action_details$',
        views.actionDetails,
        name='action details'),
    url(r'^character$',
        views.make_character,
        name='make character'),
        
]
