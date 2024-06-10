from django.core.mail import send_mail, BadHeaderError
from django.http.response import JsonResponse
from django.conf import settings
#from UserApp.response import create_response, HttpResponseCode, HttpRedirectUrl

def send_email(obj):
    subject = obj['subject']
    message = obj['message']
    to_email = obj['toEmail']
    from_email = settings.EMAIL_HOST_USER
    if subject and message and from_email:
        try:
            send_mail(subject, message, from_email, to_email)
        except BadHeaderError:
            return BadHeaderError
        return JsonResponse("An email has been sent. Please do not forget to check your spam folder",safe=False)
    else:
        return JsonResponse("Email sending error",safe=False)
