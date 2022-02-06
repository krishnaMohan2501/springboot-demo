#!/usr/bin/env bash

#release Name
springboot="springboot-demo"

while [ [$# > 0] ]; do
    key = "$1"
    case $key in
    -imgTag)
      img="$2"
      ;;
    esac
    shift
done

read -p "Enter the release name: " releaseApp

valueFile="values.yaml"
service="springboot-demmo"
chartName=$service
namespace="demonamespace"
time="$(date "+%Y-%m-%d_%H:%M:%S")"

name=""
reason=""

release=$service-$releaseApp
ingressHostPath=""
context="myAKSCluster"

kubectl config use-context $context
helm3 upgrade --install $release $chartName --namespace $namespace -f ./$chartName/$valueFile --timeout 3600s --set restart="$time" --set restart.name="$name" --set restart.reason="$reason" && \
helm3 status $release -n $namespace
