#models.py

#models.py a new field name adminToken is added after
#'adminStatus' field in adminuser
adminToken=models.CharField(max_length=100,null=True)
#and accordingly in serializer.py


#serializers.py

#serializers.py a new field name adminToken is added after
#'adminStatus' field in adminuser serializer in serializers.py
