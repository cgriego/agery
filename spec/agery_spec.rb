require 'spec_helper'

module Agery
  describe "Agery::ADULT" do
    it { ADULT.should == -1 }
  end

  describe "Agery::INFANT" do
    it { INFANT.should == 0 }
  end

  describe "Agery::CHILD" do
    it { CHILD.should == 0 }
  end

  describe "Agery::TEENAGER" do
    it { TEENAGER.should == 13 }
  end

  describe "Agery::SENIOR" do
    it { SENIOR.should == 65 }
  end
end

describe "overriding the age constants" do
  around do |example|
    old_verbose, $VERBOSE = $VERBOSE, nil
    eval "old_age, #{constant} = #{constant}, #{age}"
    $VERBOSE = old_verbose

    example.run

    old_verbose, $VERBOSE = $VERBOSE, nil
    eval "#{constant} = old_age"
    $VERBOSE = old_verbose
  end

  context "ADULT = 21" do
    let(:constant) { "Agery::ADULT" }
    let(:age) { 21 }

    describe 2 do
      its(:adults) { should == [age, age] }
    end
  end

  context "INFANT = -1" do
    let(:constant) { "Agery::INFANT" }
    let(:age) { -1 }

    describe 2 do
      its(:infants) { should == [age, age] }
    end
  end

  context "CHILD = 2" do
    let(:constant) { "Agery::CHILD" }
    let(:age) { 2 }

    describe 2 do
      its(:children) { should == [age, age] }
    end
  end

  context "TEENAGER = 16" do
    let(:constant) { "Agery::TEENAGER" }
    let(:age) { 16 }

    describe 2 do
      its(:teenagers) { should == [age, age] }
    end
  end

  context "SENIOR = 75" do
    let(:constant) { "Agery::SENIOR" }
    let(:age) { 75 }

    describe 2 do
      its(:seniors) { should == [age, age] }
    end
  end
end

describe "age extensions to Integer" do
  describe 0 do
    [
      :adult, :adults,
      :child, :children,
      :infant, :infants,
      :teenager, :teenagers,
      :senior, :seniors,
      :over_100, :under_100,
      :over_1, :under_1
    ].each do |method|
      its(method) { should == [] }
      it { should respond_to(method) }
    end

    it { should_not respond_to(:to_age_a) }

    it "responds to public Integer methods" do
      should respond_to(:to_i)
    end

    it "responds to private Integer methods" do
      subject.respond_to?(:fork, true).should be_true
    end
  end

  describe 1 do
    its(:adult)  { should == [-1] }
    its(:adults) { should == [-1] }

    its(:child)    { should == [0] }
    its(:children) { should == [0] }

    its(:infant)  { should == [0] }
    its(:infants) { should == [0] }

    its(:teenager)  { should == [13] }
    its(:teenagers) { should == [13] }

    its(:senior)  { should == [65] }
    its(:seniors) { should == [65] }

    its(:over_21)  { should == [21] }
    its(:over_65)  { should == [65] }

    its(:under_2)  { should == [1] }
    its(:under_10) { should == [9] }
    its(:under_12) { should == [11] }
    its(:under_17) { should == [16] }
    its(:under_21) { should == [20] }

    its(:over_0)   { should == [0] }
    its(:over_2000000000) { should == [2000000000] }

    its(:under_1)   { should == [0] }
    its(:under_128) { should == [127] }
    its(:under_2000000000) { should == [1999999999] }

    its(:over_00) { expect { subject }.to raise_error(NoMethodError) }
    its(:over_01) { expect { subject }.to raise_error(NoMethodError) }

    it { should_not respond_to(:over_00) }
    it { should_not respond_to(:over_01) }

    its(:under_0)  { expect { subject }.to raise_error(NoMethodError) }
    its(:under_00) { expect { subject }.to raise_error(NoMethodError) }
    its(:under_01) { expect { subject }.to raise_error(NoMethodError) }

    it { should_not respond_to(:under_0)  }
    it { should_not respond_to(:under_00) }
    it { should_not respond_to(:under_01) }
  end

  describe 2 do
    its(:adult)  { should == [-1, -1] }
    its(:adults) { should == [-1, -1] }

    its(:child)    { should == [0, 0] }
    its(:children) { should == [0, 0] }

    its(:infant)  { should == [0, 0] }
    its(:infants) { should == [0, 0] }

    its(:teenager)  { should == [13, 13] }
    its(:teenagers) { should == [13, 13] }

    its(:senior)  { should == [65, 65] }
    its(:seniors) { should == [65, 65] }

    its(:over_21)  { should == [21, 21] }
    its(:over_65)  { should == [65, 65] }

    it { should respond_to(:over_21) }
    it { should respond_to(:over_65) }

    its(:under_2)  { should == [1, 1] }
    its(:under_10) { should == [9, 9] }
    its(:under_12) { should == [11, 11] }
    its(:under_17) { should == [16, 16] }
    its(:under_21) { should == [20, 20] }

    it { should respond_to(:under_2)  }
    it { should respond_to(:under_10) }
    it { should respond_to(:under_12) }
    it { should respond_to(:under_17) }
    it { should respond_to(:under_21) }
  end

  describe 20 do
    its(:adults) { should == Array.new(described_class).map { -1 } }
  end

  describe -1 do
    [
      :adult, :adults,
      :child, :children,
      :infant, :infants,
      :teenager, :teenagers,
      :senior, :seniors,
      :over_100, :under_100,
      :over_1, :under_1
    ].each do |method|
      its(method) { expect { subject }.to raise_error(StandardError) }
    end
  end
end
