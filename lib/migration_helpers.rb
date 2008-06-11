# http://media.pragprog.com/titles/fr_arr/code/FKConstraints/lib/migration_helpers.rb
#---
# Excerpted from "Advanced Rails Recipes",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/fr_arr for more book information.
#---
module MigrationHelpers
  
  def fk(from_table, from_column, to_table)
    execute %(alter table #{from_table}
              add constraint #{constraint_name(from_table, from_column)}
              foreign key (#{from_column})
              references #{to_table}(id))
  end
  
  def drop_fk(from_table, from_column)    
    execute %(alter table #{from_table} 
              drop foreign key #{constraint_name(from_table, from_column)})
  end
  
  def constraint_name(table, column)
    "fk_#{table}_#{column}"
  end
  
end
