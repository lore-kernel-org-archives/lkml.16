Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB82A17E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421015; cv=none; b=MTtlAHZ8gx9VaDHg1yvChbmT4Cs+YHzNumyirSezOUUySN6THaH/ac/WxSrnw4SvKoTZXQT87lLnnwTcR0sIVzmSzHQMll3rjmvp4PF7HA8APUZOkDXXxVKSLjJLdsEe2etzxfXCWrjTzWwpcQOdTKGYk8olfH+My6kiwQVjnis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421015; c=relaxed/simple;
	bh=44Yw/CSL31ZZtRiXC7+bIPYWmkXmBYVRisSnGaYNhcc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tF5ruRa0KsZYudWd9+xiZW9bhZ72M9EnbjIRNbdokc9QpNqp/q0j5ATu8pk3Y2NimxxQxdEuCf0WeJryVxY78SGlfKvPtlls4blqQp2SZQRVMxsZjmQumjHvHCpNnnwjDU6IaQOYrOF+jJYxa/MiiRAY4n8EUq8G8G6NqlgzMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddbd339f3dso18304985ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421013; x=1751025813;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AE0FozSg59g5qQgki6uRnf/ry+uRQl8bOroOeAAV7Ws=;
        b=keMqGBt3d4e+WMNxLEX/0DEC7GqF2RXnxdHf0CLG0gOjj19nBLo03/Ly1uMQSHdg1D
         g7bNAsPz4LK3czgN1TXHyxuEYUYlR3VlOpP6Wlky6yi+NJowH1e+RC9u2txd+IIYAlx1
         Zopcp33VyjpmK7qqRu5PL8GoDXtUvdrkn/ggHhUR3q258aovx7FSLojb0GXb61IJwIbE
         CeKHwGaGNYdhK/EbgnC3AV1CpznH6V+6LVnpxJRH/zE3ZTEY8r0cGDH6cyOXoV4TNjYX
         2jtVsjfsQmr8Va95mTd0sI1t9Gh3rrMNKBY9WGpmqd2WWKmAvKvpFdTa7hwqNs1BSNvw
         FcnA==
X-Forwarded-Encrypted: i=1; AJvYcCUkR1L9BggwgJyBRdB2ll6Zdfhh3XWcGueIKffxCQ/04aGWf8n2k3BgN1xrGLhepEAXrQR6lehOzUo/+B0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2sxAXJEEm/FiUqWgY/68xEBMvD8/x+AAgiJl2XeZg6bF6itf
	w6ezhpDGMVOH746Upwd93pzOqW8iq8vRElL8QVFkvWop2UQnlNQT4gt2OVrVmlgyEsmSAD9384O
	IykI9QC89uNCNnSyhPAuUZlbtr0mCmqa+X5NeB1uMYbUfqT1actnwskN+9C0=
X-Google-Smtp-Source: AGHT+IEK+eTKwJOtAB4ekJWjorfgk8SwDprMoD6Cg3r1xqoPifVdru453MUxuA1ukiSfYOpSTGKI7ESeXMecv6R2aN+IsbzcthSi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fec:b0:3dc:87c7:a5a8 with SMTP id
 e9e14a558f8ab-3de38c1bf73mr27536305ab.2.1750421013111; Fri, 20 Jun 2025
 05:03:33 -0700 (PDT)
Date: Fri, 20 Jun 2025 05:03:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68554e15.a00a0220.137b3.0049.GAE@google.com>
Subject: [syzbot] [kernel?] KMSAN: uninit-value in flush_tlb_mm_range
From: syzbot <syzbot+7b7cbaa9efbaa5cf0771@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e04c78d86a96 Linux 6.16-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=123415d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=7b7cbaa9efbaa5cf0771
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c0f064a5f302/disk-e04c78d8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b71205c143e3/vmlinux-e04c78d8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2abdee22b79e/bzImage-e04c78d8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7b7cbaa9efbaa5cf0771@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in find_next_bit include/linux/find.h:68 [inline]
BUG: KMSAN: uninit-value in cpumask_any_but include/linux/cpumask.h:460 [inline]
BUG: KMSAN: uninit-value in flush_tlb_mm_range+0x786/0x1590 arch/x86/mm/tlb.c:1449
 find_next_bit include/linux/find.h:68 [inline]
 cpumask_any_but include/linux/cpumask.h:460 [inline]
 flush_tlb_mm_range+0x786/0x1590 arch/x86/mm/tlb.c:1449
 flush_tlb_page arch/x86/include/asm/tlbflush.h:324 [inline]
 ptep_clear_flush+0x161/0x1d0 mm/pgtable-generic.c:101
 wp_page_copy mm/memory.c:3635 [inline]
 do_wp_page+0x411c/0x80b0 mm/memory.c:4030
 handle_pte_fault mm/memory.c:6105 [inline]
 __handle_mm_fault mm/memory.c:6232 [inline]
 handle_mm_fault+0x4929/0xe5e0 mm/memory.c:6401
 do_user_addr_fault+0xfe1/0x2560 arch/x86/mm/fault.c:1387
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x68/0xb0 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x2b/0x30 arch/x86/include/asm/idtentry.h:623
 __put_user_4+0xd/0x20 arch/x86/lib/putuser.S:92
 ret_from_fork+0x37/0x310 arch/x86/kernel/process.c:144
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_noprof+0x81b/0xec0 mm/slub.c:4204
 dup_mm kernel/fork.c:1467 [inline]
 copy_mm+0x124/0x9d0 kernel/fork.c:1529
 copy_process+0x27ed/0x5e70 kernel/fork.c:2169
 kernel_clone+0x416/0x1070 kernel/fork.c:2599
 __do_sys_clone kernel/fork.c:2742 [inline]
 __se_sys_clone kernel/fork.c:2726 [inline]
 __x64_sys_clone+0x253/0x360 kernel/fork.c:2726
 x64_sys_call+0x37e7/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:57
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 16686 Comm: syz-executor Not tainted 6.16.0-rc2-syzkaller #0 PREEMPT(undef) 
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
