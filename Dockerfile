FROM hashicorp/terraform:light
LABEL mechtron <mechtrondev@gmail.com>

ENV TERRAFORM_VERSION=0.11.8-r0
ENV TERRAGRUNT_VERSION=0.18.4

RUN apk -v --update add go python py-pip alpine-sdk coreutils make terraform=$TERRAFORM_VERSION
RUN pip install --upgrade awscli

RUN go get github.com/sspinc/terraform-provider-credstash
ADD .terraformrc /root/.terraformrc

ADD https://github.com/gruntwork-io/terragrunt/releases/download/v$TERRAGRUNT_VERSION/terragrunt_linux_386 /bin/terragrunt
RUN chmod +x /bin/terragrunt

ENTRYPOINT [""]
