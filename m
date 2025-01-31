Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8DA1B6CE9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320934; cv=none; b=cW2nM30Iic117H7JCZn7Npr5qhCJrkE0rXI9UJysOtWE+bf2QS+K18QdwpJSpZ4kWSnWH4CxfWpSS74GvUyrTsfP+DBSxLaoFQuK7bSFQSu5EgZ+E58IMukyuNLBhlPSnoNuFslGxziuDwzWifUa/8eLWqQ1zdy7SR9O9QeYX9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320934; c=relaxed/simple;
	bh=L+t7rnM7rmH5q09taXDmcrKhj1PtNfnxnFxPKIUY6Iw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rfyxySfLHU0ECINPP6LTAF8u7WN4tsDTxS0h3bWlIZXr5OWevf5Y8lKlEiw7FtX+/Jr9ik0w+qQBBe3jDwS3Ln+ctHnN4zu8v+GyzmNltlz3XS2Wcp3u92NcCcokJuYQBlUXKLL2Jk3mshjbGdScwCAhUloYlEA/TzCYUE6sSy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d01c66745cso140405ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738320932; x=1738925732;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woC//orRGI2Di/y1i/twZ9EPOn4DcYdlMp3O75UV0P0=;
        b=dWDtLOVW/fH6HgQfYofTzS3ZaqE27utVsv3Oc23RSA10ThQMo2o0Z+OeF77u0akzUj
         bz3p4vfVlDBeCUzyHyUuOIGCpeITeatCsp1sW033xVisb6VjAbdj216pdvVhCJzoniO3
         zBBL86azRYObwYmhH+pgRv5nQgOHUL81Vj1f5o/3PyZkyHeAWmnFSB9oqnrt2X2ziAl+
         6MZm1W1vevcrpyIi6DqdaRQT77+R6sufjzZ5eO2NSGIC1A+QoGylhdZjsrSAEfCBrem+
         +RE4ssCUINDGn4UCdALTPkMKbPXjRrGek0brtjr6C07Fy03vPNSMX/I2RHdLSXRrJWWV
         IIbA==
X-Forwarded-Encrypted: i=1; AJvYcCWnrqf2qCrZRQit3h+kdYMbC63Wvoz4K2nydmO1axOzejJEgzRGO17QZTJtYAm9ZI6UaWFlGe3nP9QJCII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmnmXaSreslOHxd95xjQDG9elkNex1Rx9GmQS2hBmUPWBbpFVb
	365tNfSpZ8F7X3bzuFYAVdmhlZRfH7gIdUkRLXDoAIs7LX2DjmS4yIi6OaXdJIb/3L+2T9sTK62
	xG/2bhFfJ0CZa/nbAMdnxKg55gdaC9VsdmNywBoTYTp3Po7LXRQWffSI=
X-Google-Smtp-Source: AGHT+IHlogUV7bPPu2u+ZrptU9Y3T/DJ1H2T7ER6/oCJbXk42etX8850qUtyzsa3KlEIQphJrrg2IE1ZzYAqP7Imdk4EsDUX2k//
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa7:b0:3cf:cac6:b61d with SMTP id
 e9e14a558f8ab-3cffe4068acmr86739795ab.16.1738320931934; Fri, 31 Jan 2025
 02:55:31 -0800 (PST)
Date: Fri, 31 Jan 2025 02:55:31 -0800
In-Reply-To: <672dbfef.050a0220.69327.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679cac23.050a0220.163cdc.0007.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_look_for_free_space
From: syzbot <syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    1950a0af2d55 Merge tag 'arm64-upstream' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10404518580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cc031f8aa606a448
dashboard link: https://syzkaller.appspot.com/bug?extid=d27edf9f96ae85939222
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=118aab64580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15865ddf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f7a210b6e168/disk-1950a0af.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fffe4bd5b59c/vmlinux-1950a0af.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b5e6fc6340b2/Image-1950a0af.gz.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/8ae15bf11712/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/3b6c55850042/mount_3.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d27edf9f96ae85939222@syzkaller.appspotmail.com

ntfs3(loop3): Different NTFS sector size (4096) and media sector size (512).
ntfs3(loop3): Mark volume as dirty due to NTFS errors
======================================================
WARNING: possible circular locking dependency detected
6.13.0-rc7-syzkaller-g1950a0af2d55 #0 Not tainted
------------------------------------------------------
syz-executor323/6469 is trying to acquire lock:
ffff0000c9402270 (&wnd->rw_lock){++++}-{4:4}, at: ntfs_look_for_free_space+0xe4/0x58c fs/ntfs3/fsntfs.c:362

but task is already holding lock:
ffff0000dca92dc0 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_set_size+0x130/0x200 fs/ntfs3/inode.c:852

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&ni->file.run_lock#2){++++}-{4:4}:
       down_read+0x58/0x2fc kernel/locking/rwsem.c:1524
       run_unpack_ex+0x43c/0x7fc fs/ntfs3/run.c:1119
       ntfs_read_mft fs/ntfs3/inode.c:401 [inline]
       ntfs_iget5+0x15b4/0x2c60 fs/ntfs3/inode.c:537
       dir_search_u+0x298/0x324 fs/ntfs3/dir.c:264
       ntfs_lookup+0x108/0x1f8 fs/ntfs3/namei.c:85
       lookup_open fs/namei.c:3627 [inline]
       open_last_lookups fs/namei.c:3748 [inline]
       path_openat+0xf7c/0x2b14 fs/namei.c:3984
       do_filp_open+0x1e8/0x404 fs/namei.c:4014
       do_sys_openat2+0x124/0x1b8 fs/open.c:1402
       do_sys_open fs/open.c:1417 [inline]
       __do_sys_openat fs/open.c:1433 [inline]
       __se_sys_openat fs/open.c:1428 [inline]
       __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #0 (&wnd->rw_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain kernel/locking/lockdep.c:3904 [inline]
       __lock_acquire+0x34f0/0x7904 kernel/locking/lockdep.c:5226
       lock_acquire+0x23c/0x724 kernel/locking/lockdep.c:5849
       down_write_nested+0x58/0xcc kernel/locking/rwsem.c:1693
       ntfs_look_for_free_space+0xe4/0x58c fs/ntfs3/fsntfs.c:362
       attr_allocate_clusters+0x1dc/0x85c fs/ntfs3/attrib.c:159
       attr_set_size+0x192c/0x3468 fs/ntfs3/attrib.c:574
       ntfs_set_size+0x158/0x200 fs/ntfs3/inode.c:854
       ntfs_extend+0x19c/0x8e8 fs/ntfs3/file.c:409
       ntfs_setattr+0x220/0x95c fs/ntfs3/file.c:826
       notify_change+0x9f0/0xca0 fs/attr.c:552
       do_truncate+0x1c0/0x28c fs/open.c:65
       vfs_truncate+0x2b8/0x360 fs/open.c:111
       do_sys_truncate+0xe8/0x1ac fs/open.c:134
       __do_sys_truncate fs/open.c:146 [inline]
       __se_sys_truncate fs/open.c:144 [inline]
       __arm64_sys_truncate+0x5c/0x70 fs/open.c:144
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ni->file.run_lock#2);
                               lock(&wnd->rw_lock);
                               lock(&ni->file.run_lock#2);
  lock(&wnd->rw_lock);

 *** DEADLOCK ***

4 locks held by syz-executor323/6469:
 #0: ffff0000c9404420 (sb_writers#10){.+.+}-{0:0}, at: mnt_want_write+0x44/0x9c fs/namespace.c:516
 #1: ffff0000dca92fa8 (&sb->s_type->i_mutex_key#18){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:818 [inline]
 #1: ffff0000dca92fa8 (&sb->s_type->i_mutex_key#18){+.+.}-{4:4}, at: do_truncate+0x1ac/0x28c fs/open.c:63
 #2: ffff0000dca92d10 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ni_lock fs/ntfs3/ntfs_fs.h:1110 [inline]
 #2: ffff0000dca92d10 (&ni->ni_lock#3/5){+.+.}-{4:4}, at: ntfs_set_size+0x124/0x200 fs/ntfs3/inode.c:851
 #3: ffff0000dca92dc0 (&ni->file.run_lock#2){++++}-{4:4}, at: ntfs_set_size+0x130/0x200 fs/ntfs3/inode.c:852

stack backtrace:
CPU: 0 UID: 0 PID: 6469 Comm: syz-executor323 Not tainted 6.13.0-rc7-syzkaller-g1950a0af2d55 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x154/0x1c0 kernel/locking/lockdep.c:2074
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain kernel/locking/lockdep.c:3904 [inline]
 __lock_acquire+0x34f0/0x7904 kernel/locking/lockdep.c:5226
 lock_acquire+0x23c/0x724 kernel/locking/lockdep.c:5849
 down_write_nested+0x58/0xcc kernel/locking/rwsem.c:1693
 ntfs_look_for_free_space+0xe4/0x58c fs/ntfs3/fsntfs.c:362
 attr_allocate_clusters+0x1dc/0x85c fs/ntfs3/attrib.c:159
 attr_set_size+0x192c/0x3468 fs/ntfs3/attrib.c:574
 ntfs_set_size+0x158/0x200 fs/ntfs3/inode.c:854
 ntfs_extend+0x19c/0x8e8 fs/ntfs3/file.c:409
 ntfs_setattr+0x220/0x95c fs/ntfs3/file.c:826
 notify_change+0x9f0/0xca0 fs/attr.c:552
 do_truncate+0x1c0/0x28c fs/open.c:65
 vfs_truncate+0x2b8/0x360 fs/open.c:111
 do_sys_truncate+0xe8/0x1ac fs/open.c:134
 __do_sys_truncate fs/open.c:146 [inline]
 __se_sys_truncate fs/open.c:144 [inline]
 __arm64_sys_truncate+0x5c/0x70 fs/open.c:144
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
