class AddForeignKeysToSubjects < ActiveRecord::Migration
  def change
  	add_column :sections, :page_id, :integer
  	add_column :pages, :subject_id, :integer
  	add_index("pages","subject_id")
  	add_index("pages","permalink")
  	add_index("sections","page_id")
  end
end
