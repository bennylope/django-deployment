#!/bin/bash -e

LOGFILE=/home/user/logs/django-project-gunicorn.log
LOGDIR=$(dirname $LOGFILE)
LOGLEVEL=debug

NUM_WORKERS=3
BIND_ADDRESS=127.0.0.1:8000

USER=user
GROUP=user

PROJECTDIR=/home/user/django-project
PROJECTENV=/home/user/.virtualenvs/django-project

source $PROJECTENV/bin/activate
cd $PROJECTDIR
test -d $LOGDIR || mkdir -p $LOGDIR
exec python manage.py run_gunicorn --workers=$NUM_WORKERS --user=$USER --group=$GROUP \
        --bind=$BIND_ADDRESS --log-level=$LOGLEVEL --log-file=$LOGFILE 2>>$LOGFILE
