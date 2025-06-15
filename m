Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3A322B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 00:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749948142; cv=none; b=rH1MS1umDPlBECbK1wA9RZ7Br2xLd5ZO+5Mlny/0sbVJ0bkzP8E+idiF271OJPobVTPLpIhvxmIuEbpqImX32ecRaH6hF9Q07wPlhQVdIpghVLD0uFWpEc5eOB0VWbO5YBPCDvC0wxZEoW4a7YJPmVyUYfmVtpIwPeGvBCSjPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749948142; c=relaxed/simple;
	bh=bL7YyxIB0s5gNPXg2TrXgHXey8HIVW0X4Mokk0mXEW4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rbPp5MGhGDgrdpqenl3nfa31FFb4a7wAH66AjJHij43UY8lJVTb4BepkB0WN0NgsvMXkUsV6mG8639zJod2qV+twHIJU7kS6+ru+e0OujeHuByxS5y2Cauao3nJ8ZSgeKcis5XoV9kYbulX7DXv3fltH5Hsc1hOhpTBuS8gRMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86cfccca327so769773439f.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 17:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749948140; x=1750552940;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAdMfYGwJjjzAMIkq28e7PDUPb7jkYELlDQPgD5JKAk=;
        b=TqVuHtDv6nsgaCPtHwIg9/UCCTEGPq3f9KsH+pDNfsmVoQ44o82gHcK3Owb9IecMuO
         6WMeUracu6BIMyyI5FGtedwobU2VRbNezBpcJfPEeU0wxUkKB/2Ek0MRppHl9Z1s4rzc
         CrEmUxVNEW38R7/3ADdEmu4sT3sz2GsVsVbQTD72eHqDpCN6zkQUrpcX1gK/4xLjeKBN
         i/vB1qzoCU3/Zfgjihvd/c67Ph9O6S9HMM0AgoHNlkZy5IC9Ozz4M36juU73LHtXfLUp
         PRJhLQm+j5SJLy8Z7qSteAAvtf6NBGB9HyNf3BJbuIT7hsaTibEuAhKqimJcqcJx4Kz2
         ZcfA==
X-Forwarded-Encrypted: i=1; AJvYcCVJaSQv//0qgH+z8Kig296LRMzZE2AvCrApdf/WwgMXKKHQPjhsr/4kMNfrWK5mXLFdB7mEZvs+dCoUZYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoviyWIdSPCdotjGlcasgrgSIK3tVEqu41aF7u0LG/R+Qf2Gkp
	/0RG9ailc9f2WKE1tDcw3SVGiGCL8+GR6QZSMQ1el892O1Qke/zSdRKQ0AAn+Cnc07fp1Kiss8P
	pW/vpZzZRtZUfn2PJ/8RKVSYbmFRH0Zs/gtiIfOewtNHxzhOubChN8sLy4iM=
X-Google-Smtp-Source: AGHT+IGhe6KD2jaBryXaTJnD3UNYvgwMEAWsau1A6WbK97zyds5Z/M7JDReqxn9XdBAVWaR/uBfZjoe4J/g5xLJ2s830Guqwn5pS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2dc1:b0:873:1cc0:4e10 with SMTP id
 ca18e2360f4ac-875deda6af4mr568626739f.3.1749948140437; Sat, 14 Jun 2025
 17:42:20 -0700 (PDT)
Date: Sat, 14 Jun 2025 17:42:20 -0700
In-Reply-To: <684df1ed.a00a0220.279073.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684e16ec.050a0220.be214.02b7.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING: refcount bug in hdm_disconnect
From: syzbot <syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    4774cfe3543a Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14cf25d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=706b535f9c369932
dashboard link: https://syzkaller.appspot.com/bug?extid=d175ca7205b4f18390b1
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14bb3d70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1448f10c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-4774cfe3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cae525065b5b/vmlinux-4774cfe3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ce14ef6ecfe2/zImage-4774cfe3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com

usb 1-1: USB disconnect, device number 2
------------[ cut here ]------------
WARNING: CPU: 0 PID: 97 at lib/refcount.c:28 refcount_warn_saturate+0x13c/0x174 lib/refcount.c:28
refcount_t: underflow; use-after-free.
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 0 UID: 0 PID: 97 Comm: kworker/0:2 Not tainted 6.16.0-rc1-syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
Workqueue: usb_hub_wq hub_event
Call trace: 
[<80201a00>] (dump_backtrace) from [<80201afc>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:00000000 r6:8282083c r5:00000000 r4:82259bd0
[<80201ae4>] (show_stack) from [<8021fd94>] (__dump_stack lib/dump_stack.c:94 [inline])
[<80201ae4>] (show_stack) from [<8021fd94>] (dump_stack_lvl+0x54/0x7c lib/dump_stack.c:120)
[<8021fd40>] (dump_stack_lvl) from [<8021fdd4>] (dump_stack+0x18/0x1c lib/dump_stack.c:129)
 r5:00000000 r4:82a6dd18
[<8021fdbc>] (dump_stack) from [<80202614>] (panic+0x120/0x374 kernel/panic.c:382)
[<802024f4>] (panic) from [<802585b8>] (check_panic_on_warn kernel/panic.c:273 [inline])
[<802024f4>] (panic) from [<802585b8>] (get_taint+0x0/0x1c kernel/panic.c:268)
 r3:8280c684 r2:00000001 r1:822406fc r0:822480ac
 r7:808c00f4
[<80258544>] (check_panic_on_warn) from [<8025871c>] (__warn+0x80/0x188 kernel/panic.c:777)
[<8025869c>] (__warn) from [<80258a0c>] (warn_slowpath_fmt+0x1e8/0x1f4 kernel/panic.c:812)
 r8:00000009 r7:822b1be4 r6:df9b5bfc r5:833a1800 r4:00000000
[<80258828>] (warn_slowpath_fmt) from [<808c00f4>] (refcount_warn_saturate+0x13c/0x174 lib/refcount.c:28)
 r10:00000001 r9:829ca3e8 r8:844d4c88 r7:844d6474 r6:8419ffb4 r5:844d6400
 r4:84571800
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (__refcount_sub_and_test include/linux/refcount.h:400 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (__refcount_dec_and_test include/linux/refcount.h:432 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (refcount_dec_and_test include/linux/refcount.h:450 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (kref_put include/linux/kref.h:64 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (kobject_put+0x158/0x1f4 lib/kobject.c:737)
[<819fcd30>] (kobject_put) from [<80b307e8>] (put_device+0x18/0x1c drivers/base/core.c:3800)
 r7:844d6474 r6:8419ffb4 r5:844d6400 r4:8419f800
[<80b307d0>] (put_device) from [<81418e74>] (hdm_disconnect+0x90/0x9c drivers/most/most_usb.c:1129)
[<81418de4>] (hdm_disconnect) from [<80e8cd04>] (usb_unbind_interface+0x84/0x2b4 drivers/usb/core/driver.c:458)
 r7:844d6474 r6:844d6430 r5:00000000 r4:844d4c00
[<80e8cc80>] (usb_unbind_interface) from [<80b38870>] (device_remove drivers/base/dd.c:569 [inline])
[<80e8cc80>] (usb_unbind_interface) from [<80b38870>] (device_remove+0x64/0x6c drivers/base/dd.c:561)
 r10:00000001 r9:844d4c88 r8:00000044 r7:844d6474 r6:829ca3e8 r5:00000000
 r4:844d6430
[<80b3880c>] (device_remove) from [<80b39d60>] (__device_release_driver drivers/base/dd.c:1272 [inline])
[<80b3880c>] (device_remove) from [<80b39d60>] (device_release_driver_internal+0x18c/0x200 drivers/base/dd.c:1295)
 r5:00000000 r4:844d6430
[<80b39bd4>] (device_release_driver_internal) from [<80b39dec>] (device_release_driver+0x18/0x1c drivers/base/dd.c:1318)
 r9:844d4c88 r8:832d5d40 r7:832d5d38 r6:832d5d0c r5:844d6430 r4:832d5d30
[<80b39dd4>] (device_release_driver) from [<80b37ec4>] (bus_remove_device+0xcc/0x120 drivers/base/bus.c:579)
[<80b37df8>] (bus_remove_device) from [<80b32220>] (device_del+0x148/0x38c drivers/base/core.c:3881)
 r9:844d4c88 r8:833a1800 r7:04208060 r6:00000000 r5:844d6430 r4:844d6474
[<80b320d8>] (device_del) from [<80e8a754>] (usb_disable_device+0xd4/0x1e8 drivers/usb/core/message.c:1418)
 r10:00000001 r9:00000000 r8:00000000 r7:844d6400 r6:844d4c00 r5:84791288
 r4:60000013
[<80e8a680>] (usb_disable_device) from [<80e7f4d0>] (usb_disconnect+0xec/0x29c drivers/usb/core/hub.c:2316)
 r9:84571c00 r8:844d4ccc r7:83b56400 r6:844d4c88 r5:844d4c00 r4:60000013
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (hub_port_connect drivers/usb/core/hub.c:5375 [inline])
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (hub_port_connect_change drivers/usb/core/hub.c:5675 [inline])
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (port_event drivers/usb/core/hub.c:5835 [inline])
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (hub_event+0xe78/0x194c drivers/usb/core/hub.c:5917)
 r10:00000001 r9:00000100 r8:83caed00 r7:844d4c00 r6:83b55c00 r5:83b56610
 r4:00000001
[<80e81318>] (hub_event) from [<8027e2e8>] (process_one_work+0x1b4/0x4f4 kernel/workqueue.c:3238)
 r10:832d5f70 r9:8380e205 r8:833a1800 r7:dddced40 r6:8380e200 r5:83caed00
 r4:83338e80
[<8027e134>] (process_one_work) from [<8027ef30>] (process_scheduled_works kernel/workqueue.c:3321 [inline])
[<8027e134>] (process_one_work) from [<8027ef30>] (worker_thread+0x1fc/0x3d8 kernel/workqueue.c:3402)
 r10:61c88647 r9:833a1800 r8:83338eac r7:82804d40 r6:dddced40 r5:dddced60
 r4:83338e80
[<8027ed34>] (worker_thread) from [<80285f5c>] (kthread+0x12c/0x280 kernel/kthread.c:464)
 r10:00000000 r9:83338e80 r8:8027ed34 r7:df841e60 r6:83338f00 r5:833a1800
 r4:00000001
[<80285e30>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:137)
Exception stack(0xdf9b5fb0 to 0xdf9b5ff8)
5fa0:                                     00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80285e30
 r4:83335080
Rebooting in 86400 seconds..


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
