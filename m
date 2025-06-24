Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7861E2E2EE2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791693; cv=none; b=Z2gnRAXEXyeE7KvtM/ClrwmvZcvPHfVZISzv1xIMBWyf8j/p2blCiVVz58nsX9k/vnfrhvcb7RbpsJmojBVC8XSnCk11LFoKmXE07OVmmIlBIOvP0ENNDe9aDCdJAILN0ivr8BK4GgnH2RicgCii8U70qWsvt+HFuCdLwt6/xAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791693; c=relaxed/simple;
	bh=aLbjzGn3hzN5Fq6w7CtCUl1BXq0gsouE4GYG1t0lspk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QwP+mi+4AEq6Zg8NIn7OFyhhaeYpUEOnddWpNGEGAB9J474kwD7awDpzmOVgH/QXr6JJlUK5R5qNnagsA+/+VrI80A4Myt6Chh0ypclIX79cnFiXJkRuPiggh/gh/C/Q/aghT2tbt61E+cOztRuql3P9+jekqry63j0buva/+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-8730ca8143eso17560739f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791690; x=1751396490;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOvYSfw98Ac/jQWJsoM3q6nQovEyYvJrIRvActnfmmM=;
        b=djHRdw0MlckkvlMYdgoEoyRvj7mzfY1qgpM5HznZXPC2TPhQADq5yC55wH8D07a258
         165l2l6nHBapbFWJtTfApcCXzkqeT6IpEqQ1dTtIWxq3XZFkUTKZdD+eXid0sMOl8o9f
         U2S9e2E1+tZ5RR0bhBJtaTQvlfSzO24VyMc5l+XAxv5uLQ9XQmOO52ZmH2DXH/uA+mK7
         Cy3lOv6GXW8TlPldCwaRLVilkTeLb6d21BImAJWO1w0MCtlHTTJwMGTNcSBetmSfjLi8
         FrPclJf7hfyv+EieinfEe3qmxAOVhIbySVQ7LekndxV5IFQL7w6OfOXOBOHbrPeS2XpV
         Dk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8vTTqqYXQhz9/AVLFWRilt0Cd4cZXpSoOl8sVFvz2uYU9WGhBZoA8wc84oCvdfIceoQKBzuHdPizK/QA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzulXUVY7+xKFW43Gsr4B7TBvdPty+5yTjwr3l/JgdPRwz+AzMx
	UqCSKPxsKIeVs534ZuejmAQ/9ZzpLuZ3HluWk6sdaRZCAMQmyOaOEWwdPow2GU9goYCAs1m9Agc
	oRaDd54DTcfp4uAv9KM+Jw5weWoqSyvmx8uqOAnIUn70n/l52pvEuJWOzoiQ=
X-Google-Smtp-Source: AGHT+IG7+GPURfTvJJvK9gYGxwEVHE4cSiZVyXneCEvyulhlT45YXEg683sFuig0o1SoRqAzQF83kBYJ3rutPqVBjZx+yD7zze0z
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214d:b0:3dc:7b3d:6a45 with SMTP id
 e9e14a558f8ab-3df32a29005mr1897865ab.0.1750791690607; Tue, 24 Jun 2025
 12:01:30 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:01:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685af60a.a00a0220.2e5631.0092.GAE@google.com>
Subject: [syzbot] [perf?] WARNING in perf_pending_task
From: syzbot <syzbot+2fe61cb2a86066be6985@syzkaller.appspotmail.com>
To: acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, irogers@google.com, jolsa@kernel.org, 
	kan.liang@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	namhyung@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b67ec639010f Merge tag 'i2c-for-6.16-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17715b0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=2fe61cb2a86066be6985
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10f15b0c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1692ab0c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-b67ec639.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bcb2b262d02/vmlinux-b67ec639.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f5d4477f1e2e/bzImage-b67ec639.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2fe61cb2a86066be6985@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 5309 at kernel/events/core.c:7211 perf_sigtrap kernel/events/core.c:7211 [inline]
WARNING: CPU: 0 PID: 5309 at kernel/events/core.c:7211 perf_pending_task+0x319/0x400 kernel/events/core.c:7325
Modules linked in:
CPU: 0 UID: 0 PID: 5309 Comm: syz-executor122 Not tainted 6.16.0-rc2-syzkaller-00378-gb67ec639010f #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:perf_sigtrap kernel/events/core.c:7211 [inline]
RIP: 0010:perf_pending_task+0x319/0x400 kernel/events/core.c:7325
Code: 85 8f 00 00 00 41 fe 4d 00 eb 05 e8 21 4f cd ff 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 4e 34 76 09 cc e8 08 4f cd ff 90 <0f> 0b 90 41 80 3c 1c 00 0f 85 02 ff ff ff e9 05 ff ff ff 44 89 e1
RSP: 0018:ffffc9000d41f9d0 EFLAGS: 00010293
RAX: ffffffff81f2fe18 RBX: dffffc0000000000 RCX: ffff888032cbc880
RDX: 0000000000000000 RSI: 0000000074971a36 RDI: 0000000000000000
RBP: 0000000074971a36 R08: ffffffff8fa10af7 R09: 1ffffffff1f4215e
R10: dffffc0000000000 R11: ffffffff81f2fb00 R12: 1ffff110035f390f
R13: ffff888032cbc880 R14: ffff88801af9cad8 R15: ffff88801af9c878
FS:  0000000000000000(0000) GS:ffff88808d251000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000018 CR3: 000000000df38000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x6b5/0x22e0 kernel/exit.c:964
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1105
 get_signal+0x1286/0x1340 kernel/signal.c:3034
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9ae420dab9
Code: Unable to access opcode bytes at 0x7f9ae420da8f.
RSP: 002b:00007ffd20a313c8 EFLAGS: 00000246 ORIG_RAX: 000000000000012a
RAX: 0000000000000003 RBX: 0000000000000000 RCX: 00007f9ae420dab9
RDX: ffffffffffffffff RSI: 0000000000000000 RDI: 0000200000000000
RBP: 00007f9ae42805f0 R08: 0000000000000000 R09: 0000000000000006
R10: ffffffffffffffff R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
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
