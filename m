Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAFB1A072C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502632; cv=none; b=f1W3h7/nFpvY6edlDkJb0zbvzvHNo2PskJ1XEvY2FwQk3wjb9zVt8GwgzuWFX/8ChXPl27jyC+OHq6aBIF9zZBlV5AlNTjocnyl63VKGEKw880V11jq6cK5Gn3P0h6KLW2jzaMe4Z6hbJhx3uX/1mDsSEv4xB45CVq8Fuwjvjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502632; c=relaxed/simple;
	bh=2eYg0o+p5tQ+IwsAL0QEMVNtnnRyW7IucnB/hYpMAHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stlRSczJ1QVm2TAtB0UpLBXtEL83duRJwgmvYicqO6koSgViQuF1+nWkYOt1bpi72crZMGPQYVl8ygsH5tcW6CkgiQwPsHOBB9wRoNq1UPvmiBM8XfvLiZ1WTQi9Px1o8QUEp46Wh5T2e8XrzPVP70ZNSS4eeDBBjMU+xraZpkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=P406LLkI; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="P406LLkI"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af590aea813so2179338a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1745502628; x=1746107428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgyZJ72DX3yp67fN32Ze8H+XH057rigjNypsDD4758s=;
        b=P406LLkI06eIBly9AQFI39VEO1c3tIzcdszN73FG1fxGpNrwnp5UpoPe07qwA0oeNq
         DrpU8rPcsRlaTrtDoM7UxDEDsbQgMqbBF5+W3nZhgo0wxxnzoWyfXkiruP+ED+hWj5zV
         bTj1j/9fhJg4iaPo4MKz52iWbPhIS+avC7Rt/ZenQFdH/Myybak5ci8IxipmUr8sFQ5U
         6l9a2jaetCicqYTkn7oprDK7FYEP6xnoAMF7okXR89Rm6tXAicB6BmWP9zFDiY+yiu7e
         s0pTbZXvWGmPO09/Qszxm2raVRbkpbrRHUFjp2StfGk77E6vW+DNlUUhpEVuOG9GAr1b
         G5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502628; x=1746107428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgyZJ72DX3yp67fN32Ze8H+XH057rigjNypsDD4758s=;
        b=EG8AE7mwDkRQgbbOXLDHYYylGnCsmm8V6F7QS5uCODQMCJphiVw0Wzcm+FT20y6HGI
         2K4V2/c98BgaDzWGfvNb7e5K8NbHr8Pd7JsJIjBYs9e78MOnbtmVahIHBysCzH3fY68x
         wswF3wIFnKkWtcYUYblyoETmZJ8K/G+N5YBXJrnnGvToPgUndFtSie0E2aMTBjtS+J1s
         s0210qFQIPDCS2dl3ZbGk66MplMs/uz0Igq9qOTTcJz3xdBT//ltG6BReEXlB+Uk/hgq
         HQFVUxVgv2Isu7rdvlkySsYYg9RtVdRwL8yAuF/svCiaQj9juI+lKgDP1o7myeRf8N7N
         rXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMa9cIR1cqDkO9MJCNE03S4e9jexweIRgww1zlAtZHi0lUd+uzqXu01mwUtM2i26JPoHpJEiBuZAfqfjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5GmfFDBJurZFbl6/SSIlIZsJWRaEL8zCwYjITE2wiceggwVjv
	SpkD8cZ/G52F4neIvwujeRAI/qHIsNQ0+P6AZ+L6xBZlu8zaDUhwNq40Q7T7DNg=
X-Gm-Gg: ASbGnctEU3lc3rZJk2ilHPCsMUWpw5rCFsYwGbbQe+dp4EAs1bX2o8FBRzFp99oQKl4
	Z1R0n6gsyFi6VMmoFMsSv9j9wW4XUfLU/QMr87BMJ8LqskVq6299qE2Zj/TBC4dxxtJuRXeycUA
	laKS+Nm3DctsKJyagZhCRGhph5TlfBKeKCvUQt3hH6wfQVUMfK9opvjd9eXuWTrcQ4TKYia56lU
	ey6vMgKPjak8m5NRUoq/oI8zgMlzUxUVzKP4qxeegyOU529COGO+9AwlkbYiVeBkfNYDzv1BGnj
	yqaKraDEc8ZTHsqSCChG0udpvFvSpbhXHFujOZueciAvvHgQMJaS2IINRoCUI2I1WcyKt5r7Wzn
	yMixvm0oFXyCo+h0NxjLYKwhStRMqAlxDZQxRb66zgNmyJazS
X-Google-Smtp-Source: AGHT+IEayxNSek6NnWD36CGnLqPU7ZcYBkZczEzvRoCrUQavSHRaUfHLRclQF8CHozOGsSRTkaF12g==
X-Received: by 2002:a17:903:184:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22db47939aamr34720245ad.1.1745502628056;
        Thu, 24 Apr 2025 06:50:28 -0700 (PDT)
Received: from localhost.localdomain (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f7ec3121sm1200317a12.32.2025.04.24.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:50:27 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
X-Google-Original-From: Chiang Brian <chiang.brian@inventec.corp-partner.google.com>
To: chiang.brian@inventec.com
Cc: corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net
Subject: Re: [PATCH v6] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 24 Apr 2025 21:42:21 +0800
Message-Id: <20250424134221.2012293-1-chiang.brian@inventec.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>
References: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Here is the boot log:
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd040]
[    0.000000] Linux version 5.15.167-yocto-s-dirty-42e6584 (oe-user@oe-host) (aarch64-openbmc-linux-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.42.0.20240216) #1 SMP Thu Apr 24 09:39:16 UTC 2025
[    0.000000] Machine model: CIG Board
[    0.000000] earlycon: uart8250 at MMIO32 0x00000000f0000000 (options '')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] Memory limited to 863MB
[    0.000000] crashkernel reserved: 0x0000000031e00000 - 0x0000000035e00000 (64 MB)
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x0000000035fbffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000035fbffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000035fbffff]
[    0.000000] On node 0, zone Normal: 8256 pages in unavailable ranges
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.4
[    0.000000] percpu: Embedded 28 pages/cpu s74968 r8192 d31528 u114688
[    0.000000] pcpu-alloc: s74968 r8192 d31528 u114688 alloc=28*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: kernel page table isolation disabled by kernel configuration
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 217665
[    0.000000] Kernel command line: earlycon=uart8250,mmio32,0xf0000000 root=/dev/ram console=ttyS0,115200n8 mem=884480k ramdisk_size=48000 oops=panic panic=20 crashkernel=64M
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:on
[    0.000000] mem auto-init: clearing system memory may take some time...
[    0.000000] Memory: 719212K/884480K available (8704K kernel code, 1328K rwdata, 2688K rodata, 768K init, 335K bss, 165268K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] ftrace: allocating 29995 entries in 118 pages
[    0.000000] ftrace: allocated 118 pages with 5 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] arch_timer: cp15 timer(s) running at 250.00MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x7350b89c29, max_idle_ns: 881590431910 ns
[    0.000000] sched_clock: 56 bits at 250MHz, resolution 4ns, wraps every 4398046511102ns
[    0.008608] Calibrating delay loop (skipped), value calculated using timer frequency.. 500.00 BogoMIPS (lpj=1000000)
[    0.019712] pid_max: default: 32768 minimum: 301
[    0.025105] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.032912] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.043221] rcu: Hierarchical SRCU implementation.
[    0.049942] smp: Bringing up secondary CPUs ...
[    0.063084] Detected VIPT I-cache on CPU1
[    0.063147] CPU1: Booted secondary processor 0x0000000001 [0x411fd040]
[    0.071484] Detected VIPT I-cache on CPU2
[    0.071526] CPU2: Booted secondary processor 0x0000000002 [0x411fd040]
[    0.079849] Detected VIPT I-cache on CPU3
[    0.079887] CPU3: Booted secondary processor 0x0000000003 [0x411fd040]
[    0.079965] smp: Brought up 1 node, 4 CPUs
[    0.117589] SMP: Total of 4 processors activated.
[    0.122549] CPU features: detected: 32-bit EL0 Support
[    0.127965] CPU features: detected: CRC32 instructions
[    0.133503] CPU: All CPU(s) started at EL1
[    0.137840] alternatives: patching kernel code
[    0.143557] devtmpfs: initialized
[    0.163688] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.173992] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.181543] pinctrl core: initialized pinctrl subsystem
[    0.188228] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.195066] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.202958] thermal_sys: Registered thermal governor 'step_wise'
[    0.203507] ASID allocator initialised with 65536 entries
[    0.217254] pstore: Registered ramoops as persistent store backend
[    0.223788] ramoops: using 0x2040000@0x35fc0000, ecc: 0
[    0.274562] npcm8xx Pinctrl driver probed
[    0.296740] cryptd: max_cpu_qlen set to 1000
[    0.315908] SCSI subsystem initialized
[    0.320139] usbcore: registered new interface driver usbfs
[    0.325967] usbcore: registered new interface driver hub
[    0.331620] usbcore: registered new device driver usb
[    0.337102] EDAC MC: Ver: 3.0.0
[    0.340516] EDAC DEBUG: edac_mc_sysfs_init: device mc created
[    0.341507] mctp: management component transport protocol core
[    0.347661] NET: Registered PF_MCTP protocol family
[    0.353164] clocksource: Switched to clocksource arch_sys_counter
[    0.381535] NET: Registered PF_INET protocol family
[    0.386835] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.395690] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
[    0.404519] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.412693] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.420939] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.428681] TCP: Hash tables configured (established 8192 bind 8192)
[    0.435471] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.442478] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.450081] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.456339] Trying to unpack rootfs image as initramfs...
[    0.970889] Freeing initrd memory: 1176K
[    1.070050] workingset: timestamp_bits=46 max_order=18 bucket_order=0
[    1.082537] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.088706] ntfs: driver 2.1.32 [Flags: R/O].
[    1.093597] jffs2: version 2.2. (NAND) © 2001-2006 Red Hat, Inc.
[    1.100416] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
[    1.106018] NET: Registered PF_ALG protocol family
[    1.118164] npcm-kcs-bmc f0007000.kcs1: Initialised IPMI client for channel 1
[    1.125786] nuvoton-kcs-bmc: channel=1 idr=0x10 odr=0xe str=0xc
[    1.132260] npcm-kcs-bmc f0007000.kcs2: Initialised IPMI client for channel 2
[    1.139796] nuvoton-kcs-bmc: channel=2 idr=0x22 odr=0x20 str=0x1e
[    1.146447] npcm-kcs-bmc f0007000.kcs3: Initialised IPMI client for channel 3
[    1.153979] nuvoton-kcs-bmc: channel=3 idr=0x34 odr=0x32 str=0x30
[    1.161419] Serial: 8250/16550 driver, 6 ports, IRQ sharing disabled
[    1.169910] printk: console [ttyS0] disabled
[    1.174503] f0000000.serial: ttyS0 at MMIO 0xf0000000 (irq = 22, base_baud = 1500000) is a Nuvoton 16550
[    1.184537] printk: console [ttyS0] enabled
[    1.193120] printk: bootconsole [uart8250] disabled
[    1.203628] f0001000.serial: ttyS1 at MMIO 0xf0001000 (irq = 23, base_baud = 1500000) is a Nuvoton 16550
[    1.213589] f0002000.serial: ttyS2 at MMIO 0xf0002000 (irq = 24, base_baud = 1500000) is a Nuvoton 16550
[    1.223557] f0003000.serial: ttyS3 at MMIO 0xf0003000 (irq = 25, base_baud = 1500000) is a Nuvoton 16550
[    1.233683] f0004000.serial: ttyS4 at MMIO 0xf0004000 (irq = 26, base_baud = 1500000) is a Nuvoton 16550
[    1.244557] NPCMx50: OTP (FUZE) module is ready
[    1.250747] brd: module loaded
[    1.257868] loop: module loaded
[    1.271690] NPCM BIOS Post Code probe
[    1.276018] NPCM7xx PCI Mailbox probed
[    1.280224] jtag-master f0208000.jtm: npcm_jtm_probe
[    1.285571] jtag-master f0209000.jtm: npcm_jtm_probe
[    1.291826] spi-nor spi0.0: dauntlessd2-1024 (65536 Kbytes)
[    1.297428] NPCM-FIU fb000000.spi: Reserved memory not defined, direct read disabled
[    1.305173] NPCM-FIU fb000000.spi: Reserved memory not defined, direct read disabled
[    1.316664] 8 fixed-partitions partitions found on MTD device bmc
[    1.322784] Creating 8 MTD partitions on "bmc":
[    1.327321] 0x000000000000-0x000000150000 : "u-boot"
[    1.333340] 0x000000150000-0x000000160000 : "image-descriptor"
[    1.340018] 0x000000160000-0x000000850000 : "kernel"
[    1.345890] 0x000000850000-0x000003970000 : "rofs"
[    1.351586] 0x000003bf0000-0x000003cf0000 : "hoth-secondary"
[    1.358055] 0x000003bf0000-0x000003cf0000 : "hoth-update"
[    1.364347] 0x000003cf0000-0x000003ff0000 : "rwfs"
[    1.370040] 0x000003ff0000-0x000004000000 : "hoth-mailbox"
[    1.377360] spi-nor spi1.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff
[    1.384247] spi-nor: probe of spi1.0 failed with error -2
[    1.392411] stmmaceth f0804000.eth: IRQ eth_wake_irq not found
[    1.398277] stmmaceth f0804000.eth: IRQ eth_lpi not found
[    1.403776] stmmaceth f0804000.eth: PTP uses main clock
[    1.409227] stmmaceth f0804000.eth: User ID: 0x10, Synopsys ID: 0x37
[    1.415597] stmmaceth f0804000.eth: 	DWMAC1000
[    1.420045] stmmaceth f0804000.eth: DMA HW capability register supported
[    1.426744] stmmaceth f0804000.eth: RX Checksum Offload Engine supported
[    1.433444] stmmaceth f0804000.eth: COE Type 2
[    1.437890] stmmaceth f0804000.eth: TX Checksum insertion supported
[    1.444154] stmmaceth f0804000.eth: Wake-Up On Lan supported
[    1.449888] stmmaceth f0804000.eth: Normal descriptors
[    1.455030] stmmaceth f0804000.eth: Ring mode enabled
[    1.460081] stmmaceth f0804000.eth: Enable RX Mitigation via HW Watchdog Timer
[    1.467300] stmmaceth f0804000.eth: device MAC address 00:00:f7:a0:00:fc
[    1.485181] Broadcom BCM54612E stmmac-0:01: attached PHY driver (mii_bus:phy_addr=stmmac-0:01, irq=POLL)
[    1.496018] stmmaceth f0806000.eth: IRQ eth_wake_irq not found
[    1.501867] stmmaceth f0806000.eth: IRQ eth_lpi not found
[    1.507397] stmmaceth f0806000.eth: PTP uses main clock
[    1.512841] stmmaceth f0806000.eth: User ID: 0x10, Synopsys ID: 0x37
[    1.519208] stmmaceth f0806000.eth: 	DWMAC1000
[    1.523665] stmmaceth f0806000.eth: DMA HW capability register supported
[    1.530367] stmmaceth f0806000.eth: RX Checksum Offload Engine supported
[    1.537066] stmmaceth f0806000.eth: COE Type 2
[    1.541512] stmmaceth f0806000.eth: TX Checksum insertion supported
[    1.547777] stmmaceth f0806000.eth: Wake-Up On Lan supported
[    1.553491] stmmaceth f0806000.eth: Normal descriptors
[    1.558631] stmmaceth f0806000.eth: Ring mode enabled
[    1.563684] stmmaceth f0806000.eth: Enable RX Mitigation via HW Watchdog Timer
[    1.570918] stmmaceth f0806000.eth: device MAC address e6:47:71:24:b3:ad
[    1.578797] MCTP I2C interface driver
[    1.582495] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.589031] ehci-pci: EHCI PCI platform driver
[    1.593520] npcm7xx-ehci: EHCI npcm7xx driver
[    1.597998] npcm7xx-ehci f0828100.usb: EHCI Host Controller
[    1.603590] npcm7xx-ehci f0828100.usb: new USB bus registered, assigned bus number 1
[    1.611459] npcm7xx-ehci f0828100.usb: irq 14, io mem 0xf0828100
[    1.633177] npcm7xx-ehci f0828100.usb: USB 2.0 started, EHCI 1.00
[    1.639545] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.15
[    1.647818] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.655041] usb usb1: Product: EHCI Host Controller
[    1.659921] usb usb1: Manufacturer: Linux 5.15.167-yocto-s-dirty-42e6584 ehci_hcd
[    1.667401] usb usb1: SerialNumber: f0828100.usb
[    1.672529] hub 1-0:1.0: USB hub found
[    1.676329] hub 1-0:1.0: 1 port detected
[    1.680737] npcm7xx-ehci f082a100.usb: EHCI Host Controller
[    1.686329] npcm7xx-ehci f082a100.usb: new USB bus registered, assigned bus number 2
[    1.694182] npcm7xx-ehci f082a100.usb: irq 15, io mem 0xf082a100
[    1.713172] npcm7xx-ehci f082a100.usb: USB 2.0 started, EHCI 1.00
[    1.719517] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.15
[    1.727789] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.735011] usb usb2: Product: EHCI Host Controller
[    1.739892] usb usb2: Manufacturer: Linux 5.15.167-yocto-s-dirty-42e6584 ehci_hcd
[    1.747371] usb usb2: SerialNumber: f082a100.usb
[    1.752505] hub 2-0:1.0: USB hub found
[    1.756301] hub 2-0:1.0: 1 port detected
[    1.760819] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.767019] ohci-pci: OHCI PCI platform driver
[    1.771511] ohci-npcm7xx: OHCI NPCM7XX driver
[    1.776138] usbcore: registered new interface driver cdc_acm
[    1.781806] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    1.789873] usbcore: registered new interface driver usb-storage
[    1.800176] i2c_dev: i2c /dev entries driver
[    1.807640] at24 4-0050: supply vcc not found, using dummy regulator
[    1.814441] at24 4-0050: 128 byte 24c01 EEPROM, writable, 8 bytes/write
[    1.825101] rtc-ds1307 5-0068: registered as rtc0
[    1.830831] rtc-ds1307 5-0068: setting system clock to 2000-06-13T06:31:41 UTC (960877901)
[    1.839551] rtc-pcf85063 5-0051: RTC chip is not present
[    1.845118] at24 5-0050: supply vcc not found, using dummy regulator
[    1.852272] at24 5-0050: 8192 byte 24c64 EEPROM, writable, 32 bytes/write
[    1.859838] at24 6-0050: supply vcc not found, using dummy regulator
[    1.866651] at24 6-0050: 8192 byte 24c64 EEPROM, writable, 32 bytes/write
[    1.874471] pca953x 7-0024: supply vcc not found, using dummy regulator
[    1.881255] pca953x 7-0024: using no AI
[    1.885195] pca953x 7-0024: failed writing register
[    1.890382] pca953x 7-0020: supply vcc not found, using dummy regulator
[    1.897099] pca953x 7-0020: using no AI
[    1.901031] pca953x 7-0020: failed writing register
[    1.906283] pca953x 7-0021: supply vcc not found, using dummy regulator
[    1.909493] random: crng init done
[    1.913013] pca953x 7-0021: using no AI
[    1.920240] pca953x 7-0021: failed writing register
[    1.925596] pca953x 7-0022: supply vcc not found, using dummy regulator
[    1.932324] pca953x 7-0022: using no AI
[    1.933177] usb 1-1: new high-speed USB device number 2 using npcm7xx-ehci
[    1.943090] pca953x 7-0022: failed writing register
[    1.948380] pca953x 7-0023: supply vcc not found, using dummy regulator
[    1.955104] pca953x 7-0023: using no AI
[    1.959042] pca953x 7-0023: failed writing register
[    1.964214] pca953x 7-0025: supply vcc not found, using dummy regulator
[    1.970934] pca953x 7-0025: using no AI
[    1.974865] pca953x 7-0025: failed writing register
[    1.980053] at24 7-0052: supply vcc not found, using dummy regulator
[    2.016946] nuvoton-i2c f0088000.i2c: i2c8 register slave SA=0x10, PEC=0
[    2.024455] at24 8-0053: supply vcc not found, using dummy regulator
[    2.031207] at24 8-0053: 256 byte 24c02 EEPROM, writable, 8 bytes/write
[    2.045300] i2c i2c-4: Added multiplexed i2c bus 50
[    2.050403] i2c i2c-4: Added multiplexed i2c bus 51
[    2.055508] i2c i2c-4: Added multiplexed i2c bus 52
[    2.060749] i2c i2c-4: Added multiplexed i2c bus 53
[    2.065642] pca954x 4-0070: registered 4 multiplexed busses for I2C switch pca9546
[    2.073668] i2c i2c-6: Added multiplexed i2c bus 54
[    2.078759] i2c i2c-6: Added multiplexed i2c bus 55
[    2.083848] i2c i2c-6: Added multiplexed i2c bus 56
[    2.088930] i2c i2c-6: Added multiplexed i2c bus 57
[    2.093822] pca954x 6-0070: registered 4 multiplexed busses for I2C switch pca9546
[    2.097504] usb 1-1: New USB device found, idVendor=0424, idProduct=2514, bcdDevice= b.b3
[    2.109574] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.116751] pca954x 6-0075: probe failed
[    2.117286] hub 1-1:1.0: USB hub found
[    2.121631] silvaco-i3c-master fff10000.i3c: fclk=100000000, period_ns=10
[    2.127755] hub 1-1:1.0: 4 ports detected
[    2.131205] silvaco-i3c-master fff10000.i3c: i3c scl_rate=3846153
[    2.131214] silvaco-i3c-master fff10000.i3c: i2c scl_rate=384615
[    2.147304] silvaco-i3c-master fff10000.i3c: pp_high=130, pp_low=130
[    2.153658] silvaco-i3c-master fff10000.i3c: od_high=520, od_low=520
[    2.160014] silvaco-i3c-master fff10000.i3c: mconfig=0x3c030c31
[    2.166798] silvaco-i3c-master fff11000.i3c: fclk=100000000, period_ns=10
[    2.173604] silvaco-i3c-master fff11000.i3c: i3c scl_rate=3846153
[    2.179701] silvaco-i3c-master fff11000.i3c: i2c scl_rate=384615
[    2.185708] silvaco-i3c-master fff11000.i3c: pp_high=130, pp_low=130
[    2.192064] silvaco-i3c-master fff11000.i3c: od_high=520, od_low=520
[    2.198419] silvaco-i3c-master fff11000.i3c: mconfig=0x3c030c31
[    2.206721] silvaco-i3c-master fff12000.i3c: fclk=100000000, period_ns=10
[    2.213533] silvaco-i3c-master fff12000.i3c: i3c scl_rate=3846153
[    2.219630] silvaco-i3c-master fff12000.i3c: i2c scl_rate=384615
[    2.225639] silvaco-i3c-master fff12000.i3c: pp_high=130, pp_low=130
[    2.231994] silvaco-i3c-master fff12000.i3c: od_high=520, od_low=520
[    2.238351] silvaco-i3c-master fff12000.i3c: mconfig=0x3c030c31
[    2.246560] silvaco-i3c-master fff13000.i3c: fclk=100000000, period_ns=10
[    2.253375] silvaco-i3c-master fff13000.i3c: i3c scl_rate=3846153
[    2.259472] silvaco-i3c-master fff13000.i3c: i2c scl_rate=384615
[    2.265478] silvaco-i3c-master fff13000.i3c: pp_high=130, pp_low=130
[    2.271834] silvaco-i3c-master fff13000.i3c: od_high=520, od_low=520
[    2.278190] silvaco-i3c-master fff13000.i3c: mconfig=0x3c030c31
[    2.304059] npcm_thermal f0188000.tmps: Overheat interrupt not available
[    2.310787] npcm_thermal_probe Done
[    2.314872] npcm-wdt f000901c.watchdog: NPCM watchdog driver enabled
[    2.321637] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: dm-devel@redhat.com
[    2.330522] EDAC DEBUG: edac_mc_alloc: allocating 2040 bytes for mci data (1 dimms, 1 csrows/channels)
[    2.330598] EDAC DEBUG: edac_mc_add_mc_with_groups: 
[    2.330653] EDAC DEBUG: edac_create_sysfs_mci_device: device mc0 created
[    2.330709] EDAC MC0: Giving out device to module npcm-edac controller npcm_ddr_controller: DEV f0824000.memory-controller (INTERRUPT)
[    2.342988] sdhci: Secure Digital Host Controller Interface driver
[    2.349172] sdhci: Copyright(c) Pierre Ossman
[    2.395120] mmc0: SDHCI controller on f0842000.sdhci [f0842000.sdhci] using ADMA
[    2.402784] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.409829] usbcore: registered new interface driver usbhid
[    2.415425] usbhid: USB HID core driver
[    2.424545] NPCM ADC driver probed
[    2.428401] optee: probing for conduit method.
[    2.432875] optee: revision 4.1 (18b424c2)
[    2.448997] optee: dynamic shared memory is enabled
[    2.458224] optee: initialized driver
[    2.463201] NET: Registered PF_INET6 protocol family
[    2.469279] Segment Routing with IPv6
[    2.472960] In-situ OAM (IOAM) with IPv6
[    2.477007] NET: Registered PF_PACKET protocol family
[    2.482112] Bridge firewalling registered
[    2.486129] 8021q: 802.1Q VLAN Support v1.8
[    2.490993] pstore: Using crash dump compression: zstd
[    2.500450] clk: Disabling unused clocks
[    2.507799] Freeing unused kernel memory: 768K
[    2.512354] Run /init as init process
[    2.516036]   with arguments:
[    2.516045]     /init
[    2.516051]   with environment:
[    2.516057]     HOME=/
[    2.516062]     TERM=linux
[    2.799660] mmc0: new high speed MMC card at address 0001
[    2.806000] mmcblk0: mmc0:0001 AJTD4R 14.6 GiB 
[    2.812023] mmcblk0boot0: mmc0:0001 AJTD4R 4.00 MiB 
[    2.817644] mmcblk0boot1: mmc0:0001 AJTD4R 4.00 MiB 
[    2.823094] mmcblk0rpmb: mmc0:0001 AJTD4R 4.00 MiB, chardev (246:0)
[    2.922797] jffs2: notice: (220) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
[    3.097282] jffs2: notice: (231) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
[    3.522523] jffs2: notice: (268) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
[    6.637574] jffs2: notice: (314) jffs2_build_xattr_subsystem: complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orphan) found.
[    6.793517] overlayfs: upper fs does not support tmpfile.
[    6.814513] overlayfs: upper fs does not support RENAME_WHITEOUT.
[   14.788554] systemd[1]: System time before build time, advancing clock.
[   15.145288] systemd[1]: systemd 256.7 running in system mode (+PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS -OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC -KMOD -LIBCRYPTSETUP -LIBCRYPTSETUP_PLUGINS +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP -SYSVINIT -LIBARCHIVE)
[   15.178537] systemd[1]: Detected architecture arm64.
[   15.290812] systemd[1]: Hostname set to <>.
[   15.377422] systemd[1]: Initializing machine ID from random generator.
[   15.522255] systemd[1]: Using hardware watchdog 'npcm_wdt', version 0, device /dev/watchdog0
[   15.530736] systemd[1]: Watchdog running with a hardware timeout of 2min 52s.
[   15.537906] systemd[1]: Watchdog: reading from /sys/dev/char/249:0/pretimeout_governor
[   15.545968] systemd[1]: Watchdog running with a pretimeout of 30s with governor 'panic'.
[   15.554079] systemd[1]: Watchdog: setting pretimeout_governor to 'panic' via '/sys/dev/char/249:0/pretimeout_governor'
[   15.907935] systemd-ssh-generator[340]: Binding SSH to AF_UNIX socket /run/ssh-unix-local/socket.
[   15.916846] systemd-ssh-generator[340]: → connect via 'ssh .host' locally
[   16.976785] systemd[1]: /usr/lib/systemd/system/gbmc-ncsi-dhcrelay.service:6: Unknown key 'LogRateLimitIntervalSec' in section [Unit], ignoring.
[   16.989808] systemd[1]: /usr/lib/systemd/system/gbmc-ncsi-dhcrelay.service:7: Unknown key 'LogRateLimitBurst' in section [Unit], ignoring.
[   17.070296] systemd[1]: /etc/systemd/system/earlyoom.service:41: Invalid address prefix is specified in [Service] IPAddressDeny=, ignoring assignment: true
[   17.180538] systemd[1]: /usr/lib/systemd/system/phosphor-ipmi-net@.socket:6: Invalid interface name, ignoring: sys-subsystem-net-devices-%i.device
[   17.273954] systemd[1]: Queued start job for default target Multi-User System.
[   17.296302] systemd[1]: Created slice Slice /system/gbmc-br-dhcp.
[   17.320196] systemd[1]: Created slice Slice /system/getty.
[   17.344320] systemd[1]: Created slice Slice /system/hostlogger.
[   17.368276] systemd[1]: Created slice Slice /system/mapper-wait.
[   17.392149] systemd[1]: Created slice Slice /system/modprobe.
[   17.416047] systemd[1]: Created slice Slice /system/ncsid.
[   17.440031] systemd[1]: Created slice Slice /system/obmc-console.
[   17.464107] systemd[1]: Created slice Slice /system/obmc-led-group-start.
[   17.492381] systemd[1]: Created slice Slice /system/phosphor-certificate-manager.
[   17.520131] systemd[1]: Created slice Slice /system/phosphor-ipmi-kcs.
[   17.548118] systemd[1]: Created slice Slice /system/phosphor-ipmi-net.
[   17.576080] systemd[1]: Created slice Slice /system/phosphor-watchdog.
[   17.604106] systemd[1]: Created slice Slice /system/serial-getty.
[   17.628059] systemd[1]: Created slice Slice /system/xyz.openbmc_project.Chassis.Control.Power.
[   17.656079] systemd[1]: Created slice Slice /system/xyz.openbmc_project.State.Boot.PostCode.
[   17.681689] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[   17.709560] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[   17.733366] systemd[1]: Expecting device /sys/subsystem/net/devices/eth1...
[   17.757304] systemd[1]: Reached target Firmware Update Preconditions.
[   17.781321] systemd[1]: Reached target Firmware Updates and Configuration.
[   17.805443] systemd[1]: Reached target MCTP local network configuration.
[   17.829504] systemd[1]: Reached target Path Units.
[   17.849346] systemd[1]: Reached target Remote File Systems.
[   17.869309] systemd[1]: Reached target Slice Units.
[   17.889371] systemd[1]: Reached target Swaps.
[   17.910153] systemd[1]: Listening on Syslog Socket.
[   17.938887] systemd[1]: Listening on Process Core Dump Socket.
[   17.967501] systemd[1]: Listening on Credential Encryption/Decryption.
[   18.819284] systemd[1]: Journal Audit Socket was skipped because of an unmet condition check (ConditionSecurity=audit).
[   18.830798] systemd[1]: Listening on Journal Socket (/dev/log).
[   18.853909] systemd[1]: Listening on Journal Sockets.
[   18.873825] systemd[1]: Listening on DDI File System Mounter Socket.
[   18.898045] systemd[1]: Listening on Network Service Netlink Socket.
[   18.921698] systemd[1]: Listening on Namespace Resource Manager Socket.
[   18.945839] systemd[1]: Listening on udev Control Socket.
[   18.965669] systemd[1]: Listening on udev Kernel Socket.
[   18.985933] systemd[1]: Huge Pages File System was skipped because of an unmet condition check (ConditionPathExists=/sys/kernel/mm/hugepages).
[   19.047148] systemd[1]: Mounting POSIX Message Queue File System...
[   19.073357] systemd[1]: Mounting Kernel Debug File System...
[   19.097377] systemd[1]: Mounting Kernel Trace File System...
[   19.124639] systemd[1]: Mounting Temporary Directory /tmp...
[   19.154283] systemd[1]: Starting Load Kernel Module configfs...
[   19.183745] systemd[1]: Starting Load Kernel Module fuse...
[   19.206979] systemd[1]: File System Check on Root Device was skipped because of an unmet condition check (ConditionPathIsReadWrite=!/).
[   19.221109] systemd[1]: systemd-journald.service: unit configures an IP firewall, but the local system does not support BPF/cgroup firewalling.
[   19.234045] systemd[1]: systemd-journald.service: (This warning is only shown for the first unit using IP firewalling.)
[   19.249106] systemd[1]: Starting Journal Service...
[   19.274375] systemd[1]: Starting Generate network units from Kernel command line...
[   19.306633] systemd[1]: Starting Remount Root and Kernel File Systems...
[   19.338893] systemd[1]: Starting Apply Kernel Variables...
[   19.374305] systemd[1]: Starting Wait Until Kernel Time Synchronized...
[   19.406516] systemd[1]: Starting Create Static Device Nodes in /dev gracefully...
[   19.446876] systemd[1]: Starting Load udev Rules from Credentials...
[   19.478954] systemd[1]: Starting Coldplug All udev Devices...
[   19.522334] systemd[1]: Mounted POSIX Message Queue File System.
[   19.546286] systemd[1]: Mounted Kernel Debug File System.
[   19.574137] systemd[1]: Mounted Kernel Trace File System.
[   19.599232] systemd[1]: Mounted Temporary Directory /tmp.
[   19.622961] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[   19.630986] systemd[1]: Finished Load Kernel Module configfs.
[   19.654904] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[   19.662537] systemd[1]: Finished Load Kernel Module fuse.
[   19.679870] systemd-journald[350]: Collecting audit messages is disabled.
[   19.689057] systemd[1]: Finished Generate network units from Kernel command line.
[   19.719163] systemd[1]: Finished Remount Root and Kernel File Systems.
[   19.749658] systemd[1]: Finished Apply Kernel Variables.
[   19.775387] systemd[1]: FUSE Control File System was skipped because of an unmet condition check (ConditionPathExists=/sys/fs/fuse/connections).
[   19.805866] systemd[1]: Mounting Kernel Configuration File System...
[   19.929057] systemd[1]: Starting Rebuild Hardware Database...
[   19.954052] systemd[1]: Started Journal Service.
[   20.160087] systemd-journald[350]: Received client request to flush runtime journal.
[  101.328277] spi-nor spi1.0: mx66l51235f (65536 Kbytes)
[  101.333498] NPCM-FIU c0000000.spi: Reserved memory not defined, direct read disabled
[  101.341284] NPCM-FIU c0000000.spi: Reserved memory not defined, direct read disabled
[  105.467744] stmmaceth f0804000.eth eth0: PHY [stmmac-0:01] driver [Broadcom BCM54612E] (irq=POLL)
[  105.476908] stmmaceth f0804000.eth eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[  105.484768] stmmaceth f0804000.eth eth0: No Safety Features support found
[  105.501690] stmmaceth f0804000.eth eth0: IEEE 1588-2002 Timestamp supported
[  105.511504] stmmaceth f0804000.eth eth0: configuring for phy/rgmii-id link mode
[  105.527446] stmmaceth f0806000.eth eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
[  105.546200] stmmaceth f0806000.eth eth1: No Safety Features support found
[  105.563100] stmmaceth f0806000.eth eth1: IEEE 1588-2002 Timestamp supported
[  105.610354] stmmaceth f0806000.eth eth1: configuring for fixed/rmii link mode
[  105.619019] stmmaceth f0806000.eth eth1: Link is Up - 100Mbps/Full - flow control off
[  105.619626] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[  105.650734] gbmcbr: port 1(gbmcbrdummy) entered blocking state
[  105.657037] gbmcbr: port 1(gbmcbrdummy) entered disabled state
[  105.663470] device gbmcbrdummy entered promiscuous mode
[  105.702007] gbmcbr: port 2(gbmcbrncsidhcp) entered blocking state
[  105.708709] gbmcbr: port 2(gbmcbrncsidhcp) entered disabled state
[  105.716385] device gbmcbrncsidhcp entered promiscuous mode
[  105.857367] gbmcbr: port 1(gbmcbrdummy) entered blocking state
[  105.863241] gbmcbr: port 1(gbmcbrdummy) entered forwarding state
[  105.869585] IPv6: ADDRCONF(NETDEV_CHANGE): gbmcbr: link becomes ready
[  105.904233] IPv6: ADDRCONF(NETDEV_CHANGE): gbmcbrncsidhcp: link becomes ready
[  105.911647] gbmcbr: port 2(gbmcbrncsidhcp) entered blocking state
[  105.917818] gbmcbr: port 2(gbmcbrncsidhcp) entered forwarding state
[  105.924434] IPv6: ADDRCONF(NETDEV_CHANGE): gbmcncsidhcp: link becomes ready
[  106.186370] device eth1 entered promiscuous mode
[  106.385695] Deleting MTD partitions on "bios":
[  109.719287] stmmaceth f0804000.eth eth0: Link is Up - 1Gbps/Full - flow control off
[  109.719309] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  114.741084] i2c i2c-52: new_device: Instantiated device q50sn12072 at 0x65
[  114.744278] i2c i2c-57: new_device: Instantiated device max31790 at 0x2f
[  114.760706] i2c i2c-6: new_device: Instantiated device q50sn12072 at 0x60
[  114.937470] i2c i2c-6: Added multiplexed i2c bus 58
[  114.937950] i2c i2c-6: Added multiplexed i2c bus 59
[  114.938321] i2c i2c-6: Added multiplexed i2c bus 60
[  114.938639] i2c i2c-6: Added multiplexed i2c bus 61
[  114.938659] pca954x 6-0075: registered 4 multiplexed busses for I2C switch pca9546
[  116.003953] using random self ethernet address
[  116.003972] using random host ethernet address
[  116.018754] usb0: HOST MAC fe:bd:17:28:df:13
[  116.018786] usb0: MAC a6:35:f8:eb:09:62
[  116.018830] npcm-udc: bind to driver configfs-gadget
[  116.034209] configfs-gadget gadget gusbem0: renamed from usb0
[  116.120858] gbmcbr: port 3(gusbem0) entered blocking state
[  116.120892] gbmcbr: port 3(gusbem0) entered disabled state
[  116.121315] device gusbem0 entered promiscuous mode
[  116.822193] lm75 6-005d: supply vs not found, using dummy regulator
[  116.826572] hwmon hwmon7: temp1_input not attached to any thermal zone
[  116.826609] lm75 6-005d: hwmon7: sensor 'max31725'
[  116.826706] i2c i2c-6: new_device: Instantiated device max31725 at 0x5d
[  116.828003] lm75 50-0054: supply vs not found, using dummy regulator
[  116.833729] hwmon hwmon8: temp1_input not attached to any thermal zone
[  116.833763] lm75 50-0054: hwmon8: sensor 'max31725'
[  116.833860] i2c i2c-50: new_device: Instantiated device max31725 at 0x54
[  116.836699] lm75 51-0055: supply vs not found, using dummy regulator
[  116.838007] hwmon hwmon9: temp1_input not attached to any thermal zone
[  116.838038] lm75 51-0055: hwmon9: sensor 'max31725'
[  116.838147] i2c i2c-51: new_device: Instantiated device max31725 at 0x55
[  117.975811] i2c i2c-6: delete_device: Deleting device q50sn12072 at 0x60
[  117.998683] i2c i2c-6: new_device: Instantiated device q50sn12072 at 0x60
[  118.366798] i2c i2c-5: new_device: Instantiated device adm1266 at 0x42
[  118.368059] i2c i2c-52: delete_device: Deleting device q50sn12072 at 0x65
[  118.386026] i2c i2c-52: new_device: Instantiated device q50sn12072 at 0x65
[  118.387166] i2c i2c-56: new_device: Instantiated device tps53685 at 0x74
[  118.387444] i2c i2c-56: delete_device: Deleting device tps53685 at 0x74
[  118.388540] i2c i2c-54: new_device: Instantiated device tps53685 at 0x76
[  118.388780] i2c i2c-54: delete_device: Deleting device tps53685 at 0x76
[  118.390007] i2c i2c-55: new_device: Instantiated device tps53685 at 0x72
[  118.390283] i2c i2c-55: delete_device: Deleting device tps53685 at 0x72
[  118.771235] i2c i2c-56: new_device: Instantiated device tps53685 at 0x74
[  118.771530] i2c i2c-56: delete_device: Deleting device tps53685 at 0x74
[  118.772819] i2c i2c-54: new_device: Instantiated device tps53685 at 0x76
[  118.773096] i2c i2c-54: delete_device: Deleting device tps53685 at 0x76
[  118.774982] i2c i2c-55: new_device: Instantiated device tps53685 at 0x72
[  118.775355] i2c i2c-55: delete_device: Deleting device tps53685 at 0x72
[  118.876305] i2c i2c-56: new_device: Instantiated device tps53685 at 0x74
[  118.876606] i2c i2c-56: delete_device: Deleting device tps53685 at 0x74
[  118.878229] i2c i2c-54: new_device: Instantiated device tps53685 at 0x76
[  118.878535] i2c i2c-54: delete_device: Deleting device tps53685 at 0x76
[  118.879826] i2c i2c-55: new_device: Instantiated device tps53685 at 0x72
[  118.880225] i2c i2c-55: delete_device: Deleting device tps53685 at 0x72
[  231.873217] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: (null). Quota mode: disabled.
[  232.544299] systemd-journald[350]: Received client request to flush runtime journal.
[  448.921441] IPv6: ADDRCONF(NETDEV_CHANGE): gusbem0: link becomes ready
[  448.921651] gbmcbr: port 3(gusbem0) entered blocking state
[  448.921671] gbmcbr: port 3(gusbem0) entered forwarding state
[  471.932939] silvaco-i3c-master fff10000.i3c: fclk=100000000, period_ns=10
[  471.932967] silvaco-i3c-master fff10000.i3c: i3c scl_rate=3846153
[  471.932977] silvaco-i3c-master fff10000.i3c: i2c scl_rate=384615
[  471.932985] silvaco-i3c-master fff10000.i3c: pp_high=130, pp_low=130
[  471.932995] silvaco-i3c-master fff10000.i3c: od_high=520, od_low=520
[  471.933005] silvaco-i3c-master fff10000.i3c: mconfig=0x3c030c31
[  471.942884] hwmon hwmon11: temp1_input not attached to any thermal zone
[  471.943095] sbtsi_i3c 0-22400000001: register apml_tsi0 device
[  471.943841] I3C SBRMI_REV command returned value: 32
[  471.968567] sbrmi_i3c 0-22400000002: register apml_rmi0 device
[  472.055177] i2c i2c-56: new_device: Instantiated device tps53685 at 0x74
[  472.055412] i2c i2c-56: delete_device: Deleting device tps53685 at 0x74
[  472.056497] i2c i2c-54: new_device: Instantiated device tps53685 at 0x76
[  472.056764] i2c i2c-54: delete_device: Deleting device tps53685 at 0x76
[  472.058110] i2c i2c-55: new_device: Instantiated device tps53685 at 0x72
[  472.058397] i2c i2c-55: delete_device: Deleting device tps53685 at 0x72
[  475.001946] gbmcbr: port 3(gusbem0) entered disabled state
[  488.004114] i2c i2c-56: new_device: Instantiated device tps53685 at 0x74
[  488.004424] i2c i2c-56: delete_device: Deleting device tps53685 at 0x74
[  488.016698] i2c i2c-54: new_device: Instantiated device tps53685 at 0x76
[  488.017029] i2c i2c-54: delete_device: Deleting device tps53685 at 0x76
[  488.024280] i2c i2c-55: new_device: Instantiated device tps53685 at 0x72
[  488.024671] i2c i2c-55: delete_device: Deleting device tps53685 at 0x72
[  563.677058] gbmcbr: port 3(gusbem0) entered blocking state
[  563.677081] gbmcbr: port 3(gusbem0) entered forwarding state

Best Regards,
Brian Chiang
