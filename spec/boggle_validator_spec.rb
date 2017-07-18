require 'boggle_validator'

describe BoggleValidator do

  let(:subject) { described_class.new([ ["I","L","A","W"],
                                        ["B","N","G","E"],
                                        ["I","U","A","O"],
                                        ["A","S","R","L"]], "BINGO" )}

  describe 'initialize' do

    it "has an array of letters" do
      expect(subject.board).to eq [ ["I","L","A","W"],
                                    ["B","N","G","E"],
                                    ["I","U","A","O"],
                                    ["A","S","R","L"] ]
    end

    it "has a word" do
      expect(subject.word).to eq "BINGO"
    end

  end

  describe 'locate_first_letter' do

    it 'returns an array with the location of the first letter of the word' do
      expect(subject.locate_first_letter(["B", "I", "N", "G", "O"].first)).to eq [[1,0]]
    end

    it 'returns multiple locations for the first letter if more than onoe on board' do
      expect(subject.locate_first_letter(["L", "I", "N", "G", "O"].first)).to eq [[0,1], [3,3]]
    end

  end

  describe 'on_board' do

    it 'returns true if the location given is on the board' do
      expect(subject.on_board?(1, 1)).to eq true
    end

    it 'returns false if the location given is on the board' do
      expect(subject.on_board?(5, 5)).to eq false
    end

  end

  describe 'check_letters' do

    let(:board) { [["I","L","A","W"], ["B","N","G","E"], ["I","U","A","O"], ["A","S","R","L"]] }

    it 'returns false if the letter does not exist on the board' do
      expect(subject.check_letters?(["Z"], board, 2, 2)).to eq false
    end

    it 'returns false if the letter is not at the given location' do
      expect(subject.check_letters?(["B"], board, 3, 3)).to eq false
    end

    it 'returns true if the array of letters is empty' do
      expect(subject.check_letters?(["B"], board, 1, 0)).to eq true
    end

    it "returns true if the letter on the board is next to the previous letter " do
      expect(subject.check_letters?(["B", "I"], board, 1, 0)).to eq true
    end

  end

  describe "check_in_all_directions" do

    let(:board) { [["I","L","A","W"], ["B","N","G","E"], ["I","U","A","O"], ["A","S","R","L"]] }

    it 'returns true if the the letters given are next to eachother' do
      expect(subject.check_in_all_directions?(["B", "I"], board, 0, 0)).to eq true
    end

  end

  describe 'valid_guess returns true' do

    it 'should return true if a guess is valid' do
      expect(subject.valid_guess?).to eq true
    end

  end

  describe 'valid_guess returns false' do

    let(:subject) { described_class.new([ ["I","L","A","W"],
                                          ["B","N","G","E"],
                                          ["I","U","A","O"],
                                          ["A","S","R","L"]], "BUNGIE" )}

    it 'should return false if a guess is valid' do
      expect(subject.valid_guess?).to eq false
    end

  end

  describe 'valid_guess returns false' do

    let(:subject) { described_class.new([ ["I","L","A","W"],
                                          ["B","N","G","E"],
                                          ["I","U","A","O"],
                                          ["A","S","R","L"]], "ZUNGIE" )}

    it 'should return false if the first letter of the word cant be found' do
      expect(subject.valid_guess?).to eq false
    end

  end

end
