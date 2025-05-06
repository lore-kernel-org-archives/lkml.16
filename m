Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C1C1474B8
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521317; cv=none; b=moEEU8FqcXShc+UlKorwZBvhAE36O8zrUhd+xxpAX/XUAoDaXjqv9MVDo6279+4r1dJL5AWME7n7qsQJNTI/2SrEQnqhG+a4pryqy+5suwlE0lovKxxxnqgMW9kx/SsM8dS3qNE6j7pq+/hW8pQ7xWBGaET161poYyq0NFA39KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521317; c=relaxed/simple;
	bh=ejLMMEA5e3uyKKl9GmTcc6T9tf5lIE4lWut7ceam/64=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=oBl0Rf2waeivjYBug+e3DWzGVsYkjn4ecSvUZWs0PU+QMGJyM77r0vdcF1GL4doZ56yOhLJyKU9HZ7WXXsn5S2DV9Oe0k7dT8BwaM1RzKrG1K3uCAgkzbTMevGZHv0fchBuPy8RdSFmnDhxkMfTjDExFrZmCsyXshnC075bh+Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85dad58e80fso1518300639f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521314; x=1747126114;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evRdwzbkxC9mrutmV3g1MyaM7bypvwq/Ad2CzSm+BcI=;
        b=vXKmNvfE4HsJ6HiZVwctDzITfFq6MPoorROqM0nAVuViFuin7t38vknibz3NnCFvfO
         H0GuPtIJ6Ak/mjwmvPLu/nGis9bI0J9hHqqJoX+g8DJi06ZN+G//i7UHMzWdVSZ3iwmW
         vdn+6UU1r3H1I+ubl5VUARcflcbvnIGzUSTvKZdCShKVTfDGvfu7Osgf7vCr1mWO+QF2
         YjdiKWpj07X9H6zb0DRB73QGoZAD100LtIyskwgq+fCmpkFMcmsKweLqGvCfERvVXuW6
         wo/rNnsUXDbQJhogN50tB/xjLT4cFW3VoJAwMEBqIbTlYuhez5LP1ZSckvkVim9TWYbH
         XQxg==
X-Forwarded-Encrypted: i=1; AJvYcCWkAx9nJkjDyAGHLCDCxel8vkUp5T+XuiuS+72fcZ7I4bCDOM3LmJe5AhsjxKvL78A+Zmcm7gx8d5RcYxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0i8hHgABBA6c6V9pKtGFLOa4qWc6HaLs1CNRmgaww/Fca12C5
	VDZGIfi8dSeBbk4rFZgRoXIOSaqdbzwbIOGBXx6SyBlbSYj5zbVRnamGZ3QX+NZsvqfunR9JOJ9
	snXLz0vNqmHGcrhZeo4LA3HI+fFc9Y6xu2Hb/W3D1y8h9vbj5bE5BL1I=
X-Google-Smtp-Source: AGHT+IGMy/PGHxiElNBeJG033wwbkJsy0IkQ+1KI296Y1oSvl+wzJcstL/7QOw7FHPr+0PSPb5eAspYa0V17cdBKCmt12gfoRNvM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c10:b0:85b:3f06:1fd4 with SMTP id
 ca18e2360f4ac-86713b79d83mr1113261339f.9.1746521313923; Tue, 06 May 2025
 01:48:33 -0700 (PDT)
Date: Tue, 06 May 2025 01:48:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6819cce1.050a0220.37980e.038e.GAE@google.com>
Subject: [syzbot] [kernel?] upstream test error: KASAN: invalid-access Write
 in binder_add_device
From: syzbot <syzbot+10ed5e36a416a32f127e@syzkaller.appspotmail.com>
To: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, surenb@google.com, 
	syzkaller-bugs@googlegroups.com, tkjos@android.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    29281a76709c Merge tag 'kvmarm-fixes-6.14-2' into kvmarm-m..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fuzzme
console output: https://syzkaller.appspot.com/x/log.txt?x=16921f74580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22c3bbf92fcca116
dashboard link: https://syzkaller.appspot.com/bug?extid=10ed5e36a416a32f127e
compiler:       Debian clang version 20.1.3 (++20250415083350+2131242240f7-1~exp1~20250415203523.103), Debian LLD 20.1.3
userspace arch: arm64

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-29281a76.raw.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10ed5e36a416a32f127e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: invalid-access in hlist_add_head include/linux/list.h:1026 [inline]
BUG: KASAN: invalid-access in binder_add_device+0xf4/0xf8 drivers/android/binder.c:6932
Write of size 8 at addr d9f000001772ec08 by task syz-executor/3290
Pointer tag: [d9], memory tag: [85]

CPU: 0 UID: 0 PID: 3290 Comm: syz-executor Not tainted 6.14.0-rc2-syzkaller-g29281a76709c #0
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xac/0x290 mm/kasan/report.c:378
 print_report+0x84/0xa0 mm/kasan/report.c:489
 kasan_report+0xb0/0x110 mm/kasan/report.c:602
 kasan_tag_mismatch+0x28/0x3c mm/kasan/sw_tags.c:175
 __hwasan_tag_mismatch+0x30/0x60 arch/arm64/lib/kasan_sw_tags.S:55
 hlist_add_head include/linux/list.h:1026 [inline]
 binder_add_device+0xf4/0xf8 drivers/android/binder.c:6932
 binderfs_binder_device_create+0xbfc/0xc28 drivers/android/binderfs.c:210
 binderfs_fill_super+0xb30/0xe20 drivers/android/binderfs.c:729
 vfs_get_super fs/super.c:1280 [inline]
 get_tree_nodev+0xdc/0x1cc fs/super.c:1299
 binderfs_fs_context_get_tree+0x28/0x38 drivers/android/binderfs.c:749
 vfs_get_tree+0xc4/0x3cc fs/super.c:1814
 do_new_mount+0x2a0/0x988 fs/namespace.c:3560
 path_mount+0x650/0x101c fs/namespace.c:3887
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount fs/namespace.c:4088 [inline]
 __arm64_sys_mount+0x36c/0x468 fs/namespace.c:4088
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x134 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x4df000001772e000 pfn:0x5772e
flags: 0x1ffde8000000000(node=0|zone=0|lastcpupid=0x7ff|kasantag=0x7a)
page_type: f2(table)
raw: 01ffde8000000000 0000000000000000 dead000000000122 0000000000000000
raw: 4df000001772e000 0000000000000000 00000001f2000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 fff000001772ea00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
 fff000001772eb00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
>fff000001772ec00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
                   ^
 fff000001772ed00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
 fff000001772ee00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
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
