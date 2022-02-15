#!/usr/bin/perl

# the following was copied directly from the source of Shatter v0.3, modified sections have been tagged in the comments with asterisks

##################################################################
#
# Shatter.pl: 
#          
#    This perl script reads a CNF instance. Identifies the generators
#    representing the group of symmetries in the CNF instance. Generates 
#    symmetry-breaking clauses and augments them to the CNF instance. 
#    *This modified script does not generate the symmetry breaking 
#    clauses, that is handled by a separate python program*
#
#    It calls *2* programs:
#       - cnf2gap 
#       - saucy (graph automorphism tool by Paul Darga)
#
# Usage: 
#       - Shatter.pl CNF_Instance
#
# Output:
#       - saucy.result: contains fileName, #symmetries, #generators, 
#                       and saucy runtime.
#       - file.cnf.g: recipe file for saucy
#       - file.cnf.txt: generators of group of symmetries
#
#
# Created: 30 June. 2003, Fadi Aloul 
# 
# Copyrights Fadi Aloul, University of Michigan, 2003.
#
###########################################################################


#
# Define Executables
#

$cnf2gap = "cnf2gap";
$gat = "saucy"; # Graph Automorphism Tool
#$gap2cnf = "gap2cnf"; # *unused*


#
# 0) Define Arguments
#

if(@ARGV != 1) {
  print "\n   Shatter v0.3\n";
  print "   by Fadi Aloul, University of Michigan, 2002.\n\n";
  die "   USAGE: Shatter.pl CNF_file\n\n";
}


$file = $ARGV[0];
open(CNF, "$file") || die ("Cant open file $file\n");
close(CNF);

#
# 1) Run cnf2gap, create file.g (recipe file for saucy)
#

print "Converting CNF instance to saucy's input format ...\n";
open(OUTG, "> $file.g") || die ("Cant open $file.g");
close(OUTG);

$cmd = "$cnf2gap $file >> $file.g\n";
#print "$cmd\n";
system("$cmd");

#
# 2) Run saucy
#

print "Calling saucy ...\n";

$cmd = "$gat -i gap -o gap -x 1 -s saucy.result -c $file.g > $file.txt";
#print "$cmd\n";
system("$cmd");

