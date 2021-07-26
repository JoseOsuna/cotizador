from django.contrib import admin

# Register your models here.

from aps.models import *

admin.site.register(Plan)
admin.site.register(Service)
admin.site.register(Article)
admin.site.register(Discount)
admin.site.register(Tax)
admin.site.register(Costumer)
admin.site.register(Business)
admin.site.register(Quote)