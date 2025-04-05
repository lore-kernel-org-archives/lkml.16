Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68501AF0A4;
	Sat,  5 Apr 2025 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743838598; cv=none; b=CjRz/zE1jOZQLZzS17hwXx+xMJGRgI7sDI9p54/WcrCh6gREOaGYbt/mrVbbQ8rKhDk53oWVbqgoFwQvbP+EHK+HzCY56BefRTVCdqROUv/oUfbSR99lnNN7Z8B0N12r7jbx7xMc8lejQ3Elq9lwowvLRFIePJZfs+ouzHJECC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743838598; c=relaxed/simple;
	bh=DJQdwk1gHXxwcSk6U7ddAHOzb9mjTTSlgJw47D8LHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxoXRwHLmGUVMaKevK0BzySgMUXdQX01R57x6gWSHvjYMgc/dpPQYPNuQge82TwHxpn+yai4CB2l0pqSTVK/0sHaYdhX/43jBbYVh5kmD7PkV1sI/nUjHWr6TM7L2BayMGmXyBbrUo30TmZORMis+9xvmzYvXA1p+hIpxRPZo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af06b.dynamic.kabel-deutschland.de [95.90.240.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B1E2661E6479B;
	Sat, 05 Apr 2025 09:36:03 +0200 (CEST)
Message-ID: <7ec5ba1d-1de7-409d-882c-2efab4922ed4@molgen.mpg.de>
Date: Sat, 5 Apr 2025 09:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <20250405084307.4080edf4@foxbook>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250405084307.4080edf4@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Michał,


Thank you for looking into this.

Am 05.04.25 um 08:43 schrieb Michał Pecio:

> On Thu, 3 Apr 2025 20:02:05 +0200, Paul Menzel wrote:
>> Just a heads-up, that connecting an LMP USB-C mini Dock [1] to the
>> Intel Kaby Lake Dell XPS 13 9360 with
>>
>>       00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller [8086:9d2f] (rev 21)
> 
> This is not the USB bus generating that noise.

You are right. It is probably:

     39:00.0 USB controller [0c03]: Intel Corporation DSL6340 USB 3.1 
Controller [Alpine Ridge] [8086:15b5]

Please find the full output of `lspci -nn` attached.

> And the problem appears to be that some USB device gets reset
> periodically, probably /dev/sda, whatever it is. This reset loop is
> also visible in your new log today.
I guess it’s the SD/eMMC card slot, which I do not use though.

> The warning appears to be connected to that, and the suspend problem
> may also be if some mutex stays locked for more than 20s as a result.
> 
> Could you check:
> 1. what exact USB device is getting reset?

How do I found out? (Excuse my ignorance, I do not even knew the warning 
is related to resets.)

> 2. is it reproducible on master? (seems so)

Yes.

> 3. is it reproducible on 6.14, 6.13, ...

As written, from my logs it happened sporadically in the past, but since 
at least commit a2cc6ff5ec8f it happens almost always. I didn’t see it 
with commit 08733088b566, and after that I didn’t use any USB-C adapters 
for three days.


Kind regards,

Paul


PS: Hints on how to try to reproduce this in QEMU would be welcome. 
(Passing the controller and device to the VM.)


>> [   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
>> [   74.916241] sd 0:0:0:0: [sda] Media removed, stopped polling
>> [   74.916634] sd 0:0:0:0: [sda] Attached SCSI removable disk
>> [   98.803081] PM: suspend entry (deep)
>> [   98.813999] Filesystems sync: 0.010 seconds
>> [   98.819226] Freezing user space processes
>> [  105.534176] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
>> [  105.606437] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
>> [  118.822270] Freezing user space processes failed after 20.003 seconds (2 tasks refusing to freeze, wq_busy=0):
>> [  118.822281] task:systemd-journal state:D stack:0     pid:474 tgid:474   ppid:1      task_flags:0x400100 flags:0x00000006
>> [  118.822285] Call Trace:
>> [  118.822287]  <TASK>
>> [  118.822291]  __schedule+0x537/0xbb0
>> [  118.822297]  schedule+0x27/0xd0
>> [  118.822300]  schedule_preempt_disabled+0x15/0x20
>> [  118.822302]  __mutex_lock.constprop.0+0x4b4/0x890
>> [  118.822306]  uevent_show+0x99/0x150
>> [  118.822309]  dev_attr_show+0x19/0x40
>> [  118.822312]  sysfs_kf_seq_show+0xcd/0x110
>> [  118.822315]  seq_read_iter+0x116/0x400
>> [  118.822318]  vfs_read+0x299/0x360
>> [  118.822321]  ksys_read+0x6b/0xe0
>> [  118.822323]  do_syscall_64+0x82/0x9b0
>> [  118.822327]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
>> [  118.822331]  ? syscall_exit_to_user_mode+0x37/0x1a0
>> [  118.822333]  ? do_syscall_64+0x8e/0x9b0
>> [  118.822336]  ? __memcg_slab_free_hook+0xf9/0x140
>> [  118.822339]  ? __x64_sys_close+0x3d/0x80
>> [  118.822341]  ? kmem_cache_free+0x236/0x460
>> [  118.822344]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
>> [  118.822346]  ? syscall_exit_to_user_mode+0x37/0x1a0
>> [  118.822348]  ? do_syscall_64+0x8e/0x9b0Dez 21 10:22:08 abreu

$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen 
Core Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 
620 [8086:5916] (rev 02)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon 
E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem 
[8086:1903] (rev 02)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 
3.0 xHCI Controller [8086:9d2f] (rev 21)
00:14.2 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Thermal subsystem [8086:9d31] (rev 21)
00:15.0 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Serial IO I2C Controller #0 [8086:9d60] (rev 21)
00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise 
Point-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise 
Point-LP CSME HECI #1 [8086:9d3a] (rev 21)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #1 [8086:9d10] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #5 [8086:9d14] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #6 [8086:9d15] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #9 [8086:9d18] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point-LP LPC 
Controller [8086:9d58] (rev 21)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-LP PMC 
[8086:9d21] (rev 21)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD Audio 
[8086:9d71] (rev 21)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus 
[8086:9d23] (rev 21)
01:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:01.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
02:02.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 
Bridge [Alpine Ridge 2C 2015] [8086:1576]
39:00.0 USB controller [0c03]: Intel Corporation DSL6340 USB 3.1 
Controller [Alpine Ridge] [8086:15b5]
3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac 
Wireless Network Adapter [168c:003e] (rev 32)
3b:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A 
PCI Express Card Reader [10ec:525a] (rev 01)
3c:00.0 Non-Volatile memory controller [0108]: SK hynix PC300 NVMe Solid 
State Drive 512GB [1c5c:1284]

$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 0cf3:e300 Qualcomm Atheros Communications QCA61x4 
Bluetooth 4.0
Bus 001 Device 003: ID 04f3:2234 Elan Microelectronics Corp. Touchscreen
Bus 001 Device 004: ID 0c45:670c Microdia Integrated Webcam HD
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub
Bus 003 Device 003: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub
Bus 003 Device 005: ID 2109:8817 VIA Labs, Inc. USB Billboard Device
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 002: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub
Bus 004 Device 003: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub
Bus 004 Device 004: ID 058f:8468 Alcor Micro Corp. Mass Storage Device
Bus 004 Device 005: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 
Gigabit Ethernet Adapter
