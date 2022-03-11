module SalesHelper

  def active_sale?
    Sale.active.any?
  end

  def sale_name
    Sale.active_name
  end 


  def sale_percent
    Sale.active_percent_off
  end 

end