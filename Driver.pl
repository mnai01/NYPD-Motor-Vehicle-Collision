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

sub CollisionByZip {
    open( IN, "nypd-motor-vehicle-collisions_RB.csv" ) or die("Unable to open file");
    my $wanted_column = "ZIP CODE";
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
    foreach my $zipCode(@colvalues) {
        chomp $zipCode;
        # removed records that say "Unspecified" or are blank
        if($zipCode ne "Unspecified" && $zipCode ne ""){
            $collisionVH2Table{$zipCode} += 1;
        }
    }

    # display the key and the value associated with that key
    foreach my $key(sort{ $collisionVH2Table{$b} <=> $collisionVH2Table{$a} } keys %collisionVH2Table){
        print "Zip Code: $key, Collision Count: " . $collisionVH2Table{$key} . "\n";
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

sub subroutines12 {
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

sub subroutines13 {
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

        when ("12")  { 
                print "Pick a year to display collisions for\n";
                my $Year = <STDIN>;
                chomp $Year;
                subroutines12($Year);
                }
        when ("13")   {         
                print "Pick a year to display collisions for\n";
                my $Borough = <STDIN>;
                chomp $Borough;
                if(uc $Borough eq "QUEENS" || "MANHATTAN" || "BROOKLYN" || "STATEN ISLAND" || "BRONX"){
                    $Borough = uc $Borough;
                    subroutines13($Borough);
                }else{
                        print "That is not one of the 5 Boroughs"
                }
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