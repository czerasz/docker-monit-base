FROM czerasz/base
MAINTAINER Michał Czeraszkiewicz <czerasz.hosting@gmail.com>

# Set the reset cache variable
ENV REFRESHED_AT 2014-11-25

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Update system
RUN apt-get update

# Add SSL support
RUN apt-get install -y libssl-dev

# Download source files
ADD https://mmonit.com/monit/dist/monit-5.10.tar.gz /tmp/

# Add logrotate support
ADD config/monit/logrotate /etc/logrotate.d/monit

# Add init script
ADD config/monit/init.sh /etc/init.d/monit 

# Add defaults
ADD config/monit/default /etc/default/monit

# Add PAM support
ADD config/monit/pam /etc/pam.d/monit

# Add configuration files taken from an ubuntu with monit installed via aptget
ADD config/monit/etc /etc/monit

# Install Monit
RUN cd /tmp/ && \
    tar -xzvf monit-5.10.tar.gz && \
    rm monit-5.10.tar.gz && \
    cd monit-5.10/ && \
    ./configure --without-pam --bindir=/usr/bin/ && \
    make && make install && \
    # Create required directories
    mkdir -p /var/lib/monit && \
    # Make the init file executable
    chmod 755 /etc/init.d/monit
