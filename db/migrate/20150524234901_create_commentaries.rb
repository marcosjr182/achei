class CreateCommentaries < ActiveRecord::Migration
  def change
    create_table :commentaries do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.text :message

      t.timestamps
    end
  end
end
