FROM docker:1.13

RUN apk add --update --no-cache bash openssl ca-certificates ruby ruby-irb ruby-rdoc git vim && update-ca-certificates
RUN gem install bundler

ADD newbox /bin/newbox
ADD bash_profile /root/.bashrc
ADD vimrc /root/.vimrc
ADD vim /root/.vim
RUN mkdir /root/.vim_swp
WORKDIR /opt/workspace

CMD ["bash"]
