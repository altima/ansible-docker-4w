FROM alpine

RUN echo "===> Installing sudo to emulate normal OS behavior..."  && \
    apk --update add sudo                                         && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python3 py-pip openssl ca-certificates    && \
    apk --update add --virtual build-dependencies \
                python3-dev libffi-dev openssl-dev build-base  && \
    pip install --upgrade pip cffi                            && \
    \
    \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    apk --update add sshpass openssh-client rsync krb5 krb5-dev && \
    \
    \
    echo "===> Installing Ansible..."  && \
    pip install ansible         && \
    \
    \
    echo "===> Installing pip packages ..."  && \
    pip install pywinrm xmltodict pykerberos requests_kerberos requests-credssp jmespath && \
    \
    \
    echo "===> Removing package list..."  && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*

COPY files/krb5.conf /etc/

VOLUME [ "/playbooks" ]
WORKDIR  /playbooks

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
