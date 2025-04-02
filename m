Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D82AE99
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743552082; cv=none; b=Dj1K9YygH1qD1mp0C89eDY18r8qKz2nqCvWhUtyYOH/ygtex3Uikd4WaY9IH3UqsCK9y1SZuSf2UiDW9t0VYawlr5B/wSQ6bv5EyuwWNS4qRNqtSQCp3xCnm0HqyGBJFq0N2EO90k1WiZTg6ZSgPVBOfDpDuYKfc4Kx98thlEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743552082; c=relaxed/simple;
	bh=TrdRJorLaPVxecxKt48+QFSNFxmprXB5Q212nUNhtk4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=trb/mRF83ytSDdklMxnsWAixXvl6Sj/jNFoIbHZQ5tvkKPQVYoYugdPzyExFZR2Tpw5d0BRJHtjeJbpFL5fwY16fGOqf95+XzvlcMh4WiWk45EXyec34uBYiMKQArZS+NcttVsKWQmnmpXEe3eYXUzPa2yD6DM9kUkbnkDit7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d458e61faaso4502655ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 17:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743552079; x=1744156879;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2uuoYBPvrcOMUlPvf+U/n5iBioNWEJiVRzUmg2n4Ow=;
        b=r7grkadM4o6G0oKfXyXZV6BqVWmj0CjMEQBJRMdLNPq+nwTGq7m//WpzG6Rg2We+bg
         6KdF2RG419qPv6nLFZiqHO/YNGvuB2EKHJimGvq74v/NMysXF0b2K++RiXl9quG3ke1L
         H8IUZGyfID1n+OmIjv8GFzq8FsvzGfTJ38tJmkghaAcTshgoLgM/wE30SmC0MMioDV8Z
         XpNByheCtTWaZZPQ2HPYtbY51RxpaL+7vtEMKwBEvpJZy9Chlpfcfr465EXyf6zU3rGy
         vLYn85GbmNsgBYYUlnslKwgjdF78bW8J01Xg9wCm7itj71oXlrgNhA6Tr3Tioo/UUC6e
         RhDA==
X-Forwarded-Encrypted: i=1; AJvYcCV1U+6lHdIJRjSes9pIVAm3kVd8mEQQ9+XhhUN2f1SSxoJzlVqTE0Xtgjcl+/6bEFsxRkEiqb2klnyEYac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ywL92h4gdkfFoV1AUhv1Yksw4Q9SQ6kVK04iAVvUzhLUIgQ7
	x9NqC9QbEg83t5Wsvya3k/Zs8rVueAYxUXgSx5DdlW1EVNAnh7PS2+wT4Gusxh6aVbce+MbLN21
	EEo7HSHBCHdqZQluSqInSPVUlci38pSxPGpusYI6tl19XDepoMFoZk9A=
X-Google-Smtp-Source: AGHT+IF5KvcqrhDjrqpuCPXMno5jZm/9WvRYSmaawrQ08I4SQxkVTeOjOXwspRamha00hCbcddlVRtDu+OZ7qkZTe0+cBmnMrh2k
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca0d:0:b0:3d3:f72c:8fd8 with SMTP id
 e9e14a558f8ab-3d6d6849f4dmr159265ab.6.1743552079653; Tue, 01 Apr 2025
 17:01:19 -0700 (PDT)
Date: Tue, 01 Apr 2025 17:01:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ec7e4f.050a0220.31979b.0033.GAE@google.com>
Subject: [syzbot] [input?] KCSAN: data-race in uhid_char_poll / uhid_char_read
From: syzbot <syzbot+2775104a59cc23ddff54@syzkaller.appspotmail.com>
To: bentiss@kernel.org, david@readahead.eu, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1e7857b28020 x86: don't re-generate cpufeaturemasks.h so e..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15867bcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bdb65086dcaf0454
dashboard link: https://syzkaller.appspot.com/bug?extid=2775104a59cc23ddff54
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/08333bdf2b6c/disk-1e7857b2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c798f117761a/vmlinux-1e7857b2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a2171375da2b/bzImage-1e7857b2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2775104a59cc23ddff54@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in uhid_char_poll / uhid_char_read

read-write to 0xffff88811229d17d of 1 bytes by task 6915 on cpu 1:
 uhid_char_read+0x373/0x3f0 drivers/hid/uhid.c:711
 do_loop_readv_writev fs/read_write.c:845 [inline]
 vfs_readv+0x3e5/0x660 fs/read_write.c:1018
 do_readv+0xf7/0x230 fs/read_write.c:1078
 __do_sys_readv fs/read_write.c:1163 [inline]
 __se_sys_readv fs/read_write.c:1160 [inline]
 __x64_sys_readv+0x45/0x50 fs/read_write.c:1160
 x64_sys_call+0x2833/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:20
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88811229d17d of 1 bytes by task 6921 on cpu 0:
 uhid_char_poll+0x89/0xc0 drivers/hid/uhid.c:793
 vfs_poll include/linux/poll.h:82 [inline]
 __io_arm_poll_handler+0x1e5/0xd40 io_uring/poll.c:583
 io_poll_add+0x70/0xf0 io_uring/poll.c:893
 __io_issue_sqe io_uring/io_uring.c:1734 [inline]
 io_issue_sqe+0x15f/0xaf0 io_uring/io_uring.c:1753
 io_queue_sqe io_uring/io_uring.c:1969 [inline]
 io_req_task_submit+0x6a/0xc0 io_uring/io_uring.c:1371
 io_poll_task_func+0x74e/0xa70 io_uring/poll.c:-1
 io_handle_tw_list+0xce/0x1d0 io_uring/io_uring.c:1057
 tctx_task_work_run+0x6e/0x1c0 io_uring/io_uring.c:1121
 tctx_task_work+0x44/0x80 io_uring/io_uring.c:1139
 task_work_run+0x13c/0x1b0 kernel/task_work.c:227
 get_signal+0xe81/0x1000 kernel/signal.c:2808
 arch_do_signal_or_restart+0x9a/0x4b0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x62/0x120 kernel/entry/common.c:218
 do_syscall_64+0xd6/0x1c0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x00 -> 0x01

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 6921 Comm: syz.3.927 Not tainted 6.14.0-syzkaller-11144-g1e7857b28020 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
==================================================================


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
