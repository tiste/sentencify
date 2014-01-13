require 'spec_helper'
require 'sentencify/sentencize'

describe Array do
  subject { [] }

  describe '#assert_sentenciable' do
    it { expect { subject.send(:assert_sentenciable, on: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, limit: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, empty: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, words_connector: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, two_words_connector: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, last_word_connector: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, final_singular_connector: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, final_plural_connector: :field) }.to_not raise_error }

    it { expect { subject.send(:assert_sentenciable, dummy: :field) }.to raise_error }
  end

  describe '#sentencize' do
    let(:options) { {} }

    it 'calls #assert_sentenciable with options' do
      subject.should_receive(:assert_sentenciable).with(options)
      subject.sentencize(options)
    end

    context 'when there is no object' do
      it 'returns a no element found string' do
        subject.sentencize(on: :login).should == 'No element found'
      end
    end

    context 'when it contains Active Record or hash objects' do
      context 'when there is one object' do
        subject { [
          { name: 'Baptiste Lecocq', login: 'Tiste' }
        ] }

        it 'returns a one element string' do
          subject.sentencize(on: :login).should == 'Tiste'
        end
      end

      context 'when there is two objects' do
        subject { [
          { name: 'Baptiste Lecocq', login: 'Tiste' },
          { name: 'Chuck Norris', login: 'Chucky' }
        ] }

        it 'returns a two elements string' do
          subject.sentencize(on: :login).should == 'Tiste and Chucky'
        end
      end

      context 'when there is a number of objects less than the limit' do
        subject { [
          { name: 'Baptiste Lecocq', login: 'Tiste' },
          { name: 'Chuck Norris', login: 'Chucky' },
          { name: 'Van Damme', login: 'JCVD' }
        ] }

        it 'returns a two elements string' do
          subject.sentencize(on: :login).should == 'Tiste, Chucky and JCVD'
        end
      end

      context 'when there is a number of objects greater than the limit' do
        subject { [
          { name: 'Baptiste Lecocq', login: 'Tiste' },
          { name: 'Chuck Norris', login: 'Chucky' },
          { name: 'Van Damme', login: 'JCVD' }
        ] }

        it 'returns a two elements string' do
          subject.sentencize(on: :login, limit: 2).should == 'Tiste, Chucky and 1 other'
        end
      end
    end

    context 'when it contains strings' do
      context 'when there is one object' do
        subject { ['Tiste'] }

        it 'returns a one element string' do
          subject.sentencize.should == 'Tiste'
        end
      end

      context 'when there is two objects' do
        subject { ['Tiste', 'Chucky'] }

        it 'returns a two elements string' do
          subject.sentencize.should == 'Tiste and Chucky'
        end
      end

      context 'when there is a number of objects less than the limit' do
        subject { ['Tiste', 'Chucky', 'JCVD'] }

        it 'returns a two elements string' do
          subject.sentencize.should == 'Tiste, Chucky and JCVD'
        end
      end

      context 'when there is a number of objects greater than the limit' do
        subject { ['Tiste', 'Chucky', 'JCVD'] }

        it 'returns a two elements string' do
          subject.sentencize(limit: 2).should == 'Tiste, Chucky and 1 other'
        end
      end
    end
  end
end
