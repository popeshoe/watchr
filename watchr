#!/usr/bin/env perl
use warnings;
use strict;

use Data::Dumper;
use Digest::MD5::File qw( file_md5_hex );
use Time::HiRes qw(usleep nanosleep);

# Don't buffer output;
$| = 1;

# The first argument is a command to run (eg perl blah.pl)
my ($command, @files_to_watch) = @ARGV;
my %files = ();

sub hasChanged {
    my ($file) = @_;

    unless (-e $file) {
        print STDERR "ERROR: $file does not exist.";
        die();
    }

    my $md5 = file_md5_hex( $file );

    if ($files{$file} eq $md5) {
        return 0;
    }

    $files{$file} = $md5;
    return 1;
}
sub clearScreen {
    print "\033[2J";    #clear the screen
    print "\033[0;0H"; #jump to 0,0
}
sub executeCommand {
    system $command;
}

# put all the files to watch into a hash of filename => md5 hash, but keep the md5 empty so the first loop detects a change
# and executes the command
foreach my $filename (@files_to_watch) {
    $files{$filename} = "";
}

# Start the loop
while (1) {
    usleep(500000);
    for my $file (keys %files) {
        if (hasChanged($file)){
            clearScreen();
            executeCommand();
            next;
        }
    }
    
    #print "interval\n";
}