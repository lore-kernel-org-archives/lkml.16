Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468018C00
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749964411; cv=none; b=LoiDPqBLbAyFqUaQe5WekOvdiYlagmeqglgfCuM8M+PuvttENXnJfW7TEPp0T2eHbkLEUbomF13FQKZlF7m++V1xz8O+3ggkCnYnZMOtF8Zy7OsCt0qi9bnPVjKBpmKvOXZq9Nr6IssTkUC9hR7zOAsV5baIrilw5AkJrHMgBTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749964411; c=relaxed/simple;
	bh=A6yo1+XiRvRiqty56/GMoMrkvcyNLW1PGa6yGc7gDUs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=F/7hw7GJsP27e1n6iq6IirQzQMrOXsWrQkG6ilE+S2FH+sLUpYstO+wOmdFC76i4J/2gQMH7Tt7VB8/gM9ef/dfTx7TtMOCwe2tAe+8r7pErcSkcjPNVQaPV9WBwRaNNvSU5hm8NNXnvAXBalZ/PRkR0g1RyGOCxKutnIkL20IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-8754cf2d6e2so339654339f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 22:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749964409; x=1750569209;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6DTPGxmWcDrzKLOjb3Y1VUZCjyv/wi0Ss5/3TpLFnI=;
        b=AMAQDWsl8jzTPgmEAalbQX3ConGvD0C4McaCjLDcRbum9uJvHjcCLSZK47RimeaSTk
         CvwA4tq4qWBNvezq/gYySYFHcSmp8HKer/E8I+CEJFLaBU76h0g5cVB/Do5xOzEgStxs
         HKFKuNC4xMUn4PzeM638IB2UhsjSGEn1YfDFkZqHDdCH8utdTHlSIx7DLjIWNRXT7ObI
         0yFxN9Tp1OI9zhczncMDPdKKhm8lgIg1uiOAzFQIvyAxEglr9yx7LQsqG7ZoNpCHyyJM
         k5ZDGGX5TvbYJWbSeM0roGviKWFWUZ/BEup9zAGh+R1T9vGQo4GFFG+ZL8tFPgVBCimJ
         9nGw==
X-Forwarded-Encrypted: i=1; AJvYcCVusB+oRHHYAWnAo5HiQDGxzwmDNcyCfztUQmHEtyEfH59U/JhWe06JSsCHRps4ndcgjlLNVh1UXsZ5uqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7tXqTi/9Z0JrOoiJyGE2pJQPlDXwPpOdQWcHMS96iHprvFKPu
	h926YnaH50fDFAVMgLKEiXiBMdbAnXHgKKWLs7YCMDBQpmXoPEpjzFFlTq6+M2xUT7lIsp1cx1s
	ycG5ZirQX/1CO4EKwKhbCKokEdOFNV6TPvlgTIIUbYcgmHePZynSMM2LntAs=
X-Google-Smtp-Source: AGHT+IF0SjtNH7m0Fh1Ph3offyB5C3UuHViMYXN6zKI291145FGATzafjnRVw67A/TQd8Q9Z2PGbAgWyYD89qVEO77hLRekY00Nb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4a:0:b0:3dd:b726:cc52 with SMTP id
 e9e14a558f8ab-3de07cdb48amr58957515ab.5.1749964408830; Sat, 14 Jun 2025
 22:13:28 -0700 (PDT)
Date: Sat, 14 Jun 2025 22:13:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684e5678.a00a0220.279073.0028.GAE@google.com>
Subject: [syzbot] [mm?] [squashfs?] WARNING in vma_merge_existing_range (2)
From: syzbot <syzbot+b9b432686bcbcac1ca01@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	pfalcato@suse.de, phillip@squashfs.org.uk, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com, 
	vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=107b19d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=b9b432686bcbcac1ca01
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1424b60c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147b19d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3df2a90115c7/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b9b432686bcbcac1ca01@syzkaller.appspotmail.com

    ffff93069000-ffffd1a12fff: 0000000000000000
    ffffd1a13000-ffffd1a33fff: ffff0000ca00b640
    ffffd1a34000-ffffffffffffffff: 0000000000000000
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6489 at mm/vma.c:768 vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768
Modules linked in:
CPU: 0 UID: 0 PID: 6489 Comm: syz-executor371 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768
lr : vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768
sp : ffff8000a0d67910
x29: ffff8000a0d67990 x28: dfff800000000000 x27: 0000000000000001
x26: 0000000020000000 x25: ffff8000a0d67a80 x24: 0000000020000000
x23: 1ffff000141acf50 x22: ffff0000c712ca00 x21: 0000000020800000
x20: ffff0000c712ca00 x19: ffff8000a0d67a60 x18: 00000000ffffffff
x17: 0000000000000000 x16: ffff80008adbe9e4 x15: 0000000000000001
x14: 1fffe0003386aae2 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60003386aae3 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000ca6a9e80 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff8000a0d66ef8 x4 : ffff80008f415ba0 x3 : ffff8000807b4b68
x2 : 0000000000000001 x1 : ffffffffffffffff x0 : ffffffffffffffff
Call trace:
 vma_merge_existing_range+0x14a8/0x1964 mm/vma.c:768 (P)
 vma_modify+0x7c/0x424 mm/vma.c:1564
 vma_modify_flags+0x18c/0x1dc mm/vma.c:1605
 mlock_fixup+0x18c/0x2c4 mm/mlock.c:483
 apply_mlockall_flags+0x290/0x344 mm/mlock.c:736
 __arm64_sys_munlockall+0x11c/0x238 mm/mlock.c:782
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 15466
hardirqs last  enabled at (15465): [<ffff80008055041c>] __up_console_sem kernel/printk/printk.c:344 [inline]
hardirqs last  enabled at (15465): [<ffff80008055041c>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2885
hardirqs last disabled at (15466): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (14694): [<ffff8000803cf71c>] softirq_handle_end kernel/softirq.c:425 [inline]
softirqs last  enabled at (14694): [<ffff8000803cf71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
softirqs last disabled at (14683): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
