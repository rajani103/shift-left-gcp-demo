# Dockerfile — hardened minimal runtime (Alpine) and non-root user
FROM alpine:3.18 AS runtime

# Add non-root user 'app'
RUN addgroup -S app && adduser -S -G app app

WORKDIR /home/app

# Copy runtime script
COPY hello.sh /home/app/hello.sh

# Set permissions and ownership
RUN chmod 750 /home/app/hello.sh && chown -R app:app /home/app

# Run as non-root
USER app

# Healthcheck to ensure runtime file exists
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD [ "sh", "-c", "test -f /home/app/hello.sh" ]

ENTRYPOINT [ "/home/app/hello.sh" ]
