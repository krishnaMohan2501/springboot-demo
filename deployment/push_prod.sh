#!/usr/bin/env bash

#release Name
springboot="springboot-demo"

while [[ $# > 0 ]]; do
    key = "$1"
    case $key in
    -imgTag)
      img="$2"
      ;;
    esac
    shift
done

valueFile="./values.yaml"
service="springboot-demo"
chartName="../springboot-demo"
namespace="springboot-demoweb"
time="$(date "+%Y-%m-%d_%H:%M:%S")"
echo "$img"
echo chart name: $chartName
echo namespace: $namespace
echo time: $time

release=$service
ingressHostPath="$release.krishna.docker-desktop.local.com"
context="docker-desktop"

echo "$release"
kubectl config use-context $context && \
helm upgrade --install $release $chartName --namespace $namespace -f $valueFile --timeout 3600s --set image.tag=$img --set restart.timestamp="$time" --set restart.name="$name" --set restart.reason="$reason" && \
helm status $release -n $namespace
