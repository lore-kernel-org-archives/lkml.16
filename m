Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C40221FB4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872474; cv=none; b=F//6GTrwFECNNZfzjLKbS3CeBanIiW1zbML3ah6pqshZwGADFUj7UFR6t9tlD5gvnoqDKsyD+GE1MfCffD1+DTfPXxHAqTwWCuXBALuSI4Ag8P5LonuPJ724QqwO/foF65dwTZEb5fhTzjuiFFCzTHAPVJ+ciNQUcWLGMSn6vaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872474; c=relaxed/simple;
	bh=Vid+FEUoJKFMrUZGrDSzl6LsuWKYDUaU90e4+EdKkRo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SiFgKXwHvXysQEqPvryUH5LonUmL7PShWFIBOayFhFz/fJiwbZ0n1iMNIeFlDGf9XlufsAR1gzNTorUqAr6nj6NrYA75ANoLj/OW5Qn4S3umrAAtHoMw+HTpH9KZytSERJUCZEAe1qek7MK7O91pwqpJs4aTyHXvEGEmWiLiWKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dc9cd70437so52495875ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872472; x=1749477272;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KVbGpUMlPxut20Iu0UwV8Qrt7EeeVNR+/KWAMkeocI=;
        b=C1kzjbwt0DeepXgvW9a57tPPbjgJNX0BcBZN249yk2HOX3gKlYhG/+5YEAr8Z2X8Ab
         5wK+pTr5W9m5sW/VZfGOwxbw+nsI7NrMFlxJT41RDnSh1NvDcevd7iVKGbaYkwu2vu+y
         2OI70fuw/xDiwUtQ2autFh9JogiYXpGncn1wmoNHt31NG6wo2kxuyhUSnks9EMBcBAX9
         sovsOEPJ5YY2leKWv72DbV5YsXu7t8eIzan8XpvLT0fycddc/i2w3INvhfcZcaPBdCNx
         tg8H2aI0yqsEpDpfW5Yyxv9qqJR0oafc4fPAELVFI4Wtev9Lo+ibe1FmfUNaL7FD+DKq
         KOOw==
X-Forwarded-Encrypted: i=1; AJvYcCUBD4i/b90KtqhSCqwFa/dpvhwR64uHGWTmYDu79AkXSvyJ+W3YjVCABag5deLcTqp5CIaH1Ol4LpxKq+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrVF1DfyoriFfVr7HGm3kRKpkpa+Ttygk+4LoAePfDLmVlBynM
	AUp31W+WX/UrPgrsQG8dHSOMafbi87uG1d2vmiqmVmT5FrdWEu0hqKrKbyX1ZhzdQ1qRwWFjSaD
	i0HMSHQHwfL74DRwT5NfD9tF/k7XLLQrMOn8o1Z/g/czkC9B+6vBM2xKQ8/c=
X-Google-Smtp-Source: AGHT+IEbbr8aC5OBIH675LUi1XviHRh7vpww8ni/7KPCRegtkfA3qlcgVPD6SK3VS37vequJElmZgcA1DdnH1XMm3+GEL8HzU2aX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3801:b0:3dc:7a56:18f6 with SMTP id
 e9e14a558f8ab-3dda339e432mr94719635ab.22.1748872471778; Mon, 02 Jun 2025
 06:54:31 -0700 (PDT)
Date: Mon, 02 Jun 2025 06:54:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683dad17.a00a0220.d8eae.0054.GAE@google.com>
Subject: [syzbot] [bcachefs?] kernel BUG in bch2_bkey_pack_pos_lossy (2)
From: syzbot <syzbot+a6af6dbf934175da5161@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    90b83efa6701 Merge tag 'bpf-next-6.16' of git://git.kernel..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16a2c970580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ae6d9a7dd3ac8772
dashboard link: https://syzkaller.appspot.com/bug?extid=a6af6dbf934175da5161
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=159907f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1758a482580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fc8b15fe0000/disk-90b83efa.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/01f6377bcdf4/vmlinux-90b83efa.xz
kernel image: https://storage.googleapis.com/syzbot-assets/afd1bac4b4ac/bzImage-90b83efa.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6c680e5364cd/mount_0.gz

The issue was bisected to:

commit cd3cdb1ef706a1ac725194d81858d58375739b25
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Tue Apr 22 13:14:19 2025 +0000

    bcachefs: Single err message for btree node reads

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14841ed4580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16841ed4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=12841ed4580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a6af6dbf934175da5161@syzkaller.appspotmail.com
Fixes: cd3cdb1ef706 ("bcachefs: Single err message for btree node reads")

bcachefs (loop0): invalid bkey in btree_node btree=subvolumes level=0: u64s 8 type snapshot 0:4294967295:0 len 0 ver 0: subvol parent          0 children          0          0 subvol 1 tree 0
  invalid key type for btree subvolumes (snapshot), deleting
------------[ cut here ]------------
kernel BUG at fs/bcachefs/bkey.c:389!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5831 Comm: read_btree_node Not tainted 6.15.0-syzkaller-07774-g90b83efa6701 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:set_inc_field_lossy fs/bcachefs/bkey.c:389 [inline]
RIP: 0010:bch2_bkey_pack_pos_lossy+0x13de/0x24e0 fs/bcachefs/bkey.c:518
Code: e8 57 ce 08 fe 48 ba 00 00 00 00 00 fc ff df e9 a5 f8 ff ff e8 c3 d5 a7 fd 90 0f 0b e8 bb d5 a7 fd 90 0f 0b e8 b3 d5 a7 fd 90 <0f> 0b e8 ab d5 a7 fd 90 0f 0b e8 a3 d5 a7 fd 90 0f 0b f3 0f 1e fa
RSP: 0018:ffffc900043aeb40 EFLAGS: 00010293
RAX: ffffffff8418244d RBX: 0000090000000000 RCX: ffff888030f41e00
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 0000090000000000
RBP: ffffc900043aed78 R08: ffffffffffffffff R09: ffffffffffffffff
R10: ffffffffffffffff R11: ffffffffffffffff R12: ffff88814c4490c4
R13: fffff700ffffffff R14: 0000000000000000 R15: fffffffffffffffe
FS:  0000000000000000(0000) GS:ffff888125d98000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005633c0c98470 CR3: 000000003443a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 bkey_pack_pos fs/bcachefs/bkey.h:382 [inline]
 __build_ro_aux_tree+0xb21/0x1800 fs/bcachefs/bset.c:743
 bch2_bset_build_aux_tree+0x3f5/0x570 fs/bcachefs/bset.c:787
 bch2_btree_node_read_done+0x39e4/0x4f60 fs/bcachefs/btree_io.c:1322
 btree_node_read_work+0x426/0xe30 fs/bcachefs/btree_io.c:1400
 bch2_btree_node_read+0x887/0x29f0 fs/bcachefs/btree_io.c:-1
 bch2_btree_node_fill+0xd12/0x14f0 fs/bcachefs/btree_cache.c:994
 bch2_btree_node_get_noiter+0xa2c/0x1000 fs/bcachefs/btree_cache.c:1261
 found_btree_node_is_readable fs/bcachefs/btree_node_scan.c:85 [inline]
 try_read_btree_node fs/bcachefs/btree_node_scan.c:220 [inline]
 read_btree_nodes_worker+0x1319/0x1e20 fs/bcachefs/btree_node_scan.c:269
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:set_inc_field_lossy fs/bcachefs/bkey.c:389 [inline]
RIP: 0010:bch2_bkey_pack_pos_lossy+0x13de/0x24e0 fs/bcachefs/bkey.c:518
Code: e8 57 ce 08 fe 48 ba 00 00 00 00 00 fc ff df e9 a5 f8 ff ff e8 c3 d5 a7 fd 90 0f 0b e8 bb d5 a7 fd 90 0f 0b e8 b3 d5 a7 fd 90 <0f> 0b e8 ab d5 a7 fd 90 0f 0b e8 a3 d5 a7 fd 90 0f 0b f3 0f 1e fa
RSP: 0018:ffffc900043aeb40 EFLAGS: 00010293
RAX: ffffffff8418244d RBX: 0000090000000000 RCX: ffff888030f41e00
RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 0000090000000000
RBP: ffffc900043aed78 R08: ffffffffffffffff R09: ffffffffffffffff
R10: ffffffffffffffff R11: ffffffffffffffff R12: ffff88814c4490c4
R13: fffff700ffffffff R14: 0000000000000000 R15: fffffffffffffffe
FS:  0000000000000000(0000) GS:ffff888125c98000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055f7477e8168 CR3: 0000000034d24000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
