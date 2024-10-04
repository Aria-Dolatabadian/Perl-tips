#!/usr/local/bin/perl

# DNA to RNA to Protein from FASTA and export the results

use strict;
use warnings;

# The filename of the FASTA file containing the DNA sequence
my $fasta_filename = 'DNA.fasta';

# Initialize a variable to hold the DNA sequence
my $dna_sequence = '';

# Open the FASTA file for reading
open(my $fh, '<', $fasta_filename) or die "Could not open file '$fasta_filename': $!";

# Read the FASTA file
while (my $line = <$fh>) {
    chomp $line;  # Remove newline character from the line
    if ($line =~ /^>/) {
        # Skip header lines starting with '>'
        next;
    }
    # Append the DNA sequence lines
    $dna_sequence .= $line;
}

# Close the file
close($fh);

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


# Export RNA sequence to FASTA format
my $rna_fasta_filename = 'rna_sequence.fasta';
open(my $rna_fh, '>', $rna_fasta_filename) or die "Could not open file '$rna_fasta_filename': $!";
print $rna_fh ">RNA_Sequence\n";
print $rna_fh "$rna_sequence\n";
close($rna_fh);
print "RNA sequence exported to $rna_fasta_filename\n";

# Export Protein sequence to FASTA format
my $protein_fasta_filename = 'protein_sequence.fasta';
open(my $protein_fh, '>', $protein_fasta_filename) or die "Could not open file '$protein_fasta_filename': $!";
print $protein_fh ">Protein_Sequence\n";
print $protein_fh "$protein_sequence\n";
close($protein_fh);
print "Protein sequence exported to $protein_fasta_filename\n";

print "\n";
