# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  NEW_LINE = "\n"
  TAB = "\t"

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = load_tsv_to_arr(tsv)
    @data = create_hashes(rows.first, rows[1..])
  end

  # load_tsv_to_arr(tsv): Load tsv file using array
  def load_tsv_to_arr(tsv)
    tsv.split(NEW_LINE).map { |row| row.split(TAB) }
  end

  # creat_hashes(headers, data_rows): Build hashes using key=headers, values=data_rows
  def create_hashes(headers, data_rows)
    data_rows.map { |row| headers.zip(row).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    col_names = "#{@data.first.keys.join(TAB)}#{NEW_LINE}"
    values = "#{@data.map { |row| row.values.join(TAB) }.join(NEW_LINE)}#{NEW_LINE}"
    col_names + values
  end
end
