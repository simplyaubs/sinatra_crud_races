Sequel.migration do
  up do
    create_table(:races) do
      primary_key :id
      String :race_name, :null=>false
      String :race_location, :null=>false
      String :race_month, :null=>false
    end
  end

  down do
    drop_table(:races)
  end
end