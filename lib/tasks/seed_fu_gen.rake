require 'active_record'
require "fileutils"
require 'date'

t = Time.now + 9.hours
t_folder_name = t.strftime("%y_%m_%d")
seed_gen_folder = "#{Rails.root}/db/afixtures"

# # remove existing image files
# Dir.chdir 'public/uploads/cuisine/'
# FileUtils.rm(Dir.glob('*.*'))

# add or clean directory
if Dir.exist?(seed_gen_folder)
  if Dir.exist?("#{seed_gen_folder}/#{t_folder_name}")
    Dir.chdir("#{seed_gen_folder}")
    FileUtils.rm(Dir.glob('*.rb'))
    Dir.chdir("#{seed_gen_folder}/#{t_folder_name}")
    FileUtils.rm(Dir.glob('*.*'))
    Dir.chdir("#{seed_gen_folder}/#{t_folder_name}/images")
    FileUtils.rm(Dir.glob('*.*'))
    Dir.chdir("#{Rails.root}")
  else
    Dir.mkdir("#{seed_gen_folder}/#{t_folder_name}")
    Dir.mkdir("#{seed_gen_folder}/#{t_folder_name}/images")
  end
end

# Dir.chdir "#{Rails.root}"
# binding.pry

# namespace :seed_fu_gen do
#   desc 'generate seed-fu files'
  # task :import do |t|
  #   # 01_manager.rb
  #   managers = Manager.all
  #   SeedFu::Writer.write("db/afixtures/01_manager.rb", class_name: 'Manager', seed_type: :seed_once) do |writer|
  #     managers.find_each do |mg|
  #       writer << mg.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 02_user.rb
  #   users =users.all
  #   SeedFu::Writer.write("db/afixtures/02_user.rb", class_name: "User", seed_type: :seed_once) do |writer|
  #   users.each do |user|
  #       writer << user.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 03_foodcategory.rb
  #   foodcategories = Foodcategory.all
  #   SeedFu::Writer.write("db/afixtures/03_foodcategory.rb", class_name: "Foodcategory", seed_type: :seed_once) do |writer|
  #     foodcategories.each do |fc|
  #       writer << fc.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 04_unit.rb
  #   units = Unit.all
  #   SeedFu::Writer.write("db/afixtures/04_unit.rb", class_name: "Unit", seed_type: :seed_once) do |writer|
  #     units.each do |ut|
  #       writer << ut.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 05_ingredient.rb
  #   ingredients = Ingredient.all
  #   SeedFu::Writer.write("db/afixtures/05_ingredient.rb", class_name: "Ingredient", seed_type: :seed_once) do |writer|
  #     ingredients.each do |ig|
  #       writer << ig.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 06_rawmaterial.rb
  #   rawmaterials = Rawmaterial.all
  #   SeedFu::Writer.write("db/afixtures/06_rawmaterial.rb", class_name: "Rawmaterial", seed_type: :seed_once) do |writer|
  #     rawmaterials.each do |rm|
  #       writer << rm.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 07_cookedstate.rb
  #   cookedstates = Cookedstate.all
  #   SeedFu::Writer.write("db/afixtures/07_cookedstate.rb", class_name: "Cookedstate", seed_type: :seed_once) do |writer|
  #     cookedstates.each do |cs|
  #       writer << cs.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 08_cuisine.rb
  #   cuisines = Cuisine.all
  #   SeedFu::Writer.write("db/afixtures/08_cuisine.rb", class_name: "Cuisine", seed_type: :seed_once) do |writer|
  #     cuisines.each do |cn|
  #       cn.main_image = File.new("#{Rails.root}/db/fixtures/images/#{cn.main_image}")
  #       writer << cn.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 10_foodstuff.rb
  #   foodstuffs = Foodstuff.all
  #   SeedFu::Writer.write("db/afixtures/10_foodstuff.rb", class_name: "Foodstuff", seed_type: :seed_once) do |writer|
  #     foodstuffs.each do |fs|
  #       writer << fs.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 11_procedure.rb
  #   procedures = Procedure.all
  #   SeedFu::Writer.write("db/afixtures/11_procedure.rb", class_name: "Procedure", seed_type: :seed_once) do |writer|
  #     procedures.each do |pd|
  #       writer << pd.attributes.except("created_at", "updated_at")
  #     end
  #   end

  #   # 12_stock.rb
  #   stocks = Stock.all
  #   SeedFu::Writer.write("db/afixtures/12_stock.rb", class_name: "Stock", seed_type: :seed_once) do |writer|
  #     stocks.each do |st|
  #       writer << st.attributes.except("created_at", "updated_at")
  #     end
  #   end
  # end
# end


namespace :seed_fu_gen do
  desc 'generate seed-fu files'
  task cuisine: :environment do |t|
    # 08_cuisine.rb
    cuisines = Cuisine.all
    SeedFu::Writer.write("db/afixtures/08_cuisine.rb", class_name: "Cuisine", seed_type: :seed_once) do |writer|
      cuisines.each do |cn|
        cn.main_image = File.new("#{Rails.root}/public#{cn.main_image}")
        writer << cn.attributes.except("created_at", "updated_at")
      end
    end
  end
end
