Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B52266B71
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394576; cv=none; b=EnPQc7GorD938MT2scIi6SOz5i9t041+UbMwTopJ+rJZSX2br0DJUvCNhz8vpiH0h59NR8wIELt8+6IAKznQw/vBOxCHrb1eeucvH+11mcSxUqkUKvLK+/j3cN32PnDJC95Pfv6RZbDWnOtFTRxVg0W/+y3OsF78HISGqvcJ+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394576; c=relaxed/simple;
	bh=l8ky2QhzN6LS0wt5qCaExxISA6kghgJvi/mLCOgJFqA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NNvD9Zr01Yqr4GtrGXcCPd5ix4jK8jF27YaEMrIlTNwM7VGiQ2eeU9xspgCPzipzPu93r1rzxZrwt0gzXzaFYhyYZ8OIMYr/6H8FBoJozYFb/N0nQLQ1K7iX8yxa+MxAPsiUYvBQpNXpG1rotiy4/0sRXKAjWVwZ5zvw1n/KmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d8f1c1ce45so92209205ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394574; x=1745999374;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VSKtXzbeEK9AbIC3smKkMKPobrSVNoSlrl9FplPF804=;
        b=hvgLpZ5bNzBEuUxR1dDT74CkIpUbgO5S2r+8JIkgtyRyyXnEKUWnzFKIV76djlR7nq
         NzjuYSS7MpwTzThmlNG8TgQ1j40cJB/3K0GyoI4lLFdVWaV+lAmZgbfke6VoHg7YYFZI
         TH0yUNQXS9/HgGKvdKstpucNFoG5xfv4ceuSJ7fqYUhKYDNFHRNeR87o5vKEydN1kXqx
         CRkjmUy7eeqTfcCzjEXSnC0D69tBh3LUwV/FmfeUTnt8i1H8unH8a+zOFrZAWWoDKyrI
         26mYwp8sffBmkYQ5/bjrrw7/hboZtBxhVRoNOuAYDdRs31XCdE3bGajYGU9QYDjXlqCd
         Yw3g==
X-Forwarded-Encrypted: i=1; AJvYcCWE4HXvpsvW8OndWJwfyY0t79GnvuqwilqU0i8REQUmgTs0PgZfob7cDtb7M3nHmqqeqZ7EAlraIs7UHKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YweW40o0cV+kQlB2JQkUU4dfs+YDdYJ3B3L/wUyjrPFopQXiB/J
	39JzpdsqWos/12zXDUgwxaMrYeGC12RQ68D7Mys/zbXzkRmvHGZQE5yrXWBW+nl3J9F8cHC+qaJ
	LT6eFuTcRn1mBlEDQ04E+c+hmku54dhjDfS2HMl2m2GvmjTp9uz31bSo=
X-Google-Smtp-Source: AGHT+IHvkow66BMhG/TSSICfHddGnFKQ1S6/ST+RAgW16u672roFKspEn7cEMe8LQrIh1dVhqlBlBAWDDVJS8J+NLsZf6ebK+43H
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1648:b0:3d6:d145:2ffb with SMTP id
 e9e14a558f8ab-3d89428c8f1mr216463595ab.21.1745394573985; Wed, 23 Apr 2025
 00:49:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 00:49:33 -0700
In-Reply-To: <675101f3.050a0220.17bd51.0081.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68089b8d.050a0220.36a438.000a.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] INFO: task hung in do_truncate (3)
From: syzbot <syzbot+effe7da6578cd423f98f@syzkaller.appspotmail.com>
To: brauner@kernel.org, chao@kernel.org, jack@suse.cz, jaegeuk@kernel.org, 
	kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    bc3372351d0c Merge tag 'for-6.15-rc3-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=138cdccc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bbffc3b5b4301e1
dashboard link: https://syzkaller.appspot.com/bug?extid=effe7da6578cd423f98f
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17c8ac70580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6c893a6bd7cc/disk-bc337235.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6c31d81cbcae/vmlinux-bc337235.xz
kernel image: https://storage.googleapis.com/syzbot-assets/acf5d144656b/bzImage-bc337235.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/53b1b110f131/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=16d4f204580000)
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/3185ba5a394f/mount_4.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=14ebe7ac580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+effe7da6578cd423f98f@syzkaller.appspotmail.com

INFO: task syz.9.68:6713 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc3-syzkaller-00019-gbc3372351d0c #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.9.68        state:D stack:27592 pid:6713  tgid:6701  ppid:6519   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x1b33/0x51f0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x163/0x360 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 rwsem_down_write_slowpath+0xedd/0x1420 kernel/locking/rwsem.c:1176
 __down_write_common kernel/locking/rwsem.c:1304 [inline]
 __down_write kernel/locking/rwsem.c:1313 [inline]
 down_write+0x1da/0x220 kernel/locking/rwsem.c:1578
 inode_lock include/linux/fs.h:867 [inline]
 do_truncate+0x20e/0x310 fs/open.c:63
 vfs_truncate+0x4a6/0x540 fs/open.c:115
 do_sys_truncate+0xd8/0x190 fs/open.c:138
 __do_sys_truncate fs/open.c:150 [inline]
 __se_sys_truncate fs/open.c:148 [inline]
 __x64_sys_truncate+0x5b/0x70 fs/open.c:148
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6c9918e169
RSP: 002b:00007f6c983dd038 EFLAGS: 00000246 ORIG_RAX: 000000000000004c
RAX: ffffffffffffffda RBX: 00007f6c993b6080 RCX: 00007f6c9918e169
RDX: 0000000000000000 RSI: 0000000000008001 RDI: 00002000000000c0
RBP: 00007f6c99210a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f6c993b6080 R15: 00007ffc2675ba78


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
