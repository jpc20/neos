class Table

  def initialize(astroid_details)
    @astroid_details = astroid_details
    @column_labels = { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
    @column_data = column_data()
  end

  def divider
    "+-#{@column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"
  end

  def header
    "| #{ @column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
  end

  def column_data
    @column_labels.each_with_object({}) do |(col, label), hash|
      hash[col] = {
        label: label,
        width: [@astroid_details.details[:astroid_list].map { |astroid| astroid[col].size }.max, label.size].max}
    end
  end

end
