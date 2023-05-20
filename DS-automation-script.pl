#Initializing the Code
use MdmDiscoveryScript;
use strict;

#Variables
my $filename;
my $mdmDocument;
my $i;

#Creating the output file
open my $fh, '>', 'Location\to\save\the\output\comma-separated\txt\file\bondtypes.txt';
open STDOUT, '>&', $fh;

#Looping multiple pdb file
for ($i = 0; $i < 2501; $i++) {
    
    printf "Frame${i}BondType    NumberOfBonds\n";
   
    my $basename = "Location\to\the\pdb\files\Name of the file excluding the serial number(i.e. FA-GAS-RDF for FA-GAS-RDF00001.pdb)";
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
 
    my $hBonds = $nonbondMonitor->NonbondsOfType(Mdm::alkylType);
    printf "alkylType    %d\n", $hBonds->Count;

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

