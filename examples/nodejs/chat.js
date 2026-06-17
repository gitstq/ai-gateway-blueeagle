/**
 * BlueEagle AI Gateway - Node.js Chat Completion Example
 *
 * Usage:
 *   npm install openai
 *   node chat.js
 *
 * Make sure to set your API key before running.
 */

import OpenAI from 'openai';

// ============================================
// Configuration - Just change these two lines!
// ============================================
const API_KEY = 'YOUR_API_KEY'; // Replace with your actual API key
const BASE_URL = 'https://ahg.codes/v1'; // BlueEagle AI Gateway endpoint

const client = new OpenAI({
  apiKey: API_KEY,
  baseURL: BASE_URL,
});

/**
 * Basic chat completion example
 */
async function chatCompletion() {
  const response = await client.chat.completions.create({
    model: 'gpt-4o',
    messages: [
      { role: 'system', content: 'You are a helpful assistant.' },
      { role: 'user', content: 'Explain the concept of an AI gateway in simple terms.' },
    ],
    temperature: 0.7,
    max_tokens: 500,
  });

  console.log('=== Response ===');
  console.log(response.choices[0].message.content);
  console.log('\n=== Usage ===');
  console.log(`Prompt tokens: ${response.usage.prompt_tokens}`);
  console.log(`Completion tokens: ${response.usage.completion_tokens}`);
  console.log(`Total tokens: ${response.usage.total_tokens}`);
}

/**
 * Streaming chat completion example
 */
async function streamChat() {
  console.log('=== Streaming Response ===');
  const stream = await client.chat.completions.create({
    model: 'gpt-4o',
    messages: [
      { role: 'user', content: 'Write a short poem about artificial intelligence.' },
    ],
    stream: true,
  });

  for await (const chunk of stream) {
    const content = chunk.choices[0]?.delta?.content || '';
    process.stdout.write(content);
  }
  console.log('\n=== Stream Complete ===');
}

/**
 * Multi-model demonstration
 */
async function multiModelDemo() {
  const models = [
    'gpt-4o',
    'claude-3-5-sonnet-20241022',
    'gemini-2.0-flash-exp',
  ];

  for (const model of models) {
    console.log(`\n${'='.repeat(50)}`);
    console.log(`Model: ${model}`);
    console.log('='.repeat(50));

    const response = await client.chat.completions.create({
      model,
      messages: [{ role: 'user', content: 'Say hello in one sentence.' }],
      max_tokens: 50,
    });
    console.log(response.choices[0].message.content);
  }
}

// Run examples
async function main() {
  console.log('🦅 BlueEagle AI Gateway - Node.js Examples');
  console.log('='.repeat(40));

  // Uncomment the example you want to run:

  // 1. Basic chat completion
  await chatCompletion();

  // 2. Streaming chat completion
  // await streamChat();

  // 3. Multi-model demonstration
  // await multiModelDemo();
}

main().catch(console.error);