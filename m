Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3816F231859
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007774; cv=none; b=OmUedNyZshbh+yxTQ0AecSp5ltyTvCxcDwTsblR7ZGypWZ0GV2jVzTvSKNfrHFAIbcRe05TsdcM+ONWPLw3UW8lkU1Qc/SleItvlxkMZZXsgF4Cyd+3+gzOvNG3zH189gDwJBpcf6BiIDawwV+LJd7tKMQOWmjNiGF0U7kWPZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007774; c=relaxed/simple;
	bh=a8gRg6Izfa8RFt7wbIAfGX+9/ib/Dd8gm/sC8Csgiz8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iJFzi3rn6SRUb9f3vsRs2RZpskJ9dm0CJoWalN6gUFEx5WuTskkjaLiGGWO04i7QBRpgdCczSlD+APOjedDmyCPYw+w0nZ6JENZIy9CzDbKbyIUu0ujVLaHwf2jx8fCrJupu+Hu9evOX06lhJlyhS4/6H3CxeitRtbHLaHhQRDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85dad58e80fso1786720139f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007772; x=1746612572;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OOnF9wwZhmwyXdn4lTQkVB0yLq6TVTRIdVNFttGNbY=;
        b=N0wByIhh0JxpJjtsss8kPNck40HaJxPXCa6qPmw6R8xIwCcGlABE8ZaRAZydoF/2sq
         2LKvU29gSSQAm8dNdtdyCUv7epDtF0xVBQH8llTmJTYJ0Kdl/k7wOHWkFrCZyE5WeJ83
         BFrpxZf5f4jsMZLBJukfPaFmZon06Oj13vzJD+BtFA4dwDp9VgvJUlt4Qqdq2PsJnk1i
         dIFCFaCKGf2hPUUvoE6pLokTizGDqAFdu5SG5J1Pe/MV8LT23li6+KhRjawHtFLRowmK
         myfvr6CGU7lBTSqyKqwjpTGJLUOS9MMYdWnPJgNXl7640+WjJRQwAIX4ebq2fC6iQUIT
         2ONA==
X-Forwarded-Encrypted: i=1; AJvYcCU8KrG6IfrzIW0NbVHK+0BiMUkiYGK3dT8xwPp6GLJSOxBp16g3jTJJVn7b0ICCS8F21f2gt5hTxTERuYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2YifZd5eIeiAJLHdX2XxYbI7e/VT7llL+fWnSOcFDc/9H6YS
	GlXsYZrZQB6uTvsvbb7DUJ5wVGmdPhDTlmkZ1FO+k4C0h/FYP+cdObUo70F5pkosHCnBw2WEFJN
	Iv/KVCtk9dS7zKHhfcAIBesUpSRBgNzxMv1ZFCU69SV9EF+0jSWaL+FY=
X-Google-Smtp-Source: AGHT+IFa1pJKVPROIgV9AM7FBZ3nQall2eYrq/us1tL8cUqcLVD/Nx2EKIj+QUoPI6BFm0A5T0wvGjGs1ui0NFc7ZalWUQcjO2T1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4c10:b0:861:d6f3:a2d9 with SMTP id
 ca18e2360f4ac-86495e8c934mr362834439f.7.1746007772331; Wed, 30 Apr 2025
 03:09:32 -0700 (PDT)
Date: Wed, 30 Apr 2025 03:09:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6811f6dc.050a0220.39e3a1.0d0e.GAE@google.com>
Subject: [syzbot] [io-uring?] KCSAN: data-race in io_submit_sqes / io_uring_show_fdinfo
From: syzbot <syzbot+3e77fd302e99f5af9394@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ca91b9500108 Merge tag 'v6.15-rc4-ksmbd-server-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a7d774580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6bd11c5d4ce102b4
dashboard link: https://syzkaller.appspot.com/bug?extid=3e77fd302e99f5af9394
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3a00fa544114/disk-ca91b950.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e82e624a4321/vmlinux-ca91b950.xz
kernel image: https://storage.googleapis.com/syzbot-assets/28e6034d0263/bzImage-ca91b950.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3e77fd302e99f5af9394@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in io_submit_sqes / io_uring_show_fdinfo

read-write to 0xffff88810a2fe870 of 4 bytes by task 5625 on cpu 0:
 io_get_sqe io_uring/io_uring.c:2286 [inline]
 io_submit_sqes+0x235/0x1000 io_uring/io_uring.c:2339
 __io_sq_thread io_uring/sqpoll.c:189 [inline]
 io_sq_thread+0x778/0x1110 io_uring/sqpoll.c:312
 ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

read to 0xffff88810a2fe870 of 4 bytes by task 5624 on cpu 1:
 io_uring_show_fdinfo+0x150/0xc40 io_uring/fdinfo.c:126
 seq_show+0x331/0x3b0 fs/proc/fd.c:68
 traverse+0x141/0x3a0 fs/seq_file.c:111
 seq_lseek+0xb5/0x170 fs/seq_file.c:323
 vfs_llseek fs/read_write.c:387 [inline]
 ksys_lseek fs/read_write.c:400 [inline]
 __do_sys_lseek fs/read_write.c:410 [inline]
 __se_sys_lseek fs/read_write.c:408 [inline]
 __x64_sys_lseek+0xe5/0x160 fs/read_write.c:408
 x64_sys_call+0x2d2a/0x2fb0 arch/x86/include/generated/asm/syscalls_64.h:9
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x0000e4d3 -> 0x0000e4f2

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 5624 Comm: syz.0.732 Not tainted 6.15.0-rc4-syzkaller-00021-gca91b9500108 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
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
