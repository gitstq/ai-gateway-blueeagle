#!/usr/bin/env python3
"""
BlueEagle AI Gateway - Python Chat Completion Example

Usage:
    pip install openai
    python chat_completion.py

Make sure to set your API key before running.
"""

from openai import OpenAI

# ============================================
# Configuration - Just change these two lines!
# ============================================
API_KEY = "YOUR_API_KEY"  # Replace with your actual API key
BASE_URL = "https://ahg.codes/v1"  # BlueEagle AI Gateway endpoint


def chat_completion():
    """Basic chat completion example."""
    client = OpenAI(api_key=API_KEY, base_url=BASE_URL)

    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "What are the benefits of using an AI gateway?"}
        ],
        temperature=0.7,
        max_tokens=500
    )

    print("=== Response ===")
    print(response.choices[0].message.content)
    print(f"\n=== Usage ===")
    print(f"Prompt tokens: {response.usage.prompt_tokens}")
    print(f"Completion tokens: {response.usage.completion_tokens}")
    print(f"Total tokens: {response.usage.total_tokens}")


def stream_chat():
    """Streaming chat completion example."""
    client = OpenAI(api_key=API_KEY, base_url=BASE_URL)

    print("=== Streaming Response ===")
    stream = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "user", "content": "Write a short poem about AI."}
        ],
        stream=True
    )

    for chunk in stream:
        if chunk.choices[0].delta.content is not None:
            print(chunk.choices[0].delta.content, end="", flush=True)
    print("\n=== Stream Complete ===")


def multi_model_demo():
    """Demonstrate switching between different models."""
    models = [
        "gpt-4o",
        "claude-3-5-sonnet-20241022",
        "gemini-2.0-flash-exp"
    ]

    client = OpenAI(api_key=API_KEY, base_url=BASE_URL)

    for model in models:
        print(f"\n{'='*50}")
        print(f"Model: {model}")
        print('='*50)

        response = client.chat.completions.create(
            model=model,
            messages=[
                {"role": "user", "content": "Say hello in one sentence."}
            ],
            max_tokens=50
        )
        print(response.choices[0].message.content)


if __name__ == "__main__":
    print("🦅 BlueEagle AI Gateway - Python Examples")
    print("=" * 40)

    # Uncomment the example you want to run:

    # 1. Basic chat completion
    chat_completion()

    # 2. Streaming chat completion
    # stream_chat()

    # 3. Multi-model demonstration
    # multi_model_demo()