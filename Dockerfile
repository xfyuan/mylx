FROM node:4.2

# ===================================
# install ember-cli, bower, phantomjs
# ===================================
RUN npm install -g ember-cli@1.13.8
RUN npm install -g bower@1.6.5
RUN npm install -g phantomjs@1.9.18

# ================
# install watchman
# ================
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.9.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install


# =================
# set app directory
# =================
ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# run ember server on container start
ENTRYPOINT ["/usr/local/bin"]
