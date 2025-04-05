Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BAC148FE6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743871265; cv=none; b=OI3HNmgK05QMYqAeA+By1xY7Uv3d9hJHWHIcvYyaDldhC8rYa4dZ6BYc1HXEFV3p/IxEqKTIjKw7mIcfV31hoSan0m9BuWLLNeze4a2SLgnSnjmS2/irPKfHlh5S7lrNOPBYf7GLAFmWVw7yHNzr+Y852Zzu5WbjnrWo+8rZzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743871265; c=relaxed/simple;
	bh=Wi1zXJuu0EpxebXp4YZuq9S/jUxxwx+NeW+ChMWDk2k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bTGobcN9ogjlJe8cyItVjmy0IJIEJnyhZI1+2RzIroh+U93Djls9cTkR7yOR7IrfxKdaaMfF5bb+KLOyJHgCBswpGtNdidKvq/wFcAA+ONX3rYor+vIoyS53sZ4ktiApZBXdwaWnIQhRfc+9Sfa6PSYcNt4l3T2JHdSrROKwBLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5da4fd946so62448075ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 09:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743871262; x=1744476062;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZTTV880KNljTGyZvXnRSqRqeFoZe/G1FVCwNvgjteQ=;
        b=fJGfbcbBqj9Sj0s4XSc3CjnWZlrUuuWogvvDjhtmBd8pTc15OBRIKPhvOiNmS5lk2x
         5pBOvmsBm2h5Yz2rtD5yywedXfiiW3l1n7vxSsGfsBRW336TeCmdU9xOgVrI1fR7FxcL
         kz1YHQXJI1vbuGKUNflp5S4KwE56qn1OwOoY4tAZnbuGn8vy2h+5PiWbnW7pqC+brDiJ
         jfyMp0HPIh6yD5fJkkNK7+t5Gmu+RZIP49j6DeqsDy9wgVmv+uo2s//FwNvctWO2LX8I
         DoGh6s1A2W4/jGMf9fH3rNyjahWD2PB9MVoYINGtGcW7ufV9AWaYKSFuNwqtUOXVFhYS
         qSkQ==
X-Gm-Message-State: AOJu0Yz/Q2Up1GPnQtxd12MYl82uDhSFi/PEGHKb6CyVJfKETsqvN3cd
	yPzeNuLm2TPxU7fiIZYtxZaD/yGS9X4RasVxoG8A23Gojoa8wyU/TdqoYPm6dL7PV8lzbfRxv6v
	zJgqSBQO3hesHG5KFPAMiN9yFiiv5EkgUM/y/bZwscVmtFz3WG1QPRmA=
X-Google-Smtp-Source: AGHT+IEgpi4mzYlbhipkT0bVGpVehav5fWRQeRaZhQvueIcY+C7J2FLg2smp1VxZQDwRdh4fIjM4kYRzrFVcVdsHiRXagA+5E0eE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2484:b0:3d5:8923:faa5 with SMTP id
 e9e14a558f8ab-3d6ec536c51mr34147445ab.10.1743871262748; Sat, 05 Apr 2025
 09:41:02 -0700 (PDT)
Date: Sat, 05 Apr 2025 09:41:02 -0700
In-Reply-To: <20250405161353.1209514-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f15d1e.050a0220.0a13.0241.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] kernel BUG in bch2_journal_replay (2)
From: syzbot <syzbot+a3885f6d294f83923567@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in bch2_journal_replay

bcachefs (loop0): bch2_btree_update_start(): error EIO
bcachefs: replay_now_at() seq = 4294967295, replay_journal_seq = 18374686479671623691
------------[ cut here ]------------
kernel BUG at fs/bcachefs/recovery.c:131!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5813 Comm: syz.0.16 Not tainted 6.13.0-rc7-syzkaller-00160-gad26fc09dabf-dirty #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:replay_now_at fs/bcachefs/recovery.c:131 [inline]
RIP: 0010:bch2_journal_replay+0x2ae5/0x2b10 fs/bcachefs/recovery.c:347
Code: fd 90 0f 0b e8 8c 9d 54 fd 90 0f 0b e8 84 9d 54 fd 90 0f 0b e8 7c 9d 54 fd 90 0f 0b e8 74 9d 54 fd 90 0f 0b e8 6c 9d 54 fd 90 <0f> 0b e8 64 9d 54 fd 90 0f 0b e8 5c 9d 54 fd 90 0f 0b e8 54 9d 54
RSP: 0018:ffffc900028d7180 EFLAGS: 00010293
RAX: ffffffff844ae504 RBX: ff0000000000000b RCX: ffff888000c9a440
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ff0000000000000b
RBP: ffffc900028d7478 R08: ffffffff844adb29 R09: 1ffff9200051adcc
R10: dffffc0000000000 R11: fffff5200051adcd R12: ffff88804b4cabb8
R13: dffffc0000000000 R14: ffff88804b4cabc0 R15: 00000000ffffffff
FS:  00007ff25c6246c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055bfa0a02048 CR3: 000000003f8a4000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 bch2_run_recovery_pass+0xf0/0x1e0 fs/bcachefs/recovery_passes.c:191
 bch2_run_recovery_passes+0x3a7/0x880 fs/bcachefs/recovery_passes.c:244
 bch2_fs_recovery+0x25cc/0x39d0 fs/bcachefs/recovery.c:862
 bch2_fs_start+0x356/0x5b0 fs/bcachefs/super.c:1037
 bch2_fs_get_tree+0xd68/0x1710 fs/bcachefs/fs.c:2170
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3511
 do_mount fs/namespace.c:3851 [inline]
 __do_sys_mount fs/namespace.c:4061 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4038
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff25b7874ca
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff25c623e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ff25c623ef0 RCX: 00007ff25b7874ca
RDX: 00000000200058c0 RSI: 0000000020000140 RDI: 00007ff25c623eb0
RBP: 00000000200058c0 R08: 00007ff25c623ef0 R09: 0000000000004800
R10: 0000000000004800 R11: 0000000000000246 R12: 0000000020000140
R13: 00007ff25c623eb0 R14: 0000000000005a31 R15: 0000000020000180
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:replay_now_at fs/bcachefs/recovery.c:131 [inline]
RIP: 0010:bch2_journal_replay+0x2ae5/0x2b10 fs/bcachefs/recovery.c:347
Code: fd 90 0f 0b e8 8c 9d 54 fd 90 0f 0b e8 84 9d 54 fd 90 0f 0b e8 7c 9d 54 fd 90 0f 0b e8 74 9d 54 fd 90 0f 0b e8 6c 9d 54 fd 90 <0f> 0b e8 64 9d 54 fd 90 0f 0b e8 5c 9d 54 fd 90 0f 0b e8 54 9d 54
RSP: 0018:ffffc900028d7180 EFLAGS: 00010293
RAX: ffffffff844ae504 RBX: ff0000000000000b RCX: ffff888000c9a440
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: ff0000000000000b
RBP: ffffc900028d7478 R08: ffffffff844adb29 R09: 1ffff9200051adcc
R10: dffffc0000000000 R11: fffff5200051adcd R12: ffff88804b4cabb8
R13: dffffc0000000000 R14: ffff88804b4cabc0 R15: 00000000ffffffff
FS:  00007ff25c6246c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055bfa0a02048 CR3: 000000003f8a4000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         ad26fc09 Merge tag 'mm-hotfixes-stable-2025-01-16-21-1..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14532b4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aadf89e2f6db86cc
dashboard link: https://syzkaller.appspot.com/bug?extid=a3885f6d294f83923567
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175e423f980000

