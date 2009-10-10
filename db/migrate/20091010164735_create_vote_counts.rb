class CreateVoteCounts < ActiveRecord::Migration
  def self.up
    create_table :vote_counts do |t|
      t.string :name
      t.integer :positive
      t.integer :negative
      t.timestamps
    end
    
    execute "insert into vote_counts (`name`,`positive`,`negative`) values ('Roman Polanski',0,0)"
  end

  def self.down
    drop_table :vote_counts
  end
end
