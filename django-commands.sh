vagrant ssh
cd /vagrant
## creating a python environment in the vm, at the home directory of the vagrant server
python -m venv ~/env
## activating a virtual environment
source ~/env/bin/activate
## to deactivate
deactivate

## install required python packages, django and django rest framework
pip install -r requirements.txt

##initialising and creating a django project
django-admin.py startproject profiles_project .

## creating an app within project 
python manage.py startapp profiles_api

## enable profiles api app in our django app
edit settings.py under profiles_project, add in the dependencies in the installed app

## test changes to a django project by using the django development server
python manage.py runserver 0.0.0.0:8000

## creating migrations
python manage.py makemigrations profiles_api
python manage.py migrate

## set up django admin
python manage.py createsuperuser

##connecting to vagrant server
vagrant ssh
cd /vagrant
source ~/env/bin/activate
python manage.py runserver 0.0.0.0:8000
