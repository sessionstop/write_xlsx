# -*- coding: utf-8 -*-
require 'helper'

class TestRegressionRowColFormat03 < Test::Unit::TestCase
  def setup
    setup_dir_var
  end

  def teardown
    File.delete(@xlsx) if File.exist?(@xlsx)
  end

  def test_row_col_format03
    @xlsx = 'row_col_format03.xlsx'
    workbook  = WriteXLSX.new(@xlsx)
    worksheet = workbook.add_worksheet
    italic    = workbook.add_format(:italic => 1)

    worksheet.set_column('A:A', nil, italic)

    workbook.close
    compare_xlsx_for_regression(File.join(@regression_output, @xlsx), @xlsx)
  end
end
