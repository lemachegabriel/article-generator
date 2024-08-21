require 'openai'
class OpenAiService
  def initialize
    api = ""
    @client = OpenAI::Client.new(
      access_token: api,
      log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
    )
  end

  def send_prompt(prompt, model: "gpt-4o-mini", temperature: 0.7)
    response = @client.chat(
      parameters: {
          model: model,
          messages: [{ role: "user", content: prompt}], # Required.
          temperature: temperature,
          response_format: { type: "json_object" },
          max_tokens: 615
      })
    
    if response['choices'] && response['choices'].any?
      response['choices'].first['message']['content']
    else
      "No response"
    end
  end
end