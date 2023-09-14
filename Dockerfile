FROM python:3.9-slim

WORKDIR /app

RUN pip install pypiserver passlib \
    && apt-get update \
    && apt-get install -y apt-transport-https ca-certificates gnupg curl \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
    && apt-get update \
    && apt-get install -y google-cloud-cli

COPY . ./

ENTRYPOINT ["./entrypoint.sh"]
