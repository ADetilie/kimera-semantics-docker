#!/bin/bash 

echo "================================================"
echo "START BUILDING DOCKER LAYERS"
echo "================================================"

echo "=== layer_base ===" && \
cd layer_base && ./build_image.sh && \
echo "=== layer_kimera_semantics_installed ===" && \
cd ../layer_kimera_semantics_installed && ./build_image.sh && \
echo "=== SUCCESS ===" || \
echo "=== FAILURE ==="

echo "================================================"
echo "FINISH BUILDING DOCKER LAYERS"
echo "================================================"
