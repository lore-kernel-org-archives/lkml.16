Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927652144DB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731367; cv=none; b=XWNz4yQb63PIqMLfBfh2WHpb3ieuJ4jtOXhMNlNasSC/HPLcgPrza0IR8agbI+9OZq+KnCjCbXMPNqP/4hpFu2kg1MjT3XuEL8zPXFI6T3qhowq/cqPe83sGI/zJIgvpM1L0toYqg69wOLnSxCzmXsy3jJFyXVvTsm8cCQO4Hwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731367; c=relaxed/simple;
	bh=5g/OAhhr9PvtpDZhmmD20C8CSPogmAsBsn62p/L8oF8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tbjc56zUiPs7Ls6EjLoLeJXLSiqBbYigvpHw0fzMMj+DPtXwuXNz+l9iueXlh1xR2wezporM6BoJWT2FoiSrL4ZJFORzBfvFaqnZg+52xG6o2t65IkiozwwwlcM71dSO5/GkAV2WFz36aI1qIYIjW1n1CtCMggeXz85G3Nepmpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d43d333855so44869075ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731364; x=1745336164;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPYApG1ZS64gH63J4NkzSqzZnhQ6BXO3t6exR6o1v/M=;
        b=XyllbxdATnTyRXWp5BpYm+XDq5th9HZwGCt4ACtqCmo/brWqDQn3n52Q1j3CXY6FQo
         KbLs9OCRmXPR9rBmcBLuExa+vulAVtabz1VVMaeUS9ayVUakpoE1N8kdDFzHb2dRSzWm
         A9ow859MZ49R18bhEx/mB2lJZ+kNeO2iaJXpjt7+ilouNPkmf6pCP3jnmilePLGM6rV2
         zZyBDWiTTN49DDugc33NmT59P15D/ITEf4O8UDc+4w5wSnJ9F9uuOjNBWBxex0LFhBi+
         exnv4Xn7HgwigRg+D6st4bJV7pW/mlexA8uyzZ3CArFyPh4ePH89PpW6AeBKnQ4sVl+D
         WHQg==
X-Forwarded-Encrypted: i=1; AJvYcCWvG+ck/IqySvrdIoa6NZWymOnlcGC40ASibM009RQdSwZh36SJZo/rjZ0e0HwAR1dnicN5FPJe7yGt32Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQpxqRRJmLOjqZUWq1YGk0z5wWvuuP5n6y3fkO6PEnK50Wh/a+
	y1tDffEbeCDtTdvDqiMoL5sVS0J3UexF/2dmSkP0/4h1qx3Oi9Gx/xVQC110seOuB1CJPvnQCnF
	QJjN5BjcUGVqg3WU9CkmmD7sYeTHUBHYbRZ6eY0f9xReSorrpOapLP8c=
X-Google-Smtp-Source: AGHT+IF0qWkjJYeWIC7y25k2sLC14ZX6kAAe/R0wG1TBZhmOp3qmfzE5RdWOaSv63TcGuobFWKqZiXO1NTEJHUCBZwEgX8hGhwRJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184e:b0:3d4:36da:19a9 with SMTP id
 e9e14a558f8ab-3d7ec27ca40mr157436325ab.15.1744731364643; Tue, 15 Apr 2025
 08:36:04 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:36:04 -0700
In-Reply-To: <20250415151222.11052-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fe7ce4.050a0220.186b78.0004.GAE@google.com>
Subject: Re: [syzbot] [udf?] possible deadlock in udf_free_blocks
From: syzbot <syzbot+d472c32c5dd4cd2fb5c5@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in udf_free_blocks

============================================
WARNING: possible recursive locking detected
6.15.0-rc2-syzkaller-00037-g834a4a689699 #0 Not tainted
--------------------------------------------
syz.0.53/6250 is trying to acquire lock:
ffff88802863ed28 (&sbi->s_alloc_mutex){+.+.}-{4:4}, at: udf_table_free_blocks fs/udf/balloc.c:375 [inline]
ffff88802863ed28 (&sbi->s_alloc_mutex){+.+.}-{4:4}, at: udf_free_blocks+0xa28/0x22b0 fs/udf/balloc.c:677

but task is already holding lock:
ffff88802863ed28 (&sbi->s_alloc_mutex){+.+.}-{4:4}, at: udf_table_new_block fs/udf/balloc.c:581 [inline]
ffff88802863ed28 (&sbi->s_alloc_mutex){+.+.}-{4:4}, at: udf_new_block+0xf6f/0x21c0 fs/udf/balloc.c:725

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sbi->s_alloc_mutex);
  lock(&sbi->s_alloc_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

4 locks held by syz.0.53/6250:
 #0: ffff88807fe26420 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x220 fs/splice.c:1157
 #1: ffff88806319fbc0 (&sb->s_type->i_mutex_key#21){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #1: ffff88806319fbc0 (&sb->s_type->i_mutex_key#21){+.+.}-{4:4}, at: udf_file_write_iter+0x6d/0x6c0 fs/udf/file.c:95
 #2: ffff88806319f9f0 (&ei->i_data_sem#2){++++}-{4:4}, at: udf_map_block+0x3b9/0x53f0 fs/udf/inode.c:439
 #3: ffff88802863ed28 (&sbi->s_alloc_mutex){+.+.}-{4:4}, at: udf_table_new_block fs/udf/balloc.c:581 [inline]
 #3: ffff88802863ed28 (&sbi->s_alloc_mutex){+.+.}-{4:4}, at: udf_new_block+0xf6f/0x21c0 fs/udf/balloc.c:725

stack backtrace:
CPU: 1 UID: 0 PID: 6250 Comm: syz.0.53 Not tainted 6.15.0-rc2-syzkaller-00037-g834a4a689699 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_deadlock_bug+0x2be/0x2d0 kernel/locking/lockdep.c:3042
 check_deadlock kernel/locking/lockdep.c:3094 [inline]
 validate_chain+0x928/0x24e0 kernel/locking/lockdep.c:3896
 __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 __mutex_lock_common kernel/locking/mutex.c:601 [inline]
 __mutex_lock+0x1d1/0x1150 kernel/locking/mutex.c:746
 udf_table_free_blocks fs/udf/balloc.c:375 [inline]
 udf_free_blocks+0xa28/0x22b0 fs/udf/balloc.c:677
 udf_delete_aext+0x70c/0xed0 fs/udf/inode.c:2373
 udf_table_new_block fs/udf/balloc.c:645 [inline]
 udf_new_block+0x18a6/0x21c0 fs/udf/balloc.c:725
 inode_getblk fs/udf/inode.c:895 [inline]
 udf_map_block+0x1ce5/0x53f0 fs/udf/inode.c:447
 __udf_get_block+0x128/0x410 fs/udf/inode.c:461
 __block_write_begin_int+0x693/0x1930 fs/buffer.c:2116
 block_write_begin+0x8f/0x120 fs/buffer.c:2227
 udf_write_begin+0xfc/0x250 fs/udf/inode.c:256
 generic_perform_write+0x32b/0xa10 mm/filemap.c:4102
 udf_file_write_iter+0x2e7/0x6c0 fs/udf/file.c:111
 iter_file_splice_write+0xbe1/0x1530 fs/splice.c:738
 do_splice_from fs/splice.c:935 [inline]
 direct_splice_actor+0x11d/0x220 fs/splice.c:1158
 splice_direct_to_actor+0x597/0xc90 fs/splice.c:1102
 do_splice_direct_actor fs/splice.c:1201 [inline]
 do_splice_direct+0x281/0x3d0 fs/splice.c:1227
 do_sendfile+0x582/0x8c0 fs/read_write.c:1368
 __do_sys_sendfile64 fs/read_write.c:1429 [inline]
 __se_sys_sendfile64+0x17e/0x1e0 fs/read_write.c:1415
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbb55b85d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbb56933038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fbb55d76080 RCX: 00007fbb55b85d29
RDX: 0000000000000000 RSI: 0000000000000006 RDI: 0000000000000005
RBP: 00007fbb55c01aa8 R08: 0000000000000000 R09: 0000000000000000
R10: 0001000000201005 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fbb55d76080 R15: 00007ffea135d3b8
 </TASK>


Tested on:

commit:         834a4a68 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15bd1a3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5dd916f7ca732ed
dashboard link: https://syzkaller.appspot.com/bug?extid=d472c32c5dd4cd2fb5c5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
