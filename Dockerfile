FROM ubuntu

RUN apt update && apt upgrade -y
ADD ["scripts","/root/scripts"]

ENTRYPOINT ["/bin/bash","/root/scripts/inicial.sh"]
