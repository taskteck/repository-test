ARG RUNNER_VERSION=v2.318.0-ubuntu-20.04-a152741

FROM docker.io/summerwind/actions-runner-dind:$RUNNER_VERSION

COPY scripts/* ./

RUN \
  VERSION=`curl "https://api.github.com/repos/cli/cli/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c2-` \
  && sudo apt update \
  && sudo apt install wget python3-pip make ssh dbus-user-session -y\
  && sudo wget https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.deb \
  && sudo dpkg -i gh_${VERSION}_linux_amd64.deb \
  && sudo apt install gh -y \
  && sudo chmod +x ./docker-compose.sh ./aws.sh ./docker-login.sh \
  && sudo cp ./docker-login.sh /etc/arc/hooks/job-started.d \
  && sudo sh ./docker-compose.sh \
  && sudo sh ./aws.sh \
  && sudo sh ./helm.sh