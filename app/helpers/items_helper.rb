# -*- encoding : utf-8 -*-
module ItemsHelper
  include ActsAsTaggableOn::TagsHelper
  def action_options(item)
    btn_proposal = "Eu encontrei" if item.tag == "achados"
    btn_proposal = "Eu perdi" if item.tag_list.include? "perdidos"
    btn_proposal = "Eu quero" if item.tag_list.include? "doação"
    btn_proposal = "Fazer proposta" if item.tag_list.include? "aluguel"
    btn_proposal = "Fazer proposta" if item.tag_list.include? "venda"
    
    html = "<li>"
    html += link_to( "#{btn_proposal}", new_proposal_path(item_id: item.id), :remote => true, data: { toggle: "modal", target:'#modal'}, class:"btn btn-action" )
    html += "</li>"

    html.html_safe
  end 

  def custom_details(item)
    ach_per = ''
    ach_per += '<div class="col-md-6 reward"><span>Reconmpensa</span>#{item.reward}</span>' unless item.reward.nil?
    classificados = ""
    unless item.flexible.nil?
      flex = item.flexible ? "Sim" : "Não"
      classificados += '<span class="col-md-6 flexible">Negociável? #{flex}</span>'
    end

    return ach_per.html_safe if item.tag == "achados" || item.tag == "perdidos"
    return "" if item.tag == "doacao"
    return classificados.html_safe
  end
end
