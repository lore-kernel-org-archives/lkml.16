Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3522F6B4D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746500910; cv=none; b=mq3ZgM7V5CJYSIw52xwYm5pj74qYAPjExkOYcU00M0YJFxseRZL3st0Q5pDGDpn3EloA5zxnfD6rskC4jPztYAIKKT19GZtkLWR71a200K3LQV7vot1ClScYWcJCbIUuD5B+bHx8kX9RIIV1s4CJfhkcyDMYAo4n4nUFf5FmbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746500910; c=relaxed/simple;
	bh=wmsDEm7iWgR53IYZZ9sj/mlV+8ND5e3f4ioP1MN8X6o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SJpcg1nJDh0t9ogL3KUJY6GkPIbix1L4+HdJAcRCTQKVGy7our+eBsBkpkdLU7a3wxus7mHaOZk26WWaqGDRqpS75ZVLZQgpj8m3nAygqfIF6/GpDLyLhcyi5YrMZNtJVva+zkcMPrNmgt8gtEHcALQgvz4Z8gXGZ0NQeBkvpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-862dda418a6so1047503939f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 20:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746500907; x=1747105707;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySaeZmqBXp/ABHo7+Swh6JmkR8RcMmZrCNBCJ5ZUIEw=;
        b=r2R/avYAvnGL/awdpEuUay8fVOP2BMLLxcNHjWpG4mvqqMYox7OOLFLrLqyrgmZrzN
         XPpbC996hlzRPLDOWexVU53BlAmxui7+EoyCKVK7i445MSw3WMNSYd+BUETIOQltWGa3
         yuiz5hkRm3SCgdaqYhX8Lfmt+tttI6SWtW3+fH84gkCav/2yCByL5BfvCfO+h43a4Fck
         1rV30XQ2g8S3WRqrSUMr99R5xMj2gTOFcNvxsSk8Y15RmTV1eg3bl1dN1kYBTWEbR0MR
         yQLzzDgr+6zhtHEcckoGkrftdvAbviIDlCmNO4W1KROERZhEOj8XzOdrLz4AbNPuDygU
         mPag==
X-Forwarded-Encrypted: i=1; AJvYcCXkRCL2kTGsE1a6XmoBGAJmzBvNu6ZqXS5zrfLMOrKTN8DjH3Eg4QP6ZHZhRooKhCTTZxINbsBRUpxd/V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR89DzOGP5fozO1nTXJWi9ORojDGWx/tAqO4MYVYCaKKX7aYb2
	Op35YpLz0Ih/PDOa/7kpgEUlHTBnUwuyjqa9GLfM9cikxz+zkf1M87LhFaID2Mt5Et95TRoVCPz
	ZEjPnH5mXUhvCsGWhW6BdaGSBQukfu02HH9ExgB9jWXaqMqIklmmlV68=
X-Google-Smtp-Source: AGHT+IHGQmaqGVuos9QBwDdISA5x+O/TZ0V5cyBNQ8AF+mscGrMonDFHsRVlk2XWLDS2oXLitmHvGgh0TFJKh0eVk1hFsW50iSGk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2d:b0:3d4:2306:a875 with SMTP id
 e9e14a558f8ab-3da6cdd7d45mr18806895ab.8.1746500907409; Mon, 05 May 2025
 20:08:27 -0700 (PDT)
Date: Mon, 05 May 2025 20:08:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68197d2b.050a0220.23d401.2859.GAE@google.com>
Subject: [syzbot] [jfs?] KMSAN: uninit-value in BT_STACK_DUMP
From: syzbot <syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02ddfb981de8 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=106abf74580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=ba5f49027aace342d24d
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109589b3980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15ba1f74580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ca57f5a3f77/disk-02ddfb98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f23cbc11e68/vmlinux-02ddfb98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73e63afac354/bzImage-02ddfb98.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6ef4108d05dc/mount_2.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=169bb02f980000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com

bn = 0, index = 0
bn = 0, index = 0
bn = 0, index = 0
bn = 0, index = 0
bn = 0, index = 0
bn = 0, index = 0
bn = 0, index = 0
=====================================================
BUG: KMSAN: uninit-value in BT_STACK_DUMP+0x5e5/0x600 fs/jfs/jfs_btree.h:136
 BT_STACK_DUMP+0x5e5/0x600 fs/jfs/jfs_btree.h:136
 dtSearch+0x393f/0x3d30 fs/jfs/jfs_dtree.c:774
 jfs_lookup+0x179/0x590 fs/jfs/namei.c:1461
 lookup_one_qstr_excl_raw+0x204/0x5b0 fs/namei.c:1689
 lookup_one_qstr_excl fs/namei.c:1711 [inline]
 do_unlinkat+0x2e3/0xe50 fs/namei.c:4631
 __do_sys_unlink fs/namei.c:4689 [inline]
 __se_sys_unlink fs/namei.c:4687 [inline]
 __x64_sys_unlink+0x71/0xb0 fs/namei.c:4687
 x64_sys_call+0x29de/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:88
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable nd created at:
 __filename_parentat+0x4c/0x990 fs/namei.c:2726
 filename_parentat fs/namei.c:2749 [inline]
 do_unlinkat+0xe3/0xe50 fs/namei.c:4618

CPU: 1 UID: 0 PID: 5791 Comm: syz-executor444 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
=====================================================


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
