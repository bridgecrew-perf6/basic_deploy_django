FROM python:3.8
WORKDIR /app
COPY ./app /app
RUN pip install -r requirements.txt


RUN python app/manage.py collectstatic --noinput

# Select one of the following application gateway server commands
CMD uwsgi --http=0.0.0.0:80 --module=basic_deploy_django.wsgi
