FROM daocloud.io/wsz543/docker-maven-tomcat-base-image:master-init

ADD pom.xml /tmp/build/
RUN cd /tmp/build && mvn -q dependency:resolve

ADD src /tmp/build/src
        #鏋勫缓搴旂敤
RUN cd /tmp/build && mvn -q -DskipTests=true package \
        #鎷疯礉缂栬瘧缁撴灉鍒版寚瀹氱洰褰�
	&& rm -rf $CATALINA_HOME/webapps/* \
        && mv target/*.war $CATALINA_HOME/webapps/ROOT.war \
        #娓呯悊缂栬瘧鐥曡抗
        && cd / && rm -rf /tmp/build