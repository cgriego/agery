module Agery
  ADULT    = -1
  INFANT   =  0
  CHILD    =  0
  TEENAGER = 13
  SENIOR   = 65

  AGE_OVER  = /^over_(0|[1-9]\d*)$/.freeze
  AGE_UNDER = /^under_([1-9]\d*)$/.freeze

  def adults
    to_age_a ADULT
  end
  alias :adult :adults

  def infants
    to_age_a INFANT
  end
  alias :infant :infants

  def children
    to_age_a CHILD
  end
  alias :child :children

  def teenagers
    to_age_a TEENAGER
  end
  alias :teenager :teenagers

  def seniors
    to_age_a SENIOR
  end
  alias :senior :seniors

  def respond_to?(method, *)
    AGE_OVER === method.to_s || AGE_UNDER === method.to_s || super
  end

  def method_missing(method, *)
    case method.to_s
    when AGE_OVER  then to_age_a($1.to_i)
    when AGE_UNDER then to_age_a($1.to_i - 1)
    else super
    end
  end

  private

  def to_age_a(value=nil)
    Array.new self, value
  end
end

Integer.send :include, Agery
