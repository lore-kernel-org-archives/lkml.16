Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E07154BFE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744534378; cv=none; b=Hd1Z/yEMxrHcVLsWpubZCFpQgjwKzZK6BlDoLXYaC5HMi1rOAX2+OZwBBRzn3JRJ6Usw4wkXh2PUK7RQoQG47MzS+83L/6Lo0m65BnD6L5OlVgx9cCgLXr+Wn0rmXXTV7CFS+XYaQI2NQAlmF2zTiK9CbtcWEmEoRy4flgYkcks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744534378; c=relaxed/simple;
	bh=MNROw/OxRn6cxiGmLQxl1apUV74kFu6SfnaGAZsy1P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XK6xGVCphNkbBmJmdYDKZ/7stlY9YP6eOMugiDOWLuP8DJmckHBUtOI/aANz6vVVRJcM34buQ3AYfyouTCc63T6Srla8fCwDzMU2x5YNODQXmYDHu59rFU0qJwyK8CInlGle9QxFppUg67DV/x/A3gsULIkTk/+8/Yo42v9DJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aA2q9cIH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aA2q9cIH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so3190540f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 01:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744534374; x=1745139174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqFi7DTiIUrbGcISmc0jdmcPJMujJXlDGLlNJu8BBzQ=;
        b=aA2q9cIHqD4RdDNhbOWMH1oN3B5E+Rw6b1NSSpLfZikuPmf1YHvvh9UaawPTAki9Gc
         5oTEyBF8ySLx+ji7LfgDmVoxhsPQ8kT+Ie4CIXop+aALcBqFqnTsagfKYB62wpPXRaPb
         ldAqNP2O9+uo4FidwoAjwQcxwOhyFNW73Iso5hvwjWJXnwaAFFHeA4NZkd7d/iiDGRqD
         TcL+v2f9LNKLybC2pKUq1phk3lWkmgcWibNZrLvdfrqSkQ43cUMuzfoBJJH4sSvbRifP
         TdAUmhAQlSeLUSOxZy2Ee13SO/WzFD9nNGXJkxieaZQ6EKrkeQ/SZkLzqTvzyHV0SpCM
         7sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744534374; x=1745139174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqFi7DTiIUrbGcISmc0jdmcPJMujJXlDGLlNJu8BBzQ=;
        b=A6x/ePsSSy37n22loY5iUL4oGN7T5fH8bMbCJQexUI/ft2NEfqmENS0Xny/34LMFWh
         OCp7mh5jPEyjN+Dy6gvfv9NZJJzz6CItO6eoPFnvq00RGiv6nDYpYqYqGkNbD8Txod1v
         AW38I9NiSOLTDv/5AGw/GjZS05IvJrVSN9JtKl8sDnyrvRIDnOIVmUzslxHqbvtT8byT
         VoCunW6RYhgut3zcE+8dwfYB3m7l83kgVG+uy5civMXm/TAsM2LjqXFU78DSR98ef10w
         SpzxAlDgkNYI/GZrTKcIljvOiqnr5WBfbg5VNOOjwW4TW8Wd6LEPOuufWOL/Sgv2LRRH
         eo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuHH3WGqFN280Jr1/0XblA6Q/2UNXbPgbvvv4iGttP+BbAuFItC3OEyTkopoiVhnmwgSV+9sCOKetM44g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLRe2mr5hKWQ45NHF4bc8YphYa3GbMl1/po4ReWvTDpyjCHxj
	dAa3gZOQtTSXc3NpGTxUSrmVGKc/CerlxLNPSRCFCiOLuPfinW3P
X-Gm-Gg: ASbGncuW8rtMwP4dkBme847qjz3aF73IkwGAXRaWNg7C+A+3sW2T/Ye8YJhY7N6G4eO
	rZrambnTQILw5mlc7dfm9+JnmQ+1trW8MOwwrzmFDAkcR5+/pnAyXeYqcKZohrUCmSu7hUA3Fm7
	2Z43RM7z/TKXK6vF2WmPDhfPv2Vv1fRfkoesCAfSODdHuzWV1J8LoHS8mQIIsbpXJksBAGVZABz
	tAP8SbbiOHrKYLslRgO43ml9awF8hlU4ZrmqYlbtmXtYkF8QkWN6ODNDoE7nHdxuhvmlsI+W9h5
	i9A3QNkT8SaIYEKwh+42gZdhW6dTpacqGfP851JufQ==
X-Google-Smtp-Source: AGHT+IGknmarvcQPpRnWlyPOaX/s+TI0PihO9g8pQhbTqXGcRFvvo7r3+rVBtN5Uv5iXOVcsWC7aiQ==
X-Received: by 2002:a05:6000:4007:b0:39c:1404:3748 with SMTP id ffacd0b85a97d-39ea51f45b1mr6770486f8f.16.1744534374229;
        Sun, 13 Apr 2025 01:52:54 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eae979615sm7499956f8f.54.2025.04.13.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 01:52:53 -0700 (PDT)
Date: Sun, 13 Apr 2025 10:52:50 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	mripard@kernel.org, wens@csie.org, ebiederm@xmission.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Trying to kexec on Allwinner A80
Message-ID: <Z_t7YuzRS5p7_D7_@Red>
References: <20200407113454.GA457@Red>
 <20200407122243.GN25745@shell.armlinux.org.uk>
 <20200407130559.GB457@Red>
 <20200407132602.GO25745@shell.armlinux.org.uk>
 <20200407134849.GC457@Red>
 <20200407181740.GP25745@shell.armlinux.org.uk>
 <20200408084029.GA1859@Red>
 <20200408093320.GQ25745@shell.armlinux.org.uk>
 <20200408152412.GA3621@Red>
 <20200408161657.GT25745@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200408161657.GT25745@shell.armlinux.org.uk>

Le Wed, Apr 08, 2020 at 05:16:57PM +0100, Russell King - ARM Linux admin a écrit :
> On Wed, Apr 08, 2020 at 05:24:12PM +0200, Corentin Labbe wrote:
> > On Wed, Apr 08, 2020 at 10:33:20AM +0100, Russell King - ARM Linux admin wrote:
> > > On Wed, Apr 08, 2020 at 10:40:29AM +0200, Corentin Labbe wrote:
> > > > This is the last boot:
> > > > ## Loading init Ramdisk from Legacy Image at 2a000000 ...
> > > >    Image Name:   
> > > >    Image Type:   ARM Linux RAMDisk Image (uncompressed)
> > > >    Data Size:    8031928 Bytes = 7.7 MiB
> > > >    Load Address: 00000000
> > > >    Entry Point:  00000000
> > > >    Verifying Checksum ... OK
> > > > ## Flattened Device Tree blob at 23000000
> > > >    Booting using the fdt blob at 0x23000000
> > > >    Loading Ramdisk to 29857000, end 29fffeb8 ... OK
> > > >    Loading Device Tree to 2984e000, end 29856fd1 ... OK
> > > > Starting kernel ...
> > > > ID:0x00000000 DT:0x2984E000
> > > > Uncompressing Linux... done, booting the kernel.
> > > > [...]
> > > > fake uboot stuff
> > > > [...]
> > > > DEBUG: bootz: run kexec with --debug --kexec-syscall --force --initrd /tmp/ramdisk --dtb /tmp/dtb --command-line='console=ttyS0,115200n8 root=/dev/ram0 earlycon=uart,mmio32,0x7000000 earlyprintk ip=dhcp'
> > > > Set DEBUG!
> > > > main:1417 OPT_KEXEC_SYSCALL
> > > > main:1422 OPT_KEXEC_SYSCALL_AUTO
> > > > arch_process_options:119
> > > > main:1500
> > > > main:1517 res=0 do_load=1
> > > > main:1519 res=0 do_kexec_file_syscall=0
> > > > my_load:713
> > > > Try gzip decompression.
> > > > kernel: 0xb6931008 kernel_size: 0x444fc8
> > > > get_memory_ranges:36
> > > > MEMORY RANGES
> > > > 0000000020000000-000000009fffffff (0)
> > > > zImage_arm_load:423
> > > > zImage header: 0x016f2818 0x00000000 0x00444fc8
> > > > zImage size 0x444fc8, file size 0x444fc8
> > > > zImage requires 0x00455fc8 bytes
> > > >   offset 0x00006738 tag 0x5a534c4b size 8
> > > > Decompressed kernel sizes:
> > > >  text+data 0x00b77958 bss 0x0003d428 total 0x00bb4d80
> > > > Resulting kernel space: 0x00fcd920
> > > > Kernel: address=0x20008000 size=0x00fcd920
> > > > Initrd: address=0x20fd6000 size=0x016a6b97
> > > > DT    : address=0x2267d000 size=0x00006043
> > > > kexec_load: entry = 0x20008000 flags = 0x280000
> > > > nr_segments = 3
> > > > segment[0].buf   = 0xb6931008
> > > > segment[0].bufsz = 0x444fcc
> > > > segment[0].mem   = 0x20008000
> > > > segment[0].memsz = 0x445000
> > > > segment[1].buf   = 0xb528a008
> > > > segment[1].bufsz = 0x16a6b97
> > > > segment[1].mem   = 0x20fd6000
> > > > segment[1].memsz = 0x16a7000
> > > > segment[2].buf   = 0x4ef88
> > > > segment[2].bufsz = 0x6043
> > > > segment[2].mem   = 0x2267d000
> > > > segment[2].memsz = 0x7000
> > > > main:1568 res=0[   32.098439] sun7i-dwmac 830000.ethernet eth0: Link is Down
> > > > main:1582 res=0 do_exec=1
> > > > [   32.113191] kexec_core: Starting new kernel
> > > > [   32.460412] Bye!
> > > > ID:0xFFFFFFFF DT:0x2267D000
> > > > C:0x200080C0-0x2044CFE0->0x20B80500-0x20FC5420
> > > > ID:0xFFFFFFFF DT:0x2267D000
> > > > Uncompressing Linux... done, booting the kernel.
> > > 
> > > Okay, that looks fine:
> > > - the DT is out of the way, so shouldn't be corrupted by the
> > >   decompression process.
> > > - the decompressor writes the kernel image to 0x20008000 to 0x20b7f958
> > >   which is clear of the decompressor itself (which relocated itself
> > >   to 0x20b80500).
> > > - the ID doesn't matter for DT booting purposes.
> > > 
> > > I see you've gone back to using your own dtb rather than one derived
> > > from the booting kernel. I strongly recommend against giving your own
> > > dtb to kexec as if the boot loader modifies the DTB when calling the
> > > first kernel (such as adding memory region information, adding MAC
> > > addresses, enabling or disabling various devices) those modifications
> > > will be lost if you supply your own DTB to kexec.
> > > 
> > > Please drop "--dtb /tmp/dtb".
> > > 
> > 
> > Thanks it works now.
> > 
> > With a working setup I diffed dtb and the one given by uboot and it seems the missing node for booting was /memory.
> 
> That is more or less expected - it seems kexec never adds the /memory
> nodes to the dtb.  I've no idea whether it should or should not be doing
> so, and is for others to thrash out the arguments for and against what
> should be modified and how.
> 
> The upshot of the existing kexec behaviour is you can't take a dtb from
> the kernel build and use it with kexec.
> 
> > For booting a different kernel, I fdtput the dtb (for memory and bootargs), and it works until it try to mount the roofs which it find corrupt.
> 
> rootfs or initrd supplied to kexec?
> 
> > Since the rootfs I get by the fakeuboot is a "uboot legacy image" (rootfs.cpio.gz modified by mkimage), I drop the first 64bytes but it seems not sufficiant. (even if file say it is a good rootfs.cpio.gz)
> > Or perhaps the kernel get an invalid initrd address.
> 
> Yep, the file given via --initrd or --ramdisk is loaded exactly as-is
> into memory, no parsing of the file is done.  Neither the kernel, nor
> kexec, does any u-boot parsing of the initrd/ramdisk file; they are
> not u-boot.
> 
> If you want to try giving the kernel a bit more space, you can try
> --image-size=$((0x01000000)) to see whether that affects the ramdisk
> image problem - if it does, it means we're still not properly
> calculating the space the kernel needs.
> 

Hello

Just to say that adding --image-size=128000000 lead to a working setup.

Thanks
