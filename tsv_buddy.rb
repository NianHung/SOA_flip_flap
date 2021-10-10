# frozen_string_literal: false

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  attr_accessor :data

  TAB = "\t".freeze
  NEWLINE = "\n".freeze
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split(NEWLINE)
    title = rows[0].split(TAB)
    @data = (rows[1..(tsv.length - 1)]).map { |info| Hash[title.zip(info.split(TAB))] }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    result = ''
    result += @data[0].keys.join(TAB) + NEWLINE
    @data.each { |info| result += info.values.join(TAB) + NEWLINE }
    result
  end
end
