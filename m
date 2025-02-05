Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5802770B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736905; cv=none; b=ZexNx98XHBAmS6ihR2FkZRYSyxui+0+QbjykV2u2637vZafnflFJhEy3j/Ssc2TlqgYm4Rfj6ttY6C0DNjgNneyWlp15k6NjRINPLCdbjskxVd4brFU6ui1pNYRrtLz1uwqLw3qFLOQ7L+wyBjL2z6Gp7lwU0qSeXPZN+Fa/aKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736905; c=relaxed/simple;
	bh=vSbqnzR1xyzYtpWvblXks7qeEBgSteFAYaGNumpJIiE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kng0JS70x5ob2dk/2LNJCCmRBVkm+k2Iu36PgrUB7yOyAxKnsl/mFF8paxkzy+NoNyXNaBHM1B/ENeHQ13rW+Lxw2TtPbpIBX0AYb3hWdnybAQmWBwV0McwIW0OfNWsrWgifmRWDoouDfLVVA/seI84kcg4ZhgbbWj+1/xcaRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-844e9b88efeso1089574239f.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 22:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738736902; x=1739341702;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mSQCkeHuwhZt0xgZfQYnAAlUtXuw/pecT5TvaMXbg0=;
        b=JiH2lKUPrkOo/o/WKDiaSf+n6JSBdQfX9wfrm3BhF0zGaq0dXgWD3ebwKufq6KiCCh
         bJO1r7kgV6XPIMxJf2C2c1/z1oQnGxgb1bQ5C+nayPPV60crY5UCajgaByUMPQTfkuW7
         4iA5jwJ9nqQWBGbLozCg7bVItHpHLQEotvtuIfQzncPS7i0sqH4LOxL3ugf0KDp+sQC3
         8TUmkXTu3nUr4NpyqgtD2IslOUf0VUn0WE4EwTyphB+4xcrtcKRY8ocfLa7aPRXl5pUe
         XmSkM8oiW8KkiITVgUw8vE9g4wJc2X3ZPloL6VoY+gfycvmzt9fNBdTWvaQOTQl2wcHx
         IxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuka/FR/yqGOzp80umfAVudGrltoeH/xQqxbJrQdO61mdOJ9z1aOL1vEsWVo0wi5hi7UBs8WhdzBfSUoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/bpGAMZss/bdTMCFuc2iXygbCyzZAGO1JdmoRAK9wSB9lz/Y
	pnvtPRjUYrNVkYYbOosUYx6zA4zSgYb+6eWBISUo8Qr2fmYhkmqjwHP/xyu2jITST+hTXnZ5QEZ
	rFmxjaKi1i7hE24CtY9wyI7nsroer9GUlHZwrAsSq87uU59Kw4qidFtA=
X-Google-Smtp-Source: AGHT+IGoH6/x7eWSgJnwDXYdv0fUIqvMnn1baO6rbOPbWHLkjPGjquabYqCgR/KUHPGoY7Lj51yJCLAf+YB2msqdEdwBilzQ+ThQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1989:b0:3cf:c745:4fa8 with SMTP id
 e9e14a558f8ab-3d04f961873mr19890895ab.18.1738736902526; Tue, 04 Feb 2025
 22:28:22 -0800 (PST)
Date: Tue, 04 Feb 2025 22:28:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a30506.050a0220.50516.0010.GAE@google.com>
Subject: [syzbot] [ntfs3?] kernel panic: stack is corrupted in ni_enum_attr_ex
From: syzbot <syzbot+fe33beb8c5dba41e050b@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13ca4b24580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=fe33beb8c5dba41e050b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ac3ddf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f595f8580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-69e858e0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a53b888c1f3f/vmlinux-69e858e0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6b5e17edafc0/bzImage-69e858e0.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/57d4f876a7f0/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fe33beb8c5dba41e050b@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3(loop0): Different NTFS sector size (1024) and media sector size (512).
ntfs3(loop0): ino=a, mi_enum_attr
ntfs3(loop0): Mark volume as dirty due to NTFS errors
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: ni_enum_attr_ex+0x445/0x450
CPU: 0 UID: 0 PID: 5634 Comm: syz-executor427 Not tainted 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 panic+0x349/0x880 kernel/panic.c:354
 __stack_chk_fail+0x15/0x20 kernel/panic.c:836
 ni_enum_attr_ex+0x445/0x450
 ntfs_read_mft fs/ntfs3/inode.c:123 [inline]
 ntfs_iget5+0x23f7/0x3800 fs/ntfs3/inode.c:540
 ntfs_fill_super+0x3e8e/0x4730 fs/ntfs3/super.c:1477
 get_tree_bdev_flags+0x48c/0x5c0 fs/super.c:1636
 vfs_get_tree+0x90/0x2b0 fs/super.c:1814
 do_new_mount+0x2be/0xb40 fs/namespace.c:3560
 do_mount fs/namespace.c:3900 [inline]
 __do_sys_mount fs/namespace.c:4111 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4088
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f258c7a00ea
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc3d396c38 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffc3d396c50 RCX: 00007f258c7a00ea
RDX: 000000002001f800 RSI: 000000002001f840 RDI: 00007ffc3d396c50
RBP: 0000000000000004 R08: 00007ffc3d396c90 R09: 000000000001f815
R10: 0000000000000000 R11: 0000000000000286 R12: 0000000000000000
R13: 00007ffc3d396c90 R14: 0000000000000003 R15: 0000000000200000
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


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
