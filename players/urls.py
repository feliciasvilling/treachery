from django.conf.urls import patterns, url
from django.conf.urls.static import static
from treachery import settings
from players import views

urlpatterns = [
    url(r'^$',
        views.profile,
        name='profile'),
    url(r'^logout$',
        views.logout_view,
        name='logout'),
        
    url(r'^sessions$',
        views.sessions,
        name='player sessions'),
        
    url(r'^influences$',
        views.influences,
        name='influences'),

    url(r'^domains$',
        views.domains,
        name='domains'),
    url(r'^domain/(?P<dom>\d+)$',
        views.domain,
        name='domain'),
        
    url(r'^profile$',
        views.profile,
        name='profile'),
    url(r'^characters$',
        views.characters,
        name='characters'),
    url(r'^assign_status$',
        views.assign_status,
        name='assign status'),
        
    url(r'^session/(?P<session>\d+)$',
        views.session,
        name='session'),
    url(r'^session/submit/(?P<session>\d+)$',
        views.wizard,
        name='wizard'),
    url(r'^session/submit/(?P<session>\d+)/healing$',
        views.healing,
        name='healing'),
    url(r'^session/submit/(?P<session>\d+)/exp$',
        views.spend_exp,
        name='exp'),
    url(r'^session/submit/(?P<session>\d+)/action_details$',
        views.actionDetails,
        name='action details'),
    url(r'^character$',
        views.make_character,
        name='make character'),
        
]+ static("media/", document_root=settings.MEDIA_ROOT)
