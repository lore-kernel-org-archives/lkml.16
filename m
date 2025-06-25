Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8A1F3D20
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750809630; cv=none; b=XXUqJNScF6CSf+nC8VEjczU9JyD7D6byNdr8ZTa9EjWiW+BvmGAIN552yVSZRZpFo+oDmXMkpKieLaPT3gVArJ02QOR/c0gIQHOdh3QAhW+w8COKGlWxzT+FLG+/gUz+zFywCVagJELurDsPli+1GspMG3CTHy46DrTBU2DNO5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750809630; c=relaxed/simple;
	bh=8sive2Jl4qKmiMsMEqR3Gv72F8HQHweD7jjG/zBky+E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Vfao48trjXB5bH65wo/GTurPBrUAoqoer2ggkhRgV5UGPmDcTmM/5ywysgOhtkLNyYr2mIuH8vPGQI/3RfbhKgdNhbzqT/j4ETE+wQjFTFceIDXmVg7CgCwB5OWPY+fsXgFi/79RptbBWbU0igJz+nDZ2pAHLuV9ZkcWXYTEEKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so14569885ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750809628; x=1751414428;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCtqvdPUTs51gqi/5wXoJUWwtYfBR5G8iVs3Go24gLI=;
        b=DAMPInBhcI+fUpuYqwbeCFgDzonITIWSWFVH8MgEvpop5p+lM9EfbjN0mCIDN6dlo3
         iv9FoWK2Y54aAgts7obUUlMxHPmpV9smgAD3mDnIzbcS381lvPcweIBgiQt8ef9AMxCx
         +mQOMDWH8JTe5z0Nq7bpKvMXcXojza4cpENA+yu/Bg5bDk6jpsLLFJQey0jTRlyqqiWi
         AxU5qb5Po/kNJGZGyMDmIcfveJ7FF8bTET7lXY2S3jGyVr0t5C3GH4JvO4Yrrk5Mq3yr
         kL++3XHWEhC2KGZxrA7NwONNqxpeA5XCDq0BRebbpVcsYZ4oL7iOX6QihC1R2MwFbXzl
         RQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfop7KzbvtAnHF5Sf/kgbdA3v6qCcDz4cKAO4gsGpd4UDnDaTyp9jdtYtnMIH2MG+U1Tslhd9VoWY8yUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJppl/qQKWSvlX2KTkyuXuig9Q11ONvXcXw3+4RXpuZahSJem
	k62IOwacP1Rl+nM0JLKrypNtKu9Aavt3hDUHUSD6kH6R1MF5clrc1s7JY6mLFu+ob3XKJvVGldj
	AEjf0OaIePfCNnWV8ISf7PQh5sSFBy0P5m4IH4M7ruVjVGWd0SZq/7g0O98s=
X-Google-Smtp-Source: AGHT+IEFY0yuri4cuswlN4ChR08WzmEPJO9M5hmf2V7vwFtun89PVuyie76n9x0RMfoaR5x8/Gea53lQBHfNhGg1OW3fuiwuNtDq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b45:b0:3dd:b762:ed1b with SMTP id
 e9e14a558f8ab-3df32949ecdmr14318475ab.16.1750809628001; Tue, 24 Jun 2025
 17:00:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 17:00:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685b3c1b.050a0220.2303ee.0010.GAE@google.com>
Subject: [syzbot] [bpf?] WARNING: kernel/bpf/verifier.c:LINE at do_check, CPU: syz.NUM.NUM/NUM
From: syzbot <syzbot+dc27c5fb8388e38d2d37@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	henriette.herzog@rub.de, john.fastabend@gmail.com, jolsa@kernel.org, 
	kpsingh@kernel.org, linux-kernel@vger.kernel.org, luis.gerhorst@fau.de, 
	martin.lau@linux.dev, memxor@gmail.com, sdf@fomichev.me, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    050f8ad7b58d Add linux-next specific files for 20250616
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10678370580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2efc7740224b93a
dashboard link: https://syzkaller.appspot.com/bug?extid=dc27c5fb8388e38d2d37
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13531e82580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/49faa18d2f53/disk-050f8ad7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c6f9cd7fe5d/vmlinux-050f8ad7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/84a08d6403ee/bzImage-050f8ad7.xz

The issue was bisected to:

commit d6f1c85f22534d2d9fea9b32645da19c91ebe7d2
Author: Luis Gerhorst <luis.gerhorst@fau.de>
Date:   Tue Jun 3 21:24:28 2025 +0000

    bpf: Fall back to nospec for Spectre v1

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1346f6bc580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10c6f6bc580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1746f6bc580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dc27c5fb8388e38d2d37@syzkaller.appspotmail.com
Fixes: d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1")

------------[ cut here ]------------
WARNING: kernel/bpf/verifier.c:19944 at do_check+0xa99c/0xdba0 kernel/bpf/verifier.c:19944, CPU#0: syz.0.16/6006
Modules linked in:
CPU: 0 UID: 0 PID: 6006 Comm: syz.0.16 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:do_check+0xa99c/0xdba0 kernel/bpf/verifier.c:19944
Code: fc ff df 0f b6 04 08 84 c0 0f 85 91 2a 00 00 c7 03 00 00 00 00 49 bd 00 00 00 00 00 fc ff df e9 9d e9 ff ff e8 95 8a e9 ff 90 <0f> 0b 90 e9 fe cf ff ff e8 87 8a e9 ff 48 b8 00 00 00 00 00 fc ff
RSP: 0018:ffffc90003d7eec0 EFLAGS: 00010293
RAX: ffffffff81d6df9b RBX: 0000000000000011 RCX: ffff88807a10da00
RDX: 0000000000000000 RSI: 0000000000000010 RDI: 0000000000000011
RBP: ffffc90003d7f2d0 R08: 0000000000000004 R09: 0000000000000004
R10: ffff88802fa5b07c R11: ffffed1005f4b612 R12: 0000000000000010
R13: dffffc0000000000 R14: ffffc9000321e000 R15: ffffc9000321e611
FS:  0000555578232500(0000) GS:ffff888125c40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2f25ffff CR3: 0000000076224000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 do_check_common+0x18c9/0x2400 kernel/bpf/verifier.c:23078
 do_check_main kernel/bpf/verifier.c:23161 [inline]
 bpf_check+0x110e2/0x1a240 kernel/bpf/verifier.c:24515
 bpf_prog_load+0x1318/0x1930 kernel/bpf/syscall.c:2972
 __sys_bpf+0x5f1/0x860 kernel/bpf/syscall.c:5978
 __do_sys_bpf kernel/bpf/syscall.c:6085 [inline]
 __se_sys_bpf kernel/bpf/syscall.c:6083 [inline]
 __x64_sys_bpf+0x7c/0x90 kernel/bpf/syscall.c:6083
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9eb5d8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcbbdcac48 EFLAGS: 00000246 ORIG_RAX: 0000000000000141
RAX: ffffffffffffffda RBX: 00007f9eb5fb5fa0 RCX: 00007f9eb5d8e929
RDX: 0000000000000090 RSI: 00002000000004c0 RDI: 0000000000000005
RBP: 00007f9eb5e10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9eb5fb5fa0 R14: 00007f9eb5fb5fa0 R15: 0000000000000003
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
