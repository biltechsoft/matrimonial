
# pylint: disable=E1101
import sendgrid
import os
from sendgrid.helpers.mail import *
from django.http.response import JsonResponse

from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail



def testmail():
    return JsonResponse("Email sending error",safe=False)
