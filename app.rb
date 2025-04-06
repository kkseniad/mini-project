require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  erb(:homepage)
end

get("/prediction") do
  CARDS = {
  "The_Fool" => "A new beginning, spontaneity, and free spirit.",
  "The_Magician" => "Manifestation, resourcefulness, and inspired action.",
  "The_High Priestess" => "Intuition, secrets, and the subconscious mind.",
  "The_Empress" => "Abundance, nurturing, and fertility.",
  "The_Emperor" => "Authority, structure, and fatherly guidance.",
  "The_Hierophant" => "Tradition, spiritual wisdom, and conformity.",
  "The_Lovers" => "Love, harmony, choices, and relationships.",
  "The_Chariot" => "Control, willpower, success through determination.",
  "Strength" => "Courage, inner strength, and compassion.",
  "The_Hermit" => "Introspection, solitude, and inner guidance.",
  "Wheel_of_Fortune" => "Change, cycles, and destiny.",
  "Justice" => "Fairness, truth, and law.",
  "The_Hanged_Man" => "Pause, surrender, and a new perspective.",
  "Death" => "Endings, transformation, and new beginnings.",
  "Temperance" => "Balance, moderation, and harmony.",
  "The_Devil" => "Temptation, addiction, and materialism.",
  "The_Tower" => "Sudden change, upheaval, and awakening.",
  "The_Star" => "Hope, inspiration, and serenity.",
  "The_Moon" => "Illusion, intuition, and the unknown.",
  "The_Sun" => "Joy, success, and positivity.",
  "Judgement" => "Reflection, reckoning, and awakening.",
  "The_World" => "Completion, achievement, and fulfillment."
}


  @user_card = CARDS.keys.sample

  @meaning = CARDS[@user_card]

  api_url = "https://zenquotes.io/api/quotes"

  raw_response = HTTP.get(api_url)

  parsed_data = JSON.parse(raw_response)

  num_quote = rand(1...50)

  @quote = parsed_data[num_quote].fetch("h")
 
  erb(:prediction)

end
