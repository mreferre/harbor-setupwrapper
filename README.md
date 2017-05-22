Harbor-setupwrapper is a new (experimental) mechanism to deploy [VMware Harbor](https://github.com/vmware/harbor).

It "dockerizes" the [original setup process](https://github.com/vmware/harbor/blob/master/docs/installation_guide.md) by allowing a user to immediately bring up (with Docker Compose) Harbor without going through all the steps of the setup process as described [here](https://github.com/vmware/harbor/blob/master/docs/installation_guide.md). It works by setting shell environment variables instead of having to edit the `harbor.cfg` file. The environment variables are passed onto the harbor-setupwrapper container which goes through the preparation process.  

Each version of the wrapper is tightly coupled with (and it actually embeds into the harbor-setupwrapper docker images) the particular version of Harbor you want to deploy. This tool, in its current shape and form, supports deploying Harbor version 0.5.0 and 1.1.1.   

## Usage
Clone the harbor-setupwrapper repo, move into the directory that represents the version you want to deploy and "up" the Docker Compose file you find in there. Before you launch it, you will have to export the `HARBORHOSTNAME` and the `HARBOR_ADMIN_PASSWORD` variables.

If you do not export the variables, Docker Compose will show this:

```
root@harbor:~/harbor-setupwrapper# docker-compose up -d
WARNING: The HARBORHOSTNAME variable is not set. Defaulting to a blank string.
WARNING: The HARBOR_ADMIN_PASSWORD variable is not set. Defaulting to a blank string.
Creating network "harborsetupwrapper_default" with the default driver
...
```
At a minimum the `HARBORHOSTNAME` variable needs to be set and it needs to be set to the IP address or FQDN of the host you are installing it on. If you do no set the `HARBOR_ADMIN_PASSWORD` variable you will have to use the default Harbor password (Harbor12345).

What you want to do is this:
```
root@harbor:~/harbor-setupwrapper# export HARBORHOSTNAME=192.168.1.173
root@harbor:~/harbor-setupwrapper# export HARBOR_ADMIN_PASSWORD=MySecretPassword
root@harbor:~/harbor-setupwrapper# docker-compose up -d
Creating network "harborsetupwrapper_default" with the default driver
Creating harbor-log
....
```
Hint: if you keep bringing up and down Harbor instances on the same host and you intend to start from scratch please remember to get rid of the /data directory on the host (because that is where the state of the instance is saved, and new instances will inherit that state).

##Known Limitations
- I have only really tested this with the `HARBORHOSTNAME` and `HARBOR_ADMIN_PASSWORD` variables. Other variables should work but I haven’t tested them
- There will definitely be scenarios where this will break. For example, I haven’t implemented a way to create certificates if you choose to use a secure connection (https). This would need to be additional logic inside `harbor-setupwrapper.sh` which just doesn’t exist at the time of this writing (hint: do not try to enable https because weird things may happen)
- The original on-line installer is (really) meant to be run on a single Docker host. The approach I have implemented honors that model and assumes the same
- Because of the above, I didn’t even try to deploy this compose file on a distributed Swarm cluster. 
- More caveats that I haven’t thought about (but that certainly may exist!)
