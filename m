Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F33085D7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321232; cv=none; b=U2O68dCGtvl5/uXp1R5jbE0P+i/XILYbomXeeiVDTgBlQATJ1uszr5Vkwmp0f8FhBXXD3ZIvUzE//LBv70iCKCzvZu/bkE6DE8HuH9K0YZE6p1PQrSKfY2F/hcM6Za+Jk1i8hAVNIuO0wuWRfi3a9R0NGlCYj1pxUqnEUIWp+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321232; c=relaxed/simple;
	bh=261sDo1GyqSpoit5EDehZ8hKlPpykt7N3iW2YK8Nh/w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GdddSk+SLl6MEI1FpiH8Sk0irTNnYCYh5Oc+TSEwFwINzM4f1jE/vPcBOKGvqdHUwAidqAOVUvkrBypkb1tZd/ttn0Qrs7U+ahPC3pnwXtFLg097AYggFCMj7kKB2F0lKsBKK7AhWJLiy5rbfy7qACLJGA7l6AsKqbw23G+eP9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3de0dc57859so5297955ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321230; x=1750926030;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5VND3YHAKVVef6wrkt7GOTMwT6AsDTRdwEZamFb2fU=;
        b=XvCB5mQCHjxquJlcXSEDe3fxQkRdM1qj6bOlW5bdwEm/RjBlYghNBH7vBYdOfTmV2V
         4MDeXqNL6Xwg9uUSXi/8p+rDsV3IPSZr9CKjEeEBrdDIQNPw67HXHE77WLF64OXZmGvr
         JGwtgAjP6LwtMFnE4hz/gq1tgfzKZ+SLgf3+pcQ4faXZBZYnM9HYIwA5phaM/CyZK5jh
         T9Ey6+34DNCGZvKjsvbdCNhWtLTNjjJMc2S2GprSmh7WYLMKXag3VVBPMuAOFTpyehw3
         r4iox/zgHSOpIOiWXWA2Vg+l4/0EFu+MCUD9D24hZrNk0dP9i0aVsj+Fjs5UrBrY3O03
         ESKg==
X-Forwarded-Encrypted: i=1; AJvYcCWMOF9jPtExPHTcm3Hakz9SdWYKFzUfSBW62OJ+YZIzzT2Gx5tInwQIVFkd7LH7WBow4SjbMVGRGV6v11k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdiDfcVmM39jmTOOdWzHeaGn13PGW1qIr/37rH4dF3F3z49Ndr
	Bk2gpSqoNqBFEBOMyaVIzVMCRfddqBBtsQTWD+OWxt0mzUbXkg1GhNa7c1oOEE0fnOz/gNfbtse
	PNk7rulfTui6QRSOTY++85ouXtL3MK4WAL3t9J52R6/M8wTrQc4L2FxTT5AU=
X-Google-Smtp-Source: AGHT+IE9SYHZ0M03/4CZ4HxHMP2XlHQlC8tOVtlczY5YsdpXnMgZg8qqQz9KderSIsmW89xMPbcaTYwENsnTsmyMuwq5Q5x865aH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c7:b0:3dd:b655:2d6a with SMTP id
 e9e14a558f8ab-3de07cff8camr235705765ab.7.1750321229797; Thu, 19 Jun 2025
 01:20:29 -0700 (PDT)
Date: Thu, 19 Jun 2025 01:20:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853c84d.050a0220.216029.01ca.GAE@google.com>
Subject: [syzbot] [fs?] KMSAN: uninit-value in fsnotify_connector_destroy_workfn
From: syzbot <syzbot+aaeb1646d01d0358cb2a@syzkaller.appspotmail.com>
To: amir73il@gmail.com, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8c6bc74c7f89 Merge tag 'v6.16-rc1-smb3-client-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c9bd70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
dashboard link: https://syzkaller.appspot.com/bug?extid=aaeb1646d01d0358cb2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fa187645a1d3/disk-8c6bc74c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9c5f24a0cd2d/vmlinux-8c6bc74c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2cd7c92032f/bzImage-8c6bc74c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+aaeb1646d01d0358cb2a@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in fsnotify_connector_destroy_workfn+0x108/0x160 fs/notify/mark.c:323
 fsnotify_connector_destroy_workfn+0x108/0x160 fs/notify/mark.c:323
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e0/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_noprof+0x81b/0xec0 mm/slub.c:4204
 fsnotify_attach_connector_to_object fs/notify/mark.c:663 [inline]
 fsnotify_add_mark_list fs/notify/mark.c:746 [inline]
 fsnotify_add_mark_locked+0x862/0x1a90 fs/notify/mark.c:821
 fsnotify_add_inode_mark_locked include/linux/fsnotify_backend.h:888 [inline]
 inotify_new_watch fs/notify/inotify/inotify_user.c:620 [inline]
 inotify_update_watch fs/notify/inotify/inotify_user.c:647 [inline]
 __do_sys_inotify_add_watch fs/notify/inotify/inotify_user.c:781 [inline]
 __se_sys_inotify_add_watch+0x129c/0x1760 fs/notify/inotify/inotify_user.c:729
 __x64_sys_inotify_add_watch+0x97/0xe0 fs/notify/inotify/inotify_user.c:729
 x64_sys_call+0x330f/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:255
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 4808 Comm: kworker/u8:25 Tainted: G      D W           6.16.0-rc1-syzkaller-00236-g8c6bc74c7f89 #0 PREEMPT(undef) 
Tainted: [D]=DIE, [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound fsnotify_connector_destroy_workfn

=====================================================


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
