Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8082E11CB
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 22:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749938672; cv=none; b=XqAKAHs2e5YBBKpfCV4oDkMmfBgub0e7plUo/Qh+HgI6hijV58Jchq1nxbaDryV610QU359kJfjgPkAxOTkhbS2DPXzcrWVxJlPp1FOeAnYQlkChI+EMgBER+e7IGQMArDiaY7fGJwEU2g28bSVAFQWdgHcH63HxhiAtj9TlmHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749938672; c=relaxed/simple;
	bh=6sfSlVUXgOQMyPT1nbmF4IKOHML94okR/2LMhebCFXg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Bgb7fmOFD1KXdIKbfhJyJmhmiyBn3p+q4Ame6+uvHi3Qk8uOhyumDzZcCq3FGgFsMy1XnydrSFEQEgK6y9zDv+odQkkB7Klwnd3DP3MmrGYFL/9UBajN8gKq2VGbQPYk0D6ERQT9wmyVRF7dQsQlIUZqk0KsWix/zPBV/g0HYew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3da6fe2a552so78217205ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749938669; x=1750543469;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mogrcbZ+TiNC+9gUVOUlvySHlEjXaTgQztRk8fEDgYM=;
        b=g3BMYVCyUT6x10jd0MjglghuM+nzoZx3Gx2I6f34GPB51yIJp+ktstAiip2YEvaMi1
         BskmjKCsgrU+fXlyU9m1H9lPTUbM+hOf8x5II50VDEzr+Www8nKAUmXywaLwworY6eGP
         6AlcqS36Ew7q0Uarq1Qx3fZDvglSpdTZSBTsI/P7laCx2FSXNYkLR3vc/LaL9nbTATjW
         InM4ExJQ+pemTQQBd7oi/afBdaoRX+PD4bBbpspvUljGNZLizITbJFbAWF+J/G/6QG2y
         7naZXqEP6HLT7EJGhr0b99kEFwq9pYO5J//9LFqsrF7jjxOoqLm47JZabTohsaeGfjzL
         s13w==
X-Forwarded-Encrypted: i=1; AJvYcCVwfPGTyZuyHi0iVz16l5HIgGiTV3geTRbcV/Bv376eq7yyGAQrl08ozZGXtBDzpjQ7FE32kqlyh8Kplf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2bzpOgzosooR4+Tm7b/QEk8QypGnpdwKVN9vvGk1DQRYExsL
	u+DVeQMQjqdkDdnLEoRQROvrt6pR5CXod0O9jdASYtqgjEAXDuaXBLUFfMZxQ8LOaKtH7AIMyGg
	GNlWexvLB6otMAvV46voKxouULzoT6wMISc+r92K/gNZuNywZWcl9iJLXnWE=
X-Google-Smtp-Source: AGHT+IFYSHMnsnnpeVnBEUGLMJ6cO0VDOxaCBIgjTilhI7VFTfRKV4hYrh4wiY0/wstIbswDbiz1CFy68w9x5Mdyi72nkExxp+uk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c88:b0:3dd:d348:715a with SMTP id
 e9e14a558f8ab-3de07c6ac3bmr52964455ab.8.1749938669514; Sat, 14 Jun 2025
 15:04:29 -0700 (PDT)
Date: Sat, 14 Jun 2025 15:04:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684df1ed.a00a0220.279073.0024.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING: refcount bug in hdm_disconnect
From: syzbot <syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4774cfe3543a Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b525d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=706b535f9c369932
dashboard link: https://syzkaller.appspot.com/bug?extid=d175ca7205b4f18390b1
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-4774cfe3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cae525065b5b/vmlinux-4774cfe3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ce14ef6ecfe2/zImage-4774cfe3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d175ca7205b4f18390b1@syzkaller.appspotmail.com

usb 2-1: USB disconnect, device number 30
------------[ cut here ]------------
WARNING: CPU: 0 PID: 4354 at lib/refcount.c:28 refcount_warn_saturate+0x13c/0x174 lib/refcount.c:28
refcount_t: underflow; use-after-free.
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 0 UID: 0 PID: 4354 Comm: kworker/0:54 Not tainted 6.16.0-rc1-syzkaller #0 PREEMPT 
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
 r8:00000009 r7:822b1be4 r6:dfaa1bfc r5:85882400 r4:00000000
[<80258828>] (warn_slowpath_fmt) from [<808c00f4>] (refcount_warn_saturate+0x13c/0x174 lib/refcount.c:28)
 r10:00000001 r9:829ca3e8 r8:858c4088 r7:858c7874 r6:84aa87b4 r5:858c7800
 r4:83d21c00
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (__refcount_sub_and_test include/linux/refcount.h:400 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (__refcount_dec_and_test include/linux/refcount.h:432 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (refcount_dec_and_test include/linux/refcount.h:450 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (kref_put include/linux/kref.h:64 [inline])
[<808bffb8>] (refcount_warn_saturate) from [<819fce88>] (kobject_put+0x158/0x1f4 lib/kobject.c:737)
[<819fcd30>] (kobject_put) from [<80b307e8>] (put_device+0x18/0x1c drivers/base/core.c:3800)
 r7:858c7874 r6:84aa87b4 r5:858c7800 r4:84aa8000
[<80b307d0>] (put_device) from [<81418e74>] (hdm_disconnect+0x90/0x9c drivers/most/most_usb.c:1129)
[<81418de4>] (hdm_disconnect) from [<80e8cd04>] (usb_unbind_interface+0x84/0x2b4 drivers/usb/core/driver.c:458)
 r7:858c7874 r6:858c7830 r5:00000000 r4:858c4000
[<80e8cc80>] (usb_unbind_interface) from [<80b38870>] (device_remove drivers/base/dd.c:569 [inline])
[<80e8cc80>] (usb_unbind_interface) from [<80b38870>] (device_remove+0x64/0x6c drivers/base/dd.c:561)
 r10:00000001 r9:858c4088 r8:00000044 r7:858c7874 r6:829ca3e8 r5:00000000
 r4:858c7830
[<80b3880c>] (device_remove) from [<80b39d60>] (__device_release_driver drivers/base/dd.c:1272 [inline])
[<80b3880c>] (device_remove) from [<80b39d60>] (device_release_driver_internal+0x18c/0x200 drivers/base/dd.c:1295)
 r5:00000000 r4:858c7830
[<80b39bd4>] (device_release_driver_internal) from [<80b39dec>] (device_release_driver+0x18/0x1c drivers/base/dd.c:1318)
 r9:858c4088 r8:8335cc40 r7:8335cc38 r6:8335cc0c r5:858c7830 r4:8335cc30
[<80b39dd4>] (device_release_driver) from [<80b37ec4>] (bus_remove_device+0xcc/0x120 drivers/base/bus.c:579)
[<80b37df8>] (bus_remove_device) from [<80b32220>] (device_del+0x148/0x38c drivers/base/core.c:3881)
 r9:858c4088 r8:85882400 r7:04208060 r6:00000000 r5:858c7830 r4:858c7874
[<80b320d8>] (device_del) from [<80e8a754>] (usb_disable_device+0xd4/0x1e8 drivers/usb/core/message.c:1418)
 r10:00000001 r9:00000000 r8:00000000 r7:858c7800 r6:858c4000 r5:84899748
 r4:60000013
[<80e8a680>] (usb_disable_device) from [<80e7f4d0>] (usb_disconnect+0xec/0x29c drivers/usb/core/hub.c:2316)
 r9:83d21600 r8:858c40cc r7:84282000 r6:858c4088 r5:858c4000 r4:60000013
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (hub_port_connect drivers/usb/core/hub.c:5375 [inline])
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (hub_port_connect_change drivers/usb/core/hub.c:5675 [inline])
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (port_event drivers/usb/core/hub.c:5835 [inline])
[<80e7f3e4>] (usb_disconnect) from [<80e82190>] (hub_event+0xe78/0x194c drivers/usb/core/hub.c:5917)
 r10:00000001 r9:00000100 r8:83d03300 r7:858c4000 r6:84281800 r5:84282210
 r4:00000001
[<80e81318>] (hub_event) from [<8027e2e8>] (process_one_work+0x1b4/0x4f4 kernel/workqueue.c:3238)
 r10:8335ce70 r9:8326f405 r8:85882400 r7:dddced40 r6:8326f400 r5:83d03300
 r4:85a6a100
[<8027e134>] (process_one_work) from [<8027ef30>] (process_scheduled_works kernel/workqueue.c:3321 [inline])
[<8027e134>] (process_one_work) from [<8027ef30>] (worker_thread+0x1fc/0x3d8 kernel/workqueue.c:3402)
 r10:61c88647 r9:85882400 r8:85a6a12c r7:82804d40 r6:dddced40 r5:dddced60
 r4:85a6a100
[<8027ed34>] (worker_thread) from [<80285f5c>] (kthread+0x12c/0x280 kernel/kthread.c:464)
 r10:00000000 r9:85a6a100 r8:8027ed34 r7:dfed1e60 r6:85a6a000 r5:85882400
 r4:00000001
[<80285e30>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:137)
Exception stack(0xdfaa1fb0 to 0xdfaa1ff8)
1fa0:                                     00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80285e30
 r4:853ec900
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
