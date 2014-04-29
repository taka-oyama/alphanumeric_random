require 'alphanumeric_random'

describe AlphanumericRandom do
  context "generate" do
    it "without options" do
      rand = AlphanumericRandom.generate
      expect(rand).to be_kind_of String

      # default length should be set to 8
      expect(rand.length).to eq 8

      # unique option should be set to false as default
      length = AlphanumericRandom::BASE.length
      rand_long = AlphanumericRandom.generate(length: length + 1)
      expect(rand_long.length).to eq length + 1

      # human option should be set to false as default
      expect(rand_long.chars).to_not include(AlphanumericRandom::HUMAN_EXCULUDE)
    end

    context "with length option" do
      it "set to -1" do
        expect{ AlphanumericRandom.generate(length: -1) }.to raise_error
      end

      it "set to 0" do
        rand = AlphanumericRandom.generate(length: 0)
        expect(rand.length).to eq 0
      end

      it "set to 32" do
        rand = AlphanumericRandom.generate(length: 32)
        expect(rand.length).to eq 32
      end

      it "longer than the avaiable chars" do
        length = AlphanumericRandom::BASE.length
        rand = AlphanumericRandom.generate(length: length + 1)
        expect(rand.length).to eq length + 1
      end
    end

    context "with unique option" do
      it "as true" do
        length = AlphanumericRandom::BASE.length
        rand = AlphanumericRandom.generate(unique: true, length: length + 1)
        counter = rand.chars.inject({}) { |h,char| h[char] ||= 0; h[char] += 1; h }
        expect(counter.reject{ |k,v| v == 1 }).to be_empty
        expect(rand.length).to eq length
      end

      it "as false" do
        length = AlphanumericRandom::BASE.length
        rand = AlphanumericRandom.generate(unique: false, length: length + 1)
        expect(rand.length).to eq length + 1
      end

      it "as non-boolean value" do
        expect{ AlphanumericRandom.generate(unique: 1) }.to raise_error
      end
    end

    context "with human option" do
      it "as true" do
        length = AlphanumericRandom::HUMAN.length
        rand = AlphanumericRandom.generate(human: true, unique: true, length: length)
        expect(rand).to_not include(*AlphanumericRandom::HUMAN_EXCULUDE)
      end

      it "as false" do
        length = AlphanumericRandom::BASE.length
        rand = AlphanumericRandom.generate(human: false, unique: true, length: length)
        expect(rand).to include(*AlphanumericRandom::HUMAN_EXCULUDE)
      end

      it "as non-boolean value" do
        expect{ AlphanumericRandom.generate(human: 1) }.to raise_error
      end
    end

    context "with additional_chars option" do
      it "has two chars defined" do
        length = AlphanumericRandom::BASE.length
        rand_ext = AlphanumericRandom.generate(length: length + 2, additional_chars: ["?", "!"], unique: true)
        expect(rand_ext.length).to eq length + 2
      end

      it "has reoccuring chars defined" do
        length = AlphanumericRandom::BASE.length
        rand_ext = AlphanumericRandom.generate(length: length + 2, additional_chars: ["a", "a"], unique: true)
        expect(rand_ext.length).to eq length
      end
    end
  end

  context "human" do
    it "generates same result as human option set to true" do
      length = AlphanumericRandom::HUMAN.length
      rand = AlphanumericRandom.human(unique: true, length: length)
      expect(rand).to_not include(*AlphanumericRandom::HUMAN_EXCULUDE)
    end
  end

  context "uniq" do
    it "generates same result as unique option set to true" do
      length = AlphanumericRandom::BASE.length
      rand = AlphanumericRandom.uniq(length: length + 1)
      counter = rand.chars.inject({}) { |h,char| h[char] ||= 0; h[char] += 1; h }
      expect(counter.reject{ |k,v| v == 1 }).to be_empty
      expect(rand.length).to eq length
    end
  end
end
