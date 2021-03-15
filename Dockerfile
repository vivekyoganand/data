# This is a comment line
FROM ubi7/ubi:7.7
LABEL description="Demo Image"
MAINTAINER Chandra Prakash <cprakash@qcsdclabs.com>
RUN yum install -y httpd && \
    yum install python && \
    yum install ansible && \
    yum clean all 
EXPOSE 80 443 
COPY index.html /var/www/html/index.html
ENV DO180 /home/student 
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
