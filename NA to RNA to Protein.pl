#!/usr/local/bin/perl

# DNA to RNA to Protein

use strict;
use warnings;

# DNA sequence (example)
my $dna_sequence = 'ATGCGATACGTAAGGTCTTACGACGTA';

# Step 1: Transcribe DNA to RNA
# Replace T with U
my $rna_sequence = $dna_sequence;
$rna_sequence =~ s/T/U/g;

# Codon table for translation
my %codon_table = (
    'UUU' => 'F', 'UUC' => 'F', 'UUA' => 'L', 'UUG' => 'L',
    'CUU' => 'L', 'CUC' => 'L', 'CUA' => 'L', 'CUG' => 'L',
    'AUU' => 'I', 'AUC' => 'I', 'AUA' => 'I', 'AUG' => 'M',
    'GUU' => 'V', 'GUC' => 'V', 'GUA' => 'V', 'GUG' => 'V',
    'UCU' => 'S', 'UCC' => 'S', 'UCA' => 'S', 'UCG' => 'S',
    'CCU' => 'P', 'CCC' => 'P', 'CCA' => 'P', 'CCG' => 'P',
    'ACU' => 'T', 'ACC' => 'T', 'ACA' => 'T', 'ACG' => 'T',
    'GCU' => 'A', 'GCC' => 'A', 'GCA' => 'A', 'GCG' => 'A',
    'UAU' => 'Y', 'UAC' => 'Y', 'UAA' => '*', 'UAG' => '*',
    'CAU' => 'H', 'CAC' => 'H', 'CAA' => 'Q', 'CAG' => 'Q',
    'AAU' => 'N', 'AAC' => 'N', 'AAA' => 'K', 'AAG' => 'K',
    'GAU' => 'D', 'GAC' => 'D', 'GAA' => 'E', 'GAG' => 'E',
    'UGU' => 'C', 'UGC' => 'C', 'UGA' => '*', 'UGG' => 'W',
    'CGU' => 'R', 'CGC' => 'R', 'CGA' => 'R', 'CGG' => 'R',
    'AGU' => 'S', 'AGC' => 'S', 'AGA' => 'R', 'AGG' => 'R',
    'GGU' => 'G', 'GGC' => 'G', 'GGA' => 'G', 'GGG' => 'G',
);

# Step 2: Translate RNA to Protein
my $protein_sequence = '';
for (my $i = 0; $i < length($rna_sequence); $i += 3) {
    my $codon = substr($rna_sequence, $i, 3);
    if (exists $codon_table{$codon}) {
        $protein_sequence .= $codon_table{$codon};
    }
}

# Output the results
print "DNA Sequence: $dna_sequence\n";
print "RNA Sequence: $rna_sequence\n";
print "Protein Sequence: $protein_sequence\n";
