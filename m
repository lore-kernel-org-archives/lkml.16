Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215C212FB7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429988; cv=none; b=ANDaNDq3EtUAhyeTxEYqBGpj3YBNdjty0gwC9UOGEK2fAhI+dC6VaQGWfWkBhZV5SRS6T1hPXEV/p+6+eyRZVupfJ7I+B+mATwEas5yIe/XtTL7YwPQE7In91Z7lVsU2HYrJ3UO+FJh8JQ7kqYIYg+NSU02ivzlBLdhtYyPvjv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429988; c=relaxed/simple;
	bh=tlmSZ5xZQQJD5bPzk47mJFIdNyqOrJ2s+OwOXayAXpE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JBcjhuE0XN/Hjt9rhGG1XvhJHy6YnspN+M99J9WnNoYaGS0POHCXFaHXz7FgcHhRPLb6ArdXtwYUlv5AQ34HvfpC5BhU0EEe0hcBfpgj928ecuiMHjBVq2j++jn6V87TCmQCVXfrKj+rUxPe0y84Guf4dVGGUI5dyo5CMuQ1AGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85c552b10b9so431017239f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429986; x=1744034786;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zK9zfZLY448vr7zlVjGxKamKzvWH25WaDGmffSrrHI8=;
        b=E8kcfZk+kkhMeYXeKIKzGyK5c+2qPo174yryP6VD9lhrLDq+Yz+BuDIhEOz0EU5y0J
         ixFaHa6RxGaaa8xVnW3cMyRFVbXl7ZV0Aq5nvAoFtGkmkHJ2u/mwSaC6CUZTGDUILRGa
         SIg2h0ljIHyxA0abYFgXlDdo+38cIT9SBh3kLGk7FPMO6ltMg8170GhTzyaFZ2sOAENo
         JbuMObKBrVSgodu+WzNCFRzZ9asVVIKpfo3edGyxK9vRPrmUO48Djaoxf7+6+kSi9pus
         EY5q4eHP6N5eJSWQpq6+jv3pYsFNrUud9+vaR+uE3SopdI7ldOxSjJiNDGIjiC1CyFWg
         pQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXP/bHegmCsu6Cln7hrIJoga1KM2Ou2mtcAHA0EHJ05YlPEGQchhmxZ0OOoZnqDbqkxvze+Wvt2IS0yBFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCGF+hM9O+TUPpzw6aGE+w/Z0S3aC9dTLpIWt3SvZLDUkQu98
	BeNGcr7GozXrPsCn69+vaig5TPMxYF7F9owmpOwR6pQ5AQDpvdkvVCvhsakeckOFbcqcDff/D2n
	Dhx2B07o6mjUsh1TUm02ppj7SbMmLoc8gNWAe98CWN5PY9Qj2UOolSB0=
X-Google-Smtp-Source: AGHT+IGtUJ+GrA1Xnadwl/nwD4o9x9c1DUkzXadcitNrmUKFMa/Y3C6a2ZNSUtukOWKQvNGRVsWGaRquE408RZfY+Ne7+YM+LQfK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a67:b0:3d4:3ab3:5574 with SMTP id
 e9e14a558f8ab-3d5e08ede54mr103758035ab.3.1743429985865; Mon, 31 Mar 2025
 07:06:25 -0700 (PDT)
Date: Mon, 31 Mar 2025 07:06:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67eaa161.050a0220.3c3d88.0043.GAE@google.com>
Subject: [syzbot] [hfs?] KMSAN: uninit-value in hfs_bnode_dump
From: syzbot <syzbot+efd267470a41bc34bd98@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1e1ba8d23dae Merge tag 'timers-clocksource-2025-03-26' of ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1732e198580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=887673359f1a92bf
dashboard link: https://syzkaller.appspot.com/bug?extid=efd267470a41bc34bd98
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/97b3a10186d9/disk-1e1ba8d2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/de4a9446d205/vmlinux-1e1ba8d2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/529352453703/bzImage-1e1ba8d2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+efd267470a41bc34bd98@syzkaller.appspotmail.com

loop2: detected capacity change from 0 to 64
=====================================================
BUG: KMSAN: uninit-value in hfs_bnode_read_u8 fs/hfs/bnode.c:54 [inline]
BUG: KMSAN: uninit-value in hfs_bnode_dump+0x30e/0x4c0 fs/hfs/bnode.c:172
 hfs_bnode_read_u8 fs/hfs/bnode.c:54 [inline]
 hfs_bnode_dump+0x30e/0x4c0 fs/hfs/bnode.c:172
 hfs_brec_remove+0x868/0x9a0 fs/hfs/brec.c:225
 hfs_cat_move+0xfc9/0x12e0 fs/hfs/catalog.c:364
 hfs_rename+0x344/0x500 fs/hfs/dir.c:299
 vfs_rename+0x1d9d/0x2280 fs/namei.c:5086
 do_renameat2+0x1577/0x1b80 fs/namei.c:5235
 __do_sys_rename fs/namei.c:5282 [inline]
 __se_sys_rename fs/namei.c:5280 [inline]
 __x64_sys_rename+0xe8/0x140 fs/namei.c:5280
 x64_sys_call+0x3a1e/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable data.i created at:
 hfs_bnode_read_u16 fs/hfs/bnode.c:-1 [inline]
 hfs_bnode_dump+0x3c5/0x4c0 fs/hfs/bnode.c:156
 hfs_brec_remove+0x868/0x9a0 fs/hfs/brec.c:225

CPU: 0 UID: 0 PID: 7333 Comm: syz.2.275 Not tainted 6.14.0-syzkaller-03576-g1e1ba8d23dae #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
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
