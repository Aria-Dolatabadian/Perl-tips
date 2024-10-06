# Reading protein sequence data from a file
# The filename of the file containing the protein sequence data
$proteinfilename = 'NM_021964fragment.pep';
# First, we have to "open" the file and associate a "filehandle" with it.
open(PROTEINFILE, '<', $proteinfilename) or die "Could not open file '$proteinfilename' $!";

# Initialize a variable to hold the protein sequence
my $protein = '';

# Read the protein sequence data from the file
while (my $line = <PROTEINFILE>) {
    chomp $line;  # Remove newline character from the line
    $protein .= $line;  # Append the line to the protein variable
}

# Close the file
close(PROTEINFILE);

# Print the protein onto the screen
print "Here is the protein:\n\n";
print $protein, "\n";



#or

# Reading protein sequence data from a file, take 4
# The filename of the file containing the protein sequence data
$proteinfilename = 'NM_021964fragment.pep';
# First we have to "open" the file, and in case the
# open fails, print an error message and exit the program.
unless ( open(PROTEINFILE, $proteinfilename) ) {
 print "Could not open file $proteinfilename!\n";
exit; }
# Read the protein sequence data from the file in a "while" loop,
# printing each line as it is read.
while( $protein = <PROTEINFILE> ) {
 print " ###### Here is the next line of the file:\n";
 print $protein;
}
# Close the file.
close PROTEINFILE;
