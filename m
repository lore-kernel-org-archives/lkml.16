Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513BD221F09
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749298505; cv=none; b=iP92omebCqA6diDbdD8v8XoKqRjzqzv1puBAfUug9Vj9YiqrMsZ54Q4Z2dKP1FifoG8WT6jUkuSGPtShVUFgDIiNSYRZE5FJ6VFqq64HlsmAjZX5mGUnV7i8hM/7g1u6HuieocWAAxwBdWePs7iN6nIAd7CmaO0F4LVPTmm/mto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749298505; c=relaxed/simple;
	bh=oLtwGz2om7Uq3VZsgJHxRqVOBLG1WKvnFPqv+epsekE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y7qMvj+sa4uXrm7Ef/IBdO/9LOm1u0MD2k4sgmcMpfaO9nrsdfFqZE/tJfcI3GigYptX7vYSsYPlcVz5Vx4YXfRYZSnZ9V46JVFxf5K6a3Uj+OxCncaAsx6cr0d+FPcFtHNqF1D2/y4kATBXfPDOlzOw5q50V7x8MAtjyh58fao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc6d66787so37085825ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 05:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749298502; x=1749903302;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6khKyuzNrG0UiD6tiQwVZA1S1mtehdI0hb+YyqvtkU=;
        b=kl8f7T8zHuJRu3qfnQ+DtONb+iWJ561Iu2zROZl/Jg7ufXRxhQmJOR7FNOH9BU6Pd3
         eGQMC02dVcDsSKdmBNPkoUmEIGLaBa0xDEIMWGS/NYEIU8LSSoaZjNLDdtQYCA+wq4ih
         zzn308H5bbQeaoT5nMYQlTf1FQIVMgVt9z7YSi7aR25UwE6iOFmdmi5gJAKcULn77eAR
         mvo5ZulS+bmQe9jtUg3PAVslutmzQj49vE1SMKaanIiw1Z4beWfQbjQDwUa1WtJM2RK4
         VYmc1z0SAsgf6iDPcNecShEvHLDGeaBjkYK6XEIDUhT+RbX5UPGoXGjg4+3HYtbROVkj
         ruGg==
X-Forwarded-Encrypted: i=1; AJvYcCXMoFQj5Piww995vBQMolf/xZKoTpXkWnLJ5qYIPXvmGRO8z0xgaiIY+Qxdu6gTaDgU7BmMPsUDauJiJH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlKewFzCdDf6L8ck/2RUHT8jPD1zc8ssTF3qkgVZ+8ATlyAdz4
	WQzD9gMut7aDfMP0oswL4xJxH3BVBJ+NdiUTbnWrpOeikMTNaeEaFOdQ1eZcAKGcQWRpEcC+0QE
	391sR+hnfiBibyDOH6IXj+/4KZ9mmTRlqnkSY54JzT9hTzegZ5M2RzFgjGW0=
X-Google-Smtp-Source: AGHT+IHmL9BLSnu80DN+JqbFo/KZW5om0NI59h0+mNh5EYW7C17VUc7j20kQei8sTorluQ6q/UGSySzVRqbRuxM686EwmuOHiLb1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1569:b0:3dc:7b3d:6a37 with SMTP id
 e9e14a558f8ab-3ddce423461mr75897805ab.8.1749298502572; Sat, 07 Jun 2025
 05:15:02 -0700 (PDT)
Date: Sat, 07 Jun 2025 05:15:02 -0700
In-Reply-To: <CAJZ91LC2PXK-F8D7br-JKWiREf0hb2BFbEXvugN+=xzuTPdK5Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68442d46.a70a0220.27c366.0045.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] kernel BUG in populate_free_space_tree
From: syzbot <syzbot+36fae25c35159a763a2a@syzkaller.appspotmail.com>
To: abinashlalotra@gmail.com, clm@fb.com, dsterba@suse.com, 
	josef@toxicpanda.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in btrfs_rebuild_free_space_tree

BTRFS warning: 'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead
BTRFS info (device loop2 state M): rebuilding free space tree
------------[ cut here ]------------
BTRFS: Transaction aborted (error -17)
WARNING: CPU: 1 PID: 7626 at fs/btrfs/free-space-tree.c:1341 btrfs_rebuild_free_space_tree+0x470/0x54c fs/btrfs/free-space-tree.c:1341
Modules linked in:
CPU: 1 UID: 0 PID: 7626 Comm: syz.2.25 Not tainted 6.15.0-rc7-syzkaller-00085-gd7fa1af5b33e-dirty #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : btrfs_rebuild_free_space_tree+0x470/0x54c fs/btrfs/free-space-tree.c:1341
lr : btrfs_rebuild_free_space_tree+0x470/0x54c fs/btrfs/free-space-tree.c:1341
sp : ffff80009c4f7740
x29: ffff80009c4f77b0 x28: ffff0000d4c3f400 x27: 0000000000000000
x26: dfff800000000000 x25: ffff70001389eee8 x24: 0000000000000003
x23: 1fffe000182b6e7b x22: 0000000000000000 x21: ffff0000c15b73d8
x20: 00000000ffffffef x19: ffff0000c15b7378 x18: 1fffe0003386f276
x17: ffff80008f31e000 x16: ffff80008adbe98c x15: 0000000000000001
x14: 1fffe0001b281550 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60001b281551 x10: 0000000000000003 x9 : 1c8922000a902c00
x8 : 1c8922000a902c00 x7 : ffff800080485878 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001 x3 : ffff80008047843c
x2 : 0000000000000001 x1 : ffff80008b3ebc40 x0 : 0000000000000001
Call trace:
 btrfs_rebuild_free_space_tree+0x470/0x54c fs/btrfs/free-space-tree.c:1341 (P)
 btrfs_start_pre_rw_mount+0xa78/0xe10 fs/btrfs/disk-io.c:3074
 btrfs_remount_rw fs/btrfs/super.c:1319 [inline]
 btrfs_reconfigure+0x828/0x2418 fs/btrfs/super.c:1543
 reconfigure_super+0x1d4/0x6f0 fs/super.c:1083
 do_remount fs/namespace.c:3365 [inline]
 path_mount+0xb34/0xde0 fs/namespace.c:4200
 do_mount fs/namespace.c:4221 [inline]
 __do_sys_mount fs/namespace.c:4432 [inline]
 __se_sys_mount fs/namespace.c:4409 [inline]
 __arm64_sys_mount+0x3e8/0x468 fs/namespace.c:4409
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 330
hardirqs last  enabled at (329): [<ffff80008048590c>] raw_spin_rq_unlock_irq kernel/sched/sched.h:1525 [inline]
hardirqs last  enabled at (329): [<ffff80008048590c>] finish_lock_switch+0xb0/0x1c0 kernel/sched/core.c:5130
hardirqs last disabled at (330): [<ffff80008adb9e60>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (10): [<ffff8000801fbf10>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (8): [<ffff8000801fbedc>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---
BTRFS: error (device loop2 state MA) in btrfs_rebuild_free_space_tree:1341: errno=-17 Object already exists
BTRFS warning (device loop2 state EMA): failed to rebuild free space tree: -17


Tested on:

commit:         d7fa1af5 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=152cfc0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=36fae25c35159a763a2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=168d7282580000

