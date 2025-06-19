Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A26E21ABC2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750377448; cv=none; b=EHr4GhZ9h84IxKVy1OqY5ZUPMTff35kIwuabKwxXgm1g9sWCLwu1qBw25dT1m7x0H4RqpmOJhxgpt8P3Uaw9GvoJ3E/MLqm7mWkfF6jymf0Ke+CXqUwaULv7yV9m6kgY8RcXqt/BHk6jw+w7e8XPwXVURTC3wOGGnh9RpAeLfI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750377448; c=relaxed/simple;
	bh=8CkLORmZ39Kyfba3bOsCbHZE2zMgLqFJ3T0K2y6NQPc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hYimmEb0ielWHzlee5Kh1fUV3Jmr2Y02GN3IZJtGOp2nUYf+fKi05ph4yt5lT6DFtAETG/4GH2NMXcgLxuJvbsDLZZ5JmpZEClBoLn31l21FSOaIcu7uCeqUnSkYogMy1whNdHpH+Jx26xO8JJcp/krOAj/WxLPwBRUnFkaAA+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3de121edd59so29036495ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750377446; x=1750982246;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/lN754HPp4AKa8KIZj2kE9zMnsIpiT+KpjZF8R13ns=;
        b=iBLff4USh1if0v2FauAkN86UT4KUQasgDsk577trp2Ot0sXDQKSGKpT+VjWXf6QAy/
         OGWhDQq/O+XT6994IbUnJG2SBz+RyHX6oaRcTtHAihQ6AlRlNKkScHpd7Sx6F01jJ4ZK
         4JzOxxYkcrUR49mWzdsZW0o4zN0ieYeTVgq71N6Bbe11X0hhjolR/tra6FIj3JHNbEKW
         Grw7SPFeQwObdpOp11dI02cgMCMBh0VOLSRpvVUDMPuLKo99QhHAmgIo8DZ3cs7dnmih
         EDTcheG/AYZ9QuYJYm/yUTixlNXjqPNVApOLxTppiZfCY7wj6PoDGeriENX2f1iPLdFC
         eDeA==
X-Forwarded-Encrypted: i=1; AJvYcCXdkmFd3QgWzbVp8lzWgA3jSf9qA23hZgUo18rnSTvriR2Cul95NdQ/Uv+SuUm2USXCWz0ORMBV4XN0oYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQoS5342z0/vWioZkq9HOpqIo/TBe0TEDbgWOaMK6CU9BxxGfj
	YG0COJPJV7SShu+PA1eBft2UxgdpF3yR5C9/jA6h6OYXxntWAogsUP4SGF69W4MRfGBAKME/Egu
	6TNN+OlcjYs8e+NAj2TVtZcWLTZPPvamuxtSNDEeYXzxs0mDQa/Iwqa7bv7Y=
X-Google-Smtp-Source: AGHT+IHjVSg2I2qQR+dcH9PcRmHGUVVLw3w1KCRK4zo/OzOCNWWl7q+ge9EudiWzmJ8T31I29N6RFbPK4slHMe1QvNSLnNEGTvwv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cb:b0:3dc:8058:ddfc with SMTP id
 e9e14a558f8ab-3de38ca2ef1mr7560715ab.11.1750377446376; Thu, 19 Jun 2025
 16:57:26 -0700 (PDT)
Date: Thu, 19 Jun 2025 16:57:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
Subject: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com, 
	bryan-bt.tan@broadcom.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	vishnu.dasa@broadcom.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    08215f5486ec Merge tag 'kbuild-fixes-v6.16' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13f7fd70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f7fd70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1485690c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/01c395d764eb/disk-08215f54.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/15fc58e6441d/vmlinux-08215f54.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dbd5ac78ef83/bzImage-08215f54.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-infoleak in instrument_copy_to_user include/linux/instrumented.h:114 [inline]
BUG: KMSAN: kernel-infoleak in _inline_copy_to_user include/linux/uaccess.h:196 [inline]
BUG: KMSAN: kernel-infoleak in _copy_to_user+0xcc/0x120 lib/usercopy.c:26
 instrument_copy_to_user include/linux/instrumented.h:114 [inline]
 _inline_copy_to_user include/linux/uaccess.h:196 [inline]
 _copy_to_user+0xcc/0x120 lib/usercopy.c:26
 copy_to_user include/linux/uaccess.h:225 [inline]
 vmci_host_do_receive_datagram drivers/misc/vmw_vmci/vmci_host.c:438 [inline]
 vmci_host_unlocked_ioctl+0x1e7e/0x5200 drivers/misc/vmw_vmci/vmci_host.c:932
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable __x.i.i created at:
 set_xfeature_in_sigframe arch/x86/kernel/fpu/xstate.h:81 [inline]
 save_xstate_epilog arch/x86/kernel/fpu/signal.c:140 [inline]
 copy_fpstate_to_sigframe+0x11f2/0x13d0 arch/x86/kernel/fpu/signal.c:232
 get_sigframe+0xc6a/0x1020 arch/x86/kernel/signal.c:163

Bytes 28-31 of 40 are uninitialized
Memory access of size 40 starts at ffff888131f74080
Data copied to user address 000000000000a4bf

CPU: 1 UID: 0 PID: 5798 Comm: syz-executor419 Not tainted 6.16.0-rc1-syzkaller-00239-g08215f5486ec #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
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
