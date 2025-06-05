Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D983E2B9A8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749086429; cv=none; b=HIEkf/N6NXPgDUpEiXA5dCVi3046x7/R1xgsmKELT5dcx/I6Vy7uBUXg3d9x9hnlOacSUF/2wWgoqhmCDjSj9uRwzuNtXscq6LppQKY05BQ2znvxmL/LpDy+ajv3TIgj2m8cOE7Yd8D1k+QN1wfcc44cBaEZ8HDx9ywhb6Tq2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749086429; c=relaxed/simple;
	bh=d+xucXxPx3xfV0G2wxo/jwhxS7EXAOl+Z177Pznz07Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=teedIES2Am8aje2qfgutt1q8XJk98tuvXxB4vHt0yMQrBTArDh29hYUXCOeK5ZIGptwvJgNculxPBWEqwjqx9Ar2EoSf8tlUJ/TvUREX7WNFbxfTqE27s1NILW8P+1psgAyjCPRezCowdrClf/RuZpNShTDghATiPJVxWjgc25Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dda536e263so6045765ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 18:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749086427; x=1749691227;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdD7R5O0M+X7sO3b8kxAiJoxLP+EiFOyGu7pNuWNUnk=;
        b=VOWsFgFrbgqTmAQB4AQy9UIhgRoKBecktdJAiFd5+X3vIUPkKWoGwB5BjvMiPbSDct
         CzDd8WVGPTj7bQkZat1pd0XL/InFPh6c+QD3i80Yv0HqxDb7794GHHhxrQl6DkVMTJ+X
         CHK7PHqPFd5ZLN/97qkf7PcPONpM6VHo6VbBpxpCgvRz92QAIrP7BecSgAfY5rUpLRNG
         tBBm9jDbqZBTHXDjxQFQyb6V1MGNtOnGU15cRfMVTOoTqFcL9stS/0YAhni9oL47ndhB
         PSSPa67UTNRufrIlPGeg0bKlpvKXAzk8QG0tXtkALTWfNWJxZehI2xVJi+MRX0fsBeb7
         Iiog==
X-Forwarded-Encrypted: i=1; AJvYcCVdG5W6S/zLv6s8oQK2EA/vsOuogoYnHDfjeW8ZcQ4PZoAFPYVhMPdgamBg/cN57PfU/2OqO40Vf4MPYSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy2glxtTOQxft+aDxNBe5pUNjdhErzM6VlPpaBzM6gwWOV3ua3
	zgIF8+ntrTGZmaFPcCGg1iOSmNt0+gGQ0iSJhdQ7T03PxOTo1iP4Ok5L0nob5g/qd+EQ+e2diqG
	ex9wtd6XxMfjzSZOrtxnKlWqczM4fLOwhcpjU1q1oTdk9Nfsdc1smkI5xLRE=
X-Google-Smtp-Source: AGHT+IFN1khhK/RpvjQTqsh/pUsx5ffpB7iH61Acp/k77rrsyK6dwxXlif1jXs3Kypd6O/KAGvKDYhnUKTBHCsCnu43D66auaCg6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2169:b0:3dd:a13c:b663 with SMTP id
 e9e14a558f8ab-3ddbee3d73dmr51177315ab.14.1749086426900; Wed, 04 Jun 2025
 18:20:26 -0700 (PDT)
Date: Wed, 04 Jun 2025 18:20:26 -0700
In-Reply-To: <6813ed5a.050a0220.53db9.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6840f0da.a00a0220.d4325.0011.GAE@google.com>
Subject: Re: [syzbot] [bcachefs?] WARNING in bch2_writepage_io_done (3)
From: syzbot <syzbot+0652cd10dc5ea0a2eb6f@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15e45282580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=0652cd10dc5ea0a2eb6f
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d0cc0c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=163a6570580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f4a821c168d9/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0652cd10dc5ea0a2eb6f@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 6501 at fs/bcachefs/fs-io-buffered.c:464 bch2_writepage_io_done+0x6fc/0x7b4 fs/bcachefs/fs-io-buffered.c:464
Modules linked in:
CPU: 1 UID: 0 PID: 6501 Comm: kworker/u9:2 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: bcachefs bch2_write_point_do_index_updates
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : bch2_writepage_io_done+0x6fc/0x7b4 fs/bcachefs/fs-io-buffered.c:464
lr : bch2_writepage_io_done+0x6fc/0x7b4 fs/bcachefs/fs-io-buffered.c:464
sp : ffff8000a4b178d0
x29: ffff8000a4b17940 x28: dfff800000000000 x27: 0000000000000003
x26: ffff0000c9b8d7c8 x25: ffff0000c9b8d7c8 x24: ffff0000ddb80000
x23: ffff0000c9b8d920 x22: 0000000000000008 x21: ffff0000c9b8d940
x20: 1fffe00019371b24 x19: 0000000000000c00 x18: 00000000ffffffff
x17: ffff800092f39000 x16: ffff80008ad27e48 x15: 0000000000000006
x14: 1ffff00014962f21 x13: 0000000000000000 x12: 0000000000000000
x11: ffff700014962f27 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000d7f55b80 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff80009308cef8 x4 : 0000000000000008 x3 : 0000000000000020
x2 : 0000000000000008 x1 : 0000000000000008 x0 : 0000000000000000
Call trace:
 bch2_writepage_io_done+0x6fc/0x7b4 fs/bcachefs/fs-io-buffered.c:464 (P)
 bch2_write_done+0x2a4/0x914 fs/bcachefs/io_write.c:542
 bch2_write_point_do_index_updates+0x7c/0x4f0 fs/bcachefs/io_write.c:708
 process_one_work+0x7e8/0x156c kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x958/0xed8 kernel/workqueue.c:3400
 kthread+0x5fc/0x75c kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
irq event stamp: 824
hardirqs last  enabled at (823): [<ffff80008addfa48>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (823): [<ffff80008addfa48>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
hardirqs last disabled at (824): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (0): [<ffff8000803acfb0>] copy_process+0x112c/0x318c kernel/fork.c:2375
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
