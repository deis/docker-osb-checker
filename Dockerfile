FROM node:6-stretch

ENV TESTS_PATH=/opt/osb-checker/2.13/tests

RUN git clone https://github.com/openservicebrokerapi/osb-checker.git /opt/osb-checker \
  && rm $TESTS_PATH/test/configs/*.json \
  && npm config set package-lock false && npm install --global mocha \
  && apt-get update \
  && apt-get install -y netcat \
  && cd $TESTS_PATH \
  && npm install

COPY scripts/*.sh /app/

WORKDIR /app

CMD [ "./test.sh", "localhost", "8080", "60" ]
