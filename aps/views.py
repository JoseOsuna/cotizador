from django.http import JsonResponse
from django.urls import reverse_lazy
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView

from django.core import serializers


from aps.models import *

# Create your views here.

def index(request):
    data = {
        'services' : Service.objects.all()[:3]
    }
    return render(request, 'index.html', data)

def services(request):
    data = {
        'services' : Service.objects.all()
    }
    
    return render(request, 'all-the-services.html', data)

def get_services(request, service):
    pass

def planes(request, service):
    data = {
        'planes' : Plan.objects.all(),
        'service': service
    }
    return render(request, 'web-page-planes.html', data)


def cotizacion(request, plan, service):
    services = serializers.serialize("json", Service.objects.all())
    articles = serializers.serialize("json", Article.objects.all())
    
    data = {
        'services' : services,
        'articles' : articles,
        'plan'     : plan,
        'service'  : service
    }
    return render(request, 'generate-cotizacion.html', data)

def finalizar_cotizacion(request):
    
    return render(request, 'finalizar-cotizacion.html')

class QuoteListView(ListView):
    model = Quote
    template_name = ''

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
