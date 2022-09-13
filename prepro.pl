#!/usr/bin/perl 
#  
# Name: prepro 
# Disc: z30 message pre-processor
# BE ABLE TO DARE MIGHTY THINGS
# Ver:  0.1
# Auth: RKM

#primes - 2,3,5,7

use strict;
#use warnings;

my ($res, $ares, $bres, $num, $let1);

my %cipher = (65, "01", 66, "02", 67, "03", 68, "04", 69, "05", 70, "06", 71, "07", 72, "08", 73, "09", 74, "10", 75, "11", 76, "12", 77, "13", 78, "14", 79, "15", 80, "16", 81, "17", 82, "18", 83, "19", 84, "20", 85, "21", 86, "22", 87, "23", 88, "24", 89, "25", 90, "25");

print "Enter text: ";
chomp(my $string = <STDIN>);

my @ptext  = split(//, $string);
my $arrlen = @ptext;
my @ctext;

my $garbage = join("",@ptext);

my ($lchar, $outchar, $ordchar, $cypchar);
my $arrtot = $arrlen - 1;


for (my $i=0; $i <= $arrtot; $i++) {

$lchar = shift(@ptext);
$outchar = uc($lchar);
$ordchar = ord($outchar);
chomp($cypchar = $cipher{$ordchar});
push (@ctext, $cypchar);

}
my $crylen = @ctext;
my $outstring = join(" ", @ctext);
my $teststr = join("", @ctext);

print "$outstring\n";
#print "$teststr\n";



