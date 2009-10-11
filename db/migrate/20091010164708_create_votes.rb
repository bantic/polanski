class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.string :ip
      t.boolean :positive
      t.timestamps
    end
    
    add_index :votes, [:ip, :created_at]
  end

  def self.down
    drop_table :votes
  end
end
