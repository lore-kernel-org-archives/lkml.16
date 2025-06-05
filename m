Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD841C84BD
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749099236; cv=none; b=mQO7rfgvfUn7Fd8//6PTkaEIysQVvtnMBULGj9ecpzodggtwfla3fOyDmtfct0+rmSogiE/lynKUsNNBeiAE0Ta6GPbX1/VNxykdkhFlYuP5YM6JWw656bLHA3LVXROvjxbJm2r4G++D5uIfeC7ifVKn61kGRe8+cDDcMWkxIKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749099236; c=relaxed/simple;
	bh=/6C+JWw75/R50FFWMI8mjgcGEP7wVQE4tlqoTV6v7jo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SflJTuLZ32jdm9JKgXdJBEDmMC1Dg+HfX+a2SwY4gMWL0phARWg8aUWZjFXWEffISB3t4/fIpzNeHBuuuVE7bP/00Id2uqIcelPcKrF2DONv9FGF7Bl29A/g9Ue2K0kqlP0l1v8pNa8jHst7tXT5DhDIYpMMyq9qcC99YbY2UxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTJb43QU; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTJb43QU"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e817b40d6e7so550710276.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749099233; x=1749704033; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fS1f4AAXPnrRwjp5YID0CFk+74EYHvs8nkPEHGKclR4=;
        b=KTJb43QUfCKdTLdhwPx4S/QDd++/czqXavTr/atnjFZ3EUdHsWn+1lU9rzERT0JQxV
         A9ZHDD8Ukrp3I6zcbOVp5n7Ytmn0KwJOnwYfCrAmzJ6Y3bveiX2r9ECVEsNkJl0Y5Uak
         vlYm1abqy9XkbARlvl0NFFb/Y6e1Gf0sksCBei7qapeDa17zVemKbeAF9yknH05KxnMx
         6zVbjyN2cihgby8GWmJT2W5D11LxMoA5gQjFPqEAlsy6tQpSI2FUEFYCoT/KcQAyTRb9
         +29qieu3mT1+dRwbCgQ8Jy3dXYSKVisd0tzvvD5/xR5gEOCcUYEec5mf0Dy7Ugxdd8HV
         r6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749099233; x=1749704033;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fS1f4AAXPnrRwjp5YID0CFk+74EYHvs8nkPEHGKclR4=;
        b=O3MbMi4J4XpanTzO695NwupulAFLxlR1jbfxDs6Jvd1JXi1OaIMSb+7dnzYsnBi6hH
         Jdkis2z7pyMi+d6fddLydRJfHJ23JFUSNWIC9JR2Ydewr3SJvfNzUP7/jVqNQB0TR13v
         kB6zPrGhCGv/1LDqRRyxmsh4xiYV012TJQccLP4y+YbM5VMIZDaixUlRbZSN3mY8BJFu
         2cd+nyzj0avJOUN7vYDr+sNa5106SkGvtzOv1bV3nKeGACOHhjMSUAqlE1eV6cJh471t
         E1aAyQiBeNcw77C3+rZAnvSJXLsTNtNfLBZcxpLqVswDBOU1w5vv8qfASlMNQYy6rTIk
         PZ/A==
X-Gm-Message-State: AOJu0YziOy3RDCd0nZkWucKBf9Y5zpg99Zc6ogIZj49K3W/m5QgHoPg+
	Pd/G3Y7WcjNJVOpvyJR/J10TxwUnfeX1qHpXB42zusHltJm09khtK1h7hcURSH9s7sbvfiOwvdM
	ELeqc37QYpvJ9IjaNUQzOmK2ePaMPWbqpuAATsnEWlsDn
X-Gm-Gg: ASbGncuZFuAkeqiBj2Tq3EEvjGrD9NTdfcoo2742vaVEOGeOaj5RLSqbr9uUXvqFKhI
	VLbFlV/H8pYiF5Az/kOQNQjQfyi/QGe2n3b4Q7Tvz6YX6LSeCXznPx2oo3YXxxgISNH+f4E0IvQ
	0q1vt30seQtdj2OnbeuBrKLKMqPVz15f3pnQu19T4QkbRS7DdT5pmgEozJrhfkwVA/8u0=
X-Google-Smtp-Source: AGHT+IHJuAN2+ZFaNLR5ueUfxcly/u2JFLZx/T5PpU4QBjXlA0KknbXu8sCGbRYKhFcuqVfOE2DFPxf776nna4VQWEQ=
X-Received: by 2002:a05:6902:18ca:b0:e7d:8eee:aec8 with SMTP id
 3f1490d57ef6-e8179c39ce6mr7602022276.8.1749099233098; Wed, 04 Jun 2025
 21:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Thu, 5 Jun 2025 10:23:42 +0530
X-Gm-Features: AX0GCFsH-dgiodMRruB7kOXtiaAHea4aQnMTeLbEsDQ9FJ21Lhx4v55zJ3feva0
Message-ID: <CAFf+5zgmy9p3vLHKY6qeTKJO=RQa8z0H8dNs8BfqDr9D-1GC9g@mail.gmail.com>
Subject: Encrypt decrypt file using password as key (simple algorithm) (File: encrypt_decrypt_file.php).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Encrypt decrypt file using password as key (simple algorithm) (File:
encrypt_decrypt_file.php).

---------------------------------
encrypt_decrypt_file.php
---------------------------------

<?php

$e_option_present = FALSE;
$d_option_present = FALSE;
$op = "";
$op_str = "";
$input_file = "";
$output_file = "";
$in_handle = NULL;
$out_handle = NULL;
$password = "";
$max_password_len = 20;
$actual_password_len = 0;
$help_msg = "Please see how to use this program/script by using the --help" .
            " option (encrypt_decrypt_file --help).";
$buf_size = 8192;

// error handler function
function custom_error_handler($errno, $errstr, $errfile, $errline)
{
    //echo "Got error/notice/warning, etc.\n";
    //echo $errno . "\n";
    //echo $errtsr . "\n";
    //echo $errfile . "\n";
    //echo $errline . "\n";
    return true;
} // end of custom_error_handler
// set to the user defined error handler
$old_error_handler = set_error_handler("custom_error_handler");

function print_usage()
{
    echo ("Usage:\n\n" .
          "  Syntax:\n\n" .
          "    encrypt_decrypt_file OPTION INPUT_FILE\n\n" .
          "  Description:\n\n" .
          "    encrypt_decrypt_file will encrypt or decrypt INPUT_FILE\n" .
          "    according to the option given by the user.\n" .
          "    \n" .
          "    encrypt_decrypt_file will ask the user for a password and\n" .
          "    then use this password to encrypt or decrypt the INPUT_FILE\n" .
          "    (according to the option given by the user).\n" .
          "    \n" .
          "    The password for decrypting the input file should be the\n" .
          "    same as the password given for encrypting the original input\n" .
          "    file.\n" .
          "    \n" .
          "    The name of the output file will be\n" .
          "    input_file_name.[encrypted|decrypted] and it will be created\n" .
          "    in the same directory in which the INPUT_FILE is present.\n" .
          "    \n" .
          "    In case, the directory already has a file with the same name\n" .
          "    as the output file name, then this script will exit without\n" .
          "    doing anything and print an appropriate error message.\n" .
          "    \n" .
          "    Basically, this can be considered as protecting a file with\n" .
          "    a password.\n" .
          "    \n" .
          "  Options:\n\n" .
          "     -e\n" .
          "        Encrypt the INPUT_FILE.\n\n" .
          "     -d\n" .
          "        Decrypt the INPUT_FILE.\n\n" .
          "    --help\n".
          "        Print this usage/help and exit.\n\n");
} // end of print_usage

// print debug info
function print_debug_info()
{
    global $argc, $argv, $input_file, $output_file;
    echo "DEBUG_INFO_START:\n\n";
    echo "Number of arguments = " . ($argc - 1) . "\n\n";
    for ($i = 1; $i < $argc; $i++) {
        $arg = trim($argv[$i]);
        echo "Argument " . $i . ": " . $arg . "\n";
    }
    echo "\n";
    echo "input_file: '$input_file'\n";
    echo "output_file: '$output_file'\n";
    echo "\nDEBUG_INFO_END\n\n";
} // end of print_debug_info

function close_file_handles()
{
    global $in_handle, $out_handle;
    fclose($in_handle);
    fclose($out_handle);
} // end of close_file_handles

function delete_output_file()
{
    if (unlink($output_file) == FALSE) {
        echo "Error: Failed to delete output file. Please delete it" .
             " manually. Exiting..\n";
    }
} // end of delete_output_file

echo "\n";

//---- trim all elements of argv[] (including argv[0]) and store in an arg_list
//      so that I don't have to trim argv[] everywhere.

//---- check testing from here.

//---- check correctness of program.

// check for --help option first
for ($i = 1; $i < $argc; $i++) {
    $arg = trim($argv[$i]);
    if ($arg === '--help') {
        print_usage();
        exit(0);
    }
}

if ($argc != 3) {
    echo "Error: (Only) two arguments are required: -e|-d and an input file" .
         " name. Exiting..\n";
    echo "\n";
    echo "Number of arguments given = " . ($argc - 1) . "\n";
    echo "\n";
    echo "Arguments given are: ";
    if ($argc > 1) {
        echo "\n";
        for ($i = 1; $i < $argc; $i++) {
            $arg = trim($argv[$i]);
            echo "    Argument " . $i . ": " . $arg . "\n";
        }
    } else {
        echo "None\n";
    }
    echo "\n";
    echo $help_msg;
    echo "\n\n";
    exit(1);
}

for ($i = 1; $i < $argc; $i++) {
    $arg = trim($argv[$i]);
    if ($arg === "-e") {
        $e_option_present = TRUE;
        $op = "encrypt";
    } else if ($arg === "-d") {
        $d_option_present = TRUE;
        $op = "decrypt";
    } else {
        $input_file = $arg;
    }
} // end of for loop

if (($e_option_present == FALSE) && ($d_option_present == FALSE)) {
    echo "Error: Neither '-e' option nor '-d' option is given." .
         " This is invalid. One of the options should be given. Exiting..\n";
    echo "\n";
    echo $help_msg;
    echo "\n\n";
    exit(1);
}

if (($e_option_present == TRUE) && ($d_option_present == TRUE)) {
    echo "Error: Both '-e' option and '-d' option are given." .
         " This is invalid. Only one option should be given. Exiting..\n";
    echo "\n";
    echo $help_msg;
    echo "\n\n";
    exit(1);
}

if (strlen($input_file) == 0) {
    echo "Error: Input file name is empty. Exiting..\n";
    echo "\n";
    echo $help_msg;
    echo "\n\n";
    exit(1);
}

// set output file name
$op_str = $op . "ed";
$output_file = $input_file . "." . $op_str;

//print_debug_info();

// print names of input file and output file
echo "Input file: $input_file\n";
echo "Output file (to be created): $output_file\n\n";

// check if output file already exists by trying to read it
$op_str = $op . "ion";
$op_str = ucfirst($op_str);
if (($out_handle = fopen($output_file, "r")) != FALSE) { // output file exists
    fclose($out_handle);
    echo "\n";
    echo "Error: Output file already exists. $op_str was not done." .
         " Exiting..\n\n";
    exit(1);
}

// open input file for reading
if (($in_handle = fopen($input_file, "rb")) == FALSE) {
    echo "\n";
    echo "Error: Failed to open input file for reading. $op_str was not done." .
         " Exiting..\n\n";
    exit(1);
}

// get password from user
$op_str = $op . "ing";
while (strlen($password) == 0) {

    echo "Please enter password for $op_str input file" .
         " (max. $max_password_len characters): ";

    if (($password = fread(STDIN, $max_password_len)) == FALSE) {
        echo "Error: Failed to read password entered by the user on standard" .
             " input (STDIN). Exiting..\n\n";
        fclose($in_handle);
        exit(1);
    }

    // remove \r and \n from password
    $password = str_replace("\r", "", $password);
    $password = str_replace("\n", "", $password);
    $actual_password_len = strlen($password);
    //var_dump($password);

} // end of while strlen password

// open output file for writing
if (($out_handle = fopen($output_file, "wb")) == FALSE) {
    echo "\n";
    echo "Error: Failed to open output file for writing. $op_str was not" .
         " done. Exiting..\n\n";
    fclose($in_handle);
    exit(1);
}

while (!feof($in_handle)) {

//testing
//echo "Press enter to resume testing: ";
//fread(STDIN, 20);

    if (($buf = fread($in_handle, $buf_size)) == FALSE) {
        echo "\n";
        echo "Error: Failed to read input file. $op_str was not done." .
             " Exiting..\n\n";
        close_file_handles();
        delete_output_file();
        echo "\n";
        exit(1);
    }

    $buf_len = strlen($buf);

    for ($bi = 0, $pi = 0;
         $bi < $buf_len;
         $bi++, $pi = (($pi + 1) % $actual_password_len)) {
            //echo "$buf[$bi], ";
            //echo "$password[$pi], ";
            $buf[$bi] = ($buf[$bi] ^ $password[$pi]) ^ chr(0x80);
            //echo "$buf[$bi]\n";
            //print_r(unpack("H*", $buf[$bi]));
        } // end of for loop

//testing
//echo "Press enter to resume testing: ";
//fread(STDIN, 20);

    if (($num_bytes_written = fwrite($out_handle, $buf, $buf_len)) == FALSE) {
        echo "\n";
        echo "Error: Failed to write to output file. $op_str was not done." .
             " Exiting..\n\n";
        close_file_handles();
        delete_output_file();
        echo "\n";
        exit(1);
    }

//testing
//$num_bytes_written = 1234;
//echo "Press enter to resume testing: ";
//fread(STDIN, 20);

    if ($num_bytes_written != $buf_len) {
        echo "\n";
        echo "Error: Number of bytes read from the input file are not equal" .
             " to the number of bytes written to the output file. Output file" .
             " is corrupted. Deleting output file and exiting..\n";
        close_file_handles();
        delete_output_file();
        echo "\n";
        exit(1);
    }

} // end of while !feof

$op_str = $op . "ed";
echo "\n";
echo "Input file was $op_str successfully.\n\n";

echo "Output file was created successfully and is ready.\n\n";

close_file_handles()

?>

----
