# COMPAT UPGRADE: base interpreter bumped 3.7 -> 3.11 to match the modernized
# requirements.txt (Pillow 13, lxml 6.1.3, etc. only ship cp311+ wheels for this
# target, and 3.7-slim cannot install that tested package set any more). All
# other steps are intentionally unchanged, so the container behaves the same.
FROM python:3.11-slim

WORKDIR /

RUN mkdir /storage/

ADD redditdownloader /redditdownloader
ADD requirements.txt /requirements.txt
ADD Run.py /Run.py

RUN pip install -r /requirements.txt

ENTRYPOINT [ "python", "-u", "/redditdownloader", "--settings=/storage/config/settings.json", "--docker"]
