#!/usr/bin/env ruby

# Obtain file contents
k = ARGV[0]
m = ARGV[1]
n = ARGV[2]

# Figure out total possible combinations
numOfOrganisms = k.to_i+m.to_i+n.to_i

possibleOutcomes = 0
counter = 1

numOfOrganisms.times do
    if (counter == 0)
        possibleOutcomes += 0
    elsif (counter == 1)
        possibleOutcomes += 0
    else
      possibleOutcomes += (counter-1)*4
    end
    counter += 1
end

#print "There are " + possibleOutcomes.to_s
#puts " possible outcomes."

# Figure out number of possible individuals possessing a dominant allele.
organismArr = []

k.to_i.times do organismArr << 'k' end
m.to_i.times do organismArr << 'm' end
n.to_i.times do organismArr << 'n' end

kkArr = ["k", "k"]
kmArr = ["k", "m"]
knArr = ["k", "n"]
mmArr = ["m", "m"]
mnArr = ["m", "n"]
nnArr = ["n", "n"]

numPossibilitiesOfIndividualHasDomAllele = 0

organismArr.combination(2).to_a.each do | element |

    if ( element <=> kkArr ) == 0
        numPossibilitiesOfIndividualHasDomAllele += 4
    elsif ( element <=> kmArr ) == 0
        numPossibilitiesOfIndividualHasDomAllele += 4
    elsif ( element <=> knArr ) == 0
        numPossibilitiesOfIndividualHasDomAllele += 4
    elsif ( element <=> mmArr ) == 0
        numPossibilitiesOfIndividualHasDomAllele += 3
    elsif ( element <=> mnArr ) == 0
        numPossibilitiesOfIndividualHasDomAllele += 2
    elsif ( element <=> nnArr ) == 0
        numPossibilitiesOfIndividualHasDomAllele += 0
    end

end

#print "There are " + numPossibilitiesOfIndividualHasDomAllele.to_s
#puts " of possibilities of an individual having a Dominant allele."

puts numPossibilitiesOfIndividualHasDomAllele.to_f/possibleOutcomes
