FROM fleetdm/fleet

RUN "fleet prepare db"

CMD ["fleet", "serve"]

