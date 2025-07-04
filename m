Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584872E370A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751665852; cv=none; b=DSmEHmEYNAMGoNvstm1S+t6UMS7fICAwYG10Qt9ZcF6nphR7TzXeTGhzjV4VrsS0fZ6e+3X0xWn6wRlHU5rTEB5f+iRaD7T6jbsuSoDapmZY0+ycObBUBNLuKF9/10hY9ZuDZEOORzQ+t1hwGQhfRcpkDj+jDLojeSYn6u6n4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751665852; c=relaxed/simple;
	bh=qgxq7///GeouJK7xcHvUiFrlrBEzil20246mzZ43dtI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=n9Pedw399rNJdq1HMtcFiSBgAFoeROv3+b4GXzgKUTCo14M+fXndn22wxFLq1IIlONaJu5/8TkabOMkK2i+etFmBvBcSksxDGY3oSbK98Th4XX4b8VHP0kGE6lMDFPb6Kwq9l8iljK7ZbYSKE7wQgyrT16OOZJrO6OXgTD9wxXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3de3b5b7703so7626115ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 14:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751665849; x=1752270649;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBVoY6MXTyvkzm4bD6y7JoQow2ydBQAJtt7fOsYxSXI=;
        b=dQCf4bIY17h/+niVGwsmhaWAm0uYFHKTMxNiNWOarC5Ccg/fARuxkfG2Chy7NzMtAx
         aCcMHOBvfjMW9+kieylriMxBc4uC/gUywL0LjqvVky5y44fKBenqkcnVkemMyY5RqBMZ
         VmTcb1LDMnLBi11Ev09P2vmxTcIxoWtNFKf3Qpznd3ZwfdndRD/GuYkUBAN9yZRLM2Dw
         kdWJX0J5qrdmb8cyZ7BHws+k8twbtWt63+xC6LLBK/QXzlEBFmHN/bZdlR1BxqpPAJz+
         +iFtu4kTXkvawtHxKXAnv3+tWx6/a6ln4Ehc5hSCMs2Yo5ermplCVatHT0wW2lzu+Ovr
         fUhA==
X-Forwarded-Encrypted: i=1; AJvYcCWVu4Es+tZpMF8PAZMnzwtHpqWrZxY95Hc8tgGSZu4rxz6CKfD9twyopXBr63oZ26wyJ1MgLfb/3zCPd+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzzDfCbn+AIHJGnIZVUmdXMB0gAHJG7nZlThwQdVMh/4T+ivZn
	nRsQ/BioEaLHY/S7yR71sNOcmpr51wmDAY7lRLTA1bhdNFvkPLsMOz1eeIhZX0QT5QgwEXM3UA0
	tEhANUiYgHMsGesL37poY2uc7+pXQMATCYOBewOJkAGJK9J1NHwyszFsIq1k=
X-Google-Smtp-Source: AGHT+IEChCJYW3c9CF+R7CukkrwnrBpPGEpzi8aXvidGZhf432oLkyKZhi/BEpKH90dKP9V2ck8bBuJIvRGZUxUipgRXSulfoKZ6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349f:b0:3dd:ceb0:f603 with SMTP id
 e9e14a558f8ab-3e136ea24f4mr39331245ab.2.1751665849464; Fri, 04 Jul 2025
 14:50:49 -0700 (PDT)
Date: Fri, 04 Jul 2025 14:50:49 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68684cb9.a00a0220.c7b3.0027.GAE@google.com>
Subject: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl812_attach
From: syzbot <syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4c06e63b9203 Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=104a8f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b29b1a0d7330d4a8
dashboard link: https://syzkaller.appspot.com/bug?extid=32de323b0addb9e114ff
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b17ebc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144a8f70580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4c06e63b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ff61efc838cb/vmlinux-4c06e63b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dea44d0d14bb/bzImage-4c06e63b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+32de323b0addb9e114ff@syzkaller.appspotmail.com

------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/comedi/drivers/pcl812.c:1152:10
shift exponent 8550 is too large for 32-bit type 'int'
CPU: 0 UID: 0 PID: 5465 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-00123-g4c06e63b9203 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:233
 __ubsan_handle_shift_out_of_bounds+0x386/0x410 lib/ubsan.c:494
 pcl812_attach+0x1b9e/0x2300 drivers/comedi/drivers/pcl812.c:1152
 comedi_device_attach+0x51d/0x670 drivers/comedi/drivers.c:996
 do_devconfig_ioctl drivers/comedi/comedi_fops.c:855 [inline]
 comedi_unlocked_ioctl+0x686/0xf40 drivers/comedi/comedi_fops.c:2136
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fed6198e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd34893f98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fed61bb5fa0 RCX: 00007fed6198e929
RDX: 0000200000000140 RSI: 0000000040946400 RDI: 0000000000000003
RBP: 00007fed61a10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fed61bb5fa0 R14: 00007fed61bb5fa0 R15: 0000000000000003
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
