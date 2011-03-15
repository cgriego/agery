require 'spec_helper'

module Agery
  describe "Agery::VERSION" do
    subject { VERSION }

    it { should be_a_kind_of String }

    describe "is compliant with Semantic Versioning <http://semver.org/>" do
      let(:gem_version) { Gem::Version.new VERSION }
      subject { gem_version }

      it { subject.should have(3).segments }

      describe "major version" do
        subject { gem_version.segments[0] }

        it { should be_a_kind_of Fixnum }
      end

      describe "minor version" do
        subject { gem_version.segments[1] }

        it { should be_a_kind_of Fixnum }
      end

      describe "patch version" do
        subject { gem_version.segments[2] }

        it { subject.to_s.should =~ /\d+([A-Za-z][0-9A-Za-z-]*)?/ }
      end
    end
  end
end
