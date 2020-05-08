# use strict;
use warnings;
use Term::Menu;
use Term::ANSIColor;
use Text::CSV;
use 5.010; 
# use Switch;

my $prompt = new Term::Menu;

sub CollisionByYear {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "ACCIDENT DATE";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %yearTable = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        my ($yyyy, $mm, $dd) = split('-', $cells[$extract_col]);
        push( @colvalues, $yyyy);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $years(@colvalues) {
        $yearTable{$years} += 1;
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $yearTable{$b} <=> $yearTable{$a} } keys %yearTable){
        print "Year: $key, Collision Count: " . $yearTable{$key} . "\n";
    }

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub CollisionByBorough {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "BOROUGH";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %boroughTable = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        push( @colvalues, $cells[$extract_col]);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $years(@colvalues) {
        if($years eq ""){
            $years = "unknown";
        }
        $boroughTable{$years} += 1;
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $boroughTable{$b} <=> $boroughTable{$a} } keys %boroughTable){
        print "Borough: $key, Collision Count: " . $boroughTable{$key} . "\n";
    }

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub CollisionByFactorVH1 {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "CONTRIBUTING FACTOR VEHICLE 1";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %collisionVH1Table = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        push( @colvalues, $cells[$extract_col]);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $ContributingFactor(@colvalues){
        if($ContributingFactor eq ""){
            $ContributingFactor = "Unspecified";
        }
        $collisionVH1Table{$ContributingFactor} += 1;
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $collisionVH1Table{$b} <=> $collisionVH1Table{$a} } keys %collisionVH1Table){
        print "CONTRIBUTING FACTOR VEHICLE 1: $key, Collision Count: " . $collisionVH1Table{$key} . "\n";
    }

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub CollisionByFactorVH2 {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "CONTRIBUTING FACTOR VEHICLE 2";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %collisionVH2Table = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        push( @colvalues, $cells[$extract_col]);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $ContributingFactor(@colvalues) {
        chomp $ContributingFactor;
        # removed records that say "Unspecified" or are blank
        if($ContributingFactor ne "Unspecified" && $ContributingFactor ne ""){
            $collisionVH2Table{$ContributingFactor} += 1;
        }
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $collisionVH2Table{$b} <=> $collisionVH2Table{$a} } keys %collisionVH2Table){
        print "CONTRIBUTING FACTOR VEHICLE 2: $key, Collision Count: " . $collisionVH2Table{$key} . "\n";
    }

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub CollisionByZip {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "ZIP CODE";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %zipCodeTable = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        push( @colvalues, $cells[$extract_col]);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $zipCode(@colvalues) {
        chomp $zipCode;
        # removed records that say "Unspecified" or are blank
        if($zipCode ne "Unspecified" && $zipCode ne ""){
            $zipCodeTable{$zipCode} += 1;
        }
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $zipCodeTable{$b} <=> $zipCodeTable{$a} } keys %zipCodeTable){
        print "Zip Code: $key, Collision Count: " . $zipCodeTable{$key} . "\n";
    }

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub CollisionBySeason {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "ACCIDENT DATE";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %seasonTable = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        my ($yyyy, $mm, $dd) = split('-', $cells[$extract_col]);
        push( @colvalues, $mm);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $month(@colvalues) {
        # Represents Winter Season       
        if($month eq "12" || $month eq "01" || $month eq "02" ){
            $month = "Winter"
        }
        # Represents Spring Season
        if($month eq "03" || $month eq "04" || $month eq "05" ){
            $month = "Spring"
        }
        # Represents Summer Season
        if($month eq "06" || $month eq "07" || $month eq "08" ){
            $month = "Summer"
        }
        # Represents Fall Season
        if($month eq "09" || $month eq "10" || $month eq "11" ){
            $month = "Fall"
        }                        
        $seasonTable{$month} += 1;
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $seasonTable{$b} <=> $seasonTable{$a} } keys %seasonTable){
        print "Season: $key, Collision Count: " . $seasonTable{$key} . "\n";
    }


    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub LowestCollisionFactorMonth("NOT DONE") {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "CONTRIBUTING FACTOR VEHICLE 2";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %wordcount = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        my ($yyyy, $mm, $dd) = split('-', $cells[$extract_col]);
        push( @colvalues, $cells[$extract_col]);
        $rowLength++;
    }


    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $ContributingFactor(@colvalues) {
        chomp $ContributingFactor;
        # removed records that say "Unspecified" or are blank
        if($ContributingFactor ne "Unspecified" && $ContributingFactor ne ""){
            $wordCount{$ContributingFactor} += 1;
        }
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $wordCount{$b} <=> $wordCount{$a} } keys %wordCount){
        print "CONTRIBUTING FACTOR VEHICLE 2: $key, Collision Count: " . $wordCount{$key} . "\n";
    }

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub LowestCollisionYear {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "ACCIDENT DATE";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %lowestYearTable = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        my ($yyyy, $mm, $dd) = split('-', $cells[$extract_col]);
        push( @colvalues, $yyyy);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $years(@colvalues) {
        $lowestYearTable{$years} += 1;
    }
    my $lowMarker = 100000000000;
    my $lowKey = 0;
    # display the key and the value associated with that key
    foreach my $key(sort{ $lowestYearTable{$b} <=> $lowestYearTable{$a} } keys %lowestYearTable){
        if($lowMarker > $lowestYearTable{$key}){
            $lowMarker = $lowestYearTable{$key};
            $lowKey = $key
        }
    }
    print "LOWEST Year: $lowKey, Collision Count: " . $lowestYearTable{$lowKey} . "\n";

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub LowestCollisionMonth {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "ACCIDENT DATE";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %lowestMonthTable = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        my ($yyyy, $mm, $dd) = split('-', $cells[$extract_col]);
        push( @colvalues, $mm);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $month(@colvalues) {
        $lowestMonthTable{$month} += 1;
    }
    my $lowMarker = 100000000000;
    my $lowKey = 0;
    # display the key and the value associated with that key
    foreach my $key(sort{ $lowestMonthTable{$b} <=> $lowestMonthTable{$a} } keys %lowestMonthTable){
        if($lowMarker > $lowestMonthTable{$key}){
            $lowMarker = $lowestMonthTable{$key};
            $lowKey = $key
        }
    }
    print "LOWEST month: $lowKey, Collision Count: " . $lowestMonthTable{$lowKey} . "\n";

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub LowestCollisionByFactorVH1 {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "CONTRIBUTING FACTOR VEHICLE 1";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %lowestCollisionVH1Table = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        push( @colvalues, $cells[$extract_col]);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $ContributingFactor(@colvalues){
        if($ContributingFactor eq ""){
            $ContributingFactor = "Unspecified";
        }
        $lowestCollisionVH1Table{$ContributingFactor} += 1;
    }

    my $lowestCollisionMarker = 100000000000;
    my $lowestCollisionKey = 0;
    # display the key and the value associated with that key
    foreach my $key(sort{ $lowestCollisionVH1Table{$b} <=> $lowestCollisionVH1Table{$a} } keys %lowestCollisionVH1Table){
        if($lowestCollisionMarker > $lowestCollisionVH1Table{$key}){
            $lowestCollisionMarker = $lowestCollisionVH1Table{$key};
            $lowestCollisionKey = $key
        }
    }
    print "CONTRIBUTING FACTOR VEHICLE 1: $lowestCollisionKey, Collision Count: " . $lowestCollisionVH1Table{$lowestCollisionKey} . "\n";

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub HighestCollisionByFactorVH1 {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "CONTRIBUTING FACTOR VEHICLE 1";
    my $rowLength;
    # array
    my @cells;
    my @colvalues;
    # Hash table
    my %highestCollisionVH1Table = ();

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        push( @colvalues, $cells[$extract_col]);
        $rowLength++;
    }

    # this will ether increment an already existing key-value with +1
    # or it will insert a new key-value pair into the hash making it set to 1
    foreach my $ContributingFactor(@colvalues){
        if($ContributingFactor eq ""){
            $ContributingFactor = "Unspecified";
        }
        $highestCollisionVH1Table{$ContributingFactor} += 1;
    }

    my $highestCollisionMarker = 0;
    my $highestCollisionKey = 0;
    # display the key and the value associated with that key
    foreach my $key(sort{ $highestCollisionVH1Table{$b} <=> $highestCollisionVH1Table{$a} } keys %highestCollisionVH1Table){
        if($highestCollisionMarker < $highestCollisionVH1Table{$key}){
            $highestCollisionMarker = $highestCollisionVH1Table{$key};
            $highestCollisionKey = $key
        }
    }
    print "CONTRIBUTING FACTOR VEHICLE 1: $highestCollisionKey, Collision Count: " . $highestCollisionVH1Table{$highestCollisionKey} . "\n";

    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub CollisionByYearUserChoice {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "ACCIDENT DATE";
    my @cells;
    my @colvalues;
    my $rowLength;

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        last unless $row =~ /\S/;
        chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        my ($yyyy, $mm, $dd) = split('-', $cells[$extract_col]);
        if($_[0] eq $yyyy){
            push( @colvalues, $cells[$extract_col]);
            print("\n////////////New Record////////////\n");
            my @a = (0..17);
            for(@a){
                # added condition so if its blank just fill it with Unspecified
                if($cells[$_] eq ""){
                    $cells[$_] = "Unspecified"
                }
                chomp $column_names[$_];
                chomp $cells[$_];
                print($column_names[$_] . ": " . $cells[$_] . "\n");
            }
            print("////////////////////////////////// \n");
        }
        $rowLength++;
    }
    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}

sub CollisionByBoroughUserChoice {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "BOROUGH";
    my @cells;
    my @colvalues;
    my $rowLength;

    # represents the first row of the file
    my $header = <IN>;
    # splits each column in header and stores it in an array
    my @column_names = split( ",", $header );
    my $extract_col = 0;

    # iterates through column_names and matches the wanted column
    # once found, store the index so we can use it to take extract the specific 
    # cell data we want from each row
    for my $header_line (@column_names) {
        # last if is like break in c++
        # once condition is met, break out, else increment extract_col
        last if $header_line =~ m/$wanted_column/;
        $extract_col++;
    }

    # iterates between rows
    while ( my $row = <IN> ) {
        # last unless $row =~ /\S/;
        # chomp $row;
        @cells = split( ",", $row );
        # print($row."\n");
        # print(@cells."\n");
        if($_[0] eq $cells[$extract_col]){
            push( @colvalues, $cells[$extract_col]);
            print("\n////////////New Record////////////\n");
            my @a = (0..17);
            for(@a){
                # added condition so if its blank just fill it with Unspecified
                if($cells[$_] eq ""){
                    $cells[$_] = "Unspecified"
                }
                chomp $column_names[$_];
                chomp $cells[$_];
                print($column_names[$_] . ": " . $cells[$_] . "\n");
            }
            print("////////////////////////////////// \n");
        }
        $rowLength++;
    }
    my $sizeofarray = scalar @colvalues;
    print "$rowLength Records Scanned\n";
    print "$sizeofarray Records Matches\n";
}


# foreach my $element (@colvalues) {
#     print "$element\n";
# }

my $answer = $prompt->menu(
      1  =>      ["Collisions by Year", 1],
      2  =>      ["Collisions by Borough (user enters the Borough)", 2],
      3  =>      ["Collisions by factor (vehicle #1)", 3],
      4  =>      ["Collisions by factor (vehicle #2) - write code to eliminate “unspecified” or blank.", 4],
      5  =>      ["Collisions by zip code", 5],
      6  =>      ["Collisions by season (do more occur in the winter vs. the summer?)", 6],
      7  =>      ["Contributing factor by month sorted", 7],
      8  =>      ["Contributing factor by year sorted", 8],
      9  =>      ["Lowest year for collisions", 9],
      10  =>     ["Lowest day for collisions - Same instructions as highest day", 10],
      11  =>     ["Lowest contributing factor for vehicle #1", 11],
      12  =>     ["Collisions by year (user enters the year)", 12],
      13  =>     ["Collisions by zip (user enters the zip)", 13],
      14  =>     ["Collisions where a cyclist was injured", 14],
      15  =>     ["Collisions where nobody was injured", 15],
      16  =>     ["Accident with the largest number of people injured", 16],
      17  =>     ["Accidents where more than 5 people were injured", 17],

);

my $same_answer = $prompt->lastval;
print "$same_answer \n";

while($same_answer ne "x"){
    given($same_answer) {
        when ("1"){
            print color('blue');
            CollisionByYear();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;
            }
        when ("2"){
            print color('red');
            CollisionByBorough();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;
            }
        when ("3"){
            print color('yellow');
            CollisionByFactorVH1();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;
            }
        when ("4"){
            print color('magenta');
            CollisionByFactorVH2();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;            
            }
        when ("5"){            
            print color('green');
            CollisionByZip();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;            
            }
        when ("6"){
            print color('cyan');
            CollisionBySeason();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;            
            }
        when ("7"){
            print color('white');
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;            
            }
        when ("8"){
            print color('bold blue');
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;            
            }
        when ("9"){
            print color('bold red');
            LowestCollisionYear();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;            
            }
        when ("10"){
            print color('bold green');
            LowestCollisionMonth();
            print("Please enter a number corresponding to the option you want to choose: ");
            $same_answer = <STDIN>;
            chomp $same_answer;            
            }
        when ("11")  { 
                print color('bold yellow');
                LowestCollisionByFactorVH1();
                print("Please enter a number corresponding to the option you want to choose: ");
                $same_answer = <STDIN>;
                chomp $same_answer;  
                }
        when ("12")  { 
                print color('bold cyan');
                HighestCollisionByFactorVH1();
                print("Please enter a number corresponding to the option you want to choose: ");
                $same_answer = <STDIN>;
                chomp $same_answer;  
                }
        when ("13")  { 
                print color('bright_blue');
                print "Pick a year to display collisions for\n";
                my $Year = <STDIN>;
                chomp $Year;
                CollisionByYearUserChoice($Year);
                print("Please enter a number corresponding to the option you want to choose: ");
                $same_answer = <STDIN>;
                chomp $same_answer;
                }
        when ("14")   {         
                print color('bold magenta');
                print "Pick a borough to display collisions for\n";
                my $Borough = <STDIN>;
                chomp $Borough;
                if(uc $Borough eq "QUEENS" || "MANHATTAN" || "BROOKLYN" || "STATEN ISLAND" || "BRONX"){
                    $Borough = uc $Borough;
                    CollisionByBoroughUserChoice($Borough);
                }else{
                        print "That is not one of the 5 Boroughs"
                }
                print("Please enter a number corresponding to the option you want to choose: ");
                $same_answer = <STDIN>;
                chomp $same_answer;
            }


        default { print 'Pick a valid entry';}   
    }
}

# open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
# my $wanted_column = "BOROUGH";
# my @cells;
# my @colvalues;

# my $header = <IN>;
# my @column_names = split( ",", $header );
# my $extract_col = 0;

# for my $header_line (@column_names) {
#     last if $header_line =~ m/$wanted_column/;
#     $extract_col++;
# }
# while ( my $row = <IN> ) {
#     last unless $row =~ /\S/;
#     chomp $row;
#     @cells = split( ",", $row );
#     push( @colvalues, $cells[$extract_col] );
# }
# my $sizeofarray = scalar @colvalues;
# print "Size of the coulmn= $sizeofarray";

# foreach my $element (@colvalues) {
#     print "$element\n";
# }