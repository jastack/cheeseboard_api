require 'HTTParty'
require 'json'

class PizzasController < ApplicationController

  def get_pizzas
    page = HTTParty.get('http://cheeseboardcollective.coop/pizza/')

    parse_page = Nokogiri::HTML(page)

    pizza_hash = []

    parse_page.css('div').css('.pizza-list').css('article').map do |a|
      pizza_raw = a.text.strip.split("\r")
      pizza_date = pizza_raw.first
      pizza_type = pizza_raw.last.strip
      pizza_hash.push({date: pizza_date, type: pizza_type})
    end

    { pizza: pizza_hash }
  end

  def index
    @index = get_pizzas
    render :index
  end

end
