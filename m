Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0739B1EA80
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921613; cv=none; b=n2DeP2Sn0dQpsf58lNleOWYpZrknA+8kBMAJ07lZjyhL+WFJGrT2dH9WRZNb1bUM3oKxsLSipUv+NJf8FV8v0AXW5omEL60LGwmO1c14qfGhSlcGxXrSz6Oigjj1A60yoy2gy5zbgvlGL21yL6dK2SVe43LMFZhhkeN/zgENXGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921613; c=relaxed/simple;
	bh=BZVhE0Bvry/fMRV5aHJiF7Mzqk4Q8+Yao67u2c5HwVY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Xqf0B7bfZ9JIFwYhr53G1F7yAzRGjM3a0OVNVV76ACD0tVHPb+pTFW9DxTje07dQijs+2+nqM6lfbmq7/AHFGlLZiVC17/Fx5ziAxuqKqrHEjZbm3owvKNfBKeepQgeB8v0pEnRli72heiwi9uyLceoayKFYg2DuLzRWmwrwoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85e7551197bso773681939f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921611; x=1748526411;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBQkv0RM2YhS3rKR0r4s+KsuBA6jECpzfRp7PBrpoiQ=;
        b=inT8vn/PcF3BKAlf9KXXnrnRuWO77b42eKS+Isot5yeG17qnafqzXN6VonBd4UbJiy
         bbRcgoLNGOtpaVVuETodXXFfWYVctkDemrXwAo2vr95o5ndNpIlxzjL7dngdnxyd4Q1G
         R3YMmqYHL1APGn8R9buQPPqYpJAPhXbuNXb/mACnhVA/CvViaZ0b4HENctPRXi9I5jZ6
         KgFuxys9wmVCclAFT0DBFYjjd8ZAu4s32behWIk9OCAUJdh5Dv+GAWrD2QWqbBpiReLr
         qGotqShgcuvbYeR+jWdnPIhBDOLhqjGiJzc645xe7SsRHEWhRlu5IESzdNdtHALlzZjf
         7vWA==
X-Gm-Message-State: AOJu0YwFh+zbR5jO7LMCpBJ6k7ObUP22mYnfCXmBrYbdCeRd2VdPTT2v
	C96MVdSitd7fHji4B4b4mwHHo/q5E4D+MPaoHXxNmVOkhowk7kQPqN0EW96D6xOMMzfhHlzYNUB
	N8kK8IVVeZVVC02/SXE3dPNbWtdUCRzgzwfUwReTexuB9+DSRDpr2aKVe3wO2yw==
X-Google-Smtp-Source: AGHT+IFF63zxY6mWr0Xc+hR729r6diGMAlgl6QYIV0So0NnRVqjnIwtvHRYZVZMTWjgxAoRqDTSgMzJzv8+uyKYwt57JHl8+/Gj6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3586:b0:867:bf9:64d5 with SMTP id
 ca18e2360f4ac-86a236924f5mr4009070639f.2.1747921611106; Thu, 22 May 2025
 06:46:51 -0700 (PDT)
Date: Thu, 22 May 2025 06:46:51 -0700
In-Reply-To: <6820e1f6.050a0220.f2294.003c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f2acb.a00a0220.2a3337.001c.GAE@google.com>
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

#syz test
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
