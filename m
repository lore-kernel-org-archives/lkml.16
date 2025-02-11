Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA5B28F5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739233646; cv=none; b=IpillZe6E/Xs1w//wlzhej+4Pd4W9d089J+4ZcVgccEcbRScvo0VtQUoZOkygfRFC+62PJJInD5oEPmHsXP7HWRXQD85lnm6n9YoRKMMsjcluq4Wv99tDk/+2UDn+TlPKSNstVEf/WDg0U7nLxuHqv4zbsg6cGaSFQ6HMlvccWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739233646; c=relaxed/simple;
	bh=/YeEb0tef1pagaycgJWtt7V7ZFXRS2ZvTb2YLOs0fP4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lQ/ah0AMWmHnYDuA2QMJ7f5SKhkaRSwWJugCTUdiQL0X2FBVqkFzJFKm275E3M6Pj/QOyWvSs2OMyVLvnNuxMApqKV3FOrRSK/yW33i4D3w2+iJ+LWZZOcOAS4j/QejVsTrvRmqEshAzYy3ngnqJUp9wb5E9sdXq7u7wMC+bW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d1466cbaddso24858285ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739233643; x=1739838443;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwdoP5xDKeiD3xhc6dIZ6hGByqbJddUcA5ugMI1BuaI=;
        b=EDerHhOUctbUTrqCYHu7LGkFs4jVtog+wzrYT2HTY7TdgQb9xClf7424R4AxsTbDlJ
         zxZrIVM9dmtDyTGzKayub/eLJNn4FFnaIFaDq6RgOYoS3ByWVFxssnDTJoIsuBLjVbAe
         SuNU8rwMZhn1miDVYNBm8cv8/TOcQQ+QecKKxOvkygjoJMzxVJQd14EO2QbPfNVgd5tu
         9dUwE/9QLkt33JP8UuNyTiQJkzADCyTijch3LeGYn98gwEqWay241Cdop2obU+4ELQ8+
         5sScSXTyrXSqzm6BB6/YVVI4C/ZYHvXi7qYvlrEX0tzC9UPR/domUMEAcOMCeZ+8c02C
         X5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIavO5aYumNyj5OM7LK6uC2MqooZdf3A7Qa9S/eUb+MQHKdpTiC6T0CeO+sxLo3vUynpronutKoTdAeeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNdorsJ2mLBc/3ekxSl21iLFLSw2XHkl4LtFKDDcOT4xr/eR/
	xxtf6waoq61gR+PHcW2LEr6MEfYGoCawIyQ50rf/EdI4hBvevoV3KmqHWDiZm1TJAoVSYkRt+DV
	5dhuwAlXc7VAHHaCRzu4UBZbGwsD6pi4D4u+SpYfCh6GKFBVW2VYB8Ic=
X-Google-Smtp-Source: AGHT+IGTGS7ia3PYzneaQLW+nT8/+EH1b+SsvE35s5ycLUV2tAF3AHXI2UGn1JWiY2226OEcvXE+jX+tqsksT2LZKLbizKvxS5Vx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1282:b0:3d1:54ce:a8f9 with SMTP id
 e9e14a558f8ab-3d16f53eefamr11565025ab.10.1739233643578; Mon, 10 Feb 2025
 16:27:23 -0800 (PST)
Date: Mon, 10 Feb 2025 16:27:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aa996b.050a0220.3d72c.0057.GAE@google.com>
Subject: [syzbot] [jfs?] kernel BUG in lbmIODone (2)
From: syzbot <syzbot+856d1897cd91a6a435c9@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2014c95afece Linux 6.14-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10e40b18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8a65ac161350c5e
dashboard link: https://syzkaller.appspot.com/bug?extid=856d1897cd91a6a435c9
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c767824b323f/disk-2014c95a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/81289e194973/vmlinux-2014c95a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4a33d49982f5/Image-2014c95a.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+856d1897cd91a6a435c9@syzkaller.appspotmail.com

BUG at fs/jfs/jfs_logmgr.c:2303 assert(bp->l_flag & lbmRELEASE)
------------[ cut here ]------------
kernel BUG at fs/jfs/jfs_logmgr.c:2303!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 UID: 0 PID: 16 Comm: ksoftirqd/0 Not tainted 6.14.0-rc1-syzkaller-g2014c95afece #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : lbmIODone+0x12c4/0x1318 fs/jfs/jfs_logmgr.c:2303
lr : lbmIODone+0x12c4/0x1318 fs/jfs/jfs_logmgr.c:2303
sp : ffff800097d778f0
x29: ffff800097d77980 x28: 1fffe0001b405141 x27: 1ffff00012037934
x26: 1fffe0001e20724f x25: dfff800000000000 x24: 0000000000000000
x23: ffff0000da028a08 x22: 0000000000000000 x21: 0000000000000000
x20: 0000000000000020 x19: ffff0000da028a00 x18: 0000000000000008
x17: 0000000000000000 x16: ffff8000832d977c x15: 0000000000000001
x14: 1ffff00012faee78 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000102 x10: 0000000000ff0100 x9 : ac6013805dc83c00
x8 : ac6013805dc83c00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff800097d770b8 x4 : ffff80008fcbefc0 x3 : ffff800083275f78
x2 : 0000000000000001 x1 : 0000000100000101 x0 : 000000000000003f
Call trace:
 lbmIODone+0x12c4/0x1318 fs/jfs/jfs_logmgr.c:2303 (P)
 bio_endio+0x840/0x87c block/bio.c:1548
 blk_update_request+0x4ac/0xda0 block/blk-mq.c:983
 blk_mq_end_request+0x54/0x88 block/blk-mq.c:1145
 lo_complete_rq+0x188/0x2f4 drivers/block/loop.c:395
 blk_complete_reqs block/blk-mq.c:1220 [inline]
 blk_done_softirq+0x11c/0x168 block/blk-mq.c:1225
 handle_softirqs+0x320/0xd34 kernel/softirq.c:561
 run_ksoftirqd+0x70/0xc0 kernel/softirq.c:950
 smpboot_thread_fn+0x4b0/0x90c kernel/smpboot.c:164
 kthread+0x65c/0x7b0 kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
Code: d004fd63 91188063 52811fe2 979153a6 (d4210000) 
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
