## Exposing apps with routes:

The route hostname for a service is formatted like <service_name>-<project>.<cluster_name>-<random_hash>-0001.<region>.containers.appdomain.cloud. 

Note that this hostname that is assigned to your route is different than the Ingress subdomain that is assigned by default to your cluster. 

### To get router subdomain:
After login to ROKS on IBM public Cloud, run this command: 

```bash
oc get route -n default|grep router
```

You will obtain the router subdomain:

dbacluster04-4245ee08d404afbcaa8f0c6b522e175c-0001.us-east.containers.appdomain.cloud

### Though the router subdomain is obtained, it is not recommended to use it, since that makes the length of hostname > 64 characters, which is a problem when generating certificates as part of deployment. It is better to get the IP address of router subdomain and use it

```bash
ping dbacluster04-4245ee08d404afbcaa8f0c6b522e175c-0001.us-east.containers.appdomain.cloud
PING dbacluster04-4245ee08d404afbcaa8f0c6b522e175c-0001.us-east.containers.appdomain.cloud (169.62.48.222) 56(84) bytes of data.
64 bytes from de.30.3ea9.ip4.static.sl-reverse.com (169.62.48.222): icmp_seq=1 ttl=45 time=77.8 ms
64 bytes from de.30.3ea9.ip4.static.sl-reverse.com (169.62.48.222): icmp_seq=2 ttl=45 time=75.2 ms
64 bytes from de.30.3ea9.ip4.static.sl-reverse.com (169.62.48.222): icmp_seq=3 ttl=45 time=75.5 ms
64 bytes from de.30.3ea9.ip4.static.sl-reverse.com (169.62.48.222): icmp_seq=4 ttl=45 time=75.5 ms
```

For route URL, we should use something like: ums.169.62.48.222.nip.io

Similarly update the CR file as below:  

```yaml
shared_configuration.sc_deployment_hostname_suffix: "169.62.48.222.nip.io" 
```