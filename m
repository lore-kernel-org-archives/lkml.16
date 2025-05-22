Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB8F41AAC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923424; cv=none; b=Q4S+p4DgPWwPpW4tl+SIGGyjdvEdG8vPUug2wiNfa2EpVPy+Q9l27a7A5rYoYyI+kQdXS+5/42OXyWzJ8IEAONZN6a5SIKSoyHdFjMv8HNirtw1fyVDmmk3874cWW428+N1oy2qYZEg2IuwE2rhy9AFS7BLAXH4iZSHH/96jjOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923424; c=relaxed/simple;
	bh=V0l6Z7w33PZpewWBFsGJ7P1kFzsFpAJX+LDsIrWFihc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lnHgx0z8p/uMDNn2GvOKFew4Aq/lNb2INcSdXmnJ55R04p2lPLMF+LyjxSBpdayWRfmsF7BC1hNSotsXMok0moYZZT/PMeBpeR6dEbnPWE2w2e15z2MdnJgq9rtk+Vo0SxztfNzDXMy1IwkRCjiXNFI0l7ttgl1yS/zJPnETkdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85e4f920dacso670646339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923422; x=1748528222;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Sfq/lUq7/4vCCOnZ2qCfA7grzyChvgxUkP/l2Ik7zo=;
        b=i4egXSuTXCnNfOblALwUCQB9KyRwvZZleI3w189ESAMFisCT5APrX/p4CfNglgro8p
         jfDwUYt4yQihWY9qaqGvFhb7Ax3TtQLCew7oxFj9E13o4lb2JMeAxLDM0ikoAZtB77yP
         XeEDyhvjUHBa7LLsnBBN1knDDzYnzGBD2BrDtthRMAaKWsxy4vP0yZE5U9KWL58r2xSi
         qV0PVgKTs0msKTMJDQT9vpj1aHLt5HGxqZXlgnFzuBSN7lzIS+8xHtnDtTNMFzgRibyc
         K22/RpIRowRlZDDkG0Lu7pGP6p/RqGCzepYXBHaMHuEYaYszUaO3C15f0AagYVZ7G33j
         FlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ea6o6A5D37FBhCvWVh/NqbOADWsrF6B5N10qaP8ZtewVhyrKpz6O8swlse0i4ugXIjz5k/CuNLUX6AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuduqGr69LeyB2W0b6chr/XepE3A+JQ6a2/2yHiSW0z8dgc5n
	Nu7L8nJLa7ruYI0frrxYKODBSIorOqqR3cBh7EqP3tHh1BaWydmJH/xUWgE3GQ+xg2mSQZUwnFv
	0ZyGpdS+nwdYX3fzW2nyT8nC5RqmbxaqQC8ViWlbJGS6QUy4Mx8qMKdMZeF0=
X-Google-Smtp-Source: AGHT+IHRObJRJiznU4QGNjNqK3Kpaim9SEIIN+tX1OvGbqd10g2eKBEkAYly0275E7qks7AwLtMHriGMlZn0ewiiEeAXC1mB5kvS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4192:b0:864:4b3a:9e3a with SMTP id
 ca18e2360f4ac-86a2324e6afmr3070582039f.13.1747923422201; Thu, 22 May 2025
 07:17:02 -0700 (PDT)
Date: Thu, 22 May 2025 07:17:02 -0700
In-Reply-To: <CAMj1kXEUW2arc4E1z5VkqUm6yi_bPyPwUtvg99PpM4bQLpct5w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682f31de.a00a0220.2a3337.001d.GAE@google.com>
Subject: Re: [syzbot] [fs?] [efi?] BUG: unable to handle kernel paging request
 in alloc_fs_context
From: syzbot <syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com>
To: ardb@kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel paging request in alloc_fs_context

Bluetooth: hci0: Opcode 0x0c1a failed: -4
efivarfs: resyncing variable state
Unable to handle kernel paging request at virtual address dfff800000000005
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[dfff800000000005] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 7789 Comm: syz.0.174 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : alloc_fs_context+0x1b4/0x76c fs/fs_context.c:294
lr : __lse_atomic64_add arch/arm64/include/asm/atomic_lse.h:134 [inline]
lr : arch_atomic64_add arch/arm64/include/asm/atomic.h:67 [inline]
lr : raw_atomic64_add include/linux/atomic/atomic-arch-fallback.h:2672 [inline]
lr : raw_atomic_long_add include/linux/atomic/atomic-long.h:121 [inline]
lr : atomic_long_add include/linux/atomic/atomic-instrumented.h:3261 [inline]
lr : get_cred_many include/linux/cred.h:203 [inline]
lr : get_cred include/linux/cred.h:218 [inline]
lr : alloc_fs_context+0x150/0x76c fs/fs_context.c:293
sp : ffff80009b8c7440
x29: ffff80009b8c7470 x28: dfff800000000000 x27: ffff0000cbd6a758
x26: 0000000000000028 x25: ffff0000d6dd9cc8 x24: ffff80008fba8a20
x23: 0000000000000000 x22: ffff0000d6dd9c98 x21: ffff0000cbd69e80
x20: 0000000000000000 x19: ffff0000d6dd9c00 x18: ffff800090e6c920
x17: ffff800092f39000 x16: ffff80008adbda98 x15: 0000000000000001
x14: 1fffe00019683fa0 x13: 0000000000000000 x12: 0000000000000000
x11: ffff600019683fa1 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : 0000000000000005 x7 : ffff80008020cba8 x6 : ffff8000803f41e0
x5 : ffff0000d95932c8 x4 : ffff80009b8c71f8 x3 : ffff800080dfffa8
x2 : 0000000000000001 x1 : 0000000000000008 x0 : 0000000000000001
Call trace:
 alloc_fs_context+0x1b4/0x76c fs/fs_context.c:294 (P)
 fs_context_for_mount+0x34/0x44 fs/fs_context.c:332
 vfs_kern_mount+0x38/0x178 fs/namespace.c:1309
 efivarfs_pm_notify+0x1c4/0x4b4 fs/efivarfs/super.c:529
 notifier_call_chain+0x1b8/0x4e4 kernel/notifier.c:85
 blocking_notifier_call_chain+0x70/0xa0 kernel/notifier.c:380
 pm_notifier_call_chain+0x2c/0x3c kernel/power/main.c:109
 snapshot_release+0x104/0x1c4 kernel/power/user.c:125
 __fput+0x340/0x75c fs/file_table.c:465
 ____fput+0x20/0x58 fs/file_table.c:493
 task_work_run+0x1dc/0x260 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x4e8/0x1998 kernel/exit.c:953
 do_group_exit+0x194/0x22c kernel/exit.c:1102
 get_signal+0x11dc/0x12f8 kernel/signal.c:3034
 do_signal+0x274/0x4438 arch/arm64/kernel/signal.c:1615
 do_notify_resume+0xac/0x1ec arch/arm64/kernel/entry-common.c:148
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
 el0_svc+0xb4/0x17c arch/arm64/kernel/entry-common.c:768
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: 97f8aa83 f9400368 9100a11a d343ff48 (387c6908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	97f8aa83 	bl	0xffffffffffe2aa0c
   4:	f9400368 	ldr	x8, [x27]
   8:	9100a11a 	add	x26, x8, #0x28
   c:	d343ff48 	lsr	x8, x26, #3
* 10:	387c6908 	ldrb	w8, [x8, x28] <-- trapping instruction


Tested on:

commit:         d7fa1af5 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1689aad4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=52cd651546d11d2af06b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Note: no patches were applied.
