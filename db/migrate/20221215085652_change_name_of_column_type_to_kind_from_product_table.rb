class ChangeNameOfColumnTypeToKindFromProductTable < ActiveRecord::Migration[7.0]
  def change
    change_table :products do |t|
      t.rename :type, :kind
    end
  end
end
