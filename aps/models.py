from django.db import models
from datetime import datetime

from django.forms import model_to_dict

class Plan(models.Model):
    name = models.CharField(max_length=150, verbose_name='Nombre del plan', unique=True, help_text="Nombre del plan")
    desc = models.TextField(max_length=500, null=True, blank=True, verbose_name='Descripción', help_text="Descripción")
    image = models.ImageField(upload_to='imgs/plan/%Y/%m/%d', null=True, blank=True)
    # price = models.DecimalField(default=0.00, max_digits=12, decimal_places=3)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Plan'
        verbose_name_plural = 'Plans'
        ordering = ['id']
        
        
class Service(models.Model):
    name  = models.TextField(verbose_name='Nombre del servicio', unique=True, help_text="Nombre del servicio")
    desc  = models.TextField(max_length=500, null=True, blank=True, help_text="Descripción")
    image = models.ImageField(upload_to='imgs/service/%Y/%m/%d', null=True, blank=True)
    price = models.DecimalField(default=0.00, max_digits=12, decimal_places=3)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Service'
        verbose_name_plural = 'Services'
        ordering = ['id']
        

class Article(models.Model):
    
    class typeArticle(models.TextChoices):
        FIJO     = 'FIJO'
        OPCIONAL = 'OPCIONAL'
   
    name          = models.TextField(verbose_name='Nombre del articulo', unique=True, help_text="Nombre del articulo")
    desc          = models.TextField(max_length=500, null=True, blank=True, verbose_name='Descripción', help_text="Descripción")
    service       = models.ForeignKey(Service, on_delete=models.CASCADE)
    image         = models.ImageField(upload_to='imgs/article/%Y/%m/%d', null=True, blank=True)
    price         = models.DecimalField(default=0.00, max_digits=12, decimal_places=3)
    type_article  = models.CharField(max_length=8, choices=typeArticle.choices, default=typeArticle.OPCIONAL)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Article'
        verbose_name_plural = 'Articles'
        ordering = ['id']
        

class Discount(models.Model):
    percentage  = models.DecimalField(default=0.00, max_digits=3, decimal_places=2, verbose_name='Percentaje', help_text="Percentaje de descuento")
    created_at     = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.percentage)

    class Meta:
        verbose_name = 'Discount'
        verbose_name_plural = 'Discounts'
        ordering = ['id']      
        


class Tax(models.Model):
    
    percentage  = models.DecimalField(default=0.00, max_digits=3, decimal_places=2, verbose_name='Impuestos', help_text="Impuestos")
    created_at     = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.percentage)

    class Meta:
        verbose_name = 'Tax'
        verbose_name_plural = 'Taxes'
        ordering = ['id']
        
class Costumer(models.Model):
    
    customer_name  = models.CharField(max_length=150, verbose_name='Nombre Completo', help_text="Nombre Completo")
    email          = models.EmailField(max_length=255, verbose_name='Correo electrónico', help_text="Correo electrónico")
    phone          = models.CharField(max_length=20, null=True, blank=True, verbose_name='Teléfono celular', help_text="Teléfono celular")
    city           = models.CharField(max_length=150, null=True, blank=True, verbose_name='Ciudad', help_text="Ciudad")
    
    
    def __init__(self):
        return self.customer_name
        
    class Meta:
        verbose_name = 'Costumer'
        verbose_name_plural = 'Costumers'
        ordering = ['id']  
        
        
        
class Business(models.Model):
    
    company_name          = models.CharField(max_length=150, verbose_name='Nombre de Empresa', help_text="Nombre de Empresa")
    Legal_representative  = models.CharField(max_length=150, verbose_name='Name Legal representative', help_text="Name Legal representative")
    nit                   = models.CharField(max_length=13, verbose_name='Nit', help_text="Nombre Completo")
    company_address       = models.TextField(null=True, blank=True, verbose_name='Dirección de la Empresa', help_text="Dirección de la Empresa")
    phone                 = models.CharField(null=True, blank=True, max_length=20, verbose_name='Teléfono Empresa', help_text="Teléfono Empresa")
    city                  = models.CharField(null=True, blank=True, max_length=150, verbose_name='Ciudad', help_text="Ciudad")
    
    def __str__(self):
        return self.company_name

    class Meta:
        verbose_name = 'Business'
        verbose_name_plural = 'Companies'
        ordering = ['id']    
    
class Quote(models.Model):
    services       = models.ForeignKey(Service, on_delete=models.CASCADE)
    Articles       = models.ForeignKey(Article, on_delete=models.CASCADE)
    customer       = models.ForeignKey(Costumer, on_delete=models.CASCADE)
    business       = models.ForeignKey(Business, on_delete=models.CASCADE)
    tax            = models.ForeignKey(Tax, on_delete=models.CASCADE)
    date           = models.DateField(default=datetime.now, verbose_name='Fecha')
    time           = models.DateTimeField(verbose_name='Hora')
    discounts      = models.ForeignKey(Discount, on_delete=models.CASCADE)
    subtotal       = models.DecimalField(default=0.00, max_digits=12, decimal_places=3)
    total          = models.DecimalField(default=0.00, max_digits=12, decimal_places=3)
    created_at     = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.customer_name

    class Meta:
        verbose_name = 'Quote'
        verbose_name_plural = 'Quotes'
        ordering = ['id']