#!/usr/local/bin/perl

# Read DNA sequence from a FASTA file
use strict;
use warnings;
my $filename = 'DNA.fasta';
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";
my $dna_sequence = do { local $/; <$fh> };  # Read entire file
close($fh);

# Remove header line and print DNA sequence
$dna_sequence =~ s/^>.*\n//;  # Remove header
print "DNA Sequence: $dna_sequence\n";


