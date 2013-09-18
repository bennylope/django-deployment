======================================
From runserver to N-tier architectures
======================================

This guide aims to address two questions:

1. How do you serve a Django app in production?
2. How do you get updates from your computer to your server

There are lots of related topics and advanced methods, and while this guide
will cover some and mention many, the primary goal is to give people a solid
footing just answering these two primary questions.

A production server
===================

You might have noticed this in the Django docs with regard to the `runserver
<https://docs.djangoproject.com/en/dev/ref/django-admin/#runserver-port-or-address-port>`_
management command:

    DO NOT USE THIS SERVER IN A PRODUCTION SETTING

It can be confusing at first, but what's really meant is this:

    DO NOT USE THIS SERVER IN A PRODUCTION SETTING

It usually makes more sense the second time around. This is an unoptimized,
minimally tested tool available solely for making your application available in
development.

In production what you want is a dedicated `WSGI
<http://www.python.org/dev/peps/pep-0333/>`_ server, one designed and
configurable for a production environment and controlled by some kind of
process manager.

Moving code to production
=========================

You'll need to move your code from your computer, from your repository, to the
production server. More, you'll want to do this periodically as you fix bugs,
release new features, etc. You could certainly use FTP to move code from one
place to another, but this has some serious downsides. You can't distinguish
between releases.  There's way too much manual intervation required.

What you really want is a way to smoothly move code, run deployment tasks, and
ensure the server uses your new code. You can do better than FTP.
