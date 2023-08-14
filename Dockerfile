ARG BUILD_VERSION="latest"
FROM 416670754337.dkr.ecr.eu-west-2.amazonaws.com/ci-base-build:${BUILD_VERSION}

ONBUILD ARG SSH_PRIVATE_KEY
ONBUILD ARG SSH_PRIVATE_KEY_PASSPHRASE

ONBUILD RUN if [ "${SSH_PRIVATE_KEY}" != "" ]; then \
        mkdir -m 0600 ~/.ssh \
        && ssh-keyscan github.com >> ~/.ssh/known_hosts \
        && echo "${SSH_PRIVATE_KEY}" > ~/.ssh/id_rsa \
        && chmod 600 ~/.ssh/id_rsa \
        && ssh-keygen -p -f ~/.ssh/id_rsa -P "${SSH_PRIVATE_KEY_PASSPHRASE}" -N ""; \
    fi
