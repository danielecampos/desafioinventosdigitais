class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.references :projeto, foreign_key: true
      t.string :titulo
      t.string :versao_bug_detectado
      t.string :descricao
      t.string :status

      t.timestamps
    end
  end
end
