#!/bin/bash
scp -r root@utility:/home/lab/ocp4/auth/kube* .
export KUBECONFIG=/home/student/kubeconfig
x=$(cat /home/student/kubeadmin-password)
y=$(cat /home/student/kubeconfig | grep server | awk -F" " '{print $2}'|uniq) 
oc login -u kubeadmin -p $x $y
oc new-project project-ques7
oc adm taint node worker01 key1=value1:NoSchedule
oc adm taint node worker02 key1=value1:NoSchedule
oc adm taint node worker03 key1=value1:NoSchedule
oc new-app --name app1 httpd 

oc new-project project-ques8
oc new-app --name test01 httpd 


oc new-project project-ques9
oc new-app --name paypal httpd

oc new-project project-secret-11
oc new-app --name mysql --docker-image registry.access.redhat.com/rhscl/mysql-57-rhel7:5.7-47 


oc new-project project-sa-13
oc new-app --name git --docker-image gitlab/gitlab-ce:8.4.3-ce.0
