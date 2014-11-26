FROM czerasz/base
MAINTAINER Michał Czeraszkiewicz <czerasz.hosting@gmail.com>

# Set the reset cache variable
ENV REFRESHED_AT 2014-11-25

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Update system
RUN apt-get update

# Download Monit binaries
ADD https://mmonit.com/monit/dist/binary/5.10/monit-5.10-linux-x64.tar.gz /tmp/

# Add logrotate support
ADD config/monit/logrotate /etc/logrotate.d/monit

# Add init script
ADD config/monit/init.sh /etc/init.d/monit 

# Add defaults
ADD config/monit/default /etc/default/monit

# Add PAM configuration
ADD config/monit/pam /etc/pam.d/monit

# Add configuration files taken from an ubuntu with monit installed via apt-get
ADD config/monit/etc /etc/monit

# Install Monit
RUN mkdir -p /var/lib/monit/events && \
    touch /var/log/monit.log && \
    # Untar source files
    cd /tmp && tar -xzvf monit-5.10-linux-x64.tar.gz && \
    # Copy binary
    cp /tmp/monit-5.10/bin/monit /usr/bin/monit && \
    # Create a symlink to monitrc
    ln -s /etc/monit/monitrc /etc/monitrc

# This is not required because we added the /etc/monit directory
# # Copy configuration files
# RUN cp -r /tmp/monit-5.10/conf/ /etc/monit
