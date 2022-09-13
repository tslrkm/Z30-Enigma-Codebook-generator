#!/usr/bin/perl 
#  
# Name: code-gen 
# Disc: z30 codebook generation
#       Generates the following:
#	Walzenlage (Rotors)
#	Ringstellung (Ring setting)
#	Kenngruppen (Initial groups)
# 	30 day - April, June, Sept & Nov
# 	31 days - Jan, March, May, July, Aug, Oct & Dec
#	28 / 29 days - Feb 
# 
# BE ABLE TO DARE MIGHTY THINGS
# Ver:  0.1
# Auth: RKM

use strict;
#use warnings;

my ($wnum, $wres, $rnum1, $rnum2, $rnum3, $rnum4, $kg11, $kg12, $kg13, $kg14, $kg21, $kg22, $kg23, $kg24, $kg31, $kg32, $kg33, $kg34, $kg41, $kg42, $kg43, $kg44, $day, $kgnum1, $kgnum2, $kgnum3, $kgnum4, $month);

my %walzenlage = (0, "I II III", 1, "I III II", 2, "II I III", 3, "II III I", 4, "III I II", 5, "III II I");

my %cal = ("jan", 31, "feb", 28, "fly", 29, "mar", 31, "apr", 30, "may", 31, "jun", 30, "jul", 31, "aug", 31, "sep", 30, "oct", 31, "nov", 30, "dec", 31);


print "\n\nEnigma Z30 Code Book Generator\n\n";
print "Chose from - Jan, Feb, Fly, Mar, Apr, may, Jun, Jul, Aug, Sep, Oct, Nov, Dec.\n\n";
print "Enter month required to generate: ";
chomp(my $string = <STDIN>);


my $str = lc $string;
my $str1 = uc $string;
my $filename = "z30-$str.txt";
print "Writing code book to: $filename\n";


open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";


$month = $cal{$str};
$month = $month + 1;

print $fh "GEHIEM!    SONDER-MACHINENSCHLUSSEL:   Z30 ENIGMA    $str1\n";
print $fh " ------------------------------------------------------- \n";
print $fh "| TAG | WALZENLAGE | RINGSTELLUNG |      KENGRUPPEN     |\n";
print $fh "| --- | ---------- | ------------ | ------------------- |\n";

for( $day = 1; $day < $month; $day = $day + 1 ) {

$day = "0$day" if $day < 10;

$wnum = get_wnum();
$wres = $walzenlage{$wnum};

$rnum1 = get_rnum();
$rnum2 = get_rnum();
$rnum3 = get_rnum();
$rnum4 = get_rnum();

$kg11 = get_rnum();
$kg12 = get_rnum();
$kg13 = get_rnum();
$kg14 = get_rnum();

$kg21 = get_rnum();
$kg22 = get_rnum();
$kg23 = get_rnum();
$kg24 = get_rnum();

$kg31 = get_rnum();
$kg32 = get_rnum();
$kg33 = get_rnum();
$kg34 = get_rnum();

$kg41 = get_rnum();
$kg42 = get_rnum();
$kg43 = get_rnum();
$kg44 = get_rnum();

$kgnum1 = "$kg11$kg12$kg13$kg14";
$kgnum2 = "$kg21$kg22$kg23$kg24";
$kgnum3 = "$kg31$kg32$kg23$kg34";
$kgnum4 = "$kg41$kg42$kg43$kg44";



print $fh "| $day  |  $wres  |   $rnum1 $rnum2 $rnum3 $rnum4    | $kgnum1 $kgnum2 $kgnum3 $kgnum4 |\n";     

}

print $fh " ------------------------------------------------------- \n";

close $fh;

sub get_wnum {
  my $range = 5;
  my $random_number = int(rand($range));
  
  return $random_number;
  }


sub get_rnum {
  my $range = 10;
  my $random_number = int(rand($range));
  
  return $random_number;
  }