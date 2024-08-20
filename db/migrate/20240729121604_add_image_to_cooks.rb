class AddImageToCooks < ActiveRecord::Migration[6.1]
  def change
    add_column :cooks, :image, :string
  end
end
