FROM java:8 
MAINTAINER Eric Torti <eric.torti@vivareal.com> 

ARG GRADLE_VERSION 

WORKDIR /usr/bin
RUN curl -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip && \
  unzip gradle-${GRADLE_VERSION}-all.zip && \
  ln -s gradle-${GRADLE_VERSION} gradle && \
  rm gradle-${GRADLE_VERSION}-all.zip

ENV GRADLE_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

WORKDIR /project

ENTRYPOINT ["gradle"]
CMD ["-version"]
