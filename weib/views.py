from django.shortcuts import render, redirect
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path

urlpatterns =[]
def redireccion(request):
    return redirect('/main/')
  
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)