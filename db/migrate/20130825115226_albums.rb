class Albums < ActiveRecord::Migration
  def change
    create_table "albums", :force => true do |t|
      t.string  "title",       :limit => 50
      t.date    "upload_date"
      t.date    "modify_date"
      t.string  "status",      :limit => 1
      t.integer "order_no",                  :null => false
    end
  end  
end
