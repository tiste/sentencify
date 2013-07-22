require 'spec_helper'
require 'sentencify/sentencize'

describe Array do
  let(:to_sentencify) { [] }

  describe '#sentencize' do
    it 'allows :on option' do
      expect { to_sentencify.sentencize(on: :field) }.to_not raise_error
    end

    it 'allows :image option' do
      expect { to_sentencify.sentencize(image: :field) }.to_not raise_error
    end

    it 'allows :limit option' do
      expect { to_sentencify.sentencize(limit: :field) }.to_not raise_error
    end

    it 'allows :empty option' do
      expect { to_sentencify.sentencize(empty: :field) }.to_not raise_error
    end

    it 'allows :words_connector option' do
      expect { to_sentencify.sentencize(words_connector: :field) }.to_not raise_error
    end

    it 'allows :two_words_connector option' do
      expect { to_sentencify.sentencize(two_words_connector: :field) }.to_not raise_error
    end

    it 'allows :last_word_connector option' do
      expect { to_sentencify.sentencize(last_word_connector: :field) }.to_not raise_error
    end

    it 'allows :final_singular_connector option' do
      expect { to_sentencify.sentencize(final_singular_connector: :field) }.to_not raise_error
    end

    it 'allows :final_plural_connector option' do
      expect { to_sentencify.sentencize(final_plural_connector: :field) }.to_not raise_error
    end

    it 'denies other options' do
      expect { to_sentencify.sentencize(test: :field) }.to raise_error
    end

    context 'when there is no object' do
      it 'returns a no element found string' do
        to_sentencify.sentencize(on: :login).should == 'No element found'
      end
    end

    context 'when there is one object' do
      let(:to_sentencify) { [
        { name: 'Baptiste Lecocq', login: 'Tiste' }
      ] }

      it 'returns a one element string' do
        to_sentencify.sentencize(on: :login).should == 'Tiste'
      end
    end

    context 'when there is two objects' do
      let(:to_sentencify) { [
        { name: 'Baptiste Lecocq', login: 'Tiste' },
        { name: 'Chuck Norris', login: 'Chucky' }
      ] }

      it 'returns a two elements string' do
        to_sentencify.sentencize(on: :login).should == 'Tiste and Chucky'
      end
    end

    context 'when there is a number of objects less than the limit' do
      let(:to_sentencify) { [
        { name: 'Baptiste Lecocq', login: 'Tiste' },
        { name: 'Chuck Norris', login: 'Chucky' },
        { name: 'Van Damme', login: 'JCVD' }
      ] }

      it 'returns a two elements string' do
        to_sentencify.sentencize(on: :login).should == 'Tiste, Chucky and JCVD'
      end
    end

    context 'when there is a number of objects greater than the limit' do
      let(:to_sentencify) { [
        { name: 'Baptiste Lecocq', login: 'Tiste' },
        { name: 'Chuck Norris', login: 'Chucky' },
        { name: 'Van Damme', login: 'JCVD' }
      ] }

      it 'returns a two elements string' do
        to_sentencify.sentencize(on: :login, limit: 2).should == 'Tiste, Chucky and 1 other'
      end
    end
  end
end
