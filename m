Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AEA1F2BAB
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610890; cv=none; b=DYSf6+QemrGJ4S5YMaJVbSa6qnVXtLgOTt9Tlgc9pBcYgb8GhpUtQ+DfLgflze5hXBG8XFLvz+1+Y+yOmpYO/3UZFctuavRbq6bkYzuq5f+nEFzah0jAlefDHf+B6CL6wOqx2l6+an3XHoYdTNMfMHBn5PLGTAg0pFk+JSWfabw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610890; c=relaxed/simple;
	bh=ldds1xXL712yRRlZ4v84n8NxDHsbG08SZ7FT1QvRugk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AQs2SRL3zlys9E7BS/Q/iF6KxrskmBr5zs0s8ZlYPpQPAdAQdQf9saUuMrizYSJRrjlGE+G1LiyNTPa0CFze9TogidYZ3uNkG25vXMwkms+VINxAxLqvztoIyK8917y+TpSGp74pRxGasNGNUFlwiOfmVd34fep7DcVXxJ5qN8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3da73725047so16138825ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610888; x=1747215688;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZMjv4BurL96WWI1Ah+T5YGLK8CWMBp4tYVhTItOUNc=;
        b=bzgYWy7GjFc6kkMbQ4qCRUIi4XvSyYYZ6tan7gH7PnoUaDUjhEECzdJROAtbUnG6+Z
         KpNpVWU7ORiepYa0XBnf+Wm43r3Y88IWPVTpRl1ybS8jBdSz+HjPe2uCYMOwmc2tuQWL
         q2HGJdzg0RLkp8/4nXM6RiSdldustptkgQAROp17V7KFbMKsAJ1qvNHqzbA7CvVKL+ul
         Aufx/qR+9uNOcnvSJMkhOU08N/Edrc0P2uDAYLNoUkQWsCw2aDvodI0/0ZsuhuUZoZBb
         eqYzxW0UWNBhGJi6UnD5x1w5emg/nrmhZEATOpM4/UOwJudJ2nPs4dzRznzkzKely0yl
         Mm3A==
X-Forwarded-Encrypted: i=1; AJvYcCW7fJckzP3ge1AY1VLumTI5atDhfKG/F8AXLvQy+pWIUNvcS0FB8ezz4hcEbza2fHFPihMsQFp4Vflgvsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YznH/CVkH8xH/VlHzqsUAv6XjKkhBBiYsF5c2vUGYsLXKLY6j0Y
	vaDh6X/B5xZgaEvpxCxFFK+H/CipXlu84hrkU6JurAkbqaOZ4xWWQKrnkthn92fcdgx0QYGHz0W
	OJHF1OAx76oOXxNDhY15pqdEzWl5QZEqY1bcZrhAM7BRhRICtZ5EztJE=
X-Google-Smtp-Source: AGHT+IH4sxk5cFz5pId1g24UR8NnF/1YrG3vp1Gov//BexhCUncELV1XS248RMcVnTmXLmOWNzfF+fVCRZYnXWgWBZhwhY6owPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1987:b0:3d9:6d52:5483 with SMTP id
 e9e14a558f8ab-3da7390d6bfmr25328335ab.11.1746610888278; Wed, 07 May 2025
 02:41:28 -0700 (PDT)
Date: Wed, 07 May 2025 02:41:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681b2ac8.050a0220.a19a9.001d.GAE@google.com>
Subject: [syzbot] [bpf?] BUG: soft lockup in bpf_prog_free_deferred
From: syzbot <syzbot+05fc8ab5779d08c3dc9b@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, haoluo@google.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@linux.dev, sdf@fomichev.me, 
	song@kernel.org, syzkaller-bugs@googlegroups.com, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2bfcee565c3a Merge tag 'bcachefs-2025-05-01' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=171498d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=32cdb22fd6b8418b
dashboard link: https://syzkaller.appspot.com/bug?extid=05fc8ab5779d08c3dc9b
compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/384ffdcca292/non_bootable_disk-2bfcee56.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/02554dd7daf4/vmlinux-2bfcee56.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a7f9d70a155d/Image-2bfcee56.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+05fc8ab5779d08c3dc9b@syzkaller.appspotmail.com

watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [kworker/1:4:3595]
Modules linked in:
irq event stamp: 150378
hardirqs last  enabled at (150377): [<ffff80008545c1e8>] __exit_to_kernel_mode arch/arm64/kernel/entry-common.c:85 [inline]
hardirqs last  enabled at (150377): [<ffff80008545c1e8>] exit_to_kernel_mode+0x38/0x118 arch/arm64/kernel/entry-common.c:95
hardirqs last disabled at (150378): [<ffff80008545e390>] __el1_irq arch/arm64/kernel/entry-common.c:557 [inline]
hardirqs last disabled at (150378): [<ffff80008545e390>] el1_interrupt+0x24/0x54 arch/arm64/kernel/entry-common.c:575
softirqs last  enabled at (150376): [<ffff8000801b6c10>] softirq_handle_end kernel/softirq.c:425 [inline]
softirqs last  enabled at (150376): [<ffff8000801b6c10>] handle_softirqs+0x88c/0xdb4 kernel/softirq.c:607
softirqs last disabled at (150361): [<ffff800080010760>] __do_softirq+0x14/0x20 kernel/softirq.c:613
CPU: 1 UID: 0 PID: 3595 Comm: kworker/1:4 Not tainted 6.15.0-rc4-syzkaller-00189-g2bfcee565c3a #0 PREEMPT 
Hardware name: linux,dummy-virt (DT)
Workqueue: events bpf_prog_free_deferred
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __kasan_check_read+0x0/0x2c mm/kasan/shadow.c:30
lr : csd_lock_wait kernel/smp.c:340 [inline]
lr : smp_call_function_many_cond+0x38c/0x1528 kernel/smp.c:885
sp : ffff8000a07c7770
x29: ffff8000a07c7770 x28: 1fffe0000d41ac31 x27: dfff800000000000
x26: 0000000000000000 x25: dfff800000000000 x24: ffff8000870c13a8
x23: 0000000000000000 x22: ffffffffffffffff x21: ffff00006a0d6180
x20: ffff00006a0b8c48 x19: 1ffff000140f8f0c x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffd0f80258
x14: ffff00006a0c05b0 x13: 0000000000000000 x12: ffff60000d41718a
x11: 1fffe0000d417189 x10: ffff60000d417189 x9 : dfff800000000000
x8 : ffff00006a0b8c4b x7 : 0000000000000001 x6 : ffff60000d417189
x5 : ffff00006a0b8c48 x4 : ffff60000d41718a x3 : ffff80008044d488
x2 : 0000000000000000 x1 : 0000000000000004 x0 : ffff00006a0b8c48
Call trace:
 __kasan_check_read+0x0/0x2c (P)
 smp_call_function_many kernel/smp.c:909 [inline]
 smp_call_function kernel/smp.c:931 [inline]
 kick_all_cpus_sync+0x3c/0x94 kernel/smp.c:1076
 flush_icache_range arch/arm64/include/asm/cacheflush.h:103 [inline]
 __text_poke+0xbc/0xdc arch/arm64/kernel/patching.c:130
 aarch64_insn_set+0x30/0x4c arch/arm64/kernel/patching.c:177
 bpf_arch_text_invalidate+0x1c/0x34 arch/arm64/net/bpf_jit_comp.c:250
 bpf_prog_pack_free+0x160/0x43c kernel/bpf/core.c:1014
 bpf_jit_binary_pack_free+0x4c/0x80 kernel/bpf/core.c:1212
 bpf_jit_free+0xe4/0x1d4 arch/arm64/net/bpf_jit_comp.c:2794
 bpf_prog_free_deferred+0x344/0x4c4 kernel/bpf/core.c:2886
 process_one_work+0x7cc/0x18d4 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x734/0xb84 kernel/workqueue.c:3400
 kthread+0x348/0x5fc kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
Sending NMI from CPU 1 to CPUs 0:


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
