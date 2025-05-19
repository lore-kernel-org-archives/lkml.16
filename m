Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD8B78F2F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650215; cv=none; b=FrE/Ug4AlWvwFvsvxpSpCmcZN/CuQmGdrj4RPDaYLEG/6KzfX+iBfCI055TlgTxpplDCSO2UwuispA9RgIkhuMmZhObQK5r4AsE7cjvdlYYBXs6mVyGA1k9aOlpb5oJcQ0eTnvrGZF3iwSoWJxntV4jczY2wVJaU8Hl1Mqt/P7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650215; c=relaxed/simple;
	bh=TNWOOmFdKh5Te0IVVwVug5wyjYdt6ZQ3zVv0lDeecH4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PgEFW7MFX3ukaNUm+pRNZ7WF53b0RM29nwF01KpjM3vHsRmRw3APt8g46PEkn2OPrBo5OMYyKU/H4koAeAoGXQswWIKAVip7TzRtXSCnEpQ79fEsIIh/PshvAytB/UHfQixFRMpVO65ao83FjPec5XbzQIwgh1D35RxesHN7mQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-85b3a6c37e2so425844139f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650213; x=1748255013;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxjA/skpsZ6ve4Eq9tzitS6uxtwllVmaQFjM+/pknUU=;
        b=lyUYY2C+9cxlyPn6QZM7xE32fAXztahn4m/Uv+TN7gk5alRsHKMQam5orfxddv4tsS
         OePDE2kkPrpuF3ldO1GzJNPaHn5LyA0GFRdUHf6iWBxurVsgsrXVSMBnXbWAS5thqxdL
         7QzB0OQ8MACp81Af36jodaIRVOaa4zoW7Kou5IYzV6RcAh52YrqGk54DS6EziAQNRbTC
         MffHcHGpxRy8a2cc5utwG+DcCdOhVRUqhW7ajnKTuwPsA4Sbt/1muHawhR9DiSMZEHse
         /hte+vDej+traU/j0QYuT13SBldOWEOWJbHO+rlALlzsnxwsN7plG09k1W24OtLRMT9p
         5RDA==
X-Forwarded-Encrypted: i=1; AJvYcCVygGwxTOn1EQQJl+xDRC4W8AtyHvzqIcaEIOCwVVPGlbeMvoNQvmqy+8m0B7aaOJ4/71HIGF/5N/laphI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJ4J70ceO8rCe/JI6x+DalA1za6I4QPY8Q6G5eo/P6fnC/Ju4
	mZkvGEg6kxqZBRsAy/ljbU+a0u8hYvxRwR9UP65Eh5MnEGhdXOgtdkUmFAoCo7uWlfWap+Ec9od
	0BFmEa05l0I8b8xcz8YcXv8rZX3iwBjlXMNU8jiLFKZ0ffrCyC1vCcrt8ufU=
X-Google-Smtp-Source: AGHT+IGz54PQorwCHO4ZTXZfYi3B6zUxW5Jlae9hRcYrqwnUlQVxe05FQm557HufLDHLz5GMlvCQpgViKJwt6uqb0GqnNmJHCSDT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a0a:b0:86a:93c:5571 with SMTP id
 ca18e2360f4ac-86a2317c56cmr1550801339f.1.1747650212909; Mon, 19 May 2025
 03:23:32 -0700 (PDT)
Date: Mon, 19 May 2025 03:23:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682b06a4.a70a0220.3849cf.00b2.GAE@google.com>
Subject: [syzbot] [net?] general protection fault in ip6_ins_rt
From: syzbot <syzbot+ce95bbc882771b5d81f7@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c94d59a126cb Merge tag 'trace-v6.15-rc6' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=100ddcd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7819b10245b63b3d
dashboard link: https://syzkaller.appspot.com/bug?extid=ce95bbc882771b5d81f7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c94d59a1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c62247a68f8a/vmlinux-c94d59a1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4e1db4893db7/bzImage-c94d59a1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ce95bbc882771b5d81f7@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
CPU: 0 UID: 0 PID: 1136 Comm: kworker/u32:5 Not tainted 6.15.0-rc6-syzkaller-00085-gc94d59a126cb #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: ipv6_addrconf addrconf_dad_work
RIP: 0010:kasan_byte_accessible+0x15/0x30 mm/kasan/generic.c:199
Code: 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 <0f> b6 07 3c 07 0f 96 c0 e9 0e 29 4d 09 66 66 2e 0f 1f 84 00 00 00
RSP: 0018:ffffc90006d8f818 EFLAGS: 00010286
RAX: dffffc0000000000 RBX: 0000000000000030 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8b6c0863 RDI: dffffc0000000006
RBP: 0000000000000030 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff8b6c0863
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880977ea000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbf9f52c6b0 CR3: 0000000065999000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __kasan_check_byte+0x13/0x50 mm/kasan/common.c:556
 kasan_check_byte include/linux/kasan.h:399 [inline]
 lock_acquire kernel/locking/lockdep.c:5840 [inline]
 lock_acquire+0xfc/0x350 kernel/locking/lockdep.c:5823
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 __ip6_ins_rt net/ipv6/route.c:1350 [inline]
 ip6_ins_rt+0xa1/0x110 net/ipv6/route.c:1361
 __ipv6_ifa_notify+0xa6b/0xd60 net/ipv6/addrconf.c:6286
 ipv6_ifa_notify net/ipv6/addrconf.c:6325 [inline]
 addrconf_dad_completed+0x19a/0x10d0 net/ipv6/addrconf.c:4324
 addrconf_dad_work+0x84d/0x14e0 net/ipv6/addrconf.c:4272
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:kasan_byte_accessible+0x15/0x30 mm/kasan/generic.c:199
Code: 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 <0f> b6 07 3c 07 0f 96 c0 e9 0e 29 4d 09 66 66 2e 0f 1f 84 00 00 00
RSP: 0018:ffffc90006d8f818 EFLAGS: 00010286
RAX: dffffc0000000000 RBX: 0000000000000030 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8b6c0863 RDI: dffffc0000000006
RBP: 0000000000000030 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffffffff8b6c0863
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880977ea000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbf9f52c6b0 CR3: 0000000065999000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	0f 1f 00             	nopl   (%rax)
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	66 0f 1f 00          	nopw   (%rax)
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 c1 ef 03          	shr    $0x3,%rdi
  27:	48 01 c7             	add    %rax,%rdi
* 2a:	0f b6 07             	movzbl (%rdi),%eax <-- trapping instruction
  2d:	3c 07                	cmp    $0x7,%al
  2f:	0f 96 c0             	setbe  %al
  32:	e9 0e 29 4d 09       	jmp    0x94d2945
  37:	66                   	data16
  38:	66                   	data16
  39:	2e                   	cs
  3a:	0f                   	.byte 0xf
  3b:	1f                   	(bad)
  3c:	84 00                	test   %al,(%rax)


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
