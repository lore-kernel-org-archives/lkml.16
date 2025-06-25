Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEC8F6E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885289; cv=none; b=B6xEXScXzs0SchJxg6s+yTOzb3huy4qeUQ5Ou3JHOxCsYNgzBtm6Oloh/rTCixom6Yfn+VEpRkGsJhb9GEODVbfNDsHFtOTgFyced3UhZuuvnXQA3yOKJiTCExbOAq07AZ2mMza/7fCU6XtvyTvMnSDLoecoRUdUsr9uknRE3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885289; c=relaxed/simple;
	bh=CBIqMrK0t91mWmH7+CLy5lh6hy/LkMzfav3H/0DkQPk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E7XQLbtichDCsjkHqdbBscOHeZRB0s6+TMnMBw4kFqWS9dxaiTaPzuO9aLT7P9zee29ZZAfGYrAwf3kxbbdrTW1gDu4NbZg48wvShcSxlX9t+RDYknMUprx0T6NR9LNUiZyTI7Q7SUqj405Y7F6+rsfSiEGED/Ct+wHOmFAr2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-875b64cccd6so38655739f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750885287; x=1751490087;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0PiX8fe8Z38DG/7xY7GPfnFtFfzJLxDmHci+S8H9YI=;
        b=Pm0uGe8Qp0ljyKxaYaOAn3EiOLu6kfdpxR8ffjM9Sv2JrYKup7xesgoveuOoEtYm5K
         3ms3rDsDNAT31euKmy8UA3tTZJJpk8c+vYI7PdcGx2o49YCvcSFJ7YPQVr2R6t3dUjf6
         8JMxr2rUQ0LpjJ7fArHP9k9jIxo8wgBNn2RC/41AKqwhbU4U12IPDjxHwFWpTGe3vlPb
         v57QvUCZku8OgzBqcyxe/RJiK+8b2kCjURNlBDfEwFbQ5Di1epJjwMQV+wK9bcKHDEnB
         hsVX61apUUNmT08PfWhA2XYU7UIvXHBcgI/Ml4kRXBhuae9U0jKOSJ59M0c9BdZG9mDo
         POQg==
X-Gm-Message-State: AOJu0YxZ+fs5XamiGsOzT0ijF5Fzex6udO9c73mfeOwcsRpBj5Uuzewo
	+Glbm01C95Lsfz1WQo71h6tG+2wXIO8l8i+7W/0UanYU3cB1kHPte9YZ9CuU29Y+cqWQMf/NG0Y
	qoMC7Umpp+SAunxxlpG6tnpR7rcBCweDkIANU5KUbo5hrtVffKHDGESjWYVav3A==
X-Google-Smtp-Source: AGHT+IHJ0wo21Dk2enBbH3ywLfvgGMXxYaOF4Vo0tbSrg8LTwjUF3ipv/8DiSsCUr9s1af3dXy2lC4a6Oy1ReMbDSSvapePZxrtw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3f8c:b0:876:7555:9cb4 with SMTP id
 ca18e2360f4ac-87675559cf9mr323377539f.1.1750885286523; Wed, 25 Jun 2025
 14:01:26 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:01:26 -0700
In-Reply-To: <68232e7b.050a0220.f2294.09f6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685c63a6.050a0220.2303ee.0094.GAE@google.com>
Subject: Re: [syzbot] RE: [syzbot] [rdma?] WARNING in gid_table_release_one (3)
From: syzbot <syzbot+b0da83a6c0e2e2bddbd4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: RE: [syzbot] [rdma?] WARNING in gid_table_release_one (3)
Author: edwards@nvidia.com



-----Original Message-----
From: syzbot <syzbot+b0da83a6c0e2e2bddbd4@syzkaller.appspotmail.com>=20
Sent: Tuesday, May 13, 2025 2:35 PM
To: jgg@ziepe.ca; leon@kernel.org; linux-kernel@vger.kernel.org; linux-rdma=
@vger.kernel.org; syzkaller-bugs@googlegroups.com
Subject: [syzbot] [rdma?] WARNING in gid_table_release_one (3)

Hello,

syzbot found the following issue on:

HEAD commit:    c32f8dc5aaf9 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=3D10789768580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dea4635ffd6ad5b4=
a
dashboard link: https://syzkaller.appspot.com/bug?extid=3Db0da83a6c0e2e2bdd=
bd4
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-=
1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D15a08cf458000=
0

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b921498959d4/disk-=
c32f8dc5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04e6ad946c4b/vmlinux-=
c32f8dc5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d4f0d8db50ee/Ima=
ge-c32f8dc5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+b0da83a6c0e2e2bddbd4@syzkaller.appspotmail.com

--
------------[ cut here ]------------
GID entry ref leak for dev syz1 index 2 ref=3D573
WARNING: CPU: 1 PID: 655 at drivers/infiniband/core/cache.c:809 release_gid=
_table drivers/infiniband/core/cache.c:806 [inline]
WARNING: CPU: 1 PID: 655 at drivers/infiniband/core/cache.c:809 gid_table_r=
elease_one+0x284/0x3cc drivers/infiniband/core/cache.c:886
Modules linked in:
CPU: 1 UID: 0 PID: 655 Comm: kworker/u8:10 Not tainted 6.15.0-rc5-syzkaller=
-gc32f8dc5aaf9 #0 PREEMPT Hardware name: Google Google Compute Engine/Googl=
e Compute Engine, BIOS Google 02/12/2025
Workqueue: ib-unreg-wq ib_unregister_work
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--) pc : rele=
ase_gid_table drivers/infiniband/core/cache.c:806 [inline] pc : gid_table_r=
elease_one+0x284/0x3cc drivers/infiniband/core/cache.c:886
lr : release_gid_table drivers/infiniband/core/cache.c:806 [inline] lr : gi=
d_table_release_one+0x284/0x3cc drivers/infiniband/core/cache.c:886
sp : ffff80009c927860
x29: ffff80009c9278b0 x28: ffff0000d2b52f00 x27: ffff0000d77ee8d8
x26: ffff0000d77ee800 x25: 0000000000000010 x24: 0000000000000001
x23: ffff800092818000 x22: dfff800000000000 x21: 0000000000000003
x20: 1fffe0001aefdd1b x19: 1fffe0001aefdd00 x18: 00000000ffffffff
x17: 0000000000000000 x16: ffff80008adb410c x15: 0000000000000001
x14: 1fffe000338716e2 x13: 0000000000000000 x12: 0000000000000000
x11: ffff6000338716e3 x10: 0000000000ff0100 x9 : 1b90c18326689500
x8 : 1b90c18326689500 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009c9271b8 x4 : ffff80008f405b40 x3 : ffff8000807b1330
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000000 Call trac=
e:
 release_gid_table drivers/infiniband/core/cache.c:806 [inline] (P)  gid_ta=
ble_release_one+0x284/0x3cc drivers/infiniband/core/cache.c:886 (P)
 ib_cache_release_one+0x144/0x174 drivers/infiniband/core/cache.c:1636
 ib_device_release+0xc4/0x194 drivers/infiniband/core/device.c:482
 device_release+0x8c/0x1ac drivers/base/core.c:-1  kobject_cleanup lib/kobj=
ect.c:689 [inline]  kobject_release lib/kobject.c:720 [inline]  kref_put in=
clude/linux/kref.h:65 [inline]
 kobject_put+0x2b0/0x438 lib/kobject.c:737
 put_device+0x28/0x40 drivers/base/core.c:3800
 ib_unregister_work+0x28/0x38 drivers/infiniband/core/device.c:1629
 process_one_work+0x7e8/0x156c kernel/workqueue.c:3238  process_scheduled_w=
orks kernel/workqueue.c:3319 [inline]
 worker_thread+0x958/0xed8 kernel/workqueue.c:3400  kthread+0x5fc/0x75c ker=
nel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847 irq event stamp: 149=
9918 hardirqs last  enabled at (1499917): [<ffff80008054cc08>] __up_console=
_sem kernel/printk/printk.c:344 [inline] hardirqs last  enabled at (1499917=
): [<ffff80008054cc08>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2=
885 hardirqs last disabled at (1499918): [<ffff80008adaf5e0>] el1_dbg+0x24/=
0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (1496318): [<ffff8000803cbf1c>] softirq_handle_en=
d kernel/softirq.c:425 [inline] softirqs last  enabled at (1496318): [<ffff=
8000803cbf1c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607 softirqs la=
st disabled at (1496303): [<ffff800080020efc>] __do_softirq+0x14/0x20 kerne=
l/softirq.c:613 ---[ end trace 0000000000000000 ]---
wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50


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

