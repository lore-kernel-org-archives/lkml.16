Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A8296FA2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746047321; cv=none; b=tJ9n47t2JNn2i5f+fLBQnJW+LSDY+Xgo3w7MEVBaWjL6bUpMZ4SMchxgWpz2RfbKFFJlCcsNGLiDK0P6JtVf3iPmyTgyDH4FIs8szgcs1qXbgd7+KkPC2fk2f51hUXxV9oA+oTeX3gYVWeEyD06uZ7LIWF4fNk6MxCm1ARLhS+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746047321; c=relaxed/simple;
	bh=KaoNy/FCo//u2p7C9jfhJCjfObgsW/hQ6A6OtjnWw1o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Lvjo7CtqKw3Bl2eG2wrRYIMkfviw8oLdJjjaLvsDaCrPV8DezmRLG8JPAyCZIiHP9MKfsPlwh5LtiLxPxmNrFzX+bqJp0TgL8bfHhdlqV+2vgWh5mNN12JlE+4o8wgLBgy3xzuWovyF1LqrLyKXY/tLMfrscwuDlqc4bn7yHn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85b4dc23f03so54023039f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746047319; x=1746652119;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTnMBaJFXK5ga1w9SxnRQaZ8GQQawtec3V6B5CkklOY=;
        b=EjJNAbkYonSt5ktfqJGRD9+/uUR2PWHhGmB7BjnzghJ9GXDmzQo+wjzRPENyXCNXM5
         yFmcO/XK4gHFrWNtYDLN6JFcJmXrUb3feCf5sz1FXOKI/0QTk/giFXO8kJz45E+ZG2C5
         psiPzecStTRvj6DJtHO/2xg+tE5oSthATt5nfQ+Rgg3SQx8sA8HpBEo173sLCEgefD6E
         jc4uvfw+52H7+iWSUoeHnJ/zNwSWoRpIbRVLEq3otGWVhvJDwFd0394VwF6X+RrPkvnU
         a6hIKCOm9rrfVjsK9QZJV2zOd/7hS5cQSQhJkmu2ZPnmMMXRFCsBBeHF/XkwM8A24Jgy
         Qgaw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Lxv2Z7CLSnF9zMHEJIkFQQbnMQGcljGBkPo/3XajCaxphVEJnPt9rv72tKx3UrhkRw3rqJaWdVfMZPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0rsHZoRU0IHvxv1U0ZGjc0ZCXPqdhPBNQZ/Z8gpr9a56ni0N
	tWb+1+7fObVPp/FzltwtubS3U9pohwq397zlGypg2YROTil3/Szh/bTIikNzK05QhK75uYaISG9
	ESEXHRp3CBJ9n9uUiIz8jR/JoiFlsWg8asXE6fsehxD17qt5BcMlyX2k=
X-Google-Smtp-Source: AGHT+IGJ44fCHhwr8RnQeFoGarLHxtw7eCyEBy13uem7qWN4GRxqc5+oI83n9w+JmrD/iZwLYf7pctFtT/HldQ2NKbvS+VwG/IyK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:380b:b0:3d9:3adb:e589 with SMTP id
 e9e14a558f8ab-3d9676b65e8mr54987485ab.4.1746047318725; Wed, 30 Apr 2025
 14:08:38 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:08:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68129156.050a0220.3a872c.0009.GAE@google.com>
Subject: [syzbot] [jfs?] UBSAN: shift-out-of-bounds in dbSplit (3)
From: syzbot <syzbot+4c1966e88c28fa96e053@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f1a3944c860b Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10d550d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90837c100b88a636
dashboard link: https://syzkaller.appspot.com/bug?extid=4c1966e88c28fa96e053
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1250a270580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d550d4580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-f1a3944c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fbe8c2bb0602/vmlinux-f1a3944c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b4268e0ec733/bzImage-f1a3944c.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/10b2c382300e/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=14f49d74580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4c1966e88c28fa96e053@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in fs/jfs/jfs_dmap.c:2629:11
shift exponent 110 is too large for 32-bit type 'int'
CPU: 0 UID: 0 PID: 5303 Comm: syz-executor956 Not tainted 6.15.0-rc3-syzkaller-00283-gf1a3944c860b #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:231
 __ubsan_handle_shift_out_of_bounds+0x386/0x410 lib/ubsan.c:492
 dbSplit+0x1f8/0x200 fs/jfs/jfs_dmap.c:2629
 dbAdjCtl+0x34c/0xa20 fs/jfs/jfs_dmap.c:2521
 dbAllocDmap fs/jfs/jfs_dmap.c:2032 [inline]
 dbAllocNear+0x2ee/0x3d0 fs/jfs/jfs_dmap.c:1243
 dbAlloc+0x933/0xba0 fs/jfs/jfs_dmap.c:828
 ea_write+0x374/0xdd0 fs/jfs/xattr.c:232
 ea_put fs/jfs/xattr.c:619 [inline]
 __jfs_setxattr+0xa01/0x1120 fs/jfs/xattr.c:792
 __jfs_xattr_set+0xda/0x170 fs/jfs/xattr.c:941
 __vfs_setxattr+0x439/0x480 fs/xattr.c:200
 __vfs_setxattr_noperm+0x12d/0x660 fs/xattr.c:234
 vfs_setxattr+0x16b/0x2f0 fs/xattr.c:321
 do_setxattr fs/xattr.c:636 [inline]
 filename_setxattr+0x274/0x600 fs/xattr.c:665
 path_setxattrat+0x364/0x3a0 fs/xattr.c:713
 __do_sys_lsetxattr fs/xattr.c:754 [inline]
 __se_sys_lsetxattr fs/xattr.c:750 [inline]
 __x64_sys_lsetxattr+0xbf/0xe0 fs/xattr.c:750
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdaa19996b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffe3d43d28 EFLAGS: 00000246 ORIG_RAX: 00000000000000bd
RAX: ffffffffffffffda RBX: 0000200000000200 RCX: 00007fdaa19996b9
RDX: 0000000000000000 RSI: 0000200000000200 RDI: 0000200000000040
RBP: 00002000000000c0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000200000000040
R13: 0031656c69662f2e R14: 0000000000000001 R15: 0000000000000001
 </TASK>
---[ end trace ]---


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
