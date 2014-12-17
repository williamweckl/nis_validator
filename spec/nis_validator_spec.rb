require 'nis_validator/nis'

describe NisValidator do

  subject { NisValidator::Nis.new }

  context 'with valid nis' do

    it do
      subject.number = '125.8702.350-7'
      should be_valid
    end

    it do
      subject.number = '125.1582.032-0'
      should be_valid
    end

    it do
      subject.number = '125.3666.079-8'
      should be_valid
    end

    it do
      subject.number = '125.2145.147-0'
      should be_valid
    end

    it do
      subject.number = '125.5785.452-4'
      should be_valid
    end

    it do
      subject.number = '125.2733.324-0'
      should be_valid
    end

    it do
      subject.number = '125.6523.422-0'
      should be_valid
    end

    it do
      subject.number = '1125.8702.350-7'
      should be_valid
    end

    it do
      subject.number = '1125.1582.032-0'
      should be_valid
    end

  end

  context 'with invalid nis' do

    it do
      subject.number = '000.0000.000-0'
      should_not be_valid
    end

    it do
      subject.number = '111.1111.111-1'
      should_not be_valid
    end

    it do
      subject.number = '222.1111.111-1'
      should_not be_valid
    end

  end

end