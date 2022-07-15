FROM ubuntu

RUN apt update && apt upgrade -y
ADD ["Tp_EdP","/root/Tp_EdP"]

ENTRYPOINT ["/bin/bash","/root/Tp_EdP/inicial.sh"]
