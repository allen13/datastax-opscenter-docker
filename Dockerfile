FROM debian

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y curl

#Install datastax repo
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/datastax.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
RUN apt-get update

# Install Packages
RUN apt-get install -y opscenter

EXPOSE 8888

CMD /usr/share/opscenter/bin/opscenter -f
