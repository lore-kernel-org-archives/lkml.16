Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25A0199EBB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454055; cv=none; b=Ws/TyS9cTe2B1F1F+FXHl3NQtp5os7stZDSfMJ0wujusT82Sq8A+gvDAIU553kWrLfPgdXszZw26omHYoMMzvAusrhcdz5gmcKVAgahNYWlqZpNbSFSwXZctmjgddpEyMijOAAggJEnjxLh64z3xQLzM9dM6ROlMQ8uM7iMqorE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454055; c=relaxed/simple;
	bh=Nl3Bdd2VD8L5riajd4yFTwM2PCG/MJvzQXEacWTfIvg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TOCZPY+dn2kjL0QtGw7U5IRFyWzz2rMlU4N/pt8vE8sYN/BvJqOI4nAWRUcvcTESY8RwwlTGcmw5kqMkuB+F02uMezWnr9kSHQzfMf9rpOwMv8Zsb+BgJpCSQxPsw1UYKQAn0nycqX+0vAw7hqPrIovx5Rd4C0u2j3KNfabEMmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so39668065ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454053; x=1747058853;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxC5+1znYxQC/r4enrg+SzrtOZNNwunbYN3tx/LkGlo=;
        b=Vj29t7QdCeTRG3Cht0G5pnklzu6DhlEoiaxdE8cdWOOuceRoSC86RFR2g0cC39mxxK
         QuB6LS53b7ZQkIYbbnMsEPNnHjG33XcrmBxAICGxAt5duRHWX8iuIBwSnFcVfYV6sXrk
         2cYzhzKWmv3y4SkbL9ixOEmy3oiK+Y0AKaPmZcgU8LYPE8/AQu47ZK3AxvqyJfEpRfJX
         heLdwzXyiD+CVNY3zTuBGFIZOp2miF2UkyL5MTbOPH9RoglXmB4B5PLgMcY0pQcuibIF
         sjutbdE9a5a5oVaSim4oYGLKH116xbBjcAIcEQMQ7aKHYVWvRxqol9dVMzDSRGMRGHY2
         pZJA==
X-Forwarded-Encrypted: i=1; AJvYcCU8dpDGpyXWjzIGfrhtZpN5IPEM+VWh7Sa8xHssVnWeDFOGBRf5f8RFJ5FShctDU1yiaawJ1DOvuSwNwIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8K2MwJJzAGK0wqg72DQeRdaJaOoBTFd45cdv8jGS0UsbAHUWt
	hLD9FlhOQKB0e3aWqic0jOWq25M++WXlVJ36V2JeP3DJoh+/PqQI6zxgs8Eo/3YrD+RtF9JRYE1
	ML40CPdx4w+jkwu6CQLAKqfQrsgpiBWW7mjA9Qhop+SGMr6vAiIHnLOw=
X-Google-Smtp-Source: AGHT+IFB0lZ6S7TXw6aqkvB32BjoYiExKnL4jRlS3py/AnTzNuk3TVXRhlt4d5yT8FQ6i1L9+35xF99dpK9xUNORRWE89O099wwE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f82:b0:3d3:fcff:edae with SMTP id
 e9e14a558f8ab-3da5b2398f6mr70057475ab.3.1746454052903; Mon, 05 May 2025
 07:07:32 -0700 (PDT)
Date: Mon, 05 May 2025 07:07:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6818c624.050a0220.11da1b.004c.GAE@google.com>
Subject: [syzbot] [usb?] WARNING: ODEBUG bug in usb_unbind_interface (3)
From: syzbot <syzbot+52ba12be8e4d18263247@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b6ea1680d0ac Merge tag 'v6.15-p6' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1131b1b3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9a25b7a36123454
dashboard link: https://syzkaller.appspot.com/bug?extid=52ba12be8e4d18263247
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d847e7b2a66a/disk-b6ea1680.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c4dcc4871fb2/vmlinux-b6ea1680.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7b8bf844d89e/bzImage-b6ea1680.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+52ba12be8e4d18263247@syzkaller.appspotmail.com

WARNING: CPU: 0 PID: 6729 at lib/debugobjects.c:615 debug_print_object+0x16b/0x1e0 lib/debugobjects.c:612
Modules linked in:
CPU: 0 UID: 0 PID: 6729 Comm: kworker/0:11 Not tainted 6.15.0-rc4-syzkaller-00042-gb6ea1680d0ac #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:debug_print_object+0x16b/0x1e0 lib/debugobjects.c:612
Code: 4c 89 ff e8 b7 6b 63 fd 4d 8b 0f 48 c7 c7 80 d7 c1 8b 48 8b 34 24 4c 89 ea 89 e9 4d 89 f0 41 54 e8 6a d4 c5 fc 48 83 c4 08 90 <0f> 0b 90 90 ff 05 17 ba c0 0a 48 83 c4 08 5b 41 5c 41 5d 41 5e 41
RSP: 0018:ffffc900037df320 EFLAGS: 00010292
RAX: ca5e4d58fd900000 RBX: dffffc0000000000 RCX: 0000000000100000
RDX: ffffc90014e77000 RSI: 000000000002265c RDI: 000000000002265d
RBP: 0000000000000000 R08: ffffffff8f7ed377 R09: 1ffffffff1efda6e
R10: dffffc0000000000 R11: fffffbfff1efda6f R12: ffffffff86fb2200
R13: ffffffff8bc1d900 R14: ffff88804f0b1260 R15: ffffffff8b69bc40
FS:  0000000000000000(0000) GS:ffff8881260cc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000404000 CR3: 000000006e344000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 000000000000000e DR6: 00000000ffff0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x3a2/0x470 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2329 [inline]
 slab_free mm/slub.c:4656 [inline]
 kfree+0x117/0x440 mm/slub.c:4855
 device_release+0x99/0x1c0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x228/0x480 lib/kobject.c:737
 usb_unbind_interface+0x26b/0x8f0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x4d6/0x7c0 drivers/base/dd.c:1295
 bus_remove_device+0x34d/0x410 drivers/base/bus.c:579
 device_del+0x511/0x8e0 drivers/base/core.c:3881
 usb_disable_device+0x3e9/0x8a0 drivers/usb/core/message.c:1418
 usb_disconnect+0x330/0x910 drivers/usb/core/hub.c:2316
 hub_port_connect drivers/usb/core/hub.c:5371 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
