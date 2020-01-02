class Potluck

  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all {|dish| dish if dish.category == category}
  end

  def menu
    ordered_names = @dishes.sort_by {|dish| dish.name }

    menu = Hash.new {|hash, key| hash[key] = []}
    ordered_names.reduce(menu) do |hash, dish|
      hash[(dish.category.to_s + "s").to_sym] << dish.name
      hash
    end
  end

  def ratio(category)
    number = (get_all_from_category(category).count).to_f / menu.values.flatten.count
    number * 100
  end
end
