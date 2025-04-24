Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D61914F9EB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507680; cv=none; b=DqenTBxP92HTiJniR6ioG+DvE0zBTdTS2QYIAJc15+z6inAKA1Q6SnOeLZezgH/MnYPv0cut5pUL/Tc96hfwK91HYPtC+S0xAjwcAE5EEaMz1yPoajlha2gpJoFOaJszTJ3Z2qmIGOXmfSeK2jJ74hwCX3o38G15dAGqTrU46c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507680; c=relaxed/simple;
	bh=F83ZGtpeAhQMmjQHgvxLPobSHGwX1ybrIycXCR0AAW0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=i6xm72Ay8u6TUvGBGAaB/FPAbdtuwvr/vflKt3PqfZmbQR5SU0WLHOT3aCOLUIxeaueUUGU206V0MAUGoZnA/Q3cslgbAJMCnsnil2GSRUavBPUVFtt5YRnfolnsXJjrKr5py7h1EPvTKygq14bisGUNuDT6DOu5A+OKn2AhbXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d81bc8ec0cso19464995ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745507677; x=1746112477;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCTNtRpOC1tXnYp4r4zMym/GObnKUJqixWzZUSHA8BU=;
        b=KjKNdQArE1assQQisx1iRbkplrowBE0ybYXjXm1p9L808olvsB7Nvqi8iuExvvjxrt
         IspKVkk3W+7D3QQOj1tGAbu9L3ichBCafqy2cW5MRZMyjZi+TKqn9sCeaS/2Jse2M7kV
         +2fV8dtCHxQFPq+ePDhqLJyYkRjQI7CD9S5fU2azYAyDg5Ki9THdyC8VIDzmydwMyMS/
         FFT0St5eYqeJKWTZrKB7SZ4Yn2ca5bUQaLXLqsdHrFpJkeBLGa62HZWdW0hURKNKve9t
         u7U9q3NzmmBQtm7Cf6xqKSjDL7P+/VvEdys5AJbit1xyRJRbCRM9bZGg7pm04Y0ZZUco
         l7MA==
X-Forwarded-Encrypted: i=1; AJvYcCX6N4JpbV3EWlLr/vwkdflE/Kpeim51m8M/x6uKrMLcVEcaDfkQ8D3LjA/FI6I81ceji5F8A8/UdO+G85M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbJRSkZqYebi6RFI+9VM7dpCaRuE3GoruA1CeTZL00pAFUfKn
	wORhrBrY9mkFxsGdNpiZM1AdrQgvCKxy7QAWMCOxF7TASjfhz+ZpmptCrdLLegQFgLg20XoEOWa
	3HrNPk/pOoy94PSsy/sSfyJeniaIwBUEHibQezAG+8SHIxxEzoJn8txU=
X-Google-Smtp-Source: AGHT+IEq6qtVMICZP3MYovK41x/y4zHLnW8cGYzd070qkVcHZEC/TOVNh/LsBqOrCXog/t+H1Bi3CplRCQ98zo8YZYdZajCyE3gU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fcc:b0:3d8:1d0e:5325 with SMTP id
 e9e14a558f8ab-3d9303b49b0mr31863475ab.6.1745507677581; Thu, 24 Apr 2025
 08:14:37 -0700 (PDT)
Date: Thu, 24 Apr 2025 08:14:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680a555d.050a0220.2c0118.0c50.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in devtmpfs_submit_req (2)
From: syzbot <syzbot+e717f882731ad24f6c35@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6fea5fabd332 Merge tag 'mm-hotfixes-stable-2025-04-19-21-2..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1370f4cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a7c679f880028f0
dashboard link: https://syzkaller.appspot.com/bug?extid=e717f882731ad24f6c35
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12664c70580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/aa4afa0ae818/disk-6fea5fab.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/28ce64f489ba/vmlinux-6fea5fab.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f73afd414812/bzImage-6fea5fab.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e717f882731ad24f6c35@syzkaller.appspotmail.com

INFO: task udevd:5828 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:udevd           state:D stack:24744 pid:5828  tgid:5828  ppid:5198   task_flags:0x400140 flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 devtmpfs_submit_req+0xa8/0x100 drivers/base/devtmpfs.c:122
 devtmpfs_create_node+0x18a/0x230 drivers/base/devtmpfs.c:153
 device_add+0x10bd/0x1a70 drivers/base/core.c:3640
 add_disk_fwnode+0x468/0x13a0 block/genhd.c:473
 add_disk include/linux/blkdev.h:779 [inline]
 loop_add+0x909/0xb70 drivers/block/loop.c:2033
 loop_probe+0x70/0x90 drivers/block/loop.c:2078
 blk_probe_dev+0x116/0x1a0 block/genhd.c:823
 blk_request_module+0x16/0xb0 block/genhd.c:836
 blkdev_get_no_open+0x7a/0xe0 block/bdev.c:787
 bdev_statx+0x98/0x5c0 block/bdev.c:1288
 vfs_getattr_nosec+0x38d/0x430 fs/stat.c:224
 vfs_getattr fs/stat.c:259 [inline]
 vfs_statx_path fs/stat.c:296 [inline]
 vfs_statx+0x1a3/0x3e0 fs/stat.c:353
 vfs_fstatat+0x7b/0xf0 fs/stat.c:372
 __do_sys_newfstatat+0xa1/0x130 fs/stat.c:536
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff797f165f4
RSP: 002b:00007ffeab0f9008 EFLAGS: 00000202 ORIG_RAX: 0000000000000106
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff797f165f4
RDX: 00007ffeab0f9038 RSI: 0000563aab51c080 RDI: 00000000ffffff9c
RBP: 0000000000000006 R08: 00000000ffffffff R09: 0000563aab512a90
R10: 0000000000000100 R11: 0000000000000202 R12: 00000000000061b0
R13: 00000000000061b0 R14: 0000563aab51c080 R15: 0000563aab6f5f80
 </TASK>
INFO: task syz-executor:5941 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:23688 pid:5941  tgid:5941  ppid:1      task_flags:0x400140 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 rwsem_down_read_slowpath+0x62f/0xb60 kernel/locking/rwsem.c:1084
 __down_read_common kernel/locking/rwsem.c:1248 [inline]
 __down_read kernel/locking/rwsem.c:1261 [inline]
 down_read+0xef/0x480 kernel/locking/rwsem.c:1526
 inode_lock_shared include/linux/fs.h:877 [inline]
 open_last_lookups fs/namei.c:3799 [inline]
 path_openat+0x88a/0x2d40 fs/namei.c:4036
 do_filp_open+0x20b/0x470 fs/namei.c:4066
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0adbb8cad0
RSP: 002b:00007fff0de8c030 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f0adbb8cad0
RDX: 0000000000000002 RSI: 00007fff0de8c140 RDI: 00000000ffffff9c
RBP: 00007fff0de8c140 R08: 0000000000000000 R09: 00007fff0de8bdf7
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000037
R13: 000055558bbe5590 R14: 000000000002e3fc R15: 00007fff0de8c140
 </TASK>
INFO: task udevd:6277 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:udevd           state:D stack:26568 pid:6277  tgid:6277  ppid:5198   task_flags:0x400140 flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 __mutex_lock_common kernel/locking/mutex.c:678 [inline]
 __mutex_lock+0x6c7/0xb90 kernel/locking/mutex.c:746
 blk_probe_dev+0x25/0x1a0 block/genhd.c:820
 blk_request_module+0x16/0xb0 block/genhd.c:836
 blkdev_get_no_open+0x7a/0xe0 block/bdev.c:787
 blkdev_open+0x13c/0x3f0 block/fops.c:645
 do_dentry_open+0x741/0x1c10 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3880 [inline]
 path_openat+0x1e5e/0x2d40 fs/namei.c:4039
 do_filp_open+0x20b/0x470 fs/namei.c:4066
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff797f169a4
RSP: 002b:00007ffeab0f9510 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000563aab50edd0 RCX: 00007ff797f169a4
RDX: 00000000000a0800 RSI: 0000563aab519980 RDI: 00000000ffffff9c
RBP: 0000563aab519980 R08: 00000000ffffffff R09: 00007ff798442000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000a0800
R13: 0000563aab538aa0 R14: 0000000000000001 R15: 0000563aab5032c0
 </TASK>
INFO: task syz.1.304:7440 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.304       state:D stack:27944 pid:7440  tgid:7418  ppid:5940   task_flags:0x400140 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 devtmpfs_submit_req+0xa8/0x100 drivers/base/devtmpfs.c:122
 devtmpfs_create_node+0x18a/0x230 drivers/base/devtmpfs.c:153
 device_add+0x10bd/0x1a70 drivers/base/core.c:3640
 add_disk_fwnode+0x468/0x13a0 block/genhd.c:473
 add_disk include/linux/blkdev.h:779 [inline]
 loop_add+0x909/0xb70 drivers/block/loop.c:2033
 loop_control_get_free drivers/block/loop.c:2145 [inline]
 loop_control_ioctl+0x239/0x630 drivers/block/loop.c:2160
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb6adf8e169
RSP: 002b:00007fb6aed2c038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb6ae1b6160 RCX: 00007fb6adf8e169
RDX: 0000000000000000 RSI: 0000000000004c82 RDI: 0000000000000006
RBP: 00007fb6ae010a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fb6ae1b6160 R15: 00007ffd4013a468
 </TASK>
INFO: task syz.2.306:7431 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.306       state:D stack:26872 pid:7431  tgid:7423  ppid:5943   task_flags:0x480140 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 devtmpfs_submit_req+0xa8/0x100 drivers/base/devtmpfs.c:122
 devtmpfs_delete_node+0xf6/0x160 drivers/base/devtmpfs.c:171
 device_del+0x734/0x9f0 drivers/base/core.c:3834
 del_gendisk+0x486/0xc40 block/genhd.c:734
 loop_remove drivers/block/loop.c:2061 [inline]
 loop_control_remove drivers/block/loop.c:2120 [inline]
 loop_control_ioctl+0x4eb/0x630 drivers/block/loop.c:2158
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa254d8e169
RSP: 002b:00007fa253ffe038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa254fb6160 RCX: 00007fa254d8e169
RDX: 0000000000000000 RSI: 0000000000004c81 RDI: 0000000000000006
RBP: 00007fa254e10a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fa254fb6160 R15: 00007ffcf2b4df88
 </TASK>
INFO: task syz.0.307:7438 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.307       state:D stack:27080 pid:7438  tgid:7432  ppid:5938   task_flags:0x400140 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 devtmpfs_submit_req+0xa8/0x100 drivers/base/devtmpfs.c:122
 devtmpfs_create_node+0x18a/0x230 drivers/base/devtmpfs.c:153
 device_add+0x10bd/0x1a70 drivers/base/core.c:3640
 add_disk_fwnode+0x468/0x13a0 block/genhd.c:473
 add_disk include/linux/blkdev.h:779 [inline]
 loop_add+0x909/0xb70 drivers/block/loop.c:2033
 loop_control_get_free drivers/block/loop.c:2145 [inline]
 loop_control_ioctl+0x239/0x630 drivers/block/loop.c:2160
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd0d38e169
RSP: 002b:00007fcd0e12a038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fcd0d5b6160 RCX: 00007fcd0d38e169
RDX: 0000000000000000 RSI: 0000000000004c82 RDI: 0000000000000006
RBP: 00007fcd0d410a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fcd0d5b6160 R15: 00007fff4040fcf8
 </TASK>
INFO: task syz.4.308:7436 blocked for more than 145 seconds.
      Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.308       state:D stack:25672 pid:7436  tgid:7434  ppid:5950   task_flags:0x400140 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x257/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common+0x2fc/0x4e0 kernel/sched/completion.c:116
 devtmpfs_submit_req+0xa8/0x100 drivers/base/devtmpfs.c:122
 devtmpfs_create_node+0x18a/0x230 drivers/base/devtmpfs.c:153
 device_add+0x10bd/0x1a70 drivers/base/core.c:3640
 add_disk_fwnode+0x468/0x13a0 block/genhd.c:473
 add_disk include/linux/blkdev.h:779 [inline]
 loop_add+0x909/0xb70 drivers/block/loop.c:2033
 loop_control_get_free drivers/block/loop.c:2145 [inline]
 loop_control_ioctl+0x239/0x630 drivers/block/loop.c:2160
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7bd798e169
RSP: 002b:00007f7bd6bdd038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f7bd7bb6080 RCX: 00007f7bd798e169
RDX: 0000000000000000 RSI: 0000000000004c82 RDI: 0000000000000006
RBP: 00007f7bd7a10a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f7bd7bb6080 R15: 00007ffe1a471c98
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/u8:0/12:
 #0: ffff88801b481148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc90000117d18 ((linkwatch_work).work){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
 #2: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: linkwatch_event+0x51/0xc0 net/core/link_watch.c:303
2 locks held by kdevtmpfs/26:
 #0: ffff88801c6d8950 (&type->i_mutex_dir_key/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #0: ffff88801c6d8950 (&type->i_mutex_dir_key/1){+.+.}-{4:4}, at: __kern_path_locked+0x132/0x2a0 fs/namei.c:2765
 #1: ffffffff8eef4368 (major_names_lock){+.+.}-{4:4}, at: blk_probe_dev+0x25/0x1a0 block/genhd.c:820
1 lock held by khungtaskd/31:
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e3bf5c0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x36/0x1c0 kernel/locking/lockdep.c:6764
3 locks held by kworker/u8:4/62:
 #0: ffff88814d4a5948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc90001547d18 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
 #2: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #2: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_verify_work+0x12/0x30 net/ipv6/addrconf.c:4735
3 locks held by kworker/1:2/871:
 #0: ffff88801b478d48 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x12a2/0x1b70 kernel/workqueue.c:3213
 #1: ffffc9000320fd18 (deferred_process_work){+.+.}-{0:0}, at: process_one_work+0x929/0x1b70 kernel/workqueue.c:3214
 #2: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: switchdev_deferred_process_work+0xe/0x20 net/switchdev/switchdev.c:104
2 locks held by getty/5587:
 #0: ffff88814e9b00a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900033532f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x41b/0x14f0 drivers/tty/n_tty.c:2222
1 lock held by udevd/5828:
 #0: ffffffff8eef4368 (major_names_lock){+.+.}-{4:4}, at: blk_probe_dev+0x25/0x1a0 block/genhd.c:820
2 locks held by syz-executor/5941:
 #0: ffff88814128e420 (sb_writers){.+.+}-{0:0}, at: open_last_lookups fs/namei.c:3789 [inline]
 #0: ffff88814128e420 (sb_writers){.+.+}-{0:0}, at: path_openat+0x1f3e/0x2d40 fs/namei.c:4036
 #1: ffff88801c6d8950 (&type->i_mutex_dir_key#2){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:877 [inline]
 #1: ffff88801c6d8950 (&type->i_mutex_dir_key#2){++++}-{4:4}, at: open_last_lookups fs/namei.c:3799 [inline]
 #1: ffff88801c6d8950 (&type->i_mutex_dir_key#2){++++}-{4:4}, at: path_openat+0x88a/0x2d40 fs/namei.c:4036
1 lock held by udevd/6277:
 #0: ffffffff8eef4368 (major_names_lock){+.+.}-{4:4}, at: blk_probe_dev+0x25/0x1a0 block/genhd.c:820
2 locks held by syz-executor/7446:
 #0: ffffffff8f4b4100 (&ops->srcu#2){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:161 [inline]
 #0: ffffffff8f4b4100 (&ops->srcu#2){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:253 [inline]
 #0: ffffffff8f4b4100 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x113/0x2c0 net/core/rtnetlink.c:574
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:341 [inline]
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0x600/0x2000 net/core/rtnetlink.c:4064
2 locks held by syz-executor/7448:
 #0: ffffffff90868640 (&ops->srcu#2){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:161 [inline]
 #0: ffffffff90868640 (&ops->srcu#2){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:253 [inline]
 #0: ffffffff90868640 (&ops->srcu#2){.+.+}-{0:0}, at: rtnl_link_ops_get+0x113/0x2c0 net/core/rtnetlink.c:574
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock net/core/rtnetlink.c:80 [inline]
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_nets_lock net/core/rtnetlink.c:341 [inline]
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0x600/0x2000 net/core/rtnetlink.c:4064
2 locks held by syz-executor/7463:
 #0: ffffffff90114fd0 (pernet_ops_rwsem){++++}-{4:4}, at: copy_net_ns+0x286/0x5f0 net/core/net_namespace.c:514
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: ip_tunnel_init_net+0x21d/0x7d0 net/ipv4/ip_tunnel.c:1160
2 locks held by syz-executor/7466:
 #0: ffffffff90114fd0 (pernet_ops_rwsem){++++}-{4:4}, at: copy_net_ns+0x286/0x5f0 net/core/net_namespace.c:514
 #1: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: ip_tunnel_init_net+0x21d/0x7d0 net/ipv4/ip_tunnel.c:1160
1 lock held by syz-executor/7469:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7478:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7479:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7484:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7486:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7489:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7494:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7495:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7500:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7502:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979
1 lock held by syz-executor/7505:
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9012ae68 (rtnl_mutex){+.+.}-{4:4}, at: inet_rtm_newaddr+0x30c/0x1540 net/ipv4/devinet.c:979

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
 watchdog+0xf70/0x12c0 kernel/hung_task.c:437
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 36 Comm: kworker/u8:2 Not tainted 6.15.0-rc2-syzkaller-00488-g6fea5fabd332 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: events_unbound toggle_allocation_gate
RIP: 0010:csd_lock_wait kernel/smp.c:340 [inline]
RIP: 0010:smp_call_function_many_cond+0x4af/0x1290 kernel/smp.c:885
Code: 48 48 8b 44 24 20 49 89 c4 83 e0 07 49 c1 ec 03 48 89 c5 4d 01 f4 83 c5 03 e8 5d 17 0c 00 f3 90 41 0f b6 04 24 40 38 c5 7c 08 <84> c0 0f 85 de 0b 00 00 8b 43 08 31 ff 83 e0 01 41 89 c5 89 c6 e8
RSP: 0018:ffffc90000ad7938 EFLAGS: 00000206
RAX: 0000000000000000 RBX: ffff8880b853f740 RCX: ffffffff81af38b9
RDX: ffff88814428a440 RSI: ffffffff81af3893 RDI: 0000000000000005
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: ffffed10170a7ee9
R13: 0000000000000001 R14: dffffc0000000000 R15: ffff8880b843b040
FS:  0000000000000000(0000) GS:ffff8881249b2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0881d61e80 CR3: 000000000e180000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 on_each_cpu_cond_mask+0x40/0x90 kernel/smp.c:1052
 on_each_cpu include/linux/smp.h:71 [inline]
 text_poke_sync arch/x86/kernel/alternative.c:2455 [inline]
 text_poke_bp_batch+0x566/0x760 arch/x86/kernel/alternative.c:2748
 text_poke_flush arch/x86/kernel/alternative.c:2856 [inline]
 text_poke_flush arch/x86/kernel/alternative.c:2853 [inline]
 text_poke_finish+0x30/0x40 arch/x86/kernel/alternative.c:2863
 arch_jump_label_transform_apply+0x1c/0x30 arch/x86/kernel/jump_label.c:146
 jump_label_update+0x376/0x550 kernel/jump_label.c:919
 static_key_disable_cpuslocked+0x158/0x1c0 kernel/jump_label.c:240
 static_key_disable+0x1a/0x20 kernel/jump_label.c:248
 toggle_allocation_gate mm/kfence/core.c:855 [inline]
 toggle_allocation_gate+0x145/0x280 mm/kfence/core.c:842
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
