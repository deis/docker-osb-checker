FROM node:6-stretch

RUN git clone https://github.com/openservicebrokerapi/osb-checker.git /opt/osb-checker \
  && rm /opt/osb-checker/2.13/tests/test/configs/*.json \
  && npm config set package-lock false && npm install --global mocha \
  && apt-get update \
  && apt-get install -y netcat

COPY scripts/*.sh /opt/osb-checker/2.13/tests/

WORKDIR /opt/osb-checker/2.13/tests

RUN npm install

ENTRYPOINT [ "./test-api-compliance.sh" ]

CMD [ "localhost", "80", "300" ]
