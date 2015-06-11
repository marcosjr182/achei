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
    ach_per += '<div class="col-md-6 reward"><span>'
    ach_per += icon('star')
    ach_per += " "
    ach_per += item.reward unless item.reward.nil?
    ach_per += '</span></div>'
    ach_per = '' if item.reward.nil? || item.reward.empty?
    classificados = ""
    unless item.flexible.nil?
      flex = item.flexible ? "Sim" : "Não"
      classificados += '<span class="col-md-6 flexible">Negociável? '
      classificados += flex
      classificados += '</span>'
    end
    unless item.value.nil?
      classificados += '<span class="col-md-6 price">R$ '
      classificados += item.value.to_s
      classificados += '</span>'
    end
    
    return ach_per.html_safe if item.tag == "achados" || item.tag == "perdidos"
    return "" if item.tag == "doacao"
    return classificados.html_safe
  end

  def flexible
    html = "<div class='flexible'>"+icon("check")+" Negociável</div>"
    html.html_safe
  end

  def reward(reward)
    html = "<div class='reward'>"+icon("star")
    html += " "
    html += reward
    html += " </div>"
    html.html_safe
  end
end
