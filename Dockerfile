FROM node:4.2

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
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install


ENTRYPOINT ["/usr/local/bin"]
