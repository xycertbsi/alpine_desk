# alpine_desk
#### A docker container with built in Xrdp, with a simple useability in docker compose.
### **How to configure it?**

*Using Docker compose:*
```
services:
    desk:
        image: xycert:alpine_desk   # the image you can build from Dockerfile
        container_name: alpine_desk # the name of it 
        
        environment:
            - XRDP_USER=groot  # the xrdp user with you can login
            - XRDP_PASSWORD=1234 # the xrdp user password
            - XRDP_SESSION=icewm-session # the session that be executed

            - PLUS_PACKAGES=icewm  # what you type here gets installed
            - XRDP_USER_GROUPS=bin daemon sys adm disk wheel floppy dialout tape video # the groups that be added to your XRDP user

        ports:
            - 8000:2000 # outside_port:2000 -> your alpine_desk is be running on :8000
```
---
*Using Docker cli:*
```
docker run -d -p 8000:2000 --name alpine_desk \
  -e XRDP_USER=groot \
  -e XRDP_PASSWORD=1234 \
  -e XRDP_SESSION="icewm-session" \
  -e PLUS_PACKAGES="icewm" \
  -e XRDP_USER_GROUPS="bin daemon sys adm disk wheel floppy dialout tape video" \
  xycert:alpine_desk
```

### Building:
```
docker build . -t xycert:alpine_desk
```

#### Structure:
```
- 'import' folder: The files are used by Dockerfile.
  - 'import/xrdp.ini': This gets automaticly copied to the /etc/xrdp inside the container at building
  - 'import/entrypoint.sh': Entrypoint: Handles User setup, 
    sets sudoers, starts xrdp(-sesman), 
    fixes executable errors and sets .xinitrc.
  
- 'docker-compose.example.yml': Docker compose example.
- 'Dockerfile': Dockerfile.
```

**This repo its not contain any AI generated code.**
