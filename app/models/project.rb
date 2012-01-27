class Project < ActiveRecord::Base
  attr_accessible :address
  attr_accessor :api_key, :derate, :system_size, :tilt, :federal_tax_rate, 
                :inflation_rate, :itc_fed_percent, :loan_term, :loan_rate,
                :load_debt, :market, :system_capacity, :total_hard_cost, :total_soft_cost,
                :load_escalation, :system_degradation, :rate_escalation, :ur_monthly_fixed_charge,
                :ur_flat_buy_rate

end
