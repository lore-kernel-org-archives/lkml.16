Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43223D28A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964691; cv=none; b=BkVaxl+dO3RSYhWQn4PLBUeaHe/ZRPyTj5ztsolCyQCyB3m1cVJp85KIJty6jV9lf+8G3BpU6Zo0m1dWOA22Gf+QUz9EeVOLU1zFuusjCKwjTyMkPQ5N3yCKpYp8uqg/g4qB2MMdL4ETLjFSfogqOAuFHB585OZ4UzX0+ElFHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964691; c=relaxed/simple;
	bh=wbgYYmgY+K8XWG9aKYtXkj9/28mp6qfTeWp+2lGAXFM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rhCzgEu1WwnMvXJyCZiUXOQ5VmLCehIKQQmiL6Nm5wT4+mGs39qOmqBPmCFboWi6PKZEgBfFtC4nkIvTZ4dGicrngHJsvzmkHY34ZK7hyMp6eYotZ8m9r4adymPUnBCb0WtFcyUHa9rLbJD6YfOx4RSpleya6vEc8SUTrTL2lsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3dcd10297d5so88738625ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748964689; x=1749569489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6+WFHc8Xd2Rs5cqfXrWuYOJWj2GC9zBKyolOD6WGw0=;
        b=kU0rZRB91BR+r5G667GvjqX4Z4QC3XFXyeKGP6+Q58TOoJh76fCCUsV/35r96bDB9A
         Wpc7pHCwSAZt0Vaurk/Yrhnztj153YoX/JpRyO/AzKRfjy0Ob3Nsyls3kCZbb2BvlKNx
         E0r5gtQoIXXlpdShi9BmSDD8gGzMjNvW0AmIbq5zjK1rhHs+o4qoVirxX0nF/FAtEijF
         TetDgtcEDdLBOrtoyD+5aUbWnr22KcBYO85h8ydCkmpg7SBx+iY764rFUle8Sy/yYyiR
         +xA6Ij84cYjw5ojjKcnuBLdR45Mg3VF9hh1HpZdQI6T+zPjOGTg1ufAX6g24poBXpZxQ
         HTOg==
X-Forwarded-Encrypted: i=1; AJvYcCUrmeeOcr7bdh1f5DdyaPg3jB/V6gDEwuZ2UVWkz7ci1JCIZCjqIgz/T8eLi7YqdtxKm/UyggdXMvvq0yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGBUMWVNCy7OgA+pTgUMpw5NzbP/hjZYWla1GrL6fiG3Fs2mUH
	q5p67mnOUNKTy6iGm8oLOKqa0+rSGBQQXZBULpQi9DB4ytueMzqXzq59divAnjyWosSBgY4nyNA
	2ZbqK3gE/zuWK5k8q6C9PbQZEfJ646fzzWL3/3evxNaBVc4RQN+DqX7jFwRc=
X-Google-Smtp-Source: AGHT+IEOdHxSXjVumgLl07nzksYwLrQcaFcK7H9ZWivPHOAaD4reLIzh0tBf4A8wo8kmauv+injTXdG4v/Dyy4BhhMysgdIJ/L/f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e02:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3dd99c28958mr217938205ab.18.1748964689425; Tue, 03 Jun 2025
 08:31:29 -0700 (PDT)
Date: Tue, 03 Jun 2025 08:31:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683f1551.050a0220.55ceb.0017.GAE@google.com>
Subject: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
From: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@redhat.com, jgg@ziepe.ca, 
	jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	peterx@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1457d80c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=1d335893772467199ab6
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1d335893772467199ab6@syzkaller.appspotmail.com

head: ffffffff000001fe 0000000000000028 0000000000000000 0000000000000200
page dumped because: VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) && !PageAnonExclusive(page))
------------[ cut here ]------------
kernel BUG at mm/gup.c:70!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:

CPU: 1 UID: 0 PID: 115 Comm: kworker/u8:4 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: iou_exit io_ring_exit_work
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69
lr : sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69
sp : ffff800097f17640
x29: ffff800097f17660 x28: dfff800000000000 x27: 1fffffbff87da000
x26: 05ffc0000002107c x25: 05ffc0000002107c x24: fffffdffc3ed0000
x23: fffffdffc3ed0000 x22: ffff800097f176e0 x21: 05ffc0000002107c
x20: 0000000000000000 x19: ffff800097f176e0 x18: 1fffe0003386f276
x17: 703e2d6f696c6f66 x16: ffff80008adbe9e4 x15: 0000000000000001
x14: 1fffe0003386f2e2 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60003386f2e3 x10: 0000000000ff0100 x9 : c8ccd30be98f3f00
x8 : c8ccd30be98f3f00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff800097f16d58 x4 : ffff80008f415ba0 x3 : ffff8000807b4b68
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000061
Call trace:
 sanity_check_pinned_pages+0x7cc/0x7d0 mm/gup.c:69 (P)
 unpin_user_page+0x80/0x10c mm/gup.c:191
 io_release_ubuf+0x84/0xf8 io_uring/rsrc.c:113
 io_buffer_unmap io_uring/rsrc.c:140 [inline]
 io_free_rsrc_node+0x250/0x57c io_uring/rsrc.c:513
 io_put_rsrc_node io_uring/rsrc.h:103 [inline]
 io_rsrc_data_free+0x148/0x298 io_uring/rsrc.c:197
 io_sqe_buffers_unregister+0x84/0xa0 io_uring/rsrc.c:607
 io_ring_ctx_free+0x48/0x430 io_uring/io_uring.c:2723
 io_ring_exit_work+0x6c4/0x73c io_uring/io_uring.c:2962
 process_one_work+0x7e8/0x156c kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x958/0xed8 kernel/workqueue.c:3400
 kthread+0x5fc/0x75c kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
Code: 900523a1 910e0021 aa1703e0 97fff8a9 (d4210000) 
---[ end trace 0000000000000000 ]---


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
