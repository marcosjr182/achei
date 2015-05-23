# -*- encoding : utf-8 -*-
module ApplicationHelper
  def category_header(id)
    category = Category.find(id)
    if category.name == 'Achados' || category.name == 'Perdidos'
      header = "Achados&Perdidos"
      header_class = "ap"
    elsif category.name == 'Aluguel'
      header = "Venda"
      header_class = "venda"
    end
    return "<div class='row text-center header #{header_class}'><h2 class='col-md-12'>#{header}</h2></div>".html_safe
  end
end
