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
