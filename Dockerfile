FROM czerasz/base
MAINTAINER Michał Czeraszkiewicz <czerasz.hosting@gmail.com>

# Set the reset cache variable
ENV REFRESHED_AT 2014-11-25

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Update system
RUN apt-get update

# Install Monit
RUN apt-get install -y monit

