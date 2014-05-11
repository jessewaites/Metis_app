class AddGithubUsernameAndPhoneNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_username, :string
    add_column :users, :cell_number, :string
  end
end
