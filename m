Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3A26770A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832451; cv=none; b=CN5ne7uryHhM4Gl1Szxhlk0IZDtA+sOGu+q92J6yoBG+jhwfloMxhnYCJE0QCZFBAAUPUnYhnTHW5N4J2IEZh+mr9VKqlOybbBabaNqgUKJkA6xIIlJMKpRVat9B3RMalMcWUbq9yKpeH0f9RPt/OIT4g3YvVoisiAbrrjjFXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832451; c=relaxed/simple;
	bh=C2IwoB62GsX3hNTk0ae5FPG+0sKvNLFRkU1NxbBlgg4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H8ZlNe09FS6j+SHtLSN/eWIh4bpFaJvp7Fhrq6LDzZB40KrHOd5H5NqjX52NxdtrIfxTpZEdcyl9KEaUxTu8enN9qPUnchx/OiqWuio2f549YE7vppsZZvzAE+F0dDesRsGPWSmMQwB0I/CH0gFthW0INgks+I5Qr3a3Xv/ok/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86186c58c41so444951139f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832448; x=1746437248;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+ebg1KbTm9vvKY1TuOB6zxAWxwzKfz0azG98FkmiYQ=;
        b=H5MgVMu5Yt45hEeQAc4Xmm0dJ6CFPXoESlkj/Dp8qL/6uou80UCjXxSThPs2KJGt1d
         Bs/oHJgi4wNtV6Gw+mYF8ALLlU3jN+uLzObZpBHswaJXG4Vio2ZMyMN2vksnC0yYE0NZ
         y53C/AEAVb9Z3iOmE2a74nFua3KYO66vbaIkC+nQherDLNf0fHp7xFmTsmRhtCI5hScO
         iFJMq36RAGiamLTfxJ+SAPquoBtLd26bHdsTvpozi05o8YPxh4JG3zG5B6tPONWIMOX7
         B3BbFuNI7L7hm53/PTcD0ehgy1y27068qtoKdLtgO9o+repEUsTpz6p4k6Q+9dQhs63o
         QTtg==
X-Gm-Message-State: AOJu0Yy0ao0/xeVAAalYdsaAZs5vIttqa2XKwYjvzgDtFPtlUTubAdqf
	WnpSG4w8womSzGXZ6KjaTN3n/W64n7ja6YYL6LSkpU/oQYgmzRr16EtrHMFvu+oktAb82cNmlJB
	msg+y1uORmysnc5BT3mPEZ5AwD4vK8ZprXvTFpo2Yupij6dJ6kWgzIK7R7A==
X-Google-Smtp-Source: AGHT+IGQs6sOsykJKYePy/3LjqotbpsJu1Amy4LjmJCjyaWW0LeEhrB360Ldj5/Xy3KLoBTr5wmutVFytf1mDj1omP5crV6Ql7/0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4899:b0:864:589c:3264 with SMTP id
 ca18e2360f4ac-86467ad2d22mr953533039f.4.1745832448455; Mon, 28 Apr 2025
 02:27:28 -0700 (PDT)
Date: Mon, 28 Apr 2025 02:27:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680f4a00.050a0220.2b69d1.032a.GAE@google.com>
Subject: [syzbot] [kernel?] KCSAN: data-race in copy_mm / copy_page_range
From: syzbot <syzbot+cfd78ff95994c614d233@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5bc1018675ec Merge tag 'pci-v6.15-fixes-3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=152930d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fc7049672597c030
dashboard link: https://syzkaller.appspot.com/bug?extid=cfd78ff95994c614d233
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b07ed9969a13/disk-5bc10186.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3abab03798d3/vmlinux-5bc10186.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8fca26b1845c/bzImage-5bc10186.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cfd78ff95994c614d233@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in copy_mm / copy_page_range

write to 0xffff88810a1bc868 of 8 bytes by task 15516 on cpu 0:
 __list_add include/linux/list.h:153 [inline]
 list_add include/linux/list.h:169 [inline]
 copy_nonpresent_pte mm/memory.c:803 [inline]
 copy_pte_range mm/memory.c:1143 [inline]
 copy_pmd_range mm/memory.c:1255 [inline]
 copy_pud_range mm/memory.c:1292 [inline]
 copy_p4d_range mm/memory.c:1316 [inline]
 copy_page_range+0x2525/0x3760 mm/memory.c:1410
 dup_mmap kernel/fork.c:726 [inline]
 dup_mm kernel/fork.c:1734 [inline]
 copy_mm+0xab6/0x1310 kernel/fork.c:1786
 copy_process+0xcf1/0x1f90 kernel/fork.c:2429
 kernel_clone+0x16c/0x5b0 kernel/fork.c:2844
 __do_sys_clone kernel/fork.c:2987 [inline]
 __se_sys_clone kernel/fork.c:2971 [inline]
 __x64_sys_clone+0xe6/0x120 kernel/fork.c:2971
 x64_sys_call+0x2c59/0x2fb0 arch/x86/include/generated/asm/syscalls_64.h:57
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88810a1bc780 of 1344 bytes by task 12894 on cpu 1:
 dup_mm kernel/fork.c:1728 [inline]
 copy_mm+0xfb/0x1310 kernel/fork.c:1786
 copy_process+0xcf1/0x1f90 kernel/fork.c:2429
 kernel_clone+0x16c/0x5b0 kernel/fork.c:2844
 __do_sys_clone kernel/fork.c:2987 [inline]
 __se_sys_clone kernel/fork.c:2971 [inline]
 __x64_sys_clone+0xe6/0x120 kernel/fork.c:2971
 x64_sys_call+0x2c59/0x2fb0 arch/x86/include/generated/asm/syscalls_64.h:57
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 12894 Comm: syz-executor Not tainted 6.15.0-rc3-syzkaller-00342-g5bc1018675ec #0 PREEMPT(voluntary) 
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
