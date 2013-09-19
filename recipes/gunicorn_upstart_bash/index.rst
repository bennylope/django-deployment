======================================
Gunicorn on Upstart with a Bash script
======================================

This recipe is from Alexis Bellido's `Django Gunicorn Fabfile sample
<https://github.com/alexisbellido/The-Django-gunicorn-fabfile-project>`_. It
consists of an Upstart script for executing a controlling script and the
controlling Bash script.

Files
=====

`/etc/init/project.conf`

.. literalinclude:: project.conf
    :language: bash
    :linenos:

`/home/user/django-project/run-project.sh`

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:

Line by line
============

Let's step through this! While the Upstart script is pretty short it definitely
demands some attention.

Upstart script
--------------

.. literalinclude:: project.conf
    :language: bash
    :linenos:
    :emphasize-lines: 1

This is just a human readable description of the script.

.. literalinclude:: project.conf
    :language: bash
    :linenos:
    :emphasize-lines: 2

This service should be started if the system starts up in a normal mode.

.. literalinclude:: project.conf
    :language: bash
    :linenos:
    :emphasize-lines: 3

This service should be stopped if the system is halted or if it is rebooted.

.. literalinclude:: project.conf
    :language: bash
    :linenos:
    :emphasize-lines: 4

This is a flag saying that if the service is ended unexpectedetly that it
should be restarted.

.. literalinclude:: project.conf
    :language: bash
    :linenos:
    :emphasize-lines: 5

This line sets a limit to the previous line. It says that if the service is
unexpectedly ended more than 10 times within a period of 5 seconds that the
service should not be restarted. The stanza terms here are `count` and
`timeout` (for the values provided as 10 and 5, respectively, in this example).

.. literalinclude:: project.conf
    :language: bash
    :linenos:
    :emphasize-lines: 6

This is what actually gets run by the Upstart job. In this case it executes the
Bash script.

Bash script
-----------

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 3-5

Declares the location for the Gunicorn log and the logging level (e.g. info,
debug, warning, error, critical). The logging directory is set here to ensure
that it can be created (line 18) if it is absent.

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 7

The number of workers the Gunicorn process should spawn to serve requests.

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 8

Declares the address and port to which the Gunicorn process should be bound.
This is important to match against either upstream servers (like a web server)
or open ports.

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 10-11

Declares what user and user group the Gunicorn process should be run as.

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 13-14

Declare the directory paths.

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 16-17

Change the Python path by activating the specified virtual environment and
changes the working directory to the project directory (where the `manage.py`
file is located). If you're not familiar with `virtualenv
<http://www.virtualenv.org/en/latest/>`_, it is a tool for managing and
isolating Python environments. If you're deploying to anything other than a
PaaS - and if you're developing on anything other than a PaaS, like your laptop
- you should use it.

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 18

Create the logging directory if it's not there.

.. literalinclude:: run-project.sh
    :language: bash
    :linenos:
    :emphasize-lines: 19

This is the command to run the server. Note that this example assumes that you
are using Gunicorn's `run_gunicorn` `management command
<http://docs.gunicorn.org/en/latest/run.html#django-manage-py>`_ as opposed to
using Gunicorn with your Django project's WSGI file.
