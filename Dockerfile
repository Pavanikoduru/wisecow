FROM ubuntu:22.04

# Install prerequisites
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH for fortune
ENV PATH="/usr/games:${PATH}"

# Copy script
COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose port
EXPOSE 4499

# Run app
CMD ["/usr/local/bin/wisecow.sh"]

