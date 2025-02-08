Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E11714B7
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739006066; cv=none; b=DLOQfrOdEgKHnyxv3wuMLfXF9B4ZMsfNMz2pzMqA/V/7q3nTnEqbZlaSpsju1p49sKLIxGTWicSBKkVnOF5fv2icJKrxzFTxErRy3r3A+2ghafX7N9H1BnBNUNWFsvDvDs4dRzb4Alq3NSiwm+2Pg5Jtd1CR1ThNm0lHORVNZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739006066; c=relaxed/simple;
	bh=n6fptjxBHrz85jUk6eIQqKIsmDKaYKzCFFYl+I+rExI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HmEAEdjWDkBWhcIVVFnt+jXKt7pg3byk6HxKLKaAZoh1lplbSM8g2Wo20UPgWVhpz4Jf3giwjMe2//eju6kn2lauVZoiTbknb/9pAe0SsUbQddhEhDlcvzA0I9tZlvnC9fTWUOK4EoDCzBGYje1dvD4EVrVa4tv1muZMjDAosro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d13f29ca32so27083975ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 01:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739006064; x=1739610864;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uPZ/v3ZQp/gDPQ1FLSdSp6+MDO7HLj3XWRzPD2xDY=;
        b=fgKv5g33Bq0sR5aaWxumciS2C2+LymIuhajnAC1X6riQJBdMNLFWhGpF4rKh/7wGRj
         Fqbvbu61xoEkuSuqG87H2GAgIF4FuZtal5tVf9rjFiP3VqhTizODGXvetLTIzwsaVh0X
         Bse35TP++WeWcU9TMdRClmw7M/ikHjXHbjljRmvJriESVGM1eRK4VE6/oxhoIVZez06o
         FBPMDjiOAta9Hvs6I7xFPa8pHEQsQ5m3lxOOJEG0KS02hvQUN3mFy2/kqn/kRfhktUHK
         iaofHqcZ1ksiPB5UsQwL4g+VUN1yfAeDyA9GGsKwen8GycW6hMjGKqvUCGQ63MGDNlPr
         vLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4fpz/IV8PkNMZwIAInMTxmzgZW91qDc3ahjOj9OE7SWXKMMUGUjJY1iaKoLipBkR3hTdXNeIfrTXJlT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAU6E67QrAaG3+0V9DTXzChQbeTNoU1XKDbM/OIz43XSK9qZgS
	lxJeDPkmFbyZ6/S8Tmabhse3C8nkI1bxn78iQOng71Nwdmvgy5Sdzh3xZHHnJ2riBFEz/usaKge
	DGNl0iKv99pbj4PLAx7g4MtVFwfXbeVoYZWo8cjdmoxSWu+eVPbtZLjE=
X-Google-Smtp-Source: AGHT+IHXWZnOnBt6UZeko8QiTA5a/vt4KTNoeWbDqvFNTpI+NaKHNscpiK0Mi8mJwl/Bmuvc2NK7mCDMAaQ8Tr5WbOE4J2Nzd1ii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2163:b0:3d0:4b06:def3 with SMTP id
 e9e14a558f8ab-3d13dd645efmr49165885ab.10.1739006064152; Sat, 08 Feb 2025
 01:14:24 -0800 (PST)
Date: Sat, 08 Feb 2025 01:14:24 -0800
In-Reply-To: <66f9024f.050a0220.aab67.0010.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a72070.050a0220.3d72c.0022.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] possible deadlock in bch2_symlink
From: syzbot <syzbot+7836a68852a10ec3d790@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    7ee983c850b4 Merge tag 'drm-fixes-2025-02-08' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17375ca4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1909f2f0d8e641ce
dashboard link: https://syzkaller.appspot.com/bug?extid=7836a68852a10ec3d790
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e0cca4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=155361b0580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-7ee983c8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f2f78699fc41/vmlinux-7ee983c8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ca55e6e8dd01/bzImage-7ee983c8.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/aa79c539b21d/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7836a68852a10ec3d790@syzkaller.appspotmail.com

bcachefs (loop0): reading snapshots table
bcachefs (loop0): reading snapshots done
bcachefs (loop0): done starting filesystem
============================================
WARNING: possible recursive locking detected
6.14.0-rc1-syzkaller-00181-g7ee983c850b4 #0 Not tainted
--------------------------------------------
syz-executor294/5305 is trying to acquire lock:
ffff888044775078 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: inode_lock include/linux/fs.h:877 [inline]
ffff888044775078 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: bch2_symlink+0x176/0x310 fs/bcachefs/fs.c:839

but task is already holding lock:
ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: inode_lock include/linux/fs.h:877 [inline]
ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_copy_up_workdir fs/overlayfs/copy_up.c:782 [inline]
ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_do_copy_up fs/overlayfs/copy_up.c:1001 [inline]
ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_copy_up_one fs/overlayfs/copy_up.c:1202 [inline]
ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_copy_up_flags+0x19cb/0x47c0 fs/overlayfs/copy_up.c:1257

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sb->s_type->i_mutex_key#16);
  lock(&sb->s_type->i_mutex_key#16);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

7 locks held by syz-executor294/5305:
 #0: ffff88801df94420 (sb_writers#10){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:547
 #1: ffff88804470de50 (&ovl_i_mutex_dir_key[depth]/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:912 [inline]
 #1: ffff88804470de50 (&ovl_i_mutex_dir_key[depth]/1){+.+.}-{4:4}, at: lock_rename fs/namei.c:3217 [inline]
 #1: ffff88804470de50 (&ovl_i_mutex_dir_key[depth]/1){+.+.}-{4:4}, at: do_renameat2+0x62c/0x13f0 fs/namei.c:5161
 #2: ffff88804470e418 (&ovl_i_mutex_key[depth]){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:877 [inline]
 #2: ffff88804470e418 (&ovl_i_mutex_key[depth]){+.+.}-{4:4}, at: lock_two_nondirectories+0xe1/0x170 fs/inode.c:1281
 #3: ffff88804470e9e0 (&ovl_i_mutex_key[depth]/4){+.+.}-{4:4}, at: vfs_rename+0x6a2/0xf00 fs/namei.c:5040
 #4: ffff88804470e7d0 (&ovl_i_lock_key[depth]){+.+.}-{4:4}, at: ovl_inode_lock_interruptible fs/overlayfs/overlayfs.h:650 [inline]
 #4: ffff88804470e7d0 (&ovl_i_lock_key[depth]){+.+.}-{4:4}, at: ovl_copy_up_start+0x53/0x310 fs/overlayfs/util.c:727
 #5: ffff8880477b0420 (sb_writers#9){.+.+}-{0:0}, at: ovl_copy_up_workdir fs/overlayfs/copy_up.c:781 [inline]
 #5: ffff8880477b0420 (sb_writers#9){.+.+}-{0:0}, at: ovl_do_copy_up fs/overlayfs/copy_up.c:1001 [inline]
 #5: ffff8880477b0420 (sb_writers#9){.+.+}-{0:0}, at: ovl_copy_up_one fs/overlayfs/copy_up.c:1202 [inline]
 #5: ffff8880477b0420 (sb_writers#9){.+.+}-{0:0}, at: ovl_copy_up_flags+0x19b4/0x47c0 fs/overlayfs/copy_up.c:1257
 #6: ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: inode_lock include/linux/fs.h:877 [inline]
 #6: ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_copy_up_workdir fs/overlayfs/copy_up.c:782 [inline]
 #6: ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_do_copy_up fs/overlayfs/copy_up.c:1001 [inline]
 #6: ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_copy_up_one fs/overlayfs/copy_up.c:1202 [inline]
 #6: ffff888044774148 (&sb->s_type->i_mutex_key#16){++++}-{4:4}, at: ovl_copy_up_flags+0x19cb/0x47c0 fs/overlayfs/copy_up.c:1257

stack backtrace:
CPU: 0 UID: 0 PID: 5305 Comm: syz-executor294 Not tainted 6.14.0-rc1-syzkaller-00181-g7ee983c850b4 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_deadlock_bug+0x483/0x620 kernel/locking/lockdep.c:3039
 check_deadlock kernel/locking/lockdep.c:3091 [inline]
 validate_chain+0x15e2/0x5920 kernel/locking/lockdep.c:3893
 __lock_acquire+0x1397/0x2100 kernel/locking/lockdep.c:5228
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5851
 down_write+0x99/0x220 kernel/locking/rwsem.c:1577
 inode_lock include/linux/fs.h:877 [inline]
 bch2_symlink+0x176/0x310 fs/bcachefs/fs.c:839
 vfs_symlink+0x137/0x2e0 fs/namei.c:4671
 ovl_do_symlink+0x85/0xd0 fs/overlayfs/overlayfs.h:267
 ovl_create_real+0x346/0x550 fs/overlayfs/dir.c:206
 ovl_copy_up_workdir fs/overlayfs/copy_up.c:783 [inline]
 ovl_do_copy_up fs/overlayfs/copy_up.c:1001 [inline]
 ovl_copy_up_one fs/overlayfs/copy_up.c:1202 [inline]
 ovl_copy_up_flags+0x19fe/0x47c0 fs/overlayfs/copy_up.c:1257
 ovl_rename+0x62a/0x1760 fs/overlayfs/dir.c:1150
 vfs_rename+0xbdb/0xf00 fs/namei.c:5069
 do_renameat2+0xd94/0x13f0 fs/namei.c:5226
 __do_sys_rename fs/namei.c:5273 [inline]
 __se_sys_rename fs/namei.c:5271 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5271
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0d8dddad19
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd9dbea2d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 0031656c69662f2e RCX: 00007f0d8dddad19
RDX: 00007f0d8dddad19 RSI: 0000400000000840 RDI: 0000400000000800
RBP: 0031656c69662f2e R08: 000055558454d4c0 R09: 000055558454d4c0
R10: 000055558454d4c0 R11: 0000000000000246 R12: 00007ffd9dbea300
R13: 00007ffd9dbea528 R14: 431bde82d7b634db R15: 00007f0d8de2303b
 </TASK>
syz-executor294 (5305) used greatest stack depth: 10768 bytes left


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
