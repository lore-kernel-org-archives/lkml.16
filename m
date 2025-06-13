Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09D81E00A0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833310; cv=none; b=VWL5R4elaq0LphhvNbp0y7I2TgA8Y9sJtTE4D7+C0Bmjf7lJ49b0qgDA9gPCTzN0mR4Y76e9kIc62RdTfwutPC3xiUQead5T8M48D8n+wlsXXntfWcniI8N69x7mmb/aPP3wlHapfXoF/LT4yro+d0T8POxuOqa44LHyYz674gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833310; c=relaxed/simple;
	bh=Rp7vJTlMPsaoen5NOBgjQfwezWAotk4TV69xzCO7TNQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MjSSbbT7Smsw45VjkGQRMZf6g2WFOdD17Djk9pB873DuGbsDQQ+xoXDcVQGOMpwnpQyDycmeuGVzQcAYh/Abn9vwf8ArA7PXq4hmQMyVap2xMBPOA2OhAQqI7grtO9GrmOgJV5wNfi3IKi4uxx+HhoOxlor96flUXQRN4gDwHig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so60239755ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833308; x=1750438108;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nUBlTmct8R22pPkzLTix51atGwB3+I8WO1dU4QJBzjk=;
        b=uNMlIui7cUfNk1kGNYCoRDp5E9zbxmu1cMfuNTA8Ys2161Fjb7OOHBDiqD1q64UmzQ
         UfzDbaCnTxn0LWcvKe3JuhXQyZQsuulY7GriLOHTGggmg2P5/jAumXlxuCZnBgcPQZDp
         iHc7lQCyQ9ydUWXI/IBtDs+cUSgavIEoNFpXFEoaedA4NMQgrga+UKtIpXApY0jhMaC1
         OspwI7lUpT5D+SVE9jsPDwoowUxAqQbvB6a7W6JPwdke2+4aMoYVSs9POhCUD/FswUcW
         FKm3AdLuYbE/3gbUkdUbaDT9xV7lsroEKzo1cg8Sn0AyV0dxANuSwPmzMePvR9ReThyd
         c19w==
X-Forwarded-Encrypted: i=1; AJvYcCVf9/eEqkcUlwOILO7EVrallD2Luwl0L3ZQUof8KoNilC86F3swBaDwDJ/B3oU/+hk7YNNxygp5WJ+klNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWjyIOeJBbpzd4/Z3fo/Cw9qgNeDftOfIVUgpAxIyq2QfaBnl
	Ki7QKRxnY9oKQXxJEObOTwAXXsc5v4YhIOhq2C8vvnVnUW7/fowOp0oAUm/f4ycwrKapK8k7ybg
	ab4+cyc4TMKVlBQl720xjZRowsiuEL1eyBOmPt0VVb857R0Dgm/+Aqe5hQvo=
X-Google-Smtp-Source: AGHT+IE2fqAVde6MrvtCnAC4SuVWHIlQw+FwU8+kzEz67aL6Ahlu7EHoBf2WFhN3lVy9ywM1JHWJdwsJrKUwldbDSiIRDuDdovku
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:d746:25eb with SMTP id
 e9e14a558f8ab-3de07cd170amr3843025ab.16.1749833307733; Fri, 13 Jun 2025
 09:48:27 -0700 (PDT)
Date: Fri, 13 Jun 2025 09:48:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684c565b.a00a0220.279073.0014.GAE@google.com>
Subject: [syzbot] [bcachefs?] BUG: unable to handle kernel NULL pointer
 dereference in bch2_btree_update_start
From: syzbot <syzbot+2f3859bd28f20fa682e6@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    19272b37aa4f Linux 6.16-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11a7f682580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8409c4d4e51ac27
dashboard link: https://syzkaller.appspot.com/bug?extid=2f3859bd28f20fa682e6
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/92d22b0c6493/disk-19272b37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3fb0142bb63a/vmlinux-19272b37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3d5f3836ae42/Image-19272b37.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2f3859bd28f20fa682e6@syzkaller.appspotmail.com

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000086000006
  EC = 0x21: IABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
user pgtable: 4k pages, 48-bit VAs, pgdp=000000014106a000
[0000000000000000] pgd=0800000128c8b403, p4d=0800000128c8b403, pud=0800000132b39403, pmd=0000000000000000
Internal error: Oops: 0000000086000006 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 7230 Comm: syz.5.20 Not tainted 6.16.0-rc1-syzkaller-g19272b37aa4f #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : 0x0
lr : mempool_alloc_noprof+0x150/0x3f4 mm/mempool.c:402
sp : ffff80009dc06c80
x29: ffff80009dc06d80 x28: 0000000000000000 x27: 1fffe0001ee507df
x26: 0000000000092800 x25: ffff700013b80d9c x24: ffff0000f7283ef0
x23: 0000000000092c40 x22: ffff0000f7283ef8 x21: 0000000000000400
x20: 1fffe0001ee507de x19: ffff0000f7283ea0 x18: 00000000ffffffff
x17: ffff800093215000 x16: ffff80008051b344 x15: ffff800092d9eb80
x14: ffff0000c4812910 x13: ffff800093014c08 x12: ffff0000c4812930
x11: 0000000000008004 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : 0000000000000000 x7 : ffff800080b774a8 x6 : 0000000000000000
x5 : 0000000000000020 x4 : ffff80009dc06a20 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000092800
Call trace:
 0x0 (P)
 bch2_btree_update_start+0x488/0x1398 fs/bcachefs/btree_update_interior.c:1212
 bch2_btree_node_rewrite+0x190/0xd34 fs/bcachefs/btree_update_interior.c:2226
 bch2_move_btree+0x538/0xa8c fs/bcachefs/move.c:1145
 bch2_scan_old_btree_nodes+0x80/0x21c fs/bcachefs/move.c:1266
 bch2_data_job+0x570/0x7cc fs/bcachefs/move.c:1404
 bch2_data_thread+0xb4/0x1cc fs/bcachefs/chardev.c:315
 kthread+0x5fc/0x75c kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
Code: ???????? ???????? ???????? ???????? (????????) 
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
