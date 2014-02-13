require 'active_record'

class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :manuscript_id
      t.text :duplicate_ms
      t.string :cat_date
      t.string :seller

      t.string :seller2
      t.string :institution
      t.string :buyer
      t.string :cat_id
      t.string :cat_or_lot_num
      t.float :price
      t.string :currency
      t.string :sold
      t.string :secondary_source
      t.string :current_location
      t.text :author_authority
      t.text :author_variant
      t.text :title
      t.string :lng
      t.string :mat
      t.string :place
      t.string :manuscript_use
      t.integer :manuscript_date
      t.string :circa
      t.text :artist
      t.text :scribe
      t.integer :folios
      t.integer :col
      t.integer :lines
      t.integer :hgt
      t.integer :wdt
      t.text :manuscript_binding
      t.text :provenance
      t.text :comments
      t.string :manuscript_link
      t.integer :min_fl
      t.integer :min_lg
      t.integer :min_sm
      t.integer :min_un
      t.integer :h_init
      t.integer :d_init
      t.text :entry_comments
      t.date :addedon
      t.string :addedby
      t.string :isapproved
      t.string :isdeleted
      t.date :last_modified
      t.string :last_modified_by
      t.text :possible_dups
      t.string :x

      t.timestamps
    end
  end
end