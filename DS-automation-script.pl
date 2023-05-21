#Initializing the Code
use MdmDiscoveryScript;
use strict;

#Variables
my $filename;
my $mdmDocument;
my $i;

#Creating the output file
# Modify this line to select the location of your output 'bondtypes.txt' file
open my $fh, '>', 'Location to save the output comma-separated txt file\bondtypes.txt';
open STDOUT, '>&', $fh;

#Looping multiple pdb file
# Modify this line to select the range of your file. If you have 100 pdb files to analyze then use:
for ($i = 0; $i < 101; $i++) {
    
    printf "Frame${i}BondType    NumberOfBonds\n";
   
    # Modify this line
    my $basename = "Location to the pdb files\Name of the file excluding the serial number(i.e. FA-GAS-RDF for FA-GAS-RDF00001.pdb)";
    
    # Modify this line according to the format of the serial number of your file. If your file name is FA-GAS-RDF00001.pdb (5 digits) then use:
    my $numname = sprintf"%05d", $i;
    
    my $filename = $basename.$numname.".pdb";
    
    #Opening a single pdb file with the name from the variable $filename
    $mdmDocument = DiscoveryScript::Open(
    {
    Path => $filename,
    ModelType => MdmModelType
    }
    );
    
    #Selecting all atoms of the pdb file
    my $allAtoms = $mdmDocument->Atoms;
    
    #Extracting all the non-bond information
    my $nonbondMonitor = $mdmDocument->CreateNonbondMonitor($allAtoms);
    my $nonbonds = $nonbondMonitor->Nonbonds;
    
    #Extracting the number of alkyltype non-bond from all the non-bond information and printing it 
    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::alkylType);
    printf "alkylType    %d\n", $hBonds->Count;

    #Extracting the number of attractiveChargeType non-bond from all the non-bond information and printing it
    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::attractiveChargeType);
    printf "attractiveChargeType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::carbonHBondType);
    printf "carbonHBondType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::conventionalHBondType);
    printf "conventionalHBondType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::metalAcceptorType);
    printf "metalAcceptorType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::nonInteracting);
    printf "nonInteracting    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piAlkylType);
    printf "piAlkylType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piAnionType);
    printf "piAnionType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piCationType);
    printf "%dpiCationType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piDonorType);
    printf "piDonorType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piLonePairType);
    printf "piLonePairType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piPiStackedType);
    printf "piPiStackedType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piPiTShapedType);
    printf "piPiTShapedType    %d\n", $hBonds->Count;
 
    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::piSigmaType);
    printf "piSigmaType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::unfavorableAcceptorAcceptorType);
    printf "unfavorableAcceptorAcceptorType    %d\n", $hBonds->Count;
    
    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::unfavorableDonorDonorType);
    printf "unfavorableDonorDonorType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::unfavorableMetalDonorType);
    printf "unfavorableMetalDonorType    %d\n", $hBonds->Count;

    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::waterBridgeHBondType);
    printf "waterBridgeHBondType    %d\n", $hBonds->Count;
    
    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::waterHBondType);
    printf "waterHBondType    %d\n\n", $hBonds->Count;
    
    $mdmDocument->Close();
    }
close;

