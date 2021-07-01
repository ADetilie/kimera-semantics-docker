FROM kimera_semantics_custom:kimera_semantics_installed

# add *.sh script as entry point for docker image
COPY ./start_kimera_semantics_entrypoint.sh /
RUN ["chmod", "+x", "./start_kimera_semantics_entrypoint.sh"]
ENTRYPOINT ["./start_kimera_semantics_entrypoint.sh"]
