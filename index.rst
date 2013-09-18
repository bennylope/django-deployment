=================================
Django Deployments: A Field Guide
=================================

Moving from Django's `runserver` management command on your laptop to a live
webserver can be one of the trickiest steps for newcomers to Django. And not
just newbies. There is no one right way to deploy your application, and the
rest of the community benefits from learning about better practices.

What follows is an attempt to collect and distill some of these practices in a
digestible and applicable way.

This guide is primarily for people deploying to their own servers. Much of the
material will apply if you are deploying to a platform as a service, but this
is not primarily a PaaS deployment guide. It also assumes you are deploying to
a Linux or otherwise Unix like system (unless someone wants to contribute to a
Windows guide of course!). This guide should provide both a roadmap to people
getting started and a reference for more experienced developers.

Proposed outline
================

Getting started
---------------

.. toctree::
   :maxdepth: 1

   intro
   wsgi_servers
   web_servers
   settings_management
   paas

Going live
----------

6. Process management
7. Releases
8. Python dependencies
9. Static assets

Taking control
--------------

10. Logging & exceptions
11. Backing services
12. Securing your Django deployment

Advanced deployment options
---------------------------

13. Configuration management
14. Packaging your application
15. Application containers

Deployment recipes
------------------

Sample configurations, from Nginx configuration, gunicorn conf files, Fabric
scripts, etc.

License
=======

The content of this guide is licensed for use, sharing, and modification under
the Creative Commons license. You may reuse this content and modify it provided
that you supply attribution and that it is for non-commercial purposes. You may
not use this material in any way whatsoever for any commercial purposes.

Contributing
============

Contributions are welcome, whether new content, technical corrections, or just
typo fixes. Just as an open source coding project benefits from a consistent
coding style, so does the guide benefit from a consistent writing style and
voice.

Indices and tables
==================

* :ref:`genindex`
* :ref:`search`

