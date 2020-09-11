FROM maven:3.6-jdk-8-slim

ARG workspace="none"
ARG eval_type="none"

USER root

RUN apt-get update && apt-get install --assume-yes wget

# Pre build commands
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/springboot/maven/2.x/pre-build-2.sh
RUN chmod 775 ./pre-build-2.sh
RUN sh pre-build-2.sh

# Install Workspace for Java

RUN if [ $workspace = "theia" ] ; then \
	wget -O ./pre-build.sh https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/theia-crossover/pre-build.sh \
    && chmod 775 ./pre-build.sh && sh pre-build.sh ; fi

WORKDIR /var/

RUN if [ $workspace = "theia" ] ; then \
	wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/theia-crossover/build-2.sh \
    && chmod 775 ./build-2.sh && sh build-2.sh ; fi

WORKDIR /var/theia/

RUN if [ $workspace = "theia" ] ; then \
	wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/theia-crossover/run.sh \
    && chmod 775 ./run.sh ; fi

COPY . /tmp/
WORKDIR /tmp/

EXPOSE 8080

# Build the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/test-project/springboot/maven/2.x/build.sh
RUN chmod 775 ./build.sh
RUN sh build.sh

# Add extra docker commands here (if any)...

# Run the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/test-project/springboot/maven/2.x/run.sh
RUN chmod 775 ./run.sh
# CMD sh run.sh "UNIT_MUTATION"
CMD sh run.sh
