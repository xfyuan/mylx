FROM node:0.12

# ===================================
# install ember-cli, bower, phantomjs
# ===================================
RUN npm install -g bower
RUN npm install -g ember-cli
RUN npm install -g phantomjs

# ================
# install watchman
# ================
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v4.1.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	sudo make install


# =================
# set app directory
# =================
ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ENTRYPOINT ["/usr/local/bin"]
