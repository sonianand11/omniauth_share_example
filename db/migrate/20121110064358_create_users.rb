class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :uid
      t.string :oauth_token
      t.string :secret_token
      t.string :provider
      t.datetime :oauth_expire_at

      t.timestamps
    end
  end
end
