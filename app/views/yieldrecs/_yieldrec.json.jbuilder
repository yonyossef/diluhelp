json.extract! yield, :id, :plot_strength, :recommended_kg, :cultivar_id, :created_at, :updated_at
json.url yield_url(yield, format: :json)
