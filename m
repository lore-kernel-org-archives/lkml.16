Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF14315F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663922; cv=none; b=eRUzOXxUCR5Y5RXzSlGzTpjOI+gR+jC30t8jftdd/oP7fHBw0QO3rLgDnn8WId0nxfS1mKukBqNM7Ef/M+6lPRmXAcIcjYEDFaQ1WWpTc8jwsjLNInJVURVfIKrPYSxEG5ezHpT2E7r7jD27nd/kd34MQJtkTlUttYRftL7g1NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663922; c=relaxed/simple;
	bh=LyRbvRR1PR47B51jZJkIfAYFQaXDpwF6Wro3vdho5nM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KC0/kqH3MinrVYKYBB4pafO/9v9Jt+ywYjhycAlJs88lCntIhvLPWUaoul4ENXyfkgISoBFg+5454GbDU/7PUmxsm0nClM9gw37zymqe2EP56FwbexLcXLzm0tg9zGYBWdaRBGnLoDlmsdSgeLO/3vKYchYbENPVIwYLc0Ik29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so306595ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663920; x=1744268720;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIrwn4PlzFwEEQ/BmYU5E8VeluGuJbpMKa8S5NcW2LY=;
        b=xB0wJVYFG6zuyYrnk1HzZdOus4rbdIWiNDTijg+qofk9TZ2sUinWkSVa9LU29tnYdG
         Az8EvztLXS/uP3LBestQM6wio4ahKTjc73z3HovVcXzy/aUMEx6BCWP3sLYsgyglAG5o
         mreDRl7nwphnWeJFkfXCOaALa7DXVl6DYGns0w576JYBxCHDnrsBL2nyN9dv0eInl5op
         amnrZonMghvjyB8rxBSrdG9ESz+gokuHa0zYbImaynNURtmG/vWy4OPwrdm1MAJQzwZd
         YHRZ5YxlenKzGSVL04sS2eM9NV2CaQvfVEs3iGueiMHcY4qT5a2pE/6BwED0pkJx1MWQ
         xODg==
X-Forwarded-Encrypted: i=1; AJvYcCUsGKJCsdHL8wmYMxlutNNGbMkYleirR0oW0ih4D6xu6miUKHEP8Zy6P9kP3SRXnsj0v91GxhuF9f8oOh4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkt4mGTk7eTCih1307yBIIYclLOXEo9bGp15paSXtsowV8w/kk
	Kn3FuIPr+zwOIPucG6YwT5ZBbJPKUiNeZTEFVpyGaL3u3myVJAdYDvleOk614Ds0o7tPTijU/zi
	KMiRrnXrCCd97VRiIDPFyfweryUmm/hBgdfTuO9HGDpSXfQN3hN/RCGs=
X-Google-Smtp-Source: AGHT+IH6joD/Xwq1ac8siJhxQyjrw+RC5LvnS+SS/EvR4j0l6B3JhZ0l5RXJk09fbDl/2QS1KjAqzr5ldQ25TKEv4gV1Yao9aU7f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:441a:20b0:3d6:cb9b:cbe9 with SMTP id
 e9e14a558f8ab-3d6cb9bce19mr71596825ab.5.1743663920289; Thu, 03 Apr 2025
 00:05:20 -0700 (PDT)
Date: Thu, 03 Apr 2025 00:05:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ee3330.050a0220.9040b.014e.GAE@google.com>
Subject: [syzbot] [mm?] KCSAN: data-race in getrusage / try_to_unmap_one (2)
From: syzbot <syzbot+988c9343ca9f2c49b9c4@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    92b71befc349 Merge tag 'objtool-urgent-2025-04-01' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=106d5274580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a8120cade23cf14e
dashboard link: https://syzkaller.appspot.com/bug?extid=988c9343ca9f2c49b9c4
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2e7df7bc2f52/disk-92b71bef.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/be59123d5efb/vmlinux-92b71bef.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c9eff86053e/bzImage-92b71bef.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+988c9343ca9f2c49b9c4@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in getrusage / try_to_unmap_one

write to 0xffff888104235900 of 8 bytes by task 3866 on cpu 0:
 update_hiwater_rss include/linux/mm.h:2754 [inline]
 try_to_unmap_one+0xebb/0x1f60 mm/rmap.c:2061
 __rmap_walk_file+0x1c1/0x2c0 mm/rmap.c:2897
 try_to_unmap+0x1b7/0x1e0 mm/rmap.c:-1
 shrink_folio_list+0x11f6/0x2670 mm/vmscan.c:1373
 reclaim_folio_list+0x83/0x2f0 mm/vmscan.c:2217
 reclaim_pages+0x218/0x280 mm/vmscan.c:2254
 madvise_cold_or_pageout_pte_range+0xd4f/0xdb0 mm/madvise.c:558
 walk_pmd_range mm/pagewalk.c:130 [inline]
 walk_pud_range mm/pagewalk.c:226 [inline]
 walk_p4d_range mm/pagewalk.c:264 [inline]
 walk_pgd_range+0x7e5/0x1120 mm/pagewalk.c:305
 __walk_page_range+0xed/0x350 mm/pagewalk.c:412
 walk_page_range_mm+0x369/0x4c0 mm/pagewalk.c:505
 walk_page_range+0x56/0x70 mm/pagewalk.c:584
 madvise_pageout_page_range mm/madvise.c:617 [inline]
 madvise_pageout mm/madvise.c:644 [inline]
 madvise_vma_behavior mm/madvise.c:1269 [inline]
 madvise_walk_vmas mm/madvise.c:1530 [inline]
 madvise_do_behavior+0x1aeb/0x2530 mm/madvise.c:1695
 do_madvise mm/madvise.c:1782 [inline]
 __do_sys_madvise mm/madvise.c:1790 [inline]
 __se_sys_madvise mm/madvise.c:1788 [inline]
 __x64_sys_madvise+0xcb/0x100 mm/madvise.c:1788
 x64_sys_call+0x23b8/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:29
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff888104235900 of 8 bytes by task 3858 on cpu 1:
 get_mm_hiwater_rss include/linux/mm.h:2741 [inline]
 setmax_mm_hiwater_rss include/linux/mm.h:2771 [inline]
 getrusage+0xa17/0xb70 kernel/sys.c:1876
 io_sq_thread+0x5e0/0x1140 io_uring/sqpoll.c:310
 ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

value changed: 0x00000000000016f1 -> 0x0000000000001951

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 3858 Comm: iou-sqp-3852 Not tainted 6.14.0-syzkaller-12508-g92b71befc349 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
==================================================================


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
