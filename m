Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5191FBE8A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751190388; cv=none; b=aws1RTkwC69UdosG7zoa9UiwiCSKGK7jA21ZnlXyRADd3BPE6sM8BuBN0FkEidXmeJHQm6nQB2WQlhR7uH0ZTF/NiRPTJS4sj6J1Ltf0DjkIXs2ZhYwiingKtUiqqJGU5EhxEKLxVSyDDfVftLHk7mI5Gebiuf1Xsk2740k/q5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751190388; c=relaxed/simple;
	bh=tJaYJoy1pjfQoCMQLmPh2pFunrL9fpkDJI+UYPJGqcc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FqdCCGo7qaSbtShbDFL0n/3Kua1kcsK5oIPDUTAIMyJjFu41CPegNX8jk9obr3/Kk8D9Zzwr7MaVZrnswpe3xJxcTlJDUi8rX88tAxMlHlP6Gc6gc8wiykbyA+xNAMjuhevBF7Fb0CMJX7EDZIZquWISAX/Ce0Po3Y1BrsUmgSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so113465539f.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 02:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751190386; x=1751795186;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFGuMXAdlPCZWd64QK4rB1VLMUAOxI/KaHmVVkGjw+A=;
        b=qauLmuadVT/Fkq/xcpKmgAipl7UtNj8M7QQL01TI3WMWXfek5a6tgemCmUB1wHnel+
         mHArobUhGN9TtUDkHdRPUbYXNBMl4JHVfblHUGPfl0F/1KLR3gBvp/MPKnGE3VHIe2kY
         gk0TyjsDhO/06AA1iV3sGHdCUwb2sYL0UeTkB5pNijXCO16Tq0g3r1Dd9jSQNH46WoyH
         VVd5xBxgEr0eMJNiBUIZorNtwe8SwHDZZ5vTKMUfRn5f94U6Q+fXkAU0tB+zHArpToNL
         z7S7EVTKp2hWZW+kOOi7Pv2N09u/KxZyUuyCraXwRC8TS8OV3gNHlgODm82cTK7DaNd5
         9h0g==
X-Forwarded-Encrypted: i=1; AJvYcCU9kySJ4YagygRXCHKF0/flE6z1i5aT/X/Q2Ak88XgTEGRnUh0mqW1q2AgsYNzbXWA5g3UbgyN+oBrYYw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CMyOwyQyRMbTeWNlcax96jvh3ueJdpiRk0NbnrqTXPYGvHLB
	485e6844KcRxiUYF5pRVKkpTFE2ZhoCyRBHn6afGZkmzOLVka5LKwmXsel+Pb9sU8rgDY1eqggM
	SwTeZFHq1G1tIbWm8LipFcLkmvrlVQTGmnBrub60a2k+j2ewN5zNzJ8D+VF4=
X-Google-Smtp-Source: AGHT+IExVXdV5RAOmPI1rmmvWE5HKcLJoeBoVX8IBIbj1BZAWuvl6DGID/Xq0SZQLxwl/i3o7YZ37D2r2cJk5wUpo/EsGMzwQieb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c23:b0:3dd:dd39:324c with SMTP id
 e9e14a558f8ab-3df4ab6d058mr104367365ab.9.1751190386452; Sun, 29 Jun 2025
 02:46:26 -0700 (PDT)
Date: Sun, 29 Jun 2025 02:46:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68610b72.a70a0220.2f4de1.0019.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1b152eeca84a Add linux-next specific files for 20250625
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1409df0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1683770c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1183770c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4fe40968b29a/disk-1b152eec.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/edf810403580/vmlinux-1b152eec.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0b63be52ad9a/bzImage-1b152eec.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3256aebc06d8/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: fs/ntfs3/frecord.c:3030 at ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029, CPU#0: syz-executor359/5838
Modules linked in:
CPU: 0 UID: 0 PID: 5838 Comm: syz-executor359 Not tainted 6.16.0-rc3-next-20250625-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029
Code: 8b 05 36 32 9a 0f 48 3b 44 24 10 75 22 44 89 e0 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 19 b4 6b 08 cc e8 73 fe b9 fe 90 <0f> 0b 90 eb c5 e8 e8 d9 68 08 0f 1f 84 00 00 00 00 00 90 90 90 90
RSP: 0018:ffffc9000420fab8 EFLAGS: 00010293
RAX: ffffffff8305be0d RBX: 00000000fffffffe RCX: ffff888029afbc00
RDX: 0000000000000000 RSI: 00000000fffffffe RDI: 0000000000000000
RBP: 00000000fffffffe R08: ffffffff8fa18d37 R09: 1ffffffff1f431a6
R10: dffffc0000000000 R11: fffffbfff1f431a7 R12: 0000000000000000
R13: ffff88807c10a200 R14: ffff8880776e8758 R15: ffff888073d566d0
FS:  0000555581b87380(0000) GS:ffff888125c21000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e3bd1067a8 CR3: 0000000072ba4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ntfs_rename+0x6e2/0xb40 fs/ntfs3/namei.c:316
 vfs_rename+0xbda/0xf00 fs/namei.c:5129
 do_renameat2+0x6ce/0xa80 fs/namei.c:5278
 __do_sys_rename fs/namei.c:5325 [inline]
 __se_sys_rename fs/namei.c:5323 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5323
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe16d5c28b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcc6842518 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007fe16d5c28b9
RDX: 0000000000000000 RSI: 0000200000001040 RDI: 0000200000000280
RBP: 0030656c69662f2e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffcc68426f8 R14: 0000000000000001 R15: 0000000000000001
 </TASK>


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
