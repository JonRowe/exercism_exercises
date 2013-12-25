module Hamming
  module_function

  def compute dna_strand_a, dna_strand_b
    combine_base_pairs(dna_strand_a, dna_strand_b).count do |(a, b)|
      b && a != b
    end
  end

  def combine_base_pairs dna_strand_a, dna_strand_b
    split(dna_strand_a).zip split(dna_strand_b)
  end
  private :combine_base_pairs

  def split strand
    strand.split('')
  end
  private :split

end
