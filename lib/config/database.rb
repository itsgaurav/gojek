require 'active_record'
require 'mysql2'
 
ActiveRecord::Base.establish_connection(
    :adapter => "mysql2",
    :database => "parking_lot_gojek"
)
 
ActiveRecord::Schema.define do

    create_table :parking_lots do |table|
        table.column :slot_number, :integer
        table.column :state, :string, default: 'free'

    end unless ActiveRecord::Base.connection.table_exists? 'parking_lots'
 
    create_table :vehicles do |table|
        table.column :registration_number, :string
        table.column :color, :string
        table.column :parking_lot_id, :integer
        table.column :vehicle_type, :string, default: 'car'
    end unless ActiveRecord::Base.connection.table_exists? 'vehicles'

    create_table :histories do |table|
        table.column :checkin_time, :datetime
        table.column :checkout_time, :datetime
        table.column :parking_lot_id, :integer
        table.column :vehicle_id, :integer
    end unless ActiveRecord::Base.connection.table_exists? 'histories'

end