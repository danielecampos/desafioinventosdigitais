class CreateProjetos < ActiveRecord::Migration[5.1]
  def change
    create_table :projetos do |t|
      t.references :usuario, foreign_key: true
      t.string :titulo
      t.string :descricao
      t.datetime :previsao_termino
      t.string :status
      t.string :prioridade

      t.timestamps
    end
  end
end
