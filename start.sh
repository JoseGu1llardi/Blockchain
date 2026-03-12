#!/usr/bin/env bash
# Build and run the Blockchain service.
# Usage:
#   ./start.sh          — build (with tests) then run the JAR
#   ./start.sh dev      — run directly via Maven without building a JAR (faster for development)
#   ./start.sh skip     — build skipping tests then run the JAR

set -e

MODE=${1:-""}

case "$MODE" in
  dev)
    mvn spring-boot:run
    ;;
  skip)
    mvn clean package -DskipTests
    java -jar ./target/Blockchain-0.0.1-SNAPSHOT.jar
    ;;
  *)
    mvn clean package
    java -jar ./target/Blockchain-0.0.1-SNAPSHOT.jar
    ;;
esac
