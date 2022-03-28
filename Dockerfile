FROM tomcat

COPY . .

RUN apt-get update ; apt-get install maven default-jdk -y ; update-alternatives --config javac

RUN mvn clean package ; cp target/*.war /usr/local/tomcat/webapps/

RUN groupadd -r user && useradd -r -g user user
USER user

CMD ["catalina.sh","run"]
