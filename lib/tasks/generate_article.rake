require 'csv'
namespace :article do
  task generate: :environment do
    article_title = ENV['ARTICLE_TITLE']
    file_path = 'tmp/Content Software Engineer Project.xlsx - Business Ideas.csv'
    return if article_title.nil?
    article = Article.create!(title: article_title)


    business_ideas = []
    CSV.foreach(file_path, headers: true) do |row|
      business_ideas << {
        name: row['name'],
        average_revenue: row['average_revenue'],
        average_cost_to_start: row['average_cost_to_start']
      }
    end

    names = business_ideas.map { |idea| idea[:name] }.join(', ')
    prompt = PromptService.new.generate_based_on_article(article, names, 5)
    response = OpenAiService.new.send_prompt(prompt)
    business_ideas_response = JSON.parse(response)[article.param]

    business_ideas_response.each do |idea|

      business_ideas_name = idea['business_idea']
      found_business_idea = business_ideas.find { |bi| bi[:name].casecmp?(business_ideas_name) }

      if found_business_idea
        create_bi = BusinessIdea.create!(name: business_ideas_name, average_revenue: found_business_idea[:average_revenue], average_cost_to_start: found_business_idea[:average_cost_to_start], article_id: article.id)
        Section.create!(text: idea['description'], business_idea_id: create_bi.id)
      end
    end

  end
end