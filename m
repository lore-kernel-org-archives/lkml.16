Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F28322E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 04:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746765809; cv=none; b=hRC1u2QSVuKetlD84xuVuxMrGecChDcvcuIAqJbjKIlcMIJXzi4B7hYBX44RFOHrgh3s79Lw6pPTIEsueI7wRA2NhlXs95miUMTnhdTW72j7IsKFExC8mzrSpaRXxKTFYvxOFfZW55Z7ipc4rUB0x7yHb/Bnf0V0s7EuNeELYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746765809; c=relaxed/simple;
	bh=6vS+9ndATdRqq4O591q465VeiFzEQ35RcGwfqX/3lLk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=us2J4DKPwXDwJo14al8XmmrYqUxUPcdJESU1Na2UWTXzvsaf9swyK0jJgduNTUOG/uDtpLu1DDb2SYEDeWpUCErs5XxvOKF9SF3rptjGRyeLS8pwHRxc170AayClvBvgQHSXTu7tlXx7Sw8IhpyOaRcazS/Nn9Eo/UhyFEsmPk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86184fa3d00so138894339f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 21:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746765807; x=1747370607;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xi0HR6ic3akJ+aF/aO4A0Ekh2qNadtT1uQ1LPMqp764=;
        b=CikI7IuXKpymaMCenBF8omHXbw2HNLvdjEI8G6qX648egclS9RSJZiuWo4FAbSbAZa
         Y2hGP6ASBEf24Qm0Wr7Xzd7mVkXKYsTEv74WlMxjEDhfMn9sDy2UMNtkcvkSvIAhBVWB
         /I3Z1H+Na0JSjVTj1R6tMYN+vIp1XeXNyBSt0QJEX/47wMTegnFCWgPBYJ2lBDY+3G2h
         9IJo5vzSJ7WcgITdTZ2Rapa5sZnacNrB1c8vuHBlT0nbg53B8EYTJpDQF1c6i8/CBrsC
         dgcpgw3MjQnjiB7aJ8VlExk2vD3IXI2zixb/AqzlvXU750XP1168MKPtfVf/8WlXbWEq
         QZVA==
X-Forwarded-Encrypted: i=1; AJvYcCWs1lp79GxDjaSeTzGhG7vY2ZqG2eZkVaCOA3oUOCopw4wnDqBOMRU6vaHOwyzpKZgtKPhO19c2h77heR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWN4N/3N215IXbfhZE3VC4OIjM0EOTLfXZN49R1Vm/LWUI7/L
	gXTRH/yuaCglvIyhCu5AdUg+Ozd+dTGRRFD4Wc2MYjtAQ7wlE4rlCliQLHv4RCov4bQb39TCPLt
	G1Px+nnoSQgbFqHsGaPakC65Md5gZvrf77oBFKCXAK2CfJKZSR67eEZg=
X-Google-Smtp-Source: AGHT+IEw2yaaxwXAzGeCMdhEnT3LTjros0TrLPonVDAHSnPBHEOZsWRw804PNHdUpE6S4MnvirtuJbfnC3IGTIKdv1JePb0vB+q9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154e:b0:3d6:d18b:868c with SMTP id
 e9e14a558f8ab-3da7e1e71a0mr24516985ab.10.1746765807123; Thu, 08 May 2025
 21:43:27 -0700 (PDT)
Date: Thu, 08 May 2025 21:43:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681d87ef.050a0220.a19a9.0125.GAE@google.com>
Subject: [syzbot] [jfs?] WARNING in jfs_rename
From: syzbot <syzbot+9131ddfd7870623b719f@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    14c55b7bb0a8 Merge tag 'perf-tools-fixes-for-v6.15-2025-05..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=178078d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a42a9d552788177b
dashboard link: https://syzkaller.appspot.com/bug?extid=9131ddfd7870623b719f
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16845a70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1681d0f4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3edd34cd2f74/disk-14c55b7b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a6d9796beefe/vmlinux-14c55b7b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/90e0c0a88995/bzImage-14c55b7b.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/cb4a6659212d/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=167008f4580000)

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14935a70580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16935a70580000
console output: https://syzkaller.appspot.com/x/log.txt?x=12935a70580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9131ddfd7870623b719f@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5815 at fs/inode.c:417 drop_nlink+0xc5/0x110 fs/inode.c:417
Modules linked in:
CPU: 0 UID: 0 PID: 5815 Comm: syz-executor240 Not tainted 6.15.0-rc4-syzkaller-00319-g14c55b7bb0a8 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
RIP: 0010:drop_nlink+0xc5/0x110 fs/inode.c:417
Code: 70 07 00 00 be 08 00 00 00 e8 b7 84 e8 ff f0 48 ff 83 70 07 00 00 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc cc e8 0c b3 88 ff 90 <0f> 0b 90 eb 81 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 5b ff ff ff
RSP: 0018:ffffc9000403f8b0 EFLAGS: 00010293
RAX: ffffffff82371c54 RBX: ffff88807ab92910 RCX: ffff888068d38000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffea0001ebfef7 R09: 1ffffd40003d7fde
R10: dffffc0000000000 R11: fffff940003d7fdf R12: 1ffff1100f57252b
R13: 1ffff92000807f28 R14: ffff88807ab92958 R15: dffffc0000000000
FS:  0000555585560380(0000) GS:ffff8881260fd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000066c7e0 CR3: 000000007eb1a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 jfs_rename+0xbb3/0x1610 fs/jfs/namei.c:1247
 vfs_rename+0xb99/0xec0 fs/namei.c:5121
 do_renameat2+0x878/0xc50 fs/namei.c:5270
 __do_sys_rename fs/namei.c:5317 [inline]
 __se_sys_rename fs/namei.c:5315 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5315
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff16a8d0639
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc9b984ab8 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007ffc9b984c98 RCX: 00007ff16a8d0639
RDX: 0000000000000000 RSI: 0000200000000780 RDI: 00002000000003c0
RBP: 00007ff16a949610 R08: 0000000000006221 R09: 0000000000000000
R10: 00007ffc9b984980 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffc9b984c88 R14: 0000000000000001 R15: 0000000000000001
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
