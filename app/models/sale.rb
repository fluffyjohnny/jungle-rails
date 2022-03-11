class Sale < ActiveRecord::Base

  # scope :active, -> { where('sale.starts_on <= ? AND sales.ends_on >= ?', Date.current, Date.current).any? }

  def self.active
    where('sales.starts_on <= ? AND sales.ends_on >= ?', Date.current, Date.current)
  end

  def self.active_name
    select('name').where('sales.starts_on <= ? AND sales.ends_on >= ?', Date.current, Date.current).first.name
  end

  def self.active_percent_off
    select('percent_off').where('sales.starts_on <= ? AND sales.ends_on >= ?', Date.current, Date.current).first.percent_off
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
