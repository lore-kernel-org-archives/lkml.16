Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974361D63F5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746743065; cv=none; b=Wazqjz0EJtHw2HX4VHzMTwFIkeTcX8O22U+eVXs1YGGBipsxNweidGBXk5bhFkaXIB2mHpKfskwyGxAuSKiwMtadHQo5M81yFRNUWC7kru4bRqWSkUwINacT0dCFl0w5fHNTjCN3VkI5VP82PiPDDcYyayqMBEX9Ep6XkmcVL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746743065; c=relaxed/simple;
	bh=EASvvr6zy4sNrYkdGbffGMgWuXnT6GZQq0R8l7eXBJ0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cbV8y9zhMnm3hXAJj+i+HuWXPLZ0lk9Q9/fsV4wQiAxjYEnT0aIzjtnF/KPcQS6NW+o+mLnugb97N0hwLALhgD/dt1wGml2QbtOcZKmTUu6EuSHvTsgUT/j6HDCQDbi5GjgDc+SE22w5N7ZDETaPu63HeF4BN2KUQhRcDDc8XAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d9099f9056so26756195ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746743062; x=1747347862;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqYpOk+kp9o/oe58c6ux0E83wKBz30NTkNCZ9/EBWws=;
        b=Cs59YHKErZep+SyqdPOUY64DW2QaKH1DqX4IxUG+WinKDuJy9Zq5cVpufm7zp5w9C1
         OJEVTEnLeVsGrul7QdtSWSjzx+ENJTbPqc6SZHPnGQdsC8c+5NrRpnINOkoBdWKn3GyS
         6mY0h5ZA/LYLTyYYnm1i3RojMJ5kxwGWal6pcw4wjFPbw+zus4S5uUjyRQ10U73KcuDv
         Sm5LKRM67AMuDyadlvWgO37yLKIRur+1s6P37Avkh6Odh530g+HAjSzM8VDxFKNI0LYJ
         10or0aQFgvz+JwfW+9cvkgbhbkWZ78tfsQnr9R7E9tMr3Hygf+Gs4XUytuj9AWFM4Ufh
         f8Ew==
X-Gm-Message-State: AOJu0YzGoLdh+i0GD7H7Mas3HQOZwFI5+xkAJ/B79FHveaKEMwOn9wVN
	ezkRyIxmFFj3lCHh5HwzIEyByeCatPjBUBrS/N9YRrs854qIgSiP503hoHE+eG3c31TlIhOeBBh
	jd3o1mmkCRCdNkR3Ke5C2XFOpnAlPft3kpHr2Jj/fpXCozKofD192W7yiDg==
X-Google-Smtp-Source: AGHT+IF8ouceDSj9KHS0v+Fp89FRYOMjYaJkw8MiHUUN0lYGNxLLlVy8apBQZeB+JkrzoaHpIqCEH9fDvs+rFQjMnKBhzugHQNfu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e90:b0:3d9:2fbe:2bb1 with SMTP id
 e9e14a558f8ab-3da7e1f1d23mr18457395ab.12.1746743062736; Thu, 08 May 2025
 15:24:22 -0700 (PDT)
Date: Thu, 08 May 2025 15:24:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681d2f16.050a0220.a19a9.011f.GAE@google.com>
Subject: [syzbot] [kernel?] BUG: unable to handle kernel NULL pointer
 dereference in module_kobj_release
From: syzbot <syzbot+3ea73421f5aa3f339e9e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d76bb1ebb558 Merge tag 'erofs-for-6.15-rc6-fixes' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155c58f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=224acb8d2ffe8753
dashboard link: https://syzkaller.appspot.com/bug?extid=3ea73421f5aa3f339e9e
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-d76bb1eb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cf604d463f46/vmlinux-d76bb1eb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/01922f2b5b5e/Image-d76bb1eb.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3ea73421f5aa3f339e9e@syzkaller.appspotmail.com

 el0t_64_sync_handler+0x10c/0x138 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:600
kobject: kobject_add_internal failed for raw_gadget with -EEXIST, don't try to register things with the same name in the same directory.
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
Mem abort info:
  ESR = 0x0000000096000046
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
  CM = 0, WnR = 1, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 52-bit VAs, pgdp=00000000440f6980
[0000000000000008] pgd=0800000044a74403, p4d=080000004487c403, pud=0800000044880403, pmd=0000000000000000
Internal error: Oops: 0000000096000046 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 3469 Comm: syz.0.4 Not tainted 6.15.0-rc5-syzkaller-00043-gd76bb1ebb558 #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
pstate: 614020c9 (nZCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
pc : __lse__cmpxchg_case_acq_32 arch/arm64/include/asm/atomic_lse.h:271 [inline]
pc : __cmpxchg_case_acq_32 arch/arm64/include/asm/cmpxchg.h:120 [inline]
pc : __cmpxchg_acq arch/arm64/include/asm/cmpxchg.h:169 [inline]
pc : raw_atomic_cmpxchg_acquire include/linux/atomic/atomic-arch-fallback.h:2055 [inline]
pc : raw_atomic_try_cmpxchg_acquire include/linux/atomic/atomic-arch-fallback.h:2173 [inline]
pc : atomic_try_cmpxchg_acquire include/linux/atomic/atomic-instrumented.h:1302 [inline]
pc : queued_spin_lock include/asm-generic/qspinlock.h:111 [inline]
pc : do_raw_spin_lock include/linux/spinlock.h:187 [inline]
pc : __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:111 [inline]
pc : _raw_spin_lock_irqsave+0x34/0x8c kernel/locking/spinlock.c:162
lr : complete_with_flags kernel/sched/completion.c:20 [inline]
lr : complete+0x24/0xa4 kernel/sched/completion.c:47
sp : ffff80008948bba0
x29: ffff80008948bba0 x28: fdf00000098d0000 x27: 0000000000000000
x26: 0000000000000000 x25: 0000000000000000 x24: f6f000000485c968
x23: ffff800081d77478 x22: 0000000000000000 x21: ffff80008256d388
x20: 0000000000000008 x19: 0000000000000000 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: ffff800081b610e0
x14: 0000000000000164 x13: ffff8000828d1130 x12: 0000000000000001
x11: 000000ece58db54c x10: 7fd9d1af9fae5191 x9 : 6105f830acda155c
x8 : fdf00000098d11e8 x7 : fff000007f8d4b00 x6 : fff07ffffd022000
x5 : fff000007f8ca588 x4 : 0000000000000000 x3 : 0000000000000000
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000008
Call trace:
 __lse__cmpxchg_case_acq_32 arch/arm64/include/asm/atomic_lse.h:271 [inline] (P)
 __cmpxchg_case_acq_32 arch/arm64/include/asm/cmpxchg.h:120 [inline] (P)
 __cmpxchg_acq arch/arm64/include/asm/cmpxchg.h:169 [inline] (P)
 raw_atomic_cmpxchg_acquire include/linux/atomic/atomic-arch-fallback.h:2055 [inline] (P)
 raw_atomic_try_cmpxchg_acquire include/linux/atomic/atomic-arch-fallback.h:2173 [inline] (P)
 atomic_try_cmpxchg_acquire include/linux/atomic/atomic-instrumented.h:1302 [inline] (P)
 queued_spin_lock include/asm-generic/qspinlock.h:111 [inline] (P)
 do_raw_spin_lock include/linux/spinlock.h:187 [inline] (P)
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:111 [inline] (P)
 _raw_spin_lock_irqsave+0x34/0x8c kernel/locking/spinlock.c:162 (P)
 complete_with_flags kernel/sched/completion.c:20 [inline]
 complete+0x24/0xa4 kernel/sched/completion.c:47
 module_kobj_release+0x14/0x20 kernel/params.c:946
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0xa4/0x114 lib/kobject.c:737
 lookup_or_create_module_kobject.part.0+0xac/0xdc kernel/params.c:783
 lookup_or_create_module_kobject+0x40/0x50 kernel/params.c:793
 module_add_driver+0xf0/0x16c drivers/base/module.c:46
 bus_add_driver+0xf8/0x208 drivers/base/bus.c:682
 driver_register+0x60/0x128 drivers/base/driver.c:249
 usb_gadget_register_driver_owner+0x54/0x13c drivers/usb/gadget/udc/core.c:1700
 raw_ioctl_run drivers/usb/gadget/legacy/raw_gadget.c:595 [inline]
 raw_ioctl+0x74c/0xd2c drivers/usb/gadget/legacy/raw_gadget.c:1306
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __arm64_sys_ioctl+0xb4/0xe8 fs/ioctl.c:892
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x48/0x110 arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0x40/0xe0 arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x1c/0x28 arch/arm64/kernel/syscall.c:151
 el0_svc+0xa0/0xe0 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x10c/0x138 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x1a4/0x1a8 arch/arm64/kernel/entry.S:600
Code: b9000841 d503201f 52800001 52800022 (88e17c02) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	b9000841 	str	w1, [x2, #8]
   4:	d503201f 	nop
   8:	52800001 	mov	w1, #0x0                   	// #0
   c:	52800022 	mov	w2, #0x1                   	// #1
* 10:	88e17c02 	casa	w1, w2, [x0] <-- trapping instruction


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
