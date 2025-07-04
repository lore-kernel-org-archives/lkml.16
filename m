Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7251DDA0E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617055; cv=none; b=gjN/LM13w4nINjAF0XYEkGa6DLGbykX6yLS+GC9hdSGA91UfVmxiWzvPPW5AWTeeAUDDLv2HRKoqhlkCorwDJkuZOqIngSYGSZB9mQAWskRUYheD4iJ39Z6BNhStsC5yAz16A3h+JCt6aTBv5xU71CyA+PS/9EIiidSdIuYUimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617055; c=relaxed/simple;
	bh=O6Unz8QWJCfV+X8HFPCp5q5xdg5cfOfo9i0q6l0CWJs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OY/dG15to5/wKCNVdFf1BEvNBIlLDitz8nvuP23hc3hTPX5jYMEHI6rbsWCftGdePI++2TG+rYs9WSWPLZeLYEt56OzWZUCyxGB6QHhMBcNq/KWxMHghjUWAnAVTBIdv9sLTFNlvgCuTMKsPqKiZm+9GP52wJhDD2c/gIRzZues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-87326a81ceaso152081739f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617052; x=1752221852;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hd+G1xdvqBo9O5Kp33hFCBvYbzyTkHavIRPiVMaYOk4=;
        b=KE8o186XXo68u7vuSsqgkqxtltrWKRXmH2Cxrrhf/ZOGPVXNn5GTVGMdA7tnh/jmEv
         sg4R59OceSY+Y9EPvZ4weAyiUgvcyEJQs41t+Wk1bEwVTPIqZjDamRdflvIWBcEq1Cdl
         abwiMnccupDJdxTi1R5LI+ijkCo6aIkjENx4JhCTjQDfNl6QTvj+ntkwnjVFWF4kI4Wo
         WA6PoFHdUVAVQiN/vAwzm5IyZY1Irf7MQ4n8huEMXLeEMDlpOQ8fjYg+OCPTc2cgsvZU
         rXBfhM33b+d8BvFwJgBRB4gmDlUiOd27OT5NvIe69xo7I14cQtmivMLobbs5tb9Wz/vj
         RpbA==
X-Forwarded-Encrypted: i=1; AJvYcCV9bm0aL97JZpQ/pideNrJYBFRdv4NCF5qobLh1JzhyKrV4q+sp+kNlhmF+A978IBaFjju7m9AG82Pv1o4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygjt/ubGGOvf2YY5dce/YUzoJfUyx4l7goq9a2BB3Ni4REoGKI
	BowvASG78dMkiencvcdoCFk8r1sq2ahN+NlLbovVFNCX+PH7+ge3JGX1HqogViOnmpT3juvJ8ce
	Zo/1LQIokJ+MGtTbT5ag6EHYCCu299ockpxhOdJxvfpGZBFJp/qhRTT8jy1I=
X-Google-Smtp-Source: AGHT+IHoiaFLbGLOM/7aq8fZqlaHSUft1SeAmfH1B06Mee0OXT4e3E8Ex0IaKMXu1t3fWAFpcz+DgQwgXW6kXVmR7X3MsS1+LUE5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2787:b0:3dd:b602:88 with SMTP id
 e9e14a558f8ab-3e134859e42mr15955975ab.9.1751617052645; Fri, 04 Jul 2025
 01:17:32 -0700 (PDT)
Date: Fri, 04 Jul 2025 01:17:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68678e1c.a70a0220.29cf51.0013.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in comedi_unlocked_ioctl
From: syzbot <syzbot+d6995b62e5ac7d79557a@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4c06e63b9203 Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1550548c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29b1a0d7330d4a8
dashboard link: https://syzkaller.appspot.com/bug?extid=d6995b62e5ac7d79557a
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=163cac8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c58582580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4c06e63b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ff61efc838cb/vmlinux-4c06e63b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dea44d0d14bb/bzImage-4c06e63b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d6995b62e5ac7d79557a@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5545 at mm/page_alloc.c:4935 __alloc_frozen_pages_noprof+0x2c8/0x370 mm/page_alloc.c:4935
Modules linked in:
CPU: 0 UID: 0 PID: 5545 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-00123-g4c06e63b9203 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__alloc_frozen_pages_noprof+0x2c8/0x370 mm/page_alloc.c:4935
Code: 74 10 4c 89 e7 89 54 24 0c e8 24 14 0d 00 8b 54 24 0c 49 83 3c 24 00 0f 85 a5 fe ff ff e9 a6 fe ff ff c6 05 72 f5 74 0d 01 90 <0f> 0b 90 e9 18 ff ff ff a9 00 00 08 00 48 8b 4c 24 10 4c 8d 44 24
RSP: 0018:ffffc90002c0f960 EFLAGS: 00010246
RAX: ffffc90002c0f900 RBX: 0000000000000019 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc90002c0f9c8
RBP: ffffc90002c0fa50 R08: ffffc90002c0f9c7 R09: 0000000000000000
R10: ffffc90002c0f9a0 R11: fffff52000581f39 R12: 0000000000000000
R13: 1ffff92000581f30 R14: 0000000000040dc0 R15: dffffc0000000000
FS:  00005555918fc500(0000) GS:ffff88808d21c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000008 CR3: 0000000012196000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __alloc_pages_noprof+0xa/0x30 mm/page_alloc.c:4993
 __alloc_pages_node_noprof include/linux/gfp.h:284 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:311 [inline]
 ___kmalloc_large_node+0x85/0x210 mm/slub.c:4272
 __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:4300
 __do_kmalloc_node mm/slub.c:4316 [inline]
 __kmalloc_noprof+0x36f/0x4f0 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kmalloc_array_noprof include/linux/slab.h:948 [inline]
 comedi_unlocked_ioctl+0x9ee/0xf40 drivers/comedi/comedi_fops.c:2242
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6cd0d8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd9e4829b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f6cd0fb5fa0 RCX: 00007f6cd0d8e929
RDX: 0000200000000000 RSI: 000000008010640b RDI: 0000000000000003
RBP: 00007f6cd0e10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6cd0fb5fa0 R14: 00007f6cd0fb5fa0 R15: 0000000000000003
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
