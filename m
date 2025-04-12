Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD2195
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 03:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744427784; cv=none; b=Q5GuCiIRRQNCTfZUwg7/FacDgKn42onwNKwCawdEScDUinivlX443azNp6tmWssDvQatgc9ssbmrwtwXl5cqC8sQyc69wOu5sy2KG95K9awgKyQLVTiIJqyh8TjP6WFYshX/cl3ofAG9IdMyotittHaIOuQ5MzkLUCtuIidTwBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744427784; c=relaxed/simple;
	bh=AgDXfnsTK8+YguBIAfkD2mLlbxgmGPX/sqDsMJs5mRk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IH16oG4bpi7+Vbq43qhVsCPeGsbMl2sTuqb982ImGew2drun+wqknFo+nFdqhHrD27NOM2dpUJlv8nKLy1rsd9nXIhTq/DwjgMFMpMLh08ixzKhRQw+r7V31xgNRwcuHmvT5AKwIN19ZF6Vk4cdbDvFRvcNccHgcdAeiSamBo00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d438be189bso24787005ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744427781; x=1745032581;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6zi2RrzRY7UuAAecIJ8rYOOGjA2CcvwJYV7rTH538w=;
        b=goa+UkTOsHZ94c3w3gQXKZAA7uNCPJeJ8B39ful710CzzZNTqFpGRPooGsgDZcMld0
         tCplU8FigP4kp57T6/ZF8egQ2YEgCZ73FyCxIdgSgelL5ZAjY2bMs8VpbD+Jc6tDWP7Y
         KzEabhvibEyftl82/UPETeKS+OrmQr3VB/OpAm5cP96eVEYt59ERrqYh9Fcf8gPtQ1I/
         45QnUrJqdZEJX+yiYPpYbVZm8iciFB7+MadPTgx/F7jLIIgNniS/HV6cYZGsZlTYjmbC
         Zs4gl89OjmZb23fFIFHQbmCB4FPrEgbD46POXUEsrITcQmUzbI3Ucu14yMX7jk040pco
         IMPw==
X-Forwarded-Encrypted: i=1; AJvYcCV7FpQHHpB3Rf815eG0fVTliJGz1foLMFCqbeCQ9c58nBpocVjQEFKiD1ZfP5tZ7oIJzDdbuPKk7RZS2ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YynYUOBWW+uMj2guIPRwyrLOc4l3Zll71oNXPeKSlTyTCQFVEKC
	r8IW65ou9D3AcjnWZRuEtn7OyxA8HzBfTXtJOVIAvDr42gTTSTAn2qgMQtc3/o/jgVIuQloTQmH
	QpaOrp9nwtZmIsXUMgMJCAVDMzY3atvZnaRra8Azw27xzyTCfLCEAhBw=
X-Google-Smtp-Source: AGHT+IEq826wkvnIK8SjQD79IkL4KhtGSaNCTmn1wcJNjdchRYnl5H3yFn0YXsQe6TF4pKOrIeC4ehQfzIN5dEIbI7nIlo+i8ZqJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2603:b0:3d5:d6ad:286a with SMTP id
 e9e14a558f8ab-3d7ec225f5amr50705875ab.13.1744427781538; Fri, 11 Apr 2025
 20:16:21 -0700 (PDT)
Date: Fri, 11 Apr 2025 20:16:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f9db05.050a0220.379d84.0004.GAE@google.com>
Subject: [syzbot] [f2fs?] kernel BUG in f2fs_put_super (3)
From: syzbot <syzbot+1badb065d3258a08f5e2@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0af2f6be1b42 Linux 6.15-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11464c04580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd7cb758c9c7b24c
dashboard link: https://syzkaller.appspot.com/bug?extid=1badb065d3258a08f5e2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d136202c0eb5/disk-0af2f6be.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3adf5299bf86/vmlinux-0af2f6be.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3f351885eecb/Image-0af2f6be.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1badb065d3258a08f5e2@syzkaller.appspotmail.com

F2FS-fs (loop2): detect filesystem reference count leak during umount, type: 9, count: 4
------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:1674!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 6486 Comm: syz-executor Not tainted 6.15.0-rc1-syzkaller-g0af2f6be1b42 #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : f2fs_put_super+0xea4/0xef0 fs/f2fs/super.c:1672
lr : f2fs_put_super+0xea4/0xef0 fs/f2fs/super.c:1672
sp : ffff8000a0c17960
x29: ffff8000a0c17a50 x28: ffff8000a0c17980 x27: dfff800000000000
x26: ffff700014182f30 x25: ffff0000cac24000 x24: 0000000000002ff5
x23: ffff0000cc3a6087 x22: ffff0000cc3a6087 x21: 0000000000000004
x20: 0000000000000009 x19: ffff0000c6fc0000 x18: 0000000000000008
x17: 00000000fffffffa x16: ffff8000833376cc x15: 0000000000000001
x14: 1ffff00014182e60 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000001 x10: 0000000000ff0100 x9 : 6e36701c3beb6900
x8 : 6e36701c3beb6900 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff8000a0c16fd8 x4 : ffff800090035280 x3 : ffff8000832c7c3c
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000058
Call trace:
 f2fs_put_super+0xea4/0xef0 fs/f2fs/super.c:1672 (P)
 generic_shutdown_super+0x12c/0x2bc fs/super.c:642
 kill_block_super+0x44/0x90 fs/super.c:1710
 kill_f2fs_super+0x2b4/0x590 fs/f2fs/super.c:5032
 deactivate_locked_super+0xc4/0x12c fs/super.c:473
 deactivate_super+0xe0/0x100 fs/super.c:506
 cleanup_mnt+0x34c/0x3dc fs/namespace.c:1435
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1442
 task_work_run+0x230/0x2e0 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 do_notify_resume+0x178/0x1f4 arch/arm64/kernel/entry-common.c:151
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
 el0_svc+0xac/0x168 arch/arm64/kernel/entry-common.c:745
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: aa1303e0 2a1f03e1 2a1403e3 97ff825f (d4210000) 
---[ end trace 0000000000000000 ]---


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
