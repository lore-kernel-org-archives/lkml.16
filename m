Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D1528689A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884774; cv=none; b=gb8aZ4lHD5VNA4HM6nPa05BAcfaS/LiIa2GmWbrko9gw2f+BGfcDvvpTPpfefXaKJAxKaZIZqzqw22rum4x3E/OyGSTArxQMMl7I8KL01vkhhJKRkuaD66DExZ0xsMKJJv6pcaUWO8endloG7BJQw+CprO2ZuL98jzydzRiBBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884774; c=relaxed/simple;
	bh=R06A8xYQ3MEhH6HcvO36MpGyY6uSpNejoHZgQFMwxCU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uShnk/LOeI4lXj3tfeAhlmJ30wvX6ZBiRmKcq1rg1Wu6pKaN0rezpXvt5GK1g8Nf0xK8lKWD360wOVKDLI30R1idXlsgG3Xwpjy6uoQDxoTEnfCYB7DupF0IoVCVwHfrOmxBYPRxt6s+z6Nhl3JLZPBs+taaPHMjRlF0CXa+z34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso263785839f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751884772; x=1752489572;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8gxIQe2/CeWHQYfioTtU5wH7rq2n3OO0ZmXQUuYK+w=;
        b=hmm4GHusjVvYidigmp/SPezLFdWnCVLrMOqm9DzBm0IQFseeY2+zZp16pwZHpl+nwK
         vHed74AXZU7iKZUHJwFdChNag2swUVKTF7r9QzVQxPfXEEsoAsYgLsfYz5/ttVT80Y49
         1qq3UeVr1EyOs35J9RA0UWtNq2D7H4+URQFFJ9o01V4/Kg89ppVulDC3x9AW7q/ENgvN
         o9r9w+XEZYORcS1Iy3D0V0c3kY/TTYq89lXYmmDlQS3DUu5emO5N1ubv4a4cP4fRxR7x
         hWAqjT2Arn4I1sBsJbNVG4wnzqeK3ONKbPv6jyx391cL6RaDOOwdEEe3t9x5cuc/ArgD
         JFiA==
X-Forwarded-Encrypted: i=1; AJvYcCXXX8d8aHpjkiOe0+3AmDlx2Y2RSNiUd+uR9O8lTOl9enJ+jFSKtDDQSEyPr/uLOoj6osJJc60JLcL9dyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAcohbwqSK8TexQpgO437AmN3iUkUJl4e8+s97MZvPcDzEqJ5r
	SZORRaq29B+xiO3iGqfNzBC2XM4AVTgTcTwhGyCH7t2JF++yaTfxHnIAkLKwNKK2ukyi7bF1SxE
	vst3zcrBl6F4slt8J5JIC4OsVNWx+x5fg+FWPr78s/575CFZUB30m0BLgy5M=
X-Google-Smtp-Source: AGHT+IGOK+PLt/sL+nj1ZVtTZUoojeVM89vQV46qOWH54DrKzueIMm3CjWEKc1s87cteEJ2MAPj6nZajbvrncGFjgA3fVZ9gVjEd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2303:b0:3dd:f4d5:1c1a with SMTP id
 e9e14a558f8ab-3e1371dc051mr90513405ab.17.1751884771695; Mon, 07 Jul 2025
 03:39:31 -0700 (PDT)
Date: Mon, 07 Jul 2025 03:39:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686ba3e3.a00a0220.c7b3.007f.GAE@google.com>
Subject: [syzbot] [kernel?] KMSAN: uninit-value in dt2817_dio_insn_bits
From: syzbot <syzbot+cb96ec476fb4914445c9@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a79a588fc176 Merge tag 'pm-6.16-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e62582580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa9af7332485152e
dashboard link: https://syzkaller.appspot.com/bug?extid=cb96ec476fb4914445c9
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b7cf1187020f/disk-a79a588f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/47e08d61ef4b/vmlinux-a79a588f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/75d3bcd3c8e0/bzImage-a79a588f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cb96ec476fb4914445c9@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in __outb arch/x86/include/asm/shared/io.h:22 [inline]
BUG: KMSAN: uninit-value in dt2817_dio_insn_bits+0x42d/0x4b0 drivers/comedi/drivers/dt2817.c:82
 __outb arch/x86/include/asm/shared/io.h:22 [inline]
 dt2817_dio_insn_bits+0x42d/0x4b0 drivers/comedi/drivers/dt2817.c:82
 insn_rw_emulate_bits+0x3a6/0x560 drivers/comedi/drivers.c:632
 parse_insn+0x14b0/0x1780 drivers/comedi/comedi_fops.c:-1
 do_insnlist_ioctl+0x412/0x890 drivers/comedi/comedi_fops.c:1568
 comedi_unlocked_ioctl+0x1c6b/0x1e00 drivers/comedi/comedi_fops.c:2253
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 comedi_dio_update_state+0x244/0x250 drivers/comedi/drivers.c:392
 dt2817_dio_insn_bits+0x6e/0x4b0 drivers/comedi/drivers/dt2817.c:79
 insn_rw_emulate_bits+0x3a6/0x560 drivers/comedi/drivers.c:632
 parse_insn+0x14b0/0x1780 drivers/comedi/comedi_fops.c:-1
 do_insnlist_ioctl+0x412/0x890 drivers/comedi/comedi_fops.c:1568
 comedi_unlocked_ioctl+0x1c6b/0x1e00 drivers/comedi/comedi_fops.c:2253
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 insn_rw_emulate_bits+0x52d/0x560 drivers/comedi/drivers.c:629
 parse_insn+0x14b0/0x1780 drivers/comedi/comedi_fops.c:-1
 do_insnlist_ioctl+0x412/0x890 drivers/comedi/comedi_fops.c:1568
 comedi_unlocked_ioctl+0x1c6b/0x1e00 drivers/comedi/comedi_fops.c:2253
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x95f/0x1310 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kmalloc_array_noprof include/linux/slab.h:948 [inline]
 do_insnlist_ioctl+0x1b2/0x890 drivers/comedi/comedi_fops.c:1551
 comedi_unlocked_ioctl+0x1c6b/0x1e00 drivers/comedi/comedi_fops.c:2253
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 6184 Comm: syz.4.49 Not tainted 6.16.0-rc4-syzkaller-00308-ga79a588fc176 #0 PREEMPT(undef) 
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
