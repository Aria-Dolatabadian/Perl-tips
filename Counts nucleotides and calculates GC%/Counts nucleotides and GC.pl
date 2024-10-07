#!/usr/bin/perl
use strict;
use warnings;

# Open the FASTA file for reading
my $fasta_file = "DNA.fasta";  # Replace with your file name
open(my $fh, '<', $fasta_file) or die "Could not open file '$fasta_file' $!";

# Variables to store the nucleotide counts
my ($count_A, $count_T, $count_G, $count_C) = (0, 0, 0, 0);
my $total_bases = 0;  # To store the total number of nucleotides

# Read the file line by line
while (my $line = <$fh>) {
    chomp $line;
    
    # Skip the header line that starts with '>'
    next if $line =~ /^>/;
    
    # Count each nucleotide
    $count_A += ($line =~ tr/A//);
    $count_T += ($line =~ tr/T//);
    $count_G += ($line =~ tr/G//);
    $count_C += ($line =~ tr/C//);
    
    # Update total bases count
    $total_bases += length($line);
}

# Close the file
close($fh);

# Calculate GC content
my $gc_count = $count_G + $count_C;
my $gc_content = ($total_bases > 0) ? ($gc_count / $total_bases) * 100 : 0;

# Print the nucleotide counts
print "A: $count_A\n";
print "T: $count_T\n";
print "G: $count_G\n";
print "C: $count_C\n";

# Print the GC content
printf "GC Content: %.2f%%\n", $gc_content;
