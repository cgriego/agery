module Agery
  AGE_OVER  = /^over_(0|[1-9]\d*)$/.freeze
  AGE_UNDER = /^under_([1-9]\d*)$/.freeze

  @adult    = -1
  @infant   =  0
  @child    =  0
  @teenager = 13
  @senior   = 65

  class << self
    attr_accessor :adult, :infant, :child, :teenager, :senior
  end

  def adults
    to_age_a Agery.adult
  end
  alias :adult :adults

  def infants
    to_age_a Agery.infant
  end
  alias :infant :infants

  def children
    to_age_a Agery.child
  end
  alias :child :children

  def teenagers
    to_age_a Agery.teenager
  end
  alias :teenager :teenagers

  def seniors
    to_age_a Agery.senior
  end
  alias :senior :seniors

  def respond_to?(method, *)
    super || AGE_OVER === method.to_s || AGE_UNDER === method.to_s
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
