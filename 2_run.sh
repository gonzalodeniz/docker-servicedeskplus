docker run -d -p 8443:8443 \
  --name servicedesk \
  -v servicedesk_data:/home/servicedesk/ManageEngine/ServiceDesk \
  servicedesk-ubuntu
