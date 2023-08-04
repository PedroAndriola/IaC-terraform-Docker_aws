FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONNUNBUFFERED=1

WORKDIR /home/ubunu/tcc/

COPY . /home/ubunu/tcc/

RUN pip install -r required.txt

RUN sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['*'\]/" setup/settings.py 

RUN python manage.py migrate

RUN python manage.py loaddata clientes.json

ENTRYPOINT python manage.py runserver 0.0.0.0:8000

EXPOSE 8000