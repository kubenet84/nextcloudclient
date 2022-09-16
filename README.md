# kubenet84/nextcloudclient

This is a Docker Container for the Nextcloud CLI app "nextcloudcmd".

The Application will be called from a cronjob every minute. If it take loger as this time interval to execute then no new instance will be started.

### Running from Commandline:

```
docker run --name NextCloudClient kubenet84/nextcloudclient -v /home/user/anyuser/nextcloud:/mnt/local_nc_dir:rw -e NC_USER=NextCloud_Username -e NC_PASS=NextCloudPassword -e NC_SERVER=https://path.to.yout.nextcloud.server
```

### ENV Variables:

| Name | Default | Description |
|------|---------|-------------|
| NC_USER |  | Nextcloud Username |
| NC_PASS |  | a generated Application Password (recommend) OR your Password |
| NC_SERVER |  | Nextcloud Server URL (<https://url.to.your.nextcloud.server>) |
| NC_SERVER_PATH | / | a directory inside your NC account if u don´t want so sync your complete Profile (e.g. /Pictures) |
| NC_PARAMS |  | additional commandline parameters for nextcloudcmd. ATM is only 1 supported |

     

#### Github Repository: <https://github.com/kubenet84/nextcloudclient>

If you want to contribute, feel free to send a pull request via Github.