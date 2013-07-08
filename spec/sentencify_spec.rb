require 'spec_helper'
require 'sentencify'

describe Array do
  let(:to_sentence) { [] }

  describe '#sentencize' do
    it 'allows :on option' do
      expect { to_sentence.sentencize(on: :field) }.to_not raise_error
    end

    it 'allows :image option' do
      expect { to_sentence.sentencize(image: :field) }.to_not raise_error
    end

    it 'allows :limit option' do
      expect { to_sentence.sentencize(limit: :field) }.to_not raise_error
    end

    it 'allows :empty option' do
      expect { to_sentence.sentencize(empty: :field) }.to_not raise_error
    end

    it 'allows :words_connector option' do
      expect { to_sentence.sentencize(words_connector: :field) }.to_not raise_error
    end

    it 'allows :two_words_connector option' do
      expect { to_sentence.sentencize(two_words_connector: :field) }.to_not raise_error
    end

    it 'allows :last_word_connector option' do
      expect { to_sentence.sentencize(last_word_connector: :field) }.to_not raise_error
    end

    it 'allows :final_singular_connector option' do
      expect { to_sentence.sentencize(final_singular_connector: :field) }.to_not raise_error
    end

    it 'allows :final_plural_connector option' do
      expect { to_sentence.sentencize(final_plural_connector: :field) }.to_not raise_error
    end

    it 'denies other params' do
      expect { to_sentence.sentencize(test: :field) }.to raise_error
    end
  end
end
