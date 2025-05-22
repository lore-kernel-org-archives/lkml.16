Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB41F09B3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923968; cv=none; b=Q4sbcsugSGNFWb25Z3COO2oVYCaB+SO9337mgYXCwxGCSokqo9367Gw37Qn3bGe3mFlGMuaNyD+GcUHUGfSB/V1LFXbTnLlO1Ufiyfmj85aTM8wOJ94D9775qdGtmXzZ78XHD0GZsKczvgLf0XGZGpEp6PBrjrRs3F6pIQdCsvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923968; c=relaxed/simple;
	bh=iTI/Zfx6MBYwY1H0Qv9I5OuA5VmQsmW5cbyNjz0U07E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BNlBmIzMuvC6HsKtGf+aUqJ+cLcVico9ZQhNFSWPAUSOEsn7zIpErRuDY3xPzU+7TT0hoHOLvbQXYxUxKPVggT6U3z4C01ogMSYu0T9yypa2z8i3wCSCtAYCnCtCo+ev1qd5AhZCtUoi6Pl+Rps98ZoFhb5lyA9mCoa4wguMHYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso847233339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923964; x=1748528764;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grXw5deAfzaDDE7PLJ2OMrZGmjQIpp+xoyjYVZzRAjE=;
        b=hv5RPicckjC7tt99CIoaQ4dVKAisfZqA8e+lqTGM/FoWQKW5ojjjkOe2cgFr1rO1QV
         UIXE4tMzxJlB2z61ip9wAnJqDWu55Bre59fL+94NZgEpaJ2N24pl6VwF5XkZdTNGrk4J
         UlGks3T8Ui1abo5LH9AhUWizuPeL/Ru9MWcyhHEj/x7pDq33JmFn+YYklHneAKmxGM/J
         ALUr0hITk+mSOvbSR0sk3jjmkJrYl5BqkWsH/k/ow5kd4OlQkpK1tHyWPK6YInbjmAim
         uu3wTaHTpA6TSamkRSed7dXdI+l4iyboSWptFioemOiomnq05Ru2NZoORrkqIENDPF3o
         KvMA==
X-Gm-Message-State: AOJu0YzejGClVNHWYurnyIzc/ERo2bBBFy1+1XgrlQg4H0rkdqV2q/cu
	duOr0SjOM3tCCTuyAye34NExWkYPFBEcbLx76iUGcWLX/9qjDIxdBKAZ1xm33wasNO8Pwwns3B7
	TkCOAdJc32n9+iB9UyUbH1GHaLpTLcSHBl2qOCQ6uuzho0UQXXLvnUz/aeV2Kkw==
X-Google-Smtp-Source: AGHT+IHsC+4K4oWt2oPvqri8WYvs+s71grRM2ZWxGNDzhKtjRdwiSwbI+b0ket01ZkNl77THVXUtDlPgn+GgnmygwoQ/HvWH+7ga
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5d:9f44:0:b0:86a:93b:32bd with SMTP id
 ca18e2360f4ac-86a24baecf1mr2000586839f.2.1747923964513; Thu, 22 May 2025
 07:26:04 -0700 (PDT)
Date: Thu, 22 May 2025 07:26:04 -0700
In-Reply-To: <6820e1f6.050a0220.f2294.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f33fc.a00a0220.2a3337.001e.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [fs?] [efi?] BUG: unable to handle kernel
 paging request in alloc_fs_context
From: syzbot <syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [fs?] [efi?] BUG: unable to handle kernel paging request in alloc_fs_context
Author: ardb@kernel.org

#syz test:
git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.16.super

On Sun, 11 May 2025 at 19:44, syzbot
<syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    c32f8dc5aaf9 Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=1762d670580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea4635ffd6ad5b4a
> dashboard link: https://syzkaller.appspot.com/bug?extid=52cd651546d11d2af06b
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165c0cd4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16f49cf4580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/b921498959d4/disk-c32f8dc5.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/04e6ad946c4b/vmlinux-c32f8dc5.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d4f0d8db50ee/Image-c32f8dc5.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com
>
> efivarfs: resyncing variable state
> Unable to handle kernel paging request at virtual address dfff800000000005
> KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
> Mem abort info:
>   ESR = 0x0000000096000005
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
>   FSC = 0x05: level 1 translation fault
> Data abort info:
>   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [dfff800000000005] address between user and kernel address ranges
> Internal error: Oops: 0000000096000005 [#1]  SMP
> Modules linked in:
> CPU: 1 UID: 0 PID: 6487 Comm: syz-executor120 Not tainted 6.15.0-rc5-syzkaller-gc32f8dc5aaf9 #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : alloc_fs_context+0x1b4/0x76c fs/fs_context.c:294
> lr : __lse_atomic64_add arch/arm64/include/asm/atomic_lse.h:134 [inline]
> lr : arch_atomic64_add arch/arm64/include/asm/atomic.h:67 [inline]
> lr : raw_atomic64_add include/linux/atomic/atomic-arch-fallback.h:2672 [inline]
> lr : raw_atomic_long_add include/linux/atomic/atomic-long.h:121 [inline]
> lr : atomic_long_add include/linux/atomic/atomic-instrumented.h:3261 [inline]
> lr : get_cred_many include/linux/cred.h:203 [inline]
> lr : get_cred include/linux/cred.h:218 [inline]
> lr : alloc_fs_context+0x150/0x76c fs/fs_context.c:293
> sp : ffff8000a31b7760
> x29: ffff8000a31b7790 x28: dfff800000000000 x27: ffff0000c8ef88d8
> x26: 0000000000000028 x25: ffff0000c7e6f4c8 x24: ffff80008fb953e0
> x23: 0000000000000000 x22: ffff0000c7e6f498 x21: ffff0000c8ef8000
> x20: 0000000000000000 x19: ffff0000c7e6f400 x18: 00000000ffffffff
> x17: ffff800092f27000 x16: ffff80008adb31c0 x15: 0000000000000001
> x14: 1fffe0001a05b0e0 x13: 0000000000000000 x12: 0000000000000000
> x11: ffff60001a05b0e1 x10: 0000000000ff0100 x9 : 0000000000000000
> x8 : 0000000000000005 x7 : ffff80008022b2b8 x6 : ffff80008022b4b4
> x5 : ffff0000dabc9c90 x4 : ffff8000a31b7520 x3 : ffff800080dfa950
> x2 : 0000000000000001 x1 : 0000000000000008 x0 : 0000000000000001
> Call trace:
>  alloc_fs_context+0x1b4/0x76c fs/fs_context.c:294 (P)
>  fs_context_for_mount+0x34/0x44 fs/fs_context.c:332
>  vfs_kern_mount+0x38/0x178 fs/namespace.c:1313
>  efivarfs_pm_notify+0x1c4/0x4b4 fs/efivarfs/super.c:529
>  notifier_call_chain+0x1b8/0x4e4 kernel/notifier.c:85
>  blocking_notifier_call_chain+0x70/0xa0 kernel/notifier.c:380
>  pm_notifier_call_chain+0x2c/0x3c kernel/power/main.c:109
>  snapshot_release+0x104/0x1c4 kernel/power/user.c:125
>  __fput+0x340/0x75c fs/file_table.c:465
>  ____fput+0x20/0x58 fs/file_table.c:493
>  task_work_run+0x1dc/0x260 kernel/task_work.c:227
>  exit_task_work include/linux/task_work.h:40 [inline]
>  do_exit+0x4e8/0x1998 kernel/exit.c:953
>  do_group_exit+0x194/0x22c kernel/exit.c:1102
>  __do_sys_exit_group kernel/exit.c:1113 [inline]
>  __se_sys_exit_group kernel/exit.c:1111 [inline]
>  pid_child_should_wake+0x0/0x1dc kernel/exit.c:1111
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> Code: 97f8a879 f9400368 9100a11a d343ff48 (387c6908)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   97f8a879        bl      0xffffffffffe2a1e4
>    4:   f9400368        ldr     x8, [x27]
>    8:   9100a11a        add     x26, x8, #0x28
>    c:   d343ff48        lsr     x8, x26, #3
> * 10:   387c6908        ldrb    w8, [x8, x28] <-- trapping instruction
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
