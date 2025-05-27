Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4640F242D79
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352998; cv=none; b=d+Ddkn5PbNdATQ8RdhAlLTgxoDPFLHGE0osJ2KObdJu5zJQfOmW5FHwKJ4aVstxgBtciypl+64j4vhmnOdb4l4ZZnO5LWLFyfRvmfcXEQuzVQ8J4G/eeln9Pt0Kj1SzRX7pzEiWbb3xKJoGDLYScjuvheRJ6SIG5h2MKMv3VTAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352998; c=relaxed/simple;
	bh=CPzMYssuE5oU5WBMY3Splhw4su2FI1EFw9TIxBJhq2A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kEe4Tgv0IBc/jEnXnAfoey7CQqLV2mUJ3bT+/ayMc53XqrfUY6gNbbxsa17CCLdpLIdWhUTtiLhTjh8pz11In5GHV6BbQjwAKsd1Ydb08E85oPuI/VL9Ggbc+qLlIhRDGC1kjJTdYrtQlDTyXIOzS4fN8+UaxjtA/mPp27HEAuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85e7551197bso299718739f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352995; x=1748957795;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tTCjCPNRlyF+ItvRwJElsfocKRD+X7mEdB0iK26mvM=;
        b=SG9mkmJeTD/HYhsjQZJbeqZ93Thl5DaKksO1W/KRasZqC64m3En9dI9u2paP+zaA2F
         t+VvnYy6I2XD/4YTDP9yl84XktbHDieF7ijasTmlaWkfdRAchZreXlQo5sY15LbQB5A2
         qDqSop+Cm0RpspbAKUqaIO7rptLE+xzn5+ltzBU9X8e5ZdMNYPVUTGESdRz6X6L27OLU
         8XnFk0FSfSiRFturxN9OCGIrWwb181i2F5xnKx0j2FvyeqgXK0mPmm336xIxLiVUwbD8
         zcehGufYxQX2W+Y9Zy/JD1wOHBE7PWQiGK9xo3V+bXDIII8nwLcg1IGs178aYOPxot9H
         KD/A==
X-Forwarded-Encrypted: i=1; AJvYcCXPuDnnPGaWgLuLNgCf9GBt2IfXZmKBhshwowZq5nthyEudRr6yqH+zwmqvJYMCtTV3TBNbjSbAouwwAMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQwdHwVfjKH2ivns5aBUO2VAJhWbze/YyTEvHtTBr6a1KRH6Pr
	QYBRvxhxmM92QevpJ/BI60rO4eCZw0JlDlEJJaOdmf+Kkfj51d+h5bBNYjZiASF6n5D018fJ25e
	2GCxlIZ9O3aNIOV7eBEIpBnYXp2KxEDSWVvRDuM+qSQ9VNZ4nXbotqKxAGZI=
X-Google-Smtp-Source: AGHT+IH3P1i9wcQlGPx8x6EYDDDcYKu0b5GmvwfIadxJdICfNBDHKbFvlf3rLQ7pWdfb4V2l59h5tVazza42jB4hWlkRS128UJRL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6e83:b0:85b:3ae9:da01 with SMTP id
 ca18e2360f4ac-86ce42582d0mr47624639f.4.1748352995337; Tue, 27 May 2025
 06:36:35 -0700 (PDT)
Date: Tue, 27 May 2025 06:36:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6835bfe3.a70a0220.253bc2.00b5.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: wild-memory-access Read in get_futex_key
From: syzbot <syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com>
To: andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    785cdec46e92 Merge tag 'x86-core-2025-05-25' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e47df4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d7ed3189f3c3d3f3
dashboard link: https://syzkaller.appspot.com/bug?extid=9afaf6749e3a7aa1bdf3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ad26d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=157f3170580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/af5446d375b0/disk-785cdec4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eb59d48f91fb/vmlinux-785cdec4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/188617605a08/bzImage-785cdec4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: wild-memory-access in instrument_atomic_read include/linux/instrumented.h:68 [inline]
BUG: KASAN: wild-memory-access in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: wild-memory-access in node_state include/linux/nodemask.h:429 [inline]
BUG: KASAN: wild-memory-access in get_futex_key+0x595/0x1540 kernel/futex/core.c:587
Read of size 8 at addr 1fffffff818b9088 by task syz-executor931/5831

CPU: 0 UID: 0 PID: 5831 Comm: syz-executor931 Not tainted 6.15.0-syzkaller-01958-g785cdec46e92 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 node_state include/linux/nodemask.h:429 [inline]
 get_futex_key+0x595/0x1540 kernel/futex/core.c:587
 futex_wake+0xea/0x530 kernel/futex/waitwake.c:165
 __do_sys_futex_wake kernel/futex/syscalls.c:354 [inline]
 __se_sys_futex_wake kernel/futex/syscalls.c:338 [inline]
 __x64_sys_futex_wake+0x23d/0x2b0 kernel/futex/syscalls.c:338
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fec9a512429
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe390e0498 EFLAGS: 00000246 ORIG_RAX: 00000000000001c6
RAX: ffffffffffffffda RBX: 00007ffe390e0678 RCX: 00007fec9a512429
RDX: 0000000000000006 RSI: 0000000000000008 RDI: 0000200000000140
RBP: 00007fec9a585610 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000006 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffe390e0668 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
==================================================================


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
