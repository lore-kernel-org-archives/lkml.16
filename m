Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8620293B4B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360116; cv=none; b=VGC4aW4bZ3KMsm8vlRo5Z5y/HlGRSq4H0c0Z8yuYQ6yuXRpoBV1N+EFKJxg1OS1PFpB3e36A2uP1rUbJLH1rcnI4koX7Ch0vnGTFHju6f3xWPBLLpCZRWWUq4GEtBDeJfAIJ/1I/GjqRdS46yNdmUfktjYeDFfvczj4J91//e3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360116; c=relaxed/simple;
	bh=BdcRozpMh5XamS/3Rky22G9yMjXlMrX+TsooJQKwUKE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RNHt7JO695cjUQ4epWQGtOfzhC7kopaQkj2xsxoU25IAp6Z5v69HNzttf2pJCXYWTCPDjrw/innm2C2syrBZoxQzax2A9FV82h2zAkVnJhbxIearo8IzW5PEEeXdhUaR/encHJiWywSL4X9F2RkrJhzV/6FQyE7HRnhuGC1QYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d4578fbaf4so37739255ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360114; x=1744964914;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mspE9D6zeHc2ZpttYDmZv4JvJy7d9xVAiCjmcyAGyWw=;
        b=v9bOu4decUwZMH0+H7iCQjNEscxYFPvNjHnd3i92OzNe3JuY4lZBUTI8tQyq5cBE21
         7eMq9CcyC+QTwBsvuh6NqMYgptvP5mY0i8MuJqLGelczUfFIKHzgio1uHvri5sYZEwnt
         n3TG0eOEMwjXYVCdz3j8hSI0vLJusyrvZ3KkTWK7ej/N3uz+xgTyS3pwmgZV95u0+0nL
         r+fTIhFkqtvHCBEKOVfMKWdcU21MJJM3DjI3g+yrRF2fxErsTDhaVh/ifeFXjjD8XZXc
         kPq5rcnM2bBp4eKAeBUNCSyWyqF3PKkcfxK2Z16KgqoiCpp2eDmYRwyOeOB0i7+EJMcq
         UWRg==
X-Forwarded-Encrypted: i=1; AJvYcCVG5AdLG7bC3oeewMUBJzS0ED9f7XzKS72+cqVMqxZx619Lc6nNEnbiwA8/hCHAIdQZoQkdMNfitRa9/5c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy80fD2KK6sWiIGcDZoOsE/Vpdq5xrejxCm62p+iru6OnPB8/N4
	y/subyDi3ElaGGFZR7lrMF6WHca9Uk5XQUYhMV6jRcY5QnWHGTHnQSVSvpVP8BNtue4At9zcvw6
	rY9txxV/h/Dl+4882KHxzgjGLEufhsl58qqYt1LJP3/tpkDfqZfQLoqo=
X-Google-Smtp-Source: AGHT+IH3+I5WCI3vqlNIRDjcsCj8Z19nQyPqROdXvLgFUOnL4Yc7EuzFFOs+PAdYTUCiRy2Qs5kdcTduBaYbImMJNvDCM9Cg3N3q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:339f:b0:3d3:dfa2:4642 with SMTP id
 e9e14a558f8ab-3d7ec229316mr19127035ab.13.1744360114107; Fri, 11 Apr 2025
 01:28:34 -0700 (PDT)
Date: Fri, 11 Apr 2025 01:28:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f8d2b2.050a0220.355867.001c.GAE@google.com>
Subject: [syzbot] [gfs2?] UBSAN: shift-out-of-bounds in gfs2_fill_super
From: syzbot <syzbot+b0018b7468b2af33b4d5@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a4cda136f021 Add linux-next specific files for 20250404
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15dc523f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a257c454bb1afb7
dashboard link: https://syzkaller.appspot.com/bug?extid=b0018b7468b2af33b4d5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/59048bc9c206/disk-a4cda136.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad2ba7306f20/vmlinux-a4cda136.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b3bef7acbf10/bzImage-a4cda136.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b0018b7468b2af33b4d5@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:1172:19
shift exponent 4294967287 is too large for 64-bit type 'unsigned long'
CPU: 1 UID: 0 PID: 6127 Comm: syz.0.42 Not tainted 6.14.0-next-20250404-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3c8/0x420 lib/ubsan.c:492
 gfs2_fill_super+0x255e/0x27b0 fs/gfs2/ops_fstype.c:1172
 get_tree_bdev_flags+0x490/0x5c0 fs/super.c:1636
 gfs2_get_tree+0x54/0x220 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x90/0x2b0 fs/super.c:1759
 do_new_mount+0x2cf/0xb70 fs/namespace.c:3879
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb2fa18e90a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb2fafe2e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fb2fafe2ef0 RCX: 00007fb2fa18e90a
RDX: 0000200000000400 RSI: 0000200000012500 RDI: 00007fb2fafe2eb0
RBP: 0000200000000400 R08: 00007fb2fafe2ef0 R09: 0000000000000102
R10: 0000000000000102 R11: 0000000000000246 R12: 0000200000012500
R13: 00007fb2fafe2eb0 R14: 00000000000125bb R15: 00002000000004c0
 </TASK>
---[ end trace ]---


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
