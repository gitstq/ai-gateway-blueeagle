#!/bin/bash
# ================================================
# BlueEagle AI Gateway - cURL Examples
# ================================================
# Usage:
#   chmod +x examples.sh
#   export BLUEEAGLE_KEY="your-api-key-here"
#   ./examples.sh
# ================================================

API_KEY="${BLUEEAGLE_KEY:-YOUR_API_KEY}"
BASE_URL="https://ahg.codes/v1"

echo "🦅 BlueEagle AI Gateway - cURL Examples"
echo "========================================"

# ---------------------------
# Example 1: GPT-4o Chat Completion
# ---------------------------
echo ""
echo "=== Example 1: GPT-4o Chat Completion ==="
curl -s "${BASE_URL}/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${API_KEY}" \
  -d '{
    "model": "gpt-4o",
    "messages": [
      {"role": "system", "content": "You are a helpful assistant."},
      {"role": "user", "content": "What is the capital of Japan?"}
    ],
    "temperature": 0.7,
    "max_tokens": 100
  }' | python3 -m json.tool 2>/dev/null || echo "(Response received - install python3 for formatted output)"

# ---------------------------
# Example 2: Claude 3.5 Sonnet
# ---------------------------
echo ""
echo "=== Example 2: Claude 3.5 Sonnet ==="
curl -s "${BASE_URL}/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${API_KEY}" \
  -d '{
    "model": "claude-3-5-sonnet-20241022",
    "messages": [
      {"role": "user", "content": "Write a one-sentence fun fact about octopuses."}
    ],
    "max_tokens": 100
  }' | python3 -m json.tool 2>/dev/null || echo "(Response received)"

# ---------------------------
# Example 3: Gemini 2.0 Flash
# ---------------------------
echo ""
echo "=== Example 3: Gemini 2.0 Flash ==="
curl -s "${BASE_URL}/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${API_KEY}" \
  -d '{
    "model": "gemini-2.0-flash-exp",
    "messages": [
      {"role": "user", "content": "What is 2+2? Answer in one word."}
    ],
    "max_tokens": 50
  }' | python3 -m json.tool 2>/dev/null || echo "(Response received)"

# ---------------------------
# Example 4: Streaming (using shell)
# ---------------------------
echo ""
echo "=== Example 4: Streaming Chat (use -N flag for no-buffer) ==="
echo "Run this command separately for streaming:"
echo ""
echo "  curl -N \"${BASE_URL}/chat/completions\" \\"
echo "    -H \"Content-Type: application/json\" \\"
echo "    -H \"Authorization: Bearer ${API_KEY}\" \\"
echo "    -d '{\"model\": \"gpt-4o\", \"messages\": [{\"role\": \"user\", \"content\": \"Count from 1 to 5.\"}], \"stream\": true}'"

echo ""
echo "========================================"
echo "✅ Examples complete!"
echo "🌐 Visit https://ahg.codes for more info"