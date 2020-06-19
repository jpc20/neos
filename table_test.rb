require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'table'
require_relative 'near_earth_objects'

class TableTest < Minitest::Test

  def test_it_exists
    astroid_details = NearEarthObjects.find_neos_by_date('2019-03-30')
    table = Table.new(astroid_details)
    assert_instance_of Table, table
  end

  def test_it_can_create_column_header_and_divider
    astroid_details = NearEarthObjects.find_neos_by_date('2019-03-30')
    table = Table.new(astroid_details)
    divider = '+-------------------+----------+----------------------+'
    header = '| Name              | Diameter | Missed The Earth By: |'
    assert_equal divider, table.divider
    assert_equal header, table.header
  end

  def test_it_can_create_rows
    astroid_details = NearEarthObjects.find_neos_by_date('2019-03-30')
    table = Table.new(astroid_details)
    first_row_data = {:name=>"(2019 GD4)", :diameter=>"61 ft", :miss_distance=>"911947 miles"}
    assert_equal first_row_data, table.create_rows[0]
  end
end
