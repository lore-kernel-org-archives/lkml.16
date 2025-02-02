Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4C35966
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738522589; cv=none; b=UfscBTXlFlj0a3m3IYEJ3c561pXBOlGzYQYKZRhWtcTw8deHA/dVf05yf/6u55KkfMHXkZTQu+QsRb0Nko0RlodCqa7Sg3vvKmU8c3saRedkAcB5mLxOD9lLE7k/sb4F0VepKF/riABc0krB6OsfkFOrTlPq78shEp2h10OJqiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738522589; c=relaxed/simple;
	bh=sX2InRktospNH8gsnncypokVWkZa5r/ZEy9gyYk4Vh8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cEiWvfBWLvZp12aYFUhDWZ0TNUY0b+MfJ8QjbaSmKXGQFpt60WcXqu+B9YM85iT2AN6uD6/dS4gVPQv7PI3q3LHPphhAnKfml/rUT1yrz6kv9ULyJMmrIJVodfZoMk28inKnhh4ihuw29LJbONhEF/uCYzi8hJycbPoqBAIaxTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3cfb20d74b5so24511545ab.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 10:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738522587; x=1739127387;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoVVFOWfNsMYlAu/4VPn026nSJhMkejp31mNpEt5eyw=;
        b=nvO6nuXKdR2+0/QTGj9HfRwlFs7vBldWKtg7OyBnl0AKVaLljBgIyMqmW1+wA1btVf
         rb0Bg92r9vrApCMYJOfHIBTn4UjXvZ/q/PDHTWER9HmBgzZSB60kjm7fduooiLjdoMGu
         qakcyYQpwWD5LFbqAXOPk8fx66jNqSxaPWiPE6a6hR6WI3uvbVW7RkmRhIoAYLoEDo7K
         H6hH0v/2PzAQ3ydB/sWXyLTp4bOH0tctvm3UpYJMjeXGz7G5v6dfPVlucqHxI20JzeNi
         Zt447xJXx9zUZHES1CT8Z5IsPuHFjoH0v0aoG6BaPZjLMfmW3IZ6VGP1fuo8ZJArPdFf
         cYGA==
X-Forwarded-Encrypted: i=1; AJvYcCVETOAtf2iAO2EXUQFKHQqtO5fEWMh+fKgkUnJro3WgVpI/JEP2vnb+P+kp4NVqzlYIEJvuOe804EZzQEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLNOumgtWjkazvm2V70nygOIl8Ss6jBorY17dmirYMH4eVm9ER
	+XwMB4sy80C5bYYRkxvYpo1cWyVx1BWxBckOQEJV/GqjU7XT7xZ1OYTigTA4tHS+gFhakzDHKHQ
	y7axxLgJ3iPHFblxQ6bUhRVoSDMcwpdSoe3aFiEXDbQzbYQDwGmO12wc=
X-Google-Smtp-Source: AGHT+IGMkAvIeqKP4VlcJrRBq2jfmS65ZGIkLL5HbTejQs/+NhuRp+SdSfp92HvSWhculckyjgnh6Ru+jl8wIvBlPPnsyQGiWEAX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4f:0:b0:3d0:24c0:bd4d with SMTP id
 e9e14a558f8ab-3d024c0bfafmr57473895ab.18.1738522586968; Sun, 02 Feb 2025
 10:56:26 -0800 (PST)
Date: Sun, 02 Feb 2025 10:56:26 -0800
In-Reply-To: <000000000000931657061ffc8ad9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679fbfda.050a0220.d7c5a.0076.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] possible deadlock in walk_component (4)
From: syzbot <syzbot+b4567a8b2d2ad5f9dd06@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10dc6d18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=98d83cc1742b7377
dashboard link: https://syzkaller.appspot.com/bug?extid=b4567a8b2d2ad5f9dd06
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=116fceb0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15bf03df980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3d07b0558b0e/disk-69e858e0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5e2250eb3b1/vmlinux-69e858e0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3e676d17effc/bzImage-69e858e0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b4567a8b2d2ad5f9dd06@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.13.0-syzkaller-09760-g69e858e0b8b2 #0 Not tainted
------------------------------------------------------
syz-executor466/5830 is trying to acquire lock:
ffff88807997f398 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: inode_lock_shared include/linux/fs.h:875 [inline]
ffff88807997f398 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: lookup_slow fs/namei.c:1809 [inline]
ffff88807997f398 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: walk_component+0x342/0x5b0 fs/namei.c:2114

but task is already holding lock:
ffffffff8e07d228 (param_lock){+.+.}-{4:4}, at: kernel_param_lock kernel/params.c:607 [inline]
ffffffff8e07d228 (param_lock){+.+.}-{4:4}, at: param_attr_store+0xe6/0x300 kernel/params.c:586

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (param_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19b/0xb10 kernel/locking/mutex.c:730
       ieee80211_rate_control_ops_get net/mac80211/rate.c:220 [inline]
       rate_control_alloc net/mac80211/rate.c:266 [inline]
       ieee80211_init_rate_ctrl_alg+0x18d/0x6b0 net/mac80211/rate.c:1015
       ieee80211_register_hw+0x2077/0x3ff0 net/mac80211/main.c:1531
       mac80211_hwsim_new_radio+0x2c47/0x56d0 drivers/net/wireless/virtual/mac80211_hwsim.c:5558
       init_mac80211_hwsim+0x432/0x8c0 drivers/net/wireless/virtual/mac80211_hwsim.c:6910
       do_one_initcall+0x128/0x630 init/main.c:1257
       do_initcall_level init/main.c:1319 [inline]
       do_initcalls init/main.c:1335 [inline]
       do_basic_setup init/main.c:1354 [inline]
       kernel_init_freeable+0x58f/0x8b0 init/main.c:1568
       kernel_init+0x1c/0x2b0 init/main.c:1457
       ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #2 (rtnl_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19b/0xb10 kernel/locking/mutex.c:730
       cgrp_css_online+0xa9/0x200 net/core/netprio_cgroup.c:157
       online_css+0xaf/0x350 kernel/cgroup/cgroup.c:5568
       css_create kernel/cgroup/cgroup.c:5652 [inline]
       cgroup_apply_control_enable+0x6d7/0xc80 kernel/cgroup/cgroup.c:3239
       cgroup_mkdir+0x398/0x1150 kernel/cgroup/cgroup.c:5847
       kernfs_iop_mkdir+0x14a/0x1d0 fs/kernfs/dir.c:1247
       vfs_mkdir+0x57d/0x860 fs/namei.c:4313
       do_mkdirat+0x301/0x3a0 fs/namei.c:4336
       __do_sys_mkdir fs/namei.c:4356 [inline]
       __se_sys_mkdir fs/namei.c:4354 [inline]
       __x64_sys_mkdir+0xef/0x140 fs/namei.c:4354
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (cgroup_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:585 [inline]
       __mutex_lock+0x19b/0xb10 kernel/locking/mutex.c:730
       cgroup_lock include/linux/cgroup.h:368 [inline]
       cgroup_kn_lock_live+0x139/0x570 kernel/cgroup/cgroup.c:1662
       cgroup_rmdir+0x22/0x2d0 kernel/cgroup/cgroup.c:6045
       kernfs_iop_rmdir+0x143/0x1c0 fs/kernfs/dir.c:1265
       vfs_rmdir fs/namei.c:4396 [inline]
       vfs_rmdir+0x203/0x690 fs/namei.c:4373
       do_rmdir+0x3a2/0x410 fs/namei.c:4455
       __do_sys_rmdir fs/namei.c:4474 [inline]
       __se_sys_rmdir fs/namei.c:4472 [inline]
       __x64_sys_rmdir+0xc5/0x110 fs/namei.c:4472
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&type->i_mutex_dir_key#6){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3163 [inline]
       check_prevs_add kernel/locking/lockdep.c:3282 [inline]
       validate_chain kernel/locking/lockdep.c:3906 [inline]
       __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5228
       lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5851
       down_read+0x9a/0x330 kernel/locking/rwsem.c:1524
       inode_lock_shared include/linux/fs.h:875 [inline]
       lookup_slow fs/namei.c:1809 [inline]
       walk_component+0x342/0x5b0 fs/namei.c:2114
       lookup_last fs/namei.c:2612 [inline]
       path_lookupat+0x17f/0x770 fs/namei.c:2636
       filename_lookup+0x221/0x5f0 fs/namei.c:2665
       kern_path+0x35/0x50 fs/namei.c:2773
       lookup_bdev+0xd9/0x280 block/bdev.c:1163
       bdev_file_open_by_path+0x83/0x330 block/bdev.c:1036
       add_device drivers/mtd/devices/block2mtd.c:279 [inline]
       block2mtd_setup2+0x32e/0xe30 drivers/mtd/devices/block2mtd.c:459
       block2mtd_setup+0x55/0x70 drivers/mtd/devices/block2mtd.c:476
       param_attr_store+0x18f/0x300 kernel/params.c:588
       module_attr_store+0x55/0x80 kernel/params.c:924
       sysfs_kf_write+0x117/0x170 fs/sysfs/file.c:139
       kernfs_fop_write_iter+0x33d/0x500 fs/kernfs/file.c:334
       new_sync_write fs/read_write.c:586 [inline]
       vfs_write+0x5ae/0x1150 fs/read_write.c:679
       ksys_write+0x12b/0x250 fs/read_write.c:731
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &type->i_mutex_dir_key#6 --> rtnl_mutex --> param_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(param_lock);
                               lock(rtnl_mutex);
                               lock(param_lock);
  rlock(&type->i_mutex_dir_key#6);

 *** DEADLOCK ***

4 locks held by syz-executor466/5830:
 #0: ffff8880244b2420 (sb_writers#8){.+.+}-{0:0}, at: ksys_write+0x12b/0x250 fs/read_write.c:731
 #1: ffff88802975f488 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x27b/0x500 fs/kernfs/file.c:325
 #2: ffff88814c9e6008 (kn->active#4){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x29e/0x500 fs/kernfs/file.c:326
 #3: ffffffff8e07d228 (param_lock){+.+.}-{4:4}, at: kernel_param_lock kernel/params.c:607 [inline]
 #3: ffffffff8e07d228 (param_lock){+.+.}-{4:4}, at: param_attr_store+0xe6/0x300 kernel/params.c:586

stack backtrace:
CPU: 0 UID: 0 PID: 5830 Comm: syz-executor466 Not tainted 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x490/0x760 kernel/locking/lockdep.c:2076
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2208
 check_prev_add kernel/locking/lockdep.c:3163 [inline]
 check_prevs_add kernel/locking/lockdep.c:3282 [inline]
 validate_chain kernel/locking/lockdep.c:3906 [inline]
 __lock_acquire+0x249e/0x3c40 kernel/locking/lockdep.c:5228
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5851
 down_read+0x9a/0x330 kernel/locking/rwsem.c:1524
 inode_lock_shared include/linux/fs.h:875 [inline]
 lookup_slow fs/namei.c:1809 [inline]
 walk_component+0x342/0x5b0 fs/namei.c:2114
 lookup_last fs/namei.c:2612 [inline]
 path_lookupat+0x17f/0x770 fs/namei.c:2636
 filename_lookup+0x221/0x5f0 fs/namei.c:2665
 kern_path+0x35/0x50 fs/namei.c:2773
 lookup_bdev+0xd9/0x280 block/bdev.c:1163
 bdev_file_open_by_path+0x83/0x330 block/bdev.c:1036
 add_device drivers/mtd/devices/block2mtd.c:279 [inline]
 block2mtd_setup2+0x32e/0xe30 drivers/mtd/devices/block2mtd.c:459
 block2mtd_setup+0x55/0x70 drivers/mtd/devices/block2mtd.c:476
 param_attr_store+0x18f/0x300 kernel/params.c:588
 module_attr_store+0x55/0x80 kernel/params.c:924
 sysfs_kf_write+0x117/0x170 fs/sysfs/file.c:139
 kernfs_fop_write_iter+0x33d/0x500 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0x5ae/0x1150 fs/read_write.c:679
 ksys_write+0x12b/0x250 fs/read_write.c:731
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f64e4ab2ea9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffc0a6c6d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f64e4ab2ea9
RDX: 0000000000000003 RSI: 0000000020000000 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f64e4afc036
R13: 00007fffc0a6c710 R14: 00007fffc0a6c750 R15: 0000000000000000
 </TASK>
block2mtd: error: cannot open device 3QI


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
