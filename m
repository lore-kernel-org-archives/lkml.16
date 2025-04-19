Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D06D8472
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745037508; cv=none; b=kHIbtbxOb+5gt9R+DYIp6xMAwPWnrixJsPluwqV9QZsKjytc+1ciTTCe+C0DpftGoWAaPaS8L1FT/m+10omyiwUJwcYFJZzp2awM6GNIYz1jVXHZ5KJvvnS3PAn/8vjVWmGczNfZefAtwcnaADzGYeb/4DJyqHYuqqY2cD35Z8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745037508; c=relaxed/simple;
	bh=Nt5ULpuHYCWklLKL6dPTgL9w76UrAf0HuuX78/0txLU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ltiyHWB/AxATYR9Ob863GkNTImIAnuHvEMi42awQG1pCuiYkcaPPaWxXycV7NeurTbNNmHSNYkvwD5g3TJwAA5Eb1/6Vxrq65ZNADt1gSlh1e0elKNwBjw4yfwWy8Y4uUGA8n1X1PQ38vxch3I61HAsmRCcdlq/a1sAom27NzQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d438be189bso21240795ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745037505; x=1745642305;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hhd8cxcmA31nIqcjjcRMiI9LaDS8bI++9l+oDYSpg5Q=;
        b=Py7pqBi24qNEmykVgQq0Ka9MZci9Ii6qKxysWmUds1EoRwhJNOx7C/Skcv7NrYXLmx
         7Wbt6Qf9b6gGP7+pPjNv5Pp5Glu3lI9oUX1S6CmfCZKoDZIFaYNCrnyARbcB1xpvyKVg
         5s5gypeVSoTsh97d83o5eBVNL3AynlX36hkg/OGrBxmnht3+OAI0e8kcCceWapjQHYQY
         7s+cAe9TZDtl+R41ECHGI6dbfA7RnjFdXsjjmipV/3qVojRTSixiEMfS6hd7mMoc0D8b
         fmEi+Bvzbb7D4TUOqQCqgWWIoFt6Du9XeapIYoqRZUmL9lngDqcjQR4lK+F17GA6cuUA
         /HOA==
X-Forwarded-Encrypted: i=1; AJvYcCVU6qExtgYWr8UTt6lEEgfzH8jEwB/MLvUfTsBarNdRNxUfubmHwSY2249OKmHApsXgj9BxzCvXpRX/ksI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXrMN/RHBbnaRbTULiM1mpT8TnUy88jbdtxWJtYjc39bylIKcm
	3r2uC4hw11W5Aoe1zqt0wrzKjjpAWINVEiB+2Prw60u865LuAzUUdT2wRr25iih1mw7WZC9EgIH
	ek56VedATqgzMBgQsxGeFLRuak9AVtcRktWJtEEB3LczZIeiQn5uArwQ=
X-Google-Smtp-Source: AGHT+IGFU/es6XnWPK3DJJGOqgSN01ufsNggX9u5A3TtNUM+51PHoTGM+fEnynrp5BPc7gci1AKVR0EITqn4lprOlgm174WWsc16
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b25:b0:3d3:fbae:3978 with SMTP id
 e9e14a558f8ab-3d88eda88b8mr36412315ab.9.1745037505566; Fri, 18 Apr 2025
 21:38:25 -0700 (PDT)
Date: Fri, 18 Apr 2025 21:38:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680328c1.050a0220.243d89.0024.GAE@google.com>
Subject: [syzbot] [hfs?] WARNING in check_flush_dependency (4)
From: syzbot <syzbot+09455b3f0a89d685a9d3@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c72692105976 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=150cf0cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3074fa928809af2b
dashboard link: https://syzkaller.appspot.com/bug?extid=09455b3f0a89d685a9d3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/02d65c9d9776/disk-c7269210.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf24085c451/vmlinux-c7269210.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92025d8a23a1/Image-c7269210.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+09455b3f0a89d685a9d3@syzkaller.appspotmail.com

------------[ cut here ]------------
workqueue: WQ_MEM_RECLAIM dio/loop0:dio_aio_complete_work is flushing !WQ_MEM_RECLAIM events_long:flush_mdb
WARNING: CPU: 1 PID: 6522 at kernel/workqueue.c:3721 check_flush_dependency+0x290/0x344 kernel/workqueue.c:3717
Modules linked in:
CPU: 1 UID: 0 PID: 6522 Comm: kworker/1:5 Not tainted 6.15.0-rc2-syzkaller-gc72692105976 #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: dio/loop0 dio_aio_complete_work
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : check_flush_dependency+0x290/0x344 kernel/workqueue.c:3717
lr : check_flush_dependency+0x290/0x344 kernel/workqueue.c:3717
sp : ffff8000a4cc76d0
x29: ffff8000a4cc76d0 x28: 0000000000000000 x27: 1fffe0001dc7b42b
x26: 0000000000000000 x25: ffff80009341b000 x24: ffff0000d23f4400
x23: dfff800000000000 x22: ffff0000d3fb1918 x21: ffff80008133b000
x20: ffff0000d23f4578 x19: ffff0000c0029400 x18: 0000000000000008
x17: 00000000fffffffa x16: ffff80008333704c x15: 0000000000000001
x14: 1fffe000366e2322 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000003 x10: 0000000000ff0100 x9 : a994bece50049800
x8 : a994bece50049800 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff8000a4cc6e58 x4 : ffff800090035460 x3 : ffff800080750da0
x2 : 0000000000000001 x1 : 0000000100000001 x0 : 0000000000000000
Call trace:
 check_flush_dependency+0x290/0x344 kernel/workqueue.c:3717 (P)
 start_flush_work kernel/workqueue.c:4171 [inline]
 __flush_work+0x220/0x958 kernel/workqueue.c:4208
 flush_work kernel/workqueue.c:4265 [inline]
 flush_delayed_work+0xcc/0xf8 kernel/workqueue.c:4287
 hfs_file_fsync+0xec/0x148 fs/hfs/inode.c:680
 vfs_fsync_range+0x160/0x19c fs/sync.c:187
 generic_write_sync include/linux/fs.h:2976 [inline]
 dio_complete+0x510/0x6bc fs/direct-io.c:313
 dio_aio_complete_work+0x28/0x38 fs/direct-io.c:325
 process_one_work+0x810/0x1638 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x97c/0xf08 kernel/workqueue.c:3400
 kthread+0x674/0x7dc kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
irq event stamp: 11908
hardirqs last  enabled at (11907): [<ffff800080371ff0>] flush_delayed_work+0xac/0xf8 kernel/workqueue.c:4286
hardirqs last disabled at (11908): [<ffff80008b9be494>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
hardirqs last disabled at (11908): [<ffff80008b9be494>] _raw_spin_lock_irq+0x28/0x70 kernel/locking/spinlock.c:170
softirqs last  enabled at (11276): [<ffff80008583fac0>] spin_unlock_bh include/linux/spinlock.h:396 [inline]
softirqs last  enabled at (11276): [<ffff80008583fac0>] ptr_ring_consume_bh include/linux/ptr_ring.h:367 [inline]
softirqs last  enabled at (11276): [<ffff80008583fac0>] wg_packet_encrypt_worker+0x121c/0x12ac drivers/net/wireguard/send.c:293
softirqs last disabled at (11274): [<ffff80008583f874>] spin_lock_bh include/linux/spinlock.h:356 [inline]
softirqs last disabled at (11274): [<ffff80008583f874>] ptr_ring_consume_bh include/linux/ptr_ring.h:365 [inline]
softirqs last disabled at (11274): [<ffff80008583f874>] wg_packet_encrypt_worker+0xfd0/0x12ac drivers/net/wireguard/send.c:293
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
