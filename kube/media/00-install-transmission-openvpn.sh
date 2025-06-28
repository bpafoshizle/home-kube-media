helm repo add bananaspliff https://bananaspliff.github.io/geek-charts
#helm repo add utkuozdemir https://utkuozdemir.org/helm-charts
helm repo update

helm install transmission bananaspliff/transmission-openvpn \
    --values ../kube/media/media.transmission-openvpn.values.yml \
    --namespace media

