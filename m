Received: from mail-qv1-f77.google.com (mail-qv1-f77.google.com [209.85.219.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8BC4400
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146805; cv=none; b=pg6NIuWNCTOg74vspysrh78vMiGpO+9AbaDfbit0aXKNBTPucQQTV3Vv76m7TL7wUDKQDBMvQGdqeVIAJmHEfeTmDXEqsIkQBPHrfqyV+rrsRBvlUqcCbrQqBXwCorNevfH7HQMsSnfvvhKa4TOE5Pf3j5+uvw4xeG20M0gsSKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146805; c=relaxed/simple;
	bh=p2h8bVXfAqrdK2pNUNt8dqwNGWIHa63N9oNTqy83JI4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sSPCF/0SfmyZ1sHTHdPX+mGfrqpwU9RTBUjf67nem+mhyTQ04cKGIg1Umi5DNQeX+ZVkxH50yrcOo/wmBXLoVE8/rZvwyffaMkKnGakYQYa+V1wjHY9jfuKqnjCo6lMhWhM1tQzqYHvWgQJxyP+/d7it2jnEja/M336OHhK4q+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.219.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-qv1-f77.google.com with SMTP id 6a1803df08f44-6fad34d3cd8so18380896d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146803; x=1749751603;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dImjQym7d7b9YjCAVqcDiJr2iidHUk/UARmDlM+j+6E=;
        b=HYpFOWGqNj4NcWJPjPmClk2NISFTKl+F0eLH1rX9xn7CVkv3I806opWNExRyu9NXJb
         sgCzYp3eYiShelqUzGj8yKBna7iKC7OAH9Nrk2OTMMN3modqPnMDL+7ZQrZgUJV4UV3E
         RLrh2LYhmJeEOKUN3EDeWqPp0piopmn34JVHK8oxwqJhUhRpwqiuWS3i1RkbvTh9l71f
         TwE+ufkhrTfoHyWV4sYjFCe3CRVrQSINzF+YrOk7nRVH7GD/CKSFQEPjdN7oEotbFllJ
         1MTDpfJmgcCiScoOG7Z1UFqXYgAwsMjcGTlYY0rKuKyWqHcA7VfPALv+vdO8PXUZ15yS
         Dv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUQptF/0g2v4ulIHpAg/eDQUGDg1x8ISwmdqTVwxf14flVuw8x24jD7WQULti7H9VlFYwNRdoyltmLjjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBW/DHcepInAuWL8+AhSq23ZEiC4IETPKaq/Lkh82HotRLA99G
	T8RDbfdZ/YwOeuXuuCLVXQplAZZ5DvbtDDL66b17GZW4e/hy1WA6Xf788scHyAhL18QcHlOySNY
	qMjZ7ADO9Ys4kw+DuKcEJs/8O8ql3tKLPX8RYtsEDs0f50jH/m6s6Cle16YA=
X-Google-Smtp-Source: AGHT+IF69b7I0bjd5WI/y0hsTfFsRbtkLRNY1fVQJOY3MtlEGrSTCs31itW1/CjOU9TD9Ta27HsfG+f4NcqrUQuSb1J3SCdJOd2q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0f:b0:3dd:c04e:49af with SMTP id
 e9e14a558f8ab-3ddce461a0emr5658455ab.3.1749146792542; Thu, 05 Jun 2025
 11:06:32 -0700 (PDT)
Date: Thu, 05 Jun 2025 11:06:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6841dca8.a00a0220.d4325.0020.GAE@google.com>
Subject: [syzbot] [btrfs?] kernel BUG in populate_free_space_tree
From: syzbot <syzbot+36fae25c35159a763a2a@syzkaller.appspotmail.com>
To: clm@fb.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=17ab4c0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=36fae25c35159a763a2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b79282580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106b4c0c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/643a65f1a5eb/mount_0.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=11f86570580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+36fae25c35159a763a2a@syzkaller.appspotmail.com

BTRFS warning: 'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead
BTRFS info (device loop0 state M): rebuilding free space tree
assertion failed: ret == 0, in fs/btrfs/free-space-tree.c:1102
------------[ cut here ]------------
kernel BUG at fs/btrfs/free-space-tree.c:1102!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 6592 Comm: syz-executor322 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : populate_free_space_tree+0x514/0x518 fs/btrfs/free-space-tree.c:1102
lr : populate_free_space_tree+0x514/0x518 fs/btrfs/free-space-tree.c:1102
sp : ffff8000a4ce7600
x29: ffff8000a4ce76e0 x28: ffff0000c9bc6000 x27: ffff0000ddfff3d8
x26: ffff0000ddfff378 x25: dfff800000000000 x24: 0000000000000001
x23: ffff8000a4ce7660 x22: ffff70001499cecc x21: ffff0000e1d8c160
x20: ffff0000e1cb7800 x19: ffff0000e1d8c0b0 x18: 00000000ffffffff
x17: ffff800092f39000 x16: ffff80008ad27e48 x15: ffff700011e740c0
x14: 1ffff00011e740c0 x13: 0000000000000004 x12: ffffffffffffffff
x11: ffff700011e740c0 x10: 0000000000ff0100 x9 : 94ef24f55d2dbc00
x8 : 94ef24f55d2dbc00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff8000a4ce6f98 x4 : ffff80008f415ba0 x3 : ffff800080548ef0
x2 : 0000000000000000 x1 : 0000000100000000 x0 : 000000000000003e
Call trace:
 populate_free_space_tree+0x514/0x518 fs/btrfs/free-space-tree.c:1102 (P)
 btrfs_rebuild_free_space_tree+0x14c/0x54c fs/btrfs/free-space-tree.c:1337
 btrfs_start_pre_rw_mount+0xa78/0xe10 fs/btrfs/disk-io.c:3074
 btrfs_remount_rw fs/btrfs/super.c:1319 [inline]
 btrfs_reconfigure+0x828/0x2418 fs/btrfs/super.c:1543
 reconfigure_super+0x1d4/0x6f0 fs/super.c:1083
 do_remount fs/namespace.c:3365 [inline]
 path_mount+0xb34/0xde0 fs/namespace.c:4200
 do_mount fs/namespace.c:4221 [inline]
 __do_sys_mount fs/namespace.c:4432 [inline]
 __se_sys_mount fs/namespace.c:4409 [inline]
 __arm64_sys_mount+0x3e8/0x468 fs/namespace.c:4409
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: f0047182 91178042 528089c3 9771d47b (d4210000) 
---[ end trace 0000000000000000 ]---


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
