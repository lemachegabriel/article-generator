class PromptService
  def generate_based_on_article(article, business_ideas = "", max_ideas = nil)
    return nil if business_ideas.empty?

    max_ideas_text = max_ideas ? "Please choose up to #{max_ideas} business ideas that you think are the best for the topic and categorize them accordingly" : ""
    promt = "I have the following topic: #{article.title}. I need to categorize the following business ideas based on this topic: #{business_ideas}. #{max_ideas_text}. Please categorize the business ideas according to the most relevant topic and return a JSON in the following format: {#{article.param}: [business_idea:, description:]}. Make sure to provide a brief description for each business idea."
  end

end