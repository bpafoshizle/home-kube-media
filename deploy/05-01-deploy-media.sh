
# Install 
kubectl apply -f ../kube/media/media.namespace.yml
kubectl apply -f ../kube/media/media.persistentvolumeclaim.yml
kubectl apply -f ../kube/media/media.ingress.yml

source ../kube/media/00-install-openvpn-secret.sh
source ../kube/media/00-install-transmission-openvpn.sh
source ../kube/media/01-install-jackett.sh
source ../kube/media/02-install-sonarr.sh
source ../kube/media/03-install-radarr-gchr-secret.sh
source ../kube/media/04-install-radarr.sh
source ../kube/media/05-install-readarr.sh
source ../kube/media/06-install-prowlarr.sh

