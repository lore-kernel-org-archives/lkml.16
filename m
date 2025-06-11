Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DA228750B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639334; cv=none; b=YwXRa1ksfhGdJxRQYuq2QiudvrBPx8Gk00SDjDXq3Nfr8+9ur7/JUVs9gJtYp5uvVHqikjLIk8U6JdGxG7It/imEFCPbCJEL79+EOtIr3I5LAHNBb+WFPzxxpXBa/qc4c5nRooL0vu0Mnw+oJRAcj+3dp5SED3n/mTSJzBwmgEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639334; c=relaxed/simple;
	bh=WhkgvwTsr33OhQCjeTO3H4p35RofHKmjwzGgOaOp9MA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BoAt+E/YmfrcoPzTdmpXQb3YFxsupoouzjxxVXuM0E0wVMmbF2EpBPdi+FHZl7Fya0TW/iIyIU0NbN3MEYlOUqaPXWuJIR+LbMrQD2PBpsWJbTuVL+n5+4a3rPnUVtQCSYdG4tvETHyt7tbTXOpe6rzIpNZhCC2TnAyLRS1W32Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-875bd5522e9so71940739f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749639332; x=1750244132;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UThetRNl7XelpSLp4obh0vyJJviwgFSRy5k79cZ4mUw=;
        b=Vl0I0wsxjmr/6GRNhPZe8eojfthw4SBLEmjUOpLECZ3Np/ZoFMHqZAqwVxTBRMS6yK
         e3MGwvpmBWtUXNMweH0jgF2uocviRhKrFH2DEypYO3ZXp0sMtuVAmk9Ii3P9DqZ20Hw1
         EEcwr1EI5SqpWowtHDZvl9y6dkF7XyYxLqCanMkArYnAcHbVKhJcMfcEE+wdOclgytZr
         JsEz4duGMWjn0szxjK/PQLpykjBydQzrOWeExvmHGViSYig5G+0rWx34R8StKF8w/P+Y
         qwgH/F9w4GpZ9bnc3kcBkuGrKsxxOFRWkbdqzYX1HUQ/MdNPp8to7OMUZVRgOyveVpCr
         u43Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs9/Yno4IFJTebg210P1Mepn6kOi7J0RpQ08IpKlwnpN168ahAeKoL6U7L/hFutEDOGZbDkoKCDRtHvGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGyy8TFlaH3nS/Aa4VMsC97Uyjn0fG4B8ZeyWNU7DZUWlALRA
	YgzLccZNCQZ20PyvffeoMk6d9l2wtJYf6OfPsH4hdTzqR7Po3pKbBfgpvPydkv+eaK7k2bnSbtM
	/+C+sZH+exYoXjNQF4OrLMsMXZtxSwXM7xXCO9mOMPRpZPhuDBuuaQmj6Noo=
X-Google-Smtp-Source: AGHT+IEQsMySz54jHIwFpWCvPtXsaJnNd8qTM6XR/Nk0hHSiqo1G9I6aCQcIlZ5VR+NCJxYoix9IdZc2eqQkrAN2FaS8Vuk5ERYl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fec:b0:3dd:e7d7:3e1b with SMTP id
 e9e14a558f8ab-3ddf42e2b6amr31914095ab.18.1749639331960; Wed, 11 Jun 2025
 03:55:31 -0700 (PDT)
Date: Wed, 11 Jun 2025 03:55:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684960a3.a70a0220.27c366.006e.GAE@google.com>
Subject: [syzbot] [gfs2?] general protection fault in gfs2_remove_from_journal
From: syzbot <syzbot+2b66905568f25219e457@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8477ab143069 Merge tag 'iommu-updates-v6.16' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11fd6970580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a01551457d63a4b
dashboard link: https://syzkaller.appspot.com/bug?extid=2b66905568f25219e457
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2718334fb9f8/disk-8477ab14.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4216a14f373e/vmlinux-8477ab14.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9935c74b1923/bzImage-8477ab14.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2b66905568f25219e457@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
CPU: 1 UID: 0 PID: 5822 Comm: syz-executor Not tainted 6.15.0-syzkaller-09113-g8477ab143069 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:gfs2_remove_from_journal+0x3cc/0x6d0 fs/gfs2/meta_io.c:357
Code: 3a 4c 89 e7 e8 e5 61 30 fe eb 30 e8 be 36 cd fd 48 8b 6c 24 10 4c 8d 65 2c 4c 89 e0 48 c1 e8 03 49 be 00 00 00 00 00 fc ff df <42> 0f b6 04 30 84 c0 4c 8b 3c 24 0f 85 aa 01 00 00 41 ff 04 24 48
RSP: 0018:ffffc900041bf538 EFLAGS: 00010217
RAX: 0000000000000005 RBX: ffff88807b341488 RCX: ffff88802f01da00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
RBP: 0000000000000000 R08: ffff88807f3d0c17 R09: 1ffff1100fe7a182
R10: dffffc0000000000 R11: ffffed100fe7a183 R12: 000000000000002c
R13: 0000000000000001 R14: dffffc0000000000 R15: ffff88802271f170
FS:  0000555575d51500(0000) GS:ffff888125d65000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feea2411000 CR3: 0000000056123000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 gfs2_discard fs/gfs2/aops.c:593 [inline]
 gfs2_invalidate_folio+0x579/0x750 fs/gfs2/aops.c:627
 folio_invalidate mm/truncate.c:140 [inline]
 truncate_cleanup_folio+0x2d8/0x430 mm/truncate.c:160
 truncate_inode_pages_range+0x233/0xda0 mm/truncate.c:379
 gfs2_evict_inode+0x87a/0x1000 fs/gfs2/super.c:1441
 evict+0x504/0x9c0 fs/inode.c:810
 gfs2_put_super+0x42b/0x950 fs/gfs2/super.c:619
 generic_shutdown_super+0x135/0x2c0 fs/super.c:643
 kill_block_super+0x44/0x90 fs/super.c:1760
 deactivate_locked_super+0xbc/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1432
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efff6d8fc97
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffe029d33d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007efff6e1089d RCX: 00007efff6d8fc97
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffe029d3490
RBP: 00007ffe029d3490 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffe029d4520
R13: 00007efff6e1089d R14: 000000000007ddec R15: 00007ffe029d4560
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gfs2_remove_from_journal+0x3cc/0x6d0 fs/gfs2/meta_io.c:357
Code: 3a 4c 89 e7 e8 e5 61 30 fe eb 30 e8 be 36 cd fd 48 8b 6c 24 10 4c 8d 65 2c 4c 89 e0 48 c1 e8 03 49 be 00 00 00 00 00 fc ff df <42> 0f b6 04 30 84 c0 4c 8b 3c 24 0f 85 aa 01 00 00 41 ff 04 24 48
RSP: 0018:ffffc900041bf538 EFLAGS: 00010217
RAX: 0000000000000005 RBX: ffff88807b341488 RCX: ffff88802f01da00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
RBP: 0000000000000000 R08: ffff88807f3d0c17 R09: 1ffff1100fe7a182
R10: dffffc0000000000 R11: ffffed100fe7a183 R12: 000000000000002c
R13: 0000000000000001 R14: dffffc0000000000 R15: ffff88802271f170
FS:  0000555575d51500(0000) GS:ffff888125d65000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feea2411000 CR3: 0000000056123000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	3a 4c 89 e7          	cmp    -0x19(%rcx,%rcx,4),%cl
   4:	e8 e5 61 30 fe       	call   0xfe3061ee
   9:	eb 30                	jmp    0x3b
   b:	e8 be 36 cd fd       	call   0xfdcd36ce
  10:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  15:	4c 8d 65 2c          	lea    0x2c(%rbp),%r12
  19:	4c 89 e0             	mov    %r12,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	49 be 00 00 00 00 00 	movabs $0xdffffc0000000000,%r14
  27:	fc ff df
* 2a:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	4c 8b 3c 24          	mov    (%rsp),%r15
  35:	0f 85 aa 01 00 00    	jne    0x1e5
  3b:	41 ff 04 24          	incl   (%r12)
  3f:	48                   	rex.W


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
