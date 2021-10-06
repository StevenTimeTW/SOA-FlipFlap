# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map{ |row| row.split("\t")}
    headers = rows.first.map(&:chomp)
    data_rows = rows[1..]
    @data = data_rows.map{|row| headers.zip(row.map(&:chomp)).to_h}
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    col_names = @data[0].keys.join("\t") + "\n"
    values = @data.map{|row| row.values.join("\t")}.join("\n") + "\n"
    col_names + values
  end
end
