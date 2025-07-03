Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA86AA7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526653; cv=none; b=WnCs+ryhkEvmgCz9werv7UFcvokiVmzPvu4KT9Lm7icQsxaPsIYd+SuWqKBTvMZqtoC7XblX5GEMegtpgQrAXJ0NQyMxPbysGdnfP0ZYjFKSk6WQ0lvIjsfjNawANF91clmsGrEL81FSCmAqONRpmGrc7nei8VhCFb+qHvM+GMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526653; c=relaxed/simple;
	bh=HgZsuXrjtnnQ1ldKWGikzTeWXTHg7iRa4LatONmciKE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RZeTX9rALzapVOUqpPXnkl7sGshVkQwvI2ub8jkVMwPLc37XjtEG14i5EZEVdcY+bjD3G5Up8vEzzHoELMYRwtxq3uHX+OsPPiG6XJk8wth3fcTurLeEP4Ezr09+qntyV/K5Rzl2bjyGOxW0V03m3KAr+nwXG1OrcXHO/qSdhxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEtgcXtq; arc=none smtp.client-ip=209.85.219.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEtgcXtq"
Received: by mail-yb1-f195.google.com with SMTP id 3f1490d57ef6-e819ebc3144so6785450276.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751526650; x=1752131450; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SYPpNBdL6GQB84rzhT20IiMk8Grv0giY0MVnwAyB+LA=;
        b=HEtgcXtqmZmr/WoXIbNBLL0mICFG/uxga8oN5Cc+BaGlhhHYowqR9aFC0B0wtuJETR
         orJRwt+B5Si/lMchUUcMGIIOcbkCjbeATEdcnA7aMLFq/vTX+RABDWZx1uxaimpqKCNC
         lkYQp+Io6ux1+dP8vPtV4i0nc1KAOtNcekIwdJ1pNvz5b2sbqUhVgmEZFPdrYNTi5/Ud
         DJWsQU7yBqP2sr4JXcYD/zge36CmU1P1VI+EoHoFESgpVj5PYOpptKbS5EMLxryCjV7I
         J6NBkwKbk+9yGXz3f8iz6FZzEfx/wLk7UW76bDwIgUNN0N8FVZY7h8TPSlmTzV4eraJm
         iyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751526650; x=1752131450;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYPpNBdL6GQB84rzhT20IiMk8Grv0giY0MVnwAyB+LA=;
        b=VxAwg5NRBJHOH9y3Z/WInck/ICibYMHyr/wZmmV67DJKH1BcGb66jH8RW5cpE7m1IQ
         GL936iAU/FbscSUMAJP26b9yFQP7fiXdgctTakYBRSnU8NBI4mtwcv6VW2gBVurqRSzG
         JYbUdgbWZqx7u8JbmvfeDYP1nlHlnfSprPlV+ojCJFy7t0kuM4yLdmwmpD4IWYra+d0e
         Tb0ORIcCMZqSY+X0bUy/GaNtK+q6+i8yxbwd3l5+0VuJRTP+n/Jfr4jkuDyH4E4jF7bn
         hGD/2TN/g1eTpBS+OFUdlebdLOa5OreqEnAgDhyL8c4DAtkjIFWNM1/NrBECpoC3VE79
         TUpA==
X-Gm-Message-State: AOJu0YzrKq4NfKV/ipXJbaj+oWncO1VeKOBwXAJHDGKQVsfWZQrVMF1m
	Tp38VJ3oW+QrbLMhD+EEzDMkfhesF5JTFZDHZcIJxSpD8p5OlvrodpH4mGwzkaSImYqnB6Swfp/
	2VDtlK8oZ+XystRiQNIWm5sgzrK0GaAYJOnlIsvo=
X-Gm-Gg: ASbGncsdOh21FSrYlixO2ZGu5JGyH5/952m8vSkgVI2x4NVXPnyY1fhs+ua+9WXfbM/
	WvKDlz3T92U5tMHTR5BWSmaEVxRHfyrA3scdYYWtIbujfPfjGFBbmreZdmLolpvvFJJW6mgIkUI
	DR0vjz5kPEN6L8azC1XsIR3NZ6UtSpjfprVy/YtbgOmBJZO0ToBNUU7v2DY5CR45V5Lwt2lRDbV
	/mmvw==
X-Google-Smtp-Source: AGHT+IGK5isqJioNL/eCC0CfS4HHqCvVBopl+kZNQQfX0Of/vajaXOpb2fd3buCKwE9jgJWuxMMrk8QNjBNPss2I4Nk=
X-Received: by 2002:a05:6902:158d:b0:e89:83f3:45e9 with SMTP id
 3f1490d57ef6-e898f9b1090mr2712456276.27.1751526649733; Thu, 03 Jul 2025
 00:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Thu, 3 Jul 2025 12:40:38 +0530
X-Gm-Features: Ac12FXxEkY3bJpUIGJ8IzneXeg1PT0xQ-j3Nh0_tFUmy66FLUKB8e2yaVy5mOIw
Message-ID: <CAFf+5zju7Z+5knfxVn=TCwJLCdWy2W6Me1mGnkkQJ1KOHzFSWg@mail.gmail.com>
Subject: List of C programs.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

--------------------------
List of C programs.
--------------------------

* Multithreaded static HTTP web server (one thread per connection).
* Multithreaded dynamic HTTP web server (one thread per connection). The
  programs/scripts will be in cgi-bin directory but they won't be run
  directly. There will be a controller that will run the programs/scripts in
  the cgi-bin directory.
* Modify apache HTTP server to have a controller that will actually run
  the programs/scripts from cgi-bin directory instead of these programs/scripts
  being run directly. (Don't submit the patch).

* Generic dynamic array (like C++ vector).
* Generic hash (dynamic hash also).
* Generic singly linked list (simple - not many functions?).
* Bits library.

* Multithreaded TCP server (one thread per connection).
* HTTP client and HTTPS client implementation.
* SSH client implementation.
* Ping implementation using raw socket.
* Tcpdump type program using raw socket or iptables or nftables.
* Use raw socket to get ethernet packets and then decode them all the way to
  ICMP/TCP/UDP and print the fields/data.
* Communication between remote machines - A program that is both a TCP server
  and a TCP client will accept requests from other instance(s) of the same
  program on other machine(s) and execute program(s) given in the request and
  return the result to the client. Make this program a daemon?
* Use the above program to install other program(s)/software on remote
  machine(s).
* Tcl/Tk program for installing software on remote machine(s).
* A program that will do broadcast ping and save all IP addresses received in
  replies in a file with the status of the IP address as UP or DOWN. This
  program will show all this info on the output screen also. This program will
  do periodic broadcast pings to keep track of the status of IP addresses.
* A program that will take a file having a list of IP addresses and it will
  periodically ping those IP addresses and show their status on the output
  screen.
* Port scanning tool.
* Netlink example.
* Access Internet through another computer (both NAT server and Proxy server
  implementation).
* Netfilter example(s) (nf_register_net_hook(), etc.).
* Check packet interface.
* Pcap example(s).
* A reliable/connection oriented protocol over UDP (that guarantees delivery of
  all data) (may be a modified version of TCP or may be some other self
  developed protocol).
* Get IP address from domain name (use getaddrinfo()).
* DNS client.
* DHCP client and server (actual protocol implementation). Two tests -
        ** Run DHCP server and DHCP clients on the same computer.
        ** Use two computers. One will run DHCP server and another one will run
           DHCP client. Don't connect to any router, etc. See if it works.
* ARP client (actual protocol implementation).
* TFTP client and server (actual protocol implementation).
* SMS client (actual protocol implementation).
* Packet generator (TCP, UDP, etc.).
* A program to do stress testing of a TCP server - keep on creating new TCP
  connections. Also keep on sending garbage data to the TCP server to keep it
  busy.
* A program to do stress testing of a HTTP (web) server - keep on creating new
  HTTP connections and keep on downloading the home page and other pages listed
  on the home page, etc. (without stopping).
* Create a peer-to-peer network over wireless - One computer will have a static
  IP address and will run DHCP server on startup (DHCP server will run as a
  daemon) and other computers will run DHCP client on startup (DHCP client will
  run as a daemon). Now, another program will run and try to discover neighbors
  and write the IP addresses of the discovered neighbors in a file. Now, the IP
  addresses in this file can be used by other programs to communicate with their
  neighbors. Neighbor discovery will be done by sending a neighbor discovery
  packet on the broadcast address 255.255.255.255. Neighbor discovery will be
  done periodically so that new computers can be discovered and for deleting the
  file entry of the computers that moved out of the range. The file having the
  IP addresses of neighbors should be locked (using flock()) before
  reading/writing from/to it to maintain consistency and getting complete IP
  addresses.

* Network simulator for fixed networks.
* Network simulator for moving client(s) but AP(s)/Base station(s)/server(s)
  will be fixed.

* Signal handler example.
* Message Queue example.
* Pipes example (both unnamed and named (mkfifo()/mknod()).
* Shared Memory example.
* Shared mutex across processes example.
* Semaphore across processes example (both named and unnamed).
* Readers-Writer lock (rw_lock(), rw_unlock(), etc.) implementation.
* flock() example.
* mmap() example (mmap a file and read/write from/to it).
* Regex example (with group(s) capturing/saving).
* Regex implementation using a state machine (non-greedy).
* Regex implementation by linear parsing (first do non-greedy, then greedy).
* Logger.
* dlopen(), dlsym(), and dlclose() example.
* A program that uses dlopen(NULL, RTLD_LAZY | RTLD_GLOBAL), dlsym(), and
  dlclose() to get the function pointers of its own functions (even main()
  function) by using dlsym(lib_handle, "function_name") and then call the
  functions using these function pointers. For this, the program should be
  compiled with the "-rdynamic" flag. The compilation command for this program
  will be - "gcc program.c -o program.out -ldl -rdynamic".
* Sort a file.
* Sort a file based on a field/column.
* File system simulation (both fixed bitmap and dynamic).
* Distributed file system?
* timer_create(), etc. example.
* getitimer() and setitimer() example.
* alarm() example.
* Library functions for measuring execution time between two points in code,
  etc. (time_start(), time_end(), etc.). There can be multiple time_start() and
  time_end() in the code and they can be interspersed, so each time_start() call
  will return a pointer to a structure and this pointer should be passed in the
  corresponding timer_end().
* Timer library (upon timer expiry, call the function given by the user at the
  time of timer registration/creation along with the user data given by the user
  at the time of timer registration/creation).
* Reverse a file line by line.
* Speech to text.
* Text to speech.
* VoIP using speech to text and then text to speech.
* Redis type key-value database (both client and server) (keep saving the data
  on the disk so that it can be reloaded when the server restarts/starts).
* Key-Value store library - (add_key_value(key, value), get_value(key), etc.).
  A program will link with this library to use the key-value store. No saving
  on disk, all data in memory.
* MariaDB client (command line).
* MariaDB client library.
* Parse SQL and run it on a manually created database and check results. This
  database will basically have file(s) that will have data in columns. The data
  will be written directly in the file by the user.
* Remote mutex (mutex shared across processes on different machines (use sockets
  for implementing it)).
* Remote semaphore (semaphore shared across processes on different machines (use
  sockets for implementing it)).
* JSON library for creating and reading json data/file.
* XML parser.
* A program that catches all keystrokes and then prints on the output screen as
  to which key/key combination was pressed (like - you pressed Ctrl-K).
* A program that does bash like tab completion.
* Find duplicate files (in one folder or in multiple folders).
* Program for taking a screenshot.
* Program for recording the screen and making a video of it.
* libusb example(s).
* A program that opens the device file (/dev/sdb or /dev/sdb1, etc.) that
  represents a USB device (pen drive) and then dumps the partition table,
  names of files/directories in the USB drive, etc.
* Framebuffer (/dev/fb0) example(s).
* Experiment with xrdp.
* ptrace() example(s) (ptrace() is used by strace).
* Thread library using makecontext(), getcontext(), and swapcontext().
* Develop a compiler for C language in C language itself.
* Desktop search engine.
* File explorer.
* tar like program but self developed algorithm.
* cscope.
* A program to create ctags file. Test this ctags file with vim.
* Quicksort library.
* Mergesort library.

* Calculate mean, median, mode, standard deviation, and variance of the input
  data.
* Draw line graphs, bar graphs, dot graphs, and pie charts for the input data.
* Data analytics - A program that will take a file as an input and analyze the
  data in the file and print some statistics - like most selling product, etc.
  The input file will have all data (column-wise) such as customer name,
  customer id, product(s) the customer bought (one product per line), cost of
  the product, etc. (basically, dumping tables data into a file and then give
  this file as an input to the data analytics program).

* String library - str_join(), str_split(), substr(), is_str_an_integer(),
  is_str_a_float(), str_starts_with(), str_ends_with(), str_replace_str(),
  str_replace_chr(), str_remove_str(), str_remove_chr(), strtok_new(),
  str_strip_leading(), str_strip_trailing(), str_trim(), str_left_pad(),
  str_right_pad(), str_match_regex(), str_replace_regex_match_with_str(),
  str_starts_with_regex(), str_ends_with_regex(), str_remove_regex_match(),
  str_split_on_regex_delim(), etc.

* PIC (Programmable Interrupt Controller), Interrupt Vector Table, IRQ
  subsystem, few hardware devices, and CPU simulation (CPU simulation for IRQs
  only) (simulate IRQ_SHARED also - multiple functions/processes registered for
  the same interrupt line, workqueues or tasklets simulation?, interrupt handler
  functions should schedule some bottom half that will communicate with the
  simulated device and get data, etc. and show the data to the user and/or log
  the data in a file, etc.).

* Experiment(s) with some programmable robotics kit.
* Experiment(s) with Raspberry Pi.

* Linux kernel module (example of a character device driver).
* Linux kernel module to register for all hardware interrupts as shared and then
  printing which interrupts occurred.
* Experiment with QEMU on Linux.
* Linux kernel's memory management subsystem simulation?
* Documentation on how to write a device driver in the linux kernel (mostly
  PCI/PCIe drivers).

* Get involved in open source projects that are developed in C language -

        ** GNOME
        ** Specific GNOME apps like GNOME evolution, etc.
        ** Wireshark
        ** Apache HTTP web server
        ** Find more open source projects in C language on web.

* SDL (Simple DirectMedia Layer) - Give programs that show how to use the
  graphical widgets of SDL.

* Graphical apps in SDL -

        ** Image viewer
        ** Video player
        ** Music/Audio player
        ** Audio recorder and player
        ** Remote screen sharing (remote user can click/edit on shared screen?)

* Games in SDL -

        ** Blackjack
        ** Teen Patti
        ** Card Game 28
        ** Card Game 3-2-5
        ** Card Game Sweep
        ** Seven-up Seven-down dice game
        ** Other games

* Solutions to C interview coding questions and other C coding questions.

====
