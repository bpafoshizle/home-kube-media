# home-kube-media
This repo houses everything needed to deploy home media components to kubernetes.

- Dockerfiles (when needed for custom control). Docker images are built using GitHub workflows.
- Kube manifests and kubectl and helm deployment scripts
- Helm charts

Repo is [utilizes GitHub pages](https://www.opcito.com/blogs/creating-helm-repository-using-github-pages) to host a helm repository. 

When building new charts you need to do the following:

```
helm package helm/charts/radarr
helm package helm/charts/readarr
helm package helm/charts/prowlarr
helm repo index --url https://bpafoshizle.github.io/home-kube-media .
```

## Media Components Setup

For starters, I'm skipping creating the Persistent Volume, since mine will be dynimically provisioned, and I'm modifying the storage class for the PVC like so: `storageClassName: managed-nfs-storage`.

The entire library of media components could be installed by running the 05-01-deploy-media.sh script in the deploy directory, or they can be installed individually from helm via the scripts below.

To install transmission-openvpn, run the following from the deploy directory:

`source ../kube/media/00-install-transmission-openvpn.sh`

To install jackett, run the following: 

`source ../kube/media/01-install-jackett.sh`
