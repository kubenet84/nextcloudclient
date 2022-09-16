FROM ubuntu:latest
MAINTAINER schwitz@sossau.com

RUN apt-get update -y \
	&& apt-get install software-properties-common -y \
	&& apt-get update -y \
	&& add-apt-repository -y ppa:nextcloud-devs/client \
	&& apt-get install -y nextcloud-client \
	&& apt-get install -y cron \
	# && apt-get install -y nano \
	# && apt-get install -y locales \
	&& rm -rf /var/lib/apt/lists/*
	# && localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias de_DE.UTF-8 ENV LANG de_DE.utf8

WORKDIR /opt/scripts
ARG NC_USER='Username'
ARG NC_PASS='Password'
ARG NC_LOCAL_PATH=/mnt/local_nc_dir
ARG NC_SERVER='https://cloud.example.com'
ARG NC_SERVER_PATH='/'
ARG NC_PARAMS=''

ENV NC_USER 		$NC_USER
ENV NC_PASS 		$NC_PASS
ENV NC_LOCAL_PATH 	$NC_LOCAL_PATH 
ENV NC_SERVER 		$NC_SERVER
ENV NC_SERVER_PATH	$NC_SERVER_PATH
ENV NC_PARAMS		$NC_PARAMS

COPY nextcloudcmd-cron /etc/cron.d/nextcloudcmd-cron
COPY nc_sync.sh /opt/scripts/nc_sync.sh
COPY entrypoint.sh /opt/scripts/entrypoint.sh

RUN chmod 0644 /etc/cron.d/nextcloudcmd-cron \
	&& chmod 0744 /opt/scripts/nc_sync.sh \
	&& chmod 0744 /opt/scripts/entrypoint.sh \
	&& crontab /etc/cron.d/nextcloudcmd-cron

VOLUME ["$NC_LOCAL_PATH"]

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]
CMD ["cron", "-f"]