#!/usr/bin/env bash
set -euo pipefail

# Map of <service-name>=<namespace>
declare -A SERVICES=(
  ["argocd-server"]="argocd"
  ["jenkins"]="jenkins"
  ["redis-master"]="redis"
  ["rabbitmq"]="rabbitmq"
  ["nexus-nexus-repository-manager"]="nexus"
)

for svc in "${!SERVICES[@]}"; do
  ns="${SERVICES[$svc]}"
  echo "Patching Service \"$svc\" in namespace \"$ns\" → LoadBalancer"
  kubectl patch svc "$svc" \
    -n "$ns" \
    --type='merge' \
    -p '{"spec":{"type":"LoadBalancer"}}'
done

# echo "✅ All services patched."