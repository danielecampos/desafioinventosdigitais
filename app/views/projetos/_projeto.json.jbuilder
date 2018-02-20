json.extract! projeto, :id, :usuario_id, :titulo, :descricao, :previsao_termino, :status, :prioridade, :created_at, :updated_at
json.url projeto_url(projeto, format: :json)
