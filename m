Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F77C1C8603
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759142; cv=none; b=Yph96oSTfWToEpEC2hrhJweqURTxNzuQ8GS7Li5THbRmzJik1JXDlEZ8cIKqhWZPvVxrxkh9Q4za8qoVRylPgdNfKjACGv3SCXfufRuwPNiEMVDCrrOD7FAeM0A47x/9s2ujRKPR6I+38H2G8r+lb5BVPHBDFU2gHuZ6SLnInRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759142; c=relaxed/simple;
	bh=HdEjj9xtdOApLsV/QK9Ste8+XgzKqOObgdIxVyMFgXQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=SMhpBUTuh7tVlQJ9OyTn5ENTv95N6mAZYJxW5yuqZWmeQVlszkJM+/gg5u9sM1452AvPJWOrXRj8DAZE6uvNvNXpUL6XB9z5kONGSMmMNpcgpzJoLUrfdGctWlqlXAhz26gETmpjRI3AS7JejgyrgI5oaqTFSWjqc8lxWKg81pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=jGHrdBed; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="jGHrdBed"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-40337dd3847so4070654b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747759137; x=1748363937; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSpAqqvzCWxf5m3DjPx8fysiezIB4ytmZ9AUAzuI5Hk=;
        b=jGHrdBedE4TOUvrpc4cmEhDxl34U+LWO6Kwek1j8/4W5AsJVJN/jUG0N3LJhNsheZh
         ScpmToXitcfh3GtV9lDVDZsbZXQpn4CrEhdrDZbWV60udZgH+jT4MRisQISvt5cuCZbT
         hk6yd28b54PbHv8mEaXpE6WdplteZNbVR55mQBupYc0bSnjg6rzMFhDrbOMnQ2U3rMQW
         xXziMqg1jyKYv0boYINaWW393XR5Nki5TNHWcoIZ8hESYHeLlD2Y7gaJf3oEFqTkrKYC
         Wpe39MagIJe+mVtx1V7TwiEUgE0MV5OG+HRTWc9Az0zSY0At8XLFbGbtHC+FyM5AvN84
         xXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759137; x=1748363937;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LSpAqqvzCWxf5m3DjPx8fysiezIB4ytmZ9AUAzuI5Hk=;
        b=tDZrdm7Ozn7oyjamV61p/HRfLyJ3gnpajNn0RXzG+YxlPhg5zg3DyufDHR49StyFmq
         0KXNz+4P7ac3z+6oeEQy5Ew0L1ZlTcS9gMRz0sz1wsbBwf4GzlDvxjzz0aC160Fqa/mA
         plGI+zXz9e6izOjh0BGOHoPVLiK1OwKlMZnhkfQx5glrZq3BYamyRUmb3fb2ssd3mEXb
         ekYGogJ8ttnr4rOPw74+has8d0i9X1LZSie+XKQ+vNWlwI9RJ5CvKS8N9iS50gbeGPwM
         FH3f7WwydTYqdqHIkadxzxv2xzv1Oyt95ShSh8ivW6PB/KkZIiN/mrbLy3OJcEDLao/F
         i87w==
X-Gm-Message-State: AOJu0YxF7oxfwmYkwI7U3109FZWB3qsyoMEkUR+Z51h32QcSfiEnfpsl
	BNsryMmKB11QIs2QiZ+/WasEV3dAKYvDc0cR+AYBA1x9+yh5ZS0aeEsUwVijbnf0P56hYEO/s3L
	SUCYC
X-Gm-Gg: ASbGncu1TSam8Oc1G9GW3ZkMvkNHT9/M2jnX0HpcxAYz26iqVPWgYHpXxycGzEkivVJ
	yiZuSnjp9WBZtUDhM3XC6lhLt5KckZeWO1cCzn+EG9uG/wr+g0Rdqi4CgSEhdf/0yGFm1dz7cDR
	XqcJQmXSHMQbkTumicfKZHaEY9SQ844p11EBbwfUowHqeCPFQpRr39QM+RwwL/iLija8aZ5Pwpt
	KKj4sLwqHGbygiRj96pOuOr1AaANx2Kon5meOwyprJ4NUoxo6F8n5Fgul60OP2Gsd5zFClaga58
	milbQdTVho2e0GjJ9E6oM66h4VPojneBopNMqwP3ioMTgcKmL858dqeEvw==
X-Google-Smtp-Source: AGHT+IEzq5H1Uqhyb6uJAkgeSI25LqWEvK+3tWTWzGSKuRT1U/qjGvt3mPpaF0FBHDYFzpvyg4+idA==
X-Received: by 2002:a05:6808:164c:b0:404:a146:9d0a with SMTP id 5614622812f47-404da715bcamr10319082b6e.10.1747759137576;
        Tue, 20 May 2025 09:38:57 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a365sm2329744173.18.2025.05.20.09.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:38:57 -0700 (PDT)
Message-ID: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
Date: Tue, 20 May 2025 10:38:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 john.ogness@linutronix.de,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: printk NMI splat on boot
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

This has been going on for a while, and finally getting around to
reporting it. For every boot on my Dell R7625, I get one of these:

bnxt_en 0000:01:00.2 eno12419np2: renamed from eth2
usb 1-1.2: new low-speed USB device number 3 using xhci_hcd
usb 1-1.2: New USB device found, idVendor=047b, idProduct=0011, bcdDevice= 1.00
usb 3-1: New USB device found, idVendor=1604, idProduct=10c0, bcdDevice= 0.00
usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 96-.... } 3 jiffies s: 53 root: 0x40/.
rcu: blocking rcu_node structures (internal RCU debug): l=1:96-111:0x1/.
Sending NMI from CPU 0 to CPUs 96:
NMI backtrace for cpu 96
CPU: 96 UID: 0 PID: 3241 Comm: kworker/96:1 Not tainted 6.15.0-rc7+ #254 NONE 
Hardware name: Dell Inc. PowerEdge R7625/06444F, BIOS 1.11.2 12/18/2024
Workqueue: usb_hub_wq hub_event [usbcore]
RIP: 0010:vprintk_emit+0x360/0x430
Code: 87 01 0f 84 91 00 00 00 c6 05 36 ec 8a 01 01 c6 05 3c ec 8a 01 00 0f b6 05 28 ec 8a 01 84 c0 74 0d f3 90 0f b6 05 1b ec 8a 01 <84> c0 75 f3 e8 47 0d 00 00 80 e7 02 74 01 fb c7 05 bb ec 8c 01 00
RSP: 0018:ffffbe47220c7b78 EFLAGS: 00000002
RAX: 0000000000000001 RBX: 0000000000000246 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffffffff93019c48
RBP: ffffbe47220c7c48 R08: 00000000fffdffff R09: ffffa1bf658fffa8
R10: ffffa1bf64e00000 R11: 0000000000000002 R12: ffffbe47220c7be0
R13: ffffffff9260f8ee R14: ffffbe47220c7c58 R15: 0000000000000043
FS:  0000000000000000(0000) GS:ffffa14dd4a34000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000561066512398 CR3: 00000090a0a11002 CR4: 0000000000370ef0
Call Trace:
 <TASK>
 dev_vprintk_emit+0x130/0x140
 dev_printk_emit+0x3e/0x40
 ? __dev_printk+0x2d/0x70
 _dev_info+0x5c/0x5e
 usb_new_device.cold+0x87/0x3a0 [usbcore]
 hub_event+0x1113/0x1900 [usbcore]
 ? __schedule+0x4e5/0xaf0
 process_one_work+0x140/0x2b0
 worker_thread+0x2ea/0x430
 ? process_one_work+0x2b0/0x2b0
 kthread+0xd4/0x1d0
 ? kthreads_online_cpu+0xf0/0xf0
 ret_from_fork+0x2d/0x50
 ? kthreads_online_cpu+0xf0/0xf0
 ret_from_fork_asm+0x11/0x20
 </TASK>
usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1.2: Product: Standard USB Keyboard 
hub 3-1:1.0: USB hub found
usb 1-1.2: Manufacturer: Silitek

which appears to be this spin section:

        /* We spin waiting for the owner to release us */
        spin_acquire(&console_owner_dep_map, 0, 0, _THIS_IP_);
        /* Owner will clear console_waiter on hand off */
        while (READ_ONCE(console_waiter))
                cpu_relax();
        spin_release(&console_owner_dep_map, _THIS_IP_);

Box is a 2-socket, with 2:

AMD EPYC 9754 128-Core Processor

CPUs installed.

-- 
Jens Axboe

