Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24198287510
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747772315; cv=none; b=XQRbdYBk57HYNqQuyQxV5ppW8IDwvyFx1YtVv8B0Ep5qWtEKW/6+M2GS2g2FUh2d3Va75uVsqlbZZLm7RsyCE5r5WzDLQ3Zxv2VuHK2aoVkyE/gRCGYxCkWLwDgCgkAUj0nOfGRar2yb3tRTIyTOdHk/2oozFK5OaJdlrICGqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747772315; c=relaxed/simple;
	bh=yt8eb5iCPZg0L4j8AoQeGEI5K6xzS7WNkGH3z1x/yvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcMXNiOWw/tlL+LgXVc5bXHNoJ4aGOasfZE+kusYsLfEIhOJGeNdA3CacdivArn5dPggpah/CIfmSYFYxJZI2eS1vojTdCczqSrETxGOyqHQpsJVkkdcXVyIgqWvqNlvncGP6eZkqGVgPTLJxZKCxqLh/yXsuoJVAXLTefHB27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=IpuREF5a; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="IpuREF5a"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86a464849faso179498539f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747772310; x=1748377110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsLvfsakVDOdi8PnP6RH4SFd5tS9G0qEU3jQIx04o8Q=;
        b=IpuREF5alJ3sat5ZWplXWVhYz7nXFeMjwsgx9iq/E514evcKyrR4YQDKrvZFWTblm3
         PlqDZXJHH/XsTpl+V9KmkvFt+QAtK5I9HnwhIuwVZjkEUAsU7N4Umejjnj6c4PW5+GTk
         NuQ+Be2mmSzZ5oipWGczxWPMR1w9HbmuEXeq3qdIpTGWzHwkuoTIM9qnpPmjwFJv+ESj
         lhp0rA6eh7ZMo3rmRkEsMcfoILFGVEUQW3y1MktAuVOL5HKQVI6IBZeqtMnl1RqOsSrt
         mreqdLB9k5VTW3ZkMdIKBsa8K4TOznCFpPdAm+caVQCbxQWwqhUSJLUuxpIPEnENzcCY
         BlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747772310; x=1748377110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsLvfsakVDOdi8PnP6RH4SFd5tS9G0qEU3jQIx04o8Q=;
        b=Ja6BjY6t2xZ7jPFvYSSjRgtji0sXDlKdtU+jimDEvDs54m2G2tAiYiYosuwxcsDNas
         ui2H7xH4nC9OhaeBeuWHT/q0FGUtW0XcV+sYpqDtmlrEA+QC/F9u87jCb4kINeI+MYnx
         4nvRSxf3ipaY9SdgjUq0c4WQRORUDqLFZ8VqpxuFsAJjCUSyEDK7bpRlPlhEVb/cRibU
         CexqC+7pcG5z0qwaOUkI1Jl6aJ+8jvCpTia4Y5ftyQJkqN1T2YZTKU4tg199GtwshFMx
         CZtpaAc78oWyFkI3OEeeWX9bgvwolR8arP1G/Y0rh99dy6bJ9AeyzmVwKblGjAnMSbru
         4HzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX87BaZ+aWMsqXTQQMwtm2Mk64Aansdc4mOBqvu1nT6/4Duog59WNsMxXX23B1chQUUqLFZfkF8MG2RLrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwklBaACgQyxe0aX6jD9JehcWn80RpnOi9MJLk/J+joc2qRTg
	X9XTtRGjOUwKo6YDrmfu4b8LQ7+vhx5gf2W1jcEatg6YdvilQMW88Qvzb32+FJ2jsfA=
X-Gm-Gg: ASbGncvW9Y8STSHSasT9N9SBqGNCmAqlt63GEdwQ5+0Uei7OhxxkVfWihKgxKutG9Z+
	9IDhMzwz/RwMR+9/rOCl2YGTubj3O2Mevt6xrcd/A4p+c+/Hx5UxKjoY/TCXNeX0lsu0HJRA6dT
	PUgto2BPSV1RInLdP3CcwbBLYxDs7x39SFaC3mjXl86Gq9xv9/IPuksdY0osrm81n4RnGv2kE2T
	7JOmz691PjX6UsJRPw9gpnQtjsHU+TBtFiP4Db+n/niy+EB+aFElNPOKJGUnKRnqPlDnvqg03bV
	GJ/oqgC4tX/VlY1MjhK3N3n8ecGgPRr++BmkZZ/a8K3jnls=
X-Google-Smtp-Source: AGHT+IHZnRlBJVVI9I7HWC1S5nWmz/SJR5t4M9pocSrISLqZN0BgtUWXcU0MVo9pUPzhEkPky4tmKQ==
X-Received: by 2002:a05:6602:1356:b0:864:a228:92b4 with SMTP id ca18e2360f4ac-86a24c1155fmr2317747439f.7.1747772309957;
        Tue, 20 May 2025 13:18:29 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4b1537sm2385661173.122.2025.05.20.13.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 13:18:29 -0700 (PDT)
Message-ID: <c99232fa-e861-48ec-8438-028e61d3b744@kernel.dk>
Date: Tue, 20 May 2025 14:18:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: printk NMI splat on boot
To: John Ogness <john.ogness@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
 <84a577t590.fsf@jogness.linutronix.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <84a577t590.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/20/25 2:08 PM, John Ogness wrote:
> Added Cc: Paul E. McKenney <paulmck@kernel.org>
> 
> Hi Jens,
> 
> On 2025-05-20, Jens Axboe <axboe@kernel.dk> wrote:
>> This has been going on for a while, and finally getting around to
>> reporting it. For every boot on my Dell R7625, I get one of these:
> 
> Is it possible that you could compile with:
> 
> CONFIG_PRINTK_TIME=y
> CONFIG_PRINTK_CALLER=y
> 
> so that we can see some timestamps and from which CPU the printk calls
> are originating from?

Sure, let me try that right now. Here it is:

[   21.450298] [   T3193] ahci 0000:65:00.0: 4/4 ports implemented (port mask 0xf)
[   21.458971] [     T17] rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 32-.... 96-.... } 3 jiffies s: 29 root: 0x44/.
[   21.458980] [     T17] rcu: blocking rcu_node structures (internal RCU debug): l=1:32-47:0x1/. l=1:96-111:0x1/.
[   21.458985] [     T17] Sending NMI from CPU 0 to CPUs 32:
[   21.458990] [     C32] NMI backtrace for cpu 32
[   21.458993] [     C32] CPU: 32 UID: 0 PID: 3193 Comm: kworker/32:1 Not tainted 6.15.0-rc7+ #255 NONE
[   21.458995] [     C32] Hardware name: Dell Inc. PowerEdge R7625/06444F, BIOS 1.11.2 12/18/2024
[   21.458997] [     C32] Workqueue: events work_for_cpu_fn
[   21.459002] [     C32] RIP: 0010:vprintk_emit+0x360/0x430
[   21.459004] [     C32] Code: 87 01 0f 84 91 00 00 00 c6 05 76 ec 8a 01 01 c6 05 7c ec 8a 01 00 0f b6 05 68 ec 8a 01 84 c0 74 0d f3 90 0f b6 05 5b ec 8a 01 <84> c0 75 f3 e8 47 0d 00 00 80 e7 02 74 01 fb c7 05 fb ec 8c 01 00
[   21.459006] [     C32] RSP: 0018:ffffaf75617b7b18 EFLAGS: 00000002
[   21.459007] [     C32] RAX: 0000000000000001 RBX: 0000000000000246 RCX: 0000000000000000
[   21.459008] [     C32] RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffffffff84019c48
[   21.459009] [     C32] RBP: ffffaf75617b7be8 R08: 00000000fffdffff R09: ffffa1a6e58fffa8
[   21.459009] [     C32] R10: ffffa1a6e4e00000 R11: 0000000000000002 R12: ffffaf75617b7b80
[   21.459010] [     C32] R13: ffffffff8360f9d1 R14: ffffaf75617b7bf8 R15: 0000000000000038
[   21.459011] [     C32] FS:  0000000000000000(0000) GS:ffffa10563a34000(0000) knlGS:0000000000000000
[   21.459012] [     C32] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   21.459012] [     C32] CR2: 0000000000000000 CR3: 000000270b02a001 CR4: 0000000000370ef0
[   21.459013] [     C32] Call Trace:
[   21.459015] [     C32]  <TASK>
[   21.459017] [     C32]  dev_vprintk_emit+0x130/0x140
[   21.459023] [     C32]  dev_printk_emit+0x3e/0x40
[   21.459025] [     C32]  ? __dev_printk+0x2d/0x70
[   21.459028] [     C32]  _dev_info+0x5c/0x5e
[   21.459031] [     C32]  ahci_print_info+0xab/0x30c [libahci]
[   21.459036] [     C32]  ? pci_conf1_read+0xae/0xf0
[   21.459039] [     C32]  ahci_init_one+0xa3a/0xbf5 [ahci]
[   21.459045] [     C32]  ? sched_balance_newidle+0x2aa/0x3c0
[   21.459048] [     C32]  local_pci_probe+0x3c/0x80
[   21.459050] [     C32]  work_for_cpu_fn+0x10/0x20
[   21.459052] [     C32]  process_one_work+0x140/0x2b0
[   21.459054] [     C32]  worker_thread+0x2ea/0x430
[   21.459056] [     C32]  ? process_one_work+0x2b0/0x2b0
[   21.459057] [     C32]  kthread+0xd4/0x1d0
[   21.459059] [     C32]  ? kthreads_online_cpu+0xf0/0xf0
[   21.459061] [     C32]  ret_from_fork+0x2d/0x50
[   21.459062] [     C32]  ? kthreads_online_cpu+0xf0/0xf0
[   21.459064] [     C32]  ret_from_fork_asm+0x11/0x20
[   21.459066] [     C32]  </TASK>
[   21.459989] [     T17] Sending NMI from CPU 0 to CPUs 96:
[   21.460026] [     C96] NMI backtrace for cpu 96
[   21.460028] [     C96] CPU: 96 UID: 0 PID: 503 Comm: kworker/96:0 Not tainted 6.15.0-rc7+ #255 NONE
[   21.460030] [     C96] Hardware name: Dell Inc. PowerEdge R7625/06444F, BIOS 1.11.2 12/18/2024
[   21.460032] [     C96] Workqueue: events work_for_cpu_fn
[   21.460037] [     C96] RIP: 0010:fbcon_putcs+0xf0/0x150
[   21.460041] [     C96] Code: e5 ff ff 4c 63 44 24 0c 48 89 ee 48 89 df 89 c2 44 8b 4c 24 08 4c 89 c0 48 c1 e0 04 4c 29 c0 48 8d 04 c5 40 71 06 84 8b 48 10 <0f> bf 40 0e 41 51 45 89 f9 52 4c 89 e2 4c 8b 54 24 10 44 01 f0 41
[   21.460042] [     C96] RSP: 0018:ffffaf755af47968 EFLAGS: 00000046
[   21.460044] [     C96] RAX: ffffffff84067140 RBX: ffffa0e780215c00 RCX: 0000000000000030
[   21.460045] [     C96] RDX: 0000000000000007 RSI: ffffa0ff018a3800 RDI: ffffa0e780215c00
[   21.460046] [     C96] RBP: ffffa0ff018a3800 R08: 0000000000000000 R09: 0000000000000000
[   21.460047] [     C96] R10: ffffffff82c88930 R11: 000000000000002f R12: ffffa0ff0cca9f5c
[   21.460048] [     C96] R13: 000000000000001f R14: 000000000000001e R15: 000000000000002e
[   21.460049] [     C96] FS:  0000000000000000(0000) GS:ffffa13563a34000(0000) knlGS:0000000000000000
[   21.460050] [     C96] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   21.460051] [     C96] CR2: 00007fe388c23e10 CR3: 0000007885bd2002 CR4: 0000000000370ef0
[   21.460052] [     C96] Call Trace:
[   21.460054] [     C96]  <TASK>
[   21.460055] [     C96]  ? bit_update_start+0x40/0x40
[   21.460059] [     C96]  fbcon_redraw+0x103/0x240
[   21.460061] [     C96]  fbcon_scroll+0x15a/0x1a0
[   21.460063] [     C96]  con_scroll+0xf4/0x200
[   21.460065] [     C96]  ? fbcon_putcs+0x117/0x150
[   21.460066] [     C96]  lf+0x83/0x90
[   21.460067] [     C96]  vt_console_print+0x2b9/0x420
[   21.460069] [     C96]  console_flush_all+0x2da/0x5b0
[   21.460071] [     C96]  console_unlock+0xd9/0x240
[   21.460072] [     C96]  vprintk_emit+0x37e/0x430
[   21.460073] [     C96]  dev_vprintk_emit+0x130/0x140
[   21.460076] [     C96]  ? kernfs_activate+0x80/0xa0
[   21.460078] [     C96]  dev_printk_emit+0x3e/0x40
[   21.460080] [     C96]  ? __dev_printk+0x2d/0x70
[   21.460084] [     C96]  _dev_info+0x5c/0x5e
[   21.460089] [     C96]  usb_add_hcd.cold+0xd2/0x57d [usbcore]
[   21.460103] [     C96]  usb_hcd_pci_probe+0x16f/0x3e0 [usbcore]
[   21.460114] [     C96]  xhci_pci_common_probe+0x5c/0x220 [xhci_pci]
[   21.460118] [     C96]  local_pci_probe+0x3c/0x80
[   21.460121] [     C96]  work_for_cpu_fn+0x10/0x20
[   21.460122] [     C96]  process_one_work+0x140/0x2b0
[   21.460124] [     C96]  worker_thread+0x2ea/0x430
[   21.460126] [     C96]  ? process_one_work+0x2b0/0x2b0
[   21.460128] [     C96]  kthread+0xd4/0x1d0
[   21.460130] [     C96]  ? kthreads_online_cpu+0xf0/0xf0
[   21.460131] [     C96]  ret_from_fork+0x2d/0x50
[   21.460133] [     C96]  ? kthreads_online_cpu+0xf0/0xf0
[   21.460134] [     C96]  ret_from_fork_asm+0x11/0x20
[   21.460136] [     C96]  </TASK>

>> bnxt_en 0000:01:00.2 eno12419np2: renamed from eth2
>> usb 1-1.2: new low-speed USB device number 3 using xhci_hcd
>> usb 1-1.2: New USB device found, idVendor=047b, idProduct=0011, bcdDevice= 1.00
>> usb 3-1: New USB device found, idVendor=1604, idProduct=10c0, bcdDevice= 0.00
>> usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 96-.... } 3 jiffies s: 53 root: 0x40/.
> 
> The expedited grace period has only been going on for 3 jiffies.
> 
> What values are you using for CONFIG_RCU_EXP_CPU_STALL_TIMEOUT and
> CONFIG_RCU_CPU_STALL_TIMEOUT?

CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=2

> What CONFIG_*HZ* options are you using?

CONFIG_HZ=100

>> rcu: blocking rcu_node structures (internal RCU debug): l=1:96-111:0x1/.
>> Sending NMI from CPU 0 to CPUs 96:
>> NMI backtrace for cpu 96
>> CPU: 96 UID: 0 PID: 3241 Comm: kworker/96:1 Not tainted 6.15.0-rc7+ #254 NONE 
>> Hardware name: Dell Inc. PowerEdge R7625/06444F, BIOS 1.11.2 12/18/2024
>> Workqueue: usb_hub_wq hub_event [usbcore]
>> RIP: 0010:vprintk_emit+0x360/0x430
>> Code: 87 01 0f 84 91 00 00 00 c6 05 36 ec 8a 01 01 c6 05 3c ec 8a 01 00 0f b6 05 28 ec 8a 01 84 c0 74 0d f3 90 0f b6 05 1b ec 8a 01 <84> c0 75 f3 e8 47 0d 00 00 80 e7 02 74 01 fb c7 05 bb ec 8c 01 00
>> RSP: 0018:ffffbe47220c7b78 EFLAGS: 00000002
>> RAX: 0000000000000001 RBX: 0000000000000246 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffffffff93019c48
>> RBP: ffffbe47220c7c48 R08: 00000000fffdffff R09: ffffa1bf658fffa8
>> R10: ffffa1bf64e00000 R11: 0000000000000002 R12: ffffbe47220c7be0
>> R13: ffffffff9260f8ee R14: ffffbe47220c7c58 R15: 0000000000000043
>> FS:  0000000000000000(0000) GS:ffffa14dd4a34000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000561066512398 CR3: 00000090a0a11002 CR4: 0000000000370ef0
>> Call Trace:
>>  <TASK>
>>  dev_vprintk_emit+0x130/0x140
>>  dev_printk_emit+0x3e/0x40
>>  ? __dev_printk+0x2d/0x70
>>  _dev_info+0x5c/0x5e
>>  usb_new_device.cold+0x87/0x3a0 [usbcore]
>>  hub_event+0x1113/0x1900 [usbcore]
>>  ? __schedule+0x4e5/0xaf0
>>  process_one_work+0x140/0x2b0
>>  worker_thread+0x2ea/0x430
>>  ? process_one_work+0x2b0/0x2b0
>>  kthread+0xd4/0x1d0
>>  ? kthreads_online_cpu+0xf0/0xf0
>>  ret_from_fork+0x2d/0x50
>>  ? kthreads_online_cpu+0xf0/0xf0
>>  ret_from_fork_asm+0x11/0x20
>>  </TASK>
>> usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>> usb 1-1.2: Product: Standard USB Keyboard 
>> hub 3-1:1.0: USB hub found
>> usb 1-1.2: Manufacturer: Silitek
>>
>> which appears to be this spin section:
>>
>>         /* We spin waiting for the owner to release us */
>>         spin_acquire(&console_owner_dep_map, 0, 0, _THIS_IP_);
>>         /* Owner will clear console_waiter on hand off */
>>         while (READ_ONCE(console_waiter))
>>                 cpu_relax();
>>         spin_release(&console_owner_dep_map, _THIS_IP_);
> 
> This code is waiting for a CPU to finish printing a line so that it can
> take over printing the next line.
> 
> If you are using CONFIG_HZ_1000 and a baud rate of 115200bps, you will
> only get about 14 characters printed per jiffy. The last line
> successfully printed has 68 characters and the expedited grace period
> timed out after only 3 jiffies (which would be around 42 characters). So
> the numbers and the timeout make sense. But why is the grace period so
> short?

I think I just used whatever defaults were there. At least I didn't set
anything low on purpose. I do have a serial console turned on, which I'm
sure would explain why it's so slow (even if not used).

-- 
Jens Axboe
