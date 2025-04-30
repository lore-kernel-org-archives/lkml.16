Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F56325A2B8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019594; cv=none; b=HbehTaKCSObwgBjDcAZmGybiL1hq7itwmItQvPVF8OUuXssrsx3ufheK+RH1JAfgudrn61CHIjqsNm+E6ZqE3iWNiA5nzu3gEwyHXu3LocdmkEHkICEDVzeuWyrGaq0XkfbNyn8WQcerevEyUKSW5/DNDMxBmZ9+id2WQOKnCXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019594; c=relaxed/simple;
	bh=m9G3KsrOltkHpbgEhnKH0reG1Ths7w9P7h5Z5hovUpM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CqWldYnQMaoj1esqME4e4xX40uoFIUg/nwCF0xZIvDJgzvLlF7/U0OWTkNJKh9KdfMTEMe52XtHqt+gTJnVKUm5MDykKfLtmi5dK/elbRvCMGAfIsrfthfje5BH+/9h5Mhxei3uUJV95acVq2TKCMzUdKu82DZhu4wCS4fxDkk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d90a7e86f7so146833755ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746019591; x=1746624391;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+237LQ5iDTpGgWqsmXhiKAIuePyLHF0GBZhVW2IFIM=;
        b=sKPbE1hvX925kp2DBxDzbeS5QyWSwNBzvW+Vmof9SDkAnnM7nGhM0J+cTF9Kwl3v6/
         c9KyeTW6ze+sXnvwdlldljSMjAWYv//FpBow75BpHZS2oKd5v4pQMffnR/K0yvYMix7m
         FnXlO7MVh8/4p3Y6Qse8kdx7MdSn8Isu3iIUAJRMIjVkM/nEy+3t5dR89zR/VvNi/mg9
         HCnc4y1uB5T4G0QhmjE7CSS+qpFDAQIiKCtTFWkcZrC7YqYBS45XCDEvjlXgWwU82f/S
         v5V8PVZc70WPcbCPk4eXRGdl4lholv3xkKKQHfcMZzHk9p9eMIRMpVllNssWYI5DONUe
         PL/A==
X-Forwarded-Encrypted: i=1; AJvYcCXlo4u9AP95HJo6NLY4DeSsYUm3YirSTURWG51QXdeowZbNDkGIj1OpnrenqyY/yS+JOOPrkIoZtLEbcRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAbpdEJKYud4qQLqf2UfcrkCVACAMu/MZ/EJKSzk7NvwzjSk6
	7uWWlxhht8tPrzh4gbbtexWg4lFMyCEt7+k7pvQQIE0RgtcIj1qHrSLu6RMrOeRlvliUwuUWwLI
	Qm0Pthf3wxtx6KxbAUXOLZKKHFB7BS+EYWtPvIKog+SexbantIXX7+MM=
X-Google-Smtp-Source: AGHT+IHGbfhQQEPzUz/dA5V7wtEkPe7oRP8F8ANZhTN+H60vE9AaujMpDbZMmkEMdnQtHG85jwPtGBMDh2oJABDF16VyoEvP1BXU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd84:0:b0:3d9:666f:486d with SMTP id
 e9e14a558f8ab-3d9677192b4mr32545115ab.15.1746019591545; Wed, 30 Apr 2025
 06:26:31 -0700 (PDT)
Date: Wed, 30 Apr 2025 06:26:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68122507.050a0220.3a872c.0001.GAE@google.com>
Subject: [syzbot] [jfs?] UBSAN: shift-out-of-bounds in jfs_statfs (3)
From: syzbot <syzbot+13ba7f3e9a17f77250fe@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c72692105976 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16b1f574580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a6efb1b6b7e84ef
dashboard link: https://syzkaller.appspot.com/bug?extid=13ba7f3e9a17f77250fe
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bc4c947b6a4c/disk-c7269210.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/26198601f51b/vmlinux-c7269210.xz
kernel image: https://storage.googleapis.com/syzbot-assets/426ac395cf1d/Image-c7269210.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+13ba7f3e9a17f77250fe@syzkaller.appspotmail.com

 ... Log Wrap ... Log Wrap ... Log Wrap ...
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in fs/jfs/super.c:140:14
shift exponent 770 is too large for 64-bit type 's64' (aka 'long long')
CPU: 1 UID: 0 PID: 6605 Comm: syz.1.10 Not tainted 6.15.0-rc2-syzkaller-gc72692105976 #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 ubsan_epilogue+0x14/0x48 lib/ubsan.c:231
 __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c lib/ubsan.c:492
 jfs_statfs+0x400/0x484 fs/jfs/super.c:140
 statfs_by_dentry fs/statfs.c:66 [inline]
 vfs_statfs+0x13c/0x2b0 fs/statfs.c:90
 ovl_check_namelen fs/overlayfs/super.c:388 [inline]
 ovl_get_upper fs/overlayfs/super.c:506 [inline]
 ovl_fill_super+0x5b8/0x2bac fs/overlayfs/super.c:1387
 vfs_get_super fs/super.c:1280 [inline]
 get_tree_nodev+0xb4/0x144 fs/super.c:1299
 ovl_get_tree+0x28/0x38 fs/overlayfs/params.c:701
 vfs_get_tree+0x90/0x28c fs/super.c:1759
 do_new_mount+0x228/0x814 fs/namespace.c:3879
 path_mount+0x5b4/0xde0 fs/namespace.c:4206
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount fs/namespace.c:4407 [inline]
 __arm64_sys_mount+0x3e8/0x468 fs/namespace.c:4407
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
---[ end trace ]---
read_mapping_page failed!
ERROR: (device loop1): txAbort: 

ERROR: (device loop1): remounting filesystem as read-only
overlayfs: failed to create directory ./file0/work (errno: 5); mounting read-only
overlayfs: failed to set uuid (/file2, err=-30); falling back to uuid=null.
netlink: 277 bytes leftover after parsing attributes in process `syz.1.10'.


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
