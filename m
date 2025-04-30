Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B4A1E1A31
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746041857; cv=none; b=DZtcCBJgMd7oYFufGwKARSjYRqs+NoBtliLu2eqNSTBoEtuyXz5Pz5gL28BuZOBQ0xL2M7o6lylePXbtxNaXGWM3jvpovuF/RIpJzHMCP4RJxXGZP2MrLqexc9qWyHGZ4Gjj/V69HujfL1h5GItyB1fHlfWxRqM789HIbjpoPoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746041857; c=relaxed/simple;
	bh=WbP+1j502KwRHXjHdgEcNFaXQOamUNCcoKOeo1cam78=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IQadkk6kugtebd3NVintnwdV6fNYLbo4MaBzhcExPOXtsxC/kojndptRCGKLLDIuXnRI6v6U1BoBof+NM2sG0ljNwNvggmzUpc3tz8Mr0iZAWkHClRMlr0x+/bG+61GDfbZsDU5yrYOEhgynutq3SVnc2IkWEINdJPn8vsdlVqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d922570570so3803395ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746041855; x=1746646655;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfY1O/s3//XiDezutAZ+YZQjDJHiIW7idZke0nVrnts=;
        b=MI2GQMhjCwG9RVFwqNvmp23LcuXGShIt9nRDyanUydCiijVWBX/7Li9Ccsu4tZVEJi
         WfZDh/MGQd4xCBSBJGbWMi1HaXdvFj0YSanxGjj40/i+LC3ze4jdd5+pbjEs7Bg6/gIQ
         C+0uBVMeaDMpYGLZw50UhFV1CyWrEQ2xwlcuX+sS+dZHzpr1/ee06UjjT2tXjU3IhXGq
         c/GuDyOgxIm2dLia6SWvnFraZ7GIgE3w9PENhTZngxFC7KpgWR4GR3Adjg3GzYvm+dnn
         OJUEQMzYivucBtiC+zyE5io039II5jQMvtth8BB7TnzpEYjU+nX0zheQrhgHmCsRdYvV
         gxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmDNIUtnACpgHuXQ30fIrL3rtKCcp5cP2KBbglJWlUYRs0Vcdp9/QAUBrj8/rk9Sftft9shIVbYTw7f44=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrwu2ZN0T3yY5fBdj/9g0RZz3hYVqpdwmBC+SJsI1dpNbhehtj
	eloUCQueU30Ec3Kq1pE/Wr8SbzBeUF2z3CCibD09bnwtOAr8iNIF3TdilZJ24tOngTQmb8xaqZT
	RG60XfGN9NJw7eF0Zz8FTeGzeJW/1pD48vZg332n2c37hKj1Ac/qAwdA=
X-Google-Smtp-Source: AGHT+IF7/LYrRW0u0QAZBCK5IqbwaaRGkqLUjHoMM7Mv2096X9bF42E/DB29QmpgJDv4/Jn++cmzeM9oOVXN7pstGWFAJJPYNZXR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1949:b0:3cf:bac5:d90c with SMTP id
 e9e14a558f8ab-3d96f22dd63mr7204205ab.18.1746041855337; Wed, 30 Apr 2025
 12:37:35 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:37:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68127bff.050a0220.3a872c.0007.GAE@google.com>
Subject: [syzbot] [xfs?] BUG: unable to handle kernel paging request in xlog_cil_push_work
From: syzbot <syzbot+8f3eae9a167883ac95d5@syzkaller.appspotmail.com>
To: cem@kernel.org, djwong@kernel.org, linux-kernel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b5737d35364f Merge remote-tracking branch 'will/for-next/p..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13376e98580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=12ccc0a681e19f95
dashboard link: https://syzkaller.appspot.com/bug?extid=8f3eae9a167883ac95d5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/02e0fdf59f95/disk-b5737d35.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9f13fee8534d/vmlinux-b5737d35.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e3a18c045780/Image-b5737d35.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f3eae9a167883ac95d5@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address 001f7fe0001abb51
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[001f7fe0001abb51] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 UID: 0 PID: 12 Comm: kworker/u8:0 Not tainted 6.14.0-rc7-syzkaller-gb5737d35364f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: xfs-cil/loop1 xlog_cil_push_work
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : xlog_cil_build_lv_chain fs/xfs/xfs_log_cil.c:1245 [inline]
pc : xlog_cil_push_work+0xb68/0x25d4 fs/xfs/xfs_log_cil.c:1381
lr : generic_test_bit include/asm-generic/bitops/generic-non-atomic.h:128 [inline]
lr : xlog_cil_build_lv_chain fs/xfs/xfs_log_cil.c:1238 [inline]
lr : xlog_cil_push_work+0xb1c/0x25d4 fs/xfs/xfs_log_cil.c:1381
sp : ffff800097d476e0
x29: ffff800097d47a20 x28: ffff0000db7b5c19 x27: 00ffff0000d5da7c
x26: ffff0000ce2940b0 x25: ffff800097d479d0 x24: dfff800000000000
x23: ffff0000db7b5bf1 x22: 1fffe0001b6f6b83 x21: ffff0000db7b5c01
x20: ffff0000db7b5bc9 x19: dfff800000000000 x18: 0000000000004000
x17: ffff80008fbbd000 x16: ffff8000803b975c x15: 0000000000000001
x14: 1fffe0001a69c720 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000001 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : 001fffe0001abb51 x7 : ffff800081f89378 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff800080482fd8
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00ffff0000d5da8c
Call trace:
 xlog_cil_build_lv_chain fs/xfs/xfs_log_cil.c:1245 [inline] (P)
 xlog_cil_push_work+0xb68/0x25d4 fs/xfs/xfs_log_cil.c:1381 (P)
 process_one_work+0x810/0x1638 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x97c/0xeec kernel/workqueue.c:3400
 kthread+0x65c/0x7b0 kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
Code: 91004360 d2d00013 d343fc08 f2fbfff3 (38f86908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	91004360 	add	x0, x27, #0x10
   4:	d2d00013 	mov	x19, #0x800000000000        	// #140737488355328
   8:	d343fc08 	lsr	x8, x0, #3
   c:	f2fbfff3 	movk	x19, #0xdfff, lsl #48
* 10:	38f86908 	ldrsb	w8, [x8, x24] <-- trapping instruction


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
