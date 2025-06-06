Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108741339A4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220114; cv=none; b=ZAyZpWTBGxwtl9tpDzc8qoo0aob/LzFR97sgHUwWozV6LCGPf15lDA5Dg5q8OiHHTj3vwn/yEU2+03xIg0rrI1TzXSiwR9j4Cyuxpb4JRYTj4xOXf+ZhUUe0i+ScFXSDMVKT9kfsFn8qJh2FrxglttXDDDGWlCg/IqqOqxEXLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220114; c=relaxed/simple;
	bh=biYcYaU5eBW9WP/dymTI+cSw8ql6koScbNr6aIjyULM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qKah19d2n/8kmD/LdOx7E1R5zsmhnQOUxVhQXN+0B+S3A6++XeMlr9NowEVm3n+X0fUvA5llqC84V4HZJ/SL4HCJIBuqaB9fVqI4Un2nWR6RXUhwYxpr2jHdCbbXM6xuH/Aftrc0iIDyPbzZavl+VUniJpgdnLj9wM1bboswS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddc3f14171so29037295ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220111; x=1749824911;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9O7Vw9hq24JSKUy5LWCCSKNu/YQohpnts9uAfWp4Yk=;
        b=ETCjuqA0B1P/IvdDLv0RoNvkGeDucw6EIs0NAyH+YAuky/kNI23B6PV42z+sjbAl+a
         8FnPurdVqywz5UM4nClIX3HrMRaPqfX2ACENNVVcKW30PplMFII9sHn8K10W0Dy2lVZ5
         G+DTGuZL8LU+sfB1HXvwuEgPWSLQoxVoOiHLG5rRFmBlS/RHGmAb9KL47UG9w6nAm3mK
         3krJa7kay/Ozy2WO+KnAys/scupr9VpUIeKsA0QK/crUe1Nrno05XR7fFw+DQfLFYYwk
         QHnGSe2cEqciWxBE1hk4PCPjlxs7zSAaDRGfuzgOzHKWXZo7cOC7+XZWwonX8PzVoMuC
         2RqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQvZOC0bh0UjRF7ir3oUf5ZFx+oIgtgxOpv4nKSjltFgU41pvDQEN2SSlkiu/WdTi0aqc77AS5R1tisv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzva1ComGtnYyHKv2O5a53WRTpCl7ncIDJ+zGSxWC59mc+wSUbn
	mmB4BAViuGx1RyfXB9nDs/1hQZo3g5DrxR8cQmPU82o7U0rj1acqDx3mui41zr+7xh5C55Z+bBv
	Iw6xIr6K/IqA0TXLbzuAtiPgRZ+pvdIc/yDBUONwwtG+6ea5Wev/S2bbW1M4=
X-Google-Smtp-Source: AGHT+IGl3VUXOeQZGwKedAVyHMmazJe0L0rP4hWudnpGDWFuFI6Fr2VW+cKwX5SSjX8EKM/SVw6ysE7DqQ76EX7zBnKXNp3k6WO9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:380d:b0:3dc:868e:dae7 with SMTP id
 e9e14a558f8ab-3ddce441589mr42066485ab.15.1749220111133; Fri, 06 Jun 2025
 07:28:31 -0700 (PDT)
Date: Fri, 06 Jun 2025 07:28:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6842fb0f.a00a0220.29ac89.0042.GAE@google.com>
Subject: [syzbot] [mm?] INFO: rcu detected stall in sys_unlinkat (3)
From: syzbot <syzbot+61ec37db8c428baeb677@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    92a09c47464d Linux 6.15-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=143530f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=61ec37db8c428baeb677
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1891731f8dec/disk-92a09c47.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d0de4fa2c8c2/vmlinux-92a09c47.xz
kernel image: https://storage.googleapis.com/syzbot-assets/53a4edfaecf1/bzImage-92a09c47.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+61ec37db8c428baeb677@syzkaller.appspotmail.com

sched: DL replenish lagged too much
rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P6265/1:b..l
rcu: 	(detected by 0, t=10503 jiffies, g=19425, q=859 ncpus=2)
task:syz-executor    state:R  running task     stack:22008 pid:6265  tgid:6265  ppid:6251   task_flags:0x400140 flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x16e2/0x4cd0 kernel/sched/core.c:6767
 preempt_schedule_irq+0xb5/0x150 kernel/sched/core.c:7090
 irqentry_exit+0x6f/0x90 kernel/entry/common.c:354
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:arch_atomic_read arch/x86/include/asm/atomic.h:23 [inline]
RIP: 0010:raw_atomic_read include/linux/atomic/atomic-arch-fallback.h:457 [inline]
RIP: 0010:atomic_read include/linux/atomic/atomic-instrumented.h:33 [inline]
RIP: 0010:__page_table_check_zero+0x1f9/0x510 mm/page_table_check.c:142
Code: 89 ee e8 fa 26 93 ff 4c 39 ed 0f 84 6c 01 00 00 4c 8b 3d 5a 2c db 0b 4d 01 e7 4c 89 ff be 04 00 00 00 e8 7a 1b f5 ff 4c 89 f8 <48> c1 e8 03 48 b9 00 00 00 00 00 fc ff df 0f b6 04 08 84 c0 0f 85
RSP: 0018:ffffc9000b5ef790 EFLAGS: 00000256
RAX: ffff88801d1b29b8 RBX: 0000000000000000 RCX: ffffffff822cabd6
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff88801d1b29b8
RBP: 0000000000000008 R08: ffff88801d1b29bb R09: 1ffff11003a36537
R10: dffffc0000000000 R11: ffffed1003a36538 R12: ffff88801d1b2970
R13: 0000000000000003 R14: 000000000005d6e9 R15: ffff88801d1b29b8
 page_table_check_free include/linux/page_table_check.h:41 [inline]
 free_pages_prepare mm/page_alloc.c:1263 [inline]
 __free_frozen_pages+0xb22/0xcd0 mm/page_alloc.c:2725
 __slab_free+0x326/0x400 mm/slub.c:4553
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_kmalloc+0x22/0xb0 mm/kasan/common.c:385
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x27a/0x4f0 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x28b/0x550 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x58d/0x5d0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_perm+0x213/0x4b0 security/tomoyo/file.c:822
 tomoyo_path_rmdir+0xa2/0xe0 security/tomoyo/tomoyo.c:195
 security_path_rmdir+0x167/0x360 security/security.c:1949
 do_rmdir+0x219/0x630 fs/namei.c:4506
 __do_sys_unlinkat fs/namei.c:4683 [inline]
 __se_sys_unlinkat fs/namei.c:4677 [inline]
 __x64_sys_unlinkat+0xc2/0xf0 fs/namei.c:4677
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f36e318df47
RSP: 002b:00007ffdf6aecb78 EFLAGS: 00000207 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 0000000000000065 RCX: 00007f36e318df47
RDX: 0000000000000200 RSI: 00007ffdf6aedd20 RDI: 00000000ffffff9c
RBP: 00007f36e321089d R08: 000055555c96962b R09: 0000000000000000
R10: 0000000000001000 R11: 0000000000000207 R12: 00007ffdf6aedd20
R13: 00007f36e321089d R14: 0000000000033668 R15: 00007ffdf6aeedf0
 </TASK>


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
