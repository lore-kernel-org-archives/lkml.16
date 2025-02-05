Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A61519BC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755682; cv=none; b=b9GyrGurMuRPYgh8z/RRDfoo/MMFwQjcNWdfcv0cw1FPZJAVk88BmhswZGHKcc7xsvD7baRw0LklgQ3rCFIIRzXToBDxS8PDCf2eySFXrth7vnu9Rwl95ffapodN3SNBDklk2i8YRS7TnLEFvBmPYjKMsZ0i0FGAfgwVlds4Afw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755682; c=relaxed/simple;
	bh=NNMOuqINQOhLqZp3Wlwm09HO0mcPsmGg81hfvH9yrlw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gcOI9LKewM2yQd5cHpozxmK0j5sLEKDt0G0InOwe+CI7wBpKtdc/mU1Yp25ugoCCEMsWgAe4LvymIYvJhGJjd9A3DT+rj1Ya4TPb5sgQITyPrt6pA4nAQ0iMaCgCx3GybT8lN+12VRy0fqmMuxYhjNsgYh21lP+t+FheKfUQDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ce3bbb2b9dso41227005ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755680; x=1739360480;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmQKBKwFMCE26N1dcZQXWysRKjvC/WnVWKkrsfbq70M=;
        b=ncex+c/vOlSnOw6Eohwjk0FoBGEvPnM2vDj2RvyvgfAz66CvNf3r3eOBWvCTkf48sN
         HTRMNAYG2GnS9CnwZmTEFn21t1eSf12trXHO+3qGew8P+VFT1hTIA0bDxjz6mNXpROPi
         qAUqkibp2GKIfKaqH/bZoeAU0vfNB+aKgKdIY1knW820eMK0Cb+RXcp92DWfy6usip6C
         /iAQc4sXgywCW+PqvP5fRBJ6xxb9xBcJsffNv8aHnr5ZfbfL/kzKajHuLCJZXZn98UEH
         6Fiw88iBNxo6Uh+X+rLv7pZuuoAfW85ug1MArWDq0UxHflDsN8kJM+yvnLeL9fx008j8
         rszA==
X-Forwarded-Encrypted: i=1; AJvYcCUo2DWxrxKW+GjZYao3zxpFfpISZMwybkn3dHG5uJY3FQlZY4QhtkaB82xhRwEIoxGjF7/FGVtx3i0o2sY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy3rxYO1cKaLIBiCanw1TiLNav2wsUq/W/MUEf2pXjdSvX8jbz
	Qd1NSTqo6uu2kekkZk1lmd/rEd4eOSuKmmonXmHnrmrT/pnpcr+NGPpZpBoYSiuiHWJ3xcR0e4O
	0wHQYG8n8oSemX6i6azJ4BSJuXz1qCjFfQq4Z0QKRGboHn36ykeBZt2Q=
X-Google-Smtp-Source: AGHT+IHY8KosqO8vAs2OYd00s6eQDHotfRAwhIQMNoxMVwahzbEA5LvPRGMnV8tuHvyvZqa92y1FRVDBhmXDANPBA75M7VNyceuN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3309:b0:3cf:fc11:90ca with SMTP id
 e9e14a558f8ab-3d04f42561emr22613105ab.6.1738755680148; Wed, 05 Feb 2025
 03:41:20 -0800 (PST)
Date: Wed, 05 Feb 2025 03:41:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a34e60.050a0220.50516.0040.GAE@google.com>
Subject: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup / try_to_migrate_one
From: syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12b678a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e757e3762bd630b
dashboard link: https://syzkaller.appspot.com/bug?extid=c2e5712cbb14c95d4847
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88/disk-d009de7d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vmlinux-d009de7d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb5782/bzImage-d009de7d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one

write to 0xffff888114b41700 of 8 bytes by task 6432 on cpu 1:
 vm_flags_init include/linux/mm.h:875 [inline]
 vm_flags_reset include/linux/mm.h:887 [inline]
 mprotect_fixup+0x419/0x5e0 mm/mprotect.c:679
 do_mprotect_pkey+0x6cc/0x9a0 mm/mprotect.c:840
 __do_sys_mprotect mm/mprotect.c:861 [inline]
 __se_sys_mprotect mm/mprotect.c:858 [inline]
 __x64_sys_mprotect+0x48/0x60 mm/mprotect.c:858
 x64_sys_call+0x2770/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:11
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
 try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321
 rmap_walk_anon+0x28f/0x440 mm/rmap.c:2646
 try_to_migrate+0x11f/0x150
 migrate_folio_unmap mm/migrate.c:1320 [inline]
 migrate_pages_batch+0x786/0x1930 mm/migrate.c:1866
 migrate_pages_sync mm/migrate.c:1989 [inline]
 migrate_pages+0xf02/0x1840 mm/migrate.c:2098
 do_mbind mm/mempolicy.c:1394 [inline]
 kernel_mbind mm/mempolicy.c:1537 [inline]
 __do_sys_mbind mm/mempolicy.c:1611 [inline]
 __se_sys_mbind+0xfd1/0x11c0 mm/mempolicy.c:1607
 __x64_sys_mbind+0x78/0x90 mm/mempolicy.c:1607
 x64_sys_call+0x2662/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:238
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x0000000000102077 -> 0x0000000000102071

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 6418 Comm: syz.0.1339 Not tainted 6.14.0-rc1-syzkaller-00026-gd009de7d5428 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
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
