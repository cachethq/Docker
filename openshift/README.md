## Synopsis

This is a very simple way to deploy CachetHD on to Openshift or Kubernetes.  I have only tested this on OpenShift 3.3 at this time 01/29/2017.

## Motivation

This was someting I did a work as we needed a dashboard to see that status of the services in our OpenShift.

## Installation

To get this all work you need to have a DB you can access.

Deploy the DC using `oc create -f cachethd-dc.yaml` while logged in to the project you want to deploy to.

You will need to change the env values to your setup.

You will then need to setup service and then a route so you can get to Cachet URL.


## Contributors

Andy del Hierro
andelhie@cisco.com