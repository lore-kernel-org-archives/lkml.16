Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB90196
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 06:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744525482; cv=none; b=gvUawm6pBEHgZsoDbS9Qfg5yNsLsjQ9zf5It1PIBOYcesflRky9y+9kwIW4mRql/O2Z0Bdprn8JbSsG5wPtZYM5da5I6RvsiY7pH1bFlXUN+1Squot94INrHQ9aautdOVx4MshT8rWiiZZ4O1HkpTm5fSMe9G27vNbFtfkhnCFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744525482; c=relaxed/simple;
	bh=57pR2qihC1PxCsWc76togiDes1jaO4B95L4MXQYPc24=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oGUfYlkP1OnqOgQxf9+54v9/cnE7dhb+3gsNawfWI81HVqt7CNfWzxBcZ00Vah7OXyQgl7q4Ij4NBdYq9jK+EMQHci+rGFrVdOKTLqenuqobP6716w7qQMq8vtsfkmnmmasLx/QthBsx4wyi/KLE9K2NktVzMshJMwlCb5Hm98k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so32805815ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 23:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744525480; x=1745130280;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj+C6+yV6G/pJC3iESoarMPQO/VN2LOr/uZ2BqgJe2s=;
        b=ew3vp792fl+YeWbWvosBJNT4iAf9A/uaHzOVXkRkYAjsuBGI+dp0if3ArkdF3Lp0Ff
         TRnoc2s2ZyxqHWhmR03bqgFXeuKEhTB/mxiinIio+U79d5jjUSDHF4189MENHAqWaXDt
         QBW/IYrH19y2Qi2Pg3buB/JNgWdZymucYAGBRzSHSrLqSfFSIMdmbVV246G9Parl8eYS
         uKbT3H1tP6n9d5q8odVKrTh+j07QhENzIb0++oDefmVicZg3ThdA0cNIZntzEVeng77p
         7vjm5YwZJ00kCpiJVVDkNSGzVRzOo0/xTEMYYDt4Fd9eurKCXzUkzQ1zesq+ub6+0uHn
         yYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmlSvJKyl+ShGfrEo4rz6aaOFtOZ1XmGzmlSUtpQjJicIAGYa66f7ruCuqlvjYuQIE260hv0USX/+GwXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRCMTX/yV9Jx9peSfW2hsdKiEbPQZx87PscjnzJLm57HpMmfz
	DIDJLjOi3RUy/0u0yuaJuH9OkTlrDg0Xh6iZ5mcoYSwuo7GRW1+VeKeKpzCntr3SQDRZo32by5J
	oXYCfZ7Om4SQI8VFSNxDc9368rUNVILZQ7Gn2JO4LnxOZ8QZsXirgj0I=
X-Google-Smtp-Source: AGHT+IG4QAU2EqJ9IMvDB5KzRm+HHz1djsWGOEFznYlWvlJs2DPIEiNmQgC9qG0l++bJY/K9/YYnJjZ17Eq5LEa1dIJtZp/g+zQ/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f0e:b0:3d0:4e57:bbda with SMTP id
 e9e14a558f8ab-3d7ec1dc6d5mr85971475ab.1.1744525479665; Sat, 12 Apr 2025
 23:24:39 -0700 (PDT)
Date: Sat, 12 Apr 2025 23:24:39 -0700
In-Reply-To: <67faff52.050a0220.379d84.001b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fb58a7.050a0220.379d84.001d.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
From: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    01c6df60d5d4 Add linux-next specific files for 20250411
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=111db870580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10afca3f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116f5c04580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/928246b3f3d5/disk-01c6df60.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/79a68c4e1134/vmlinux-01c6df60.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9caf8c293819/bzImage-01c6df60.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/9e5bb76a4272/mount_3.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=14ebd398580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com

------------[ cut here ]------------
jfs_metapage_aops does not implement migrate_folio
WARNING: CPU: 1 PID: 5861 at mm/migrate.c:955 fallback_migrate_folio mm/migrate.c:953 [inline]
WARNING: CPU: 1 PID: 5861 at mm/migrate.c:955 move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
Modules linked in:
CPU: 1 UID: 0 PID: 5861 Comm: syz-executor280 Not tainted 6.15.0-rc1-next-20250411-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:fallback_migrate_folio mm/migrate.c:953 [inline]
RIP: 0010:move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
Code: b8 00 00 00 00 00 fc ff df 41 80 7c 05 00 00 74 08 4c 89 e7 e8 73 2d fe ff 49 8b 34 24 48 c7 c7 00 8b 57 8c e8 d3 0b 53 ff 90 <0f> 0b 90 90 e9 0a fd ff ff e8 74 f6 93 ff 90 0f 0b 90 eb a7 e8 69
RSP: 0018:ffffc90003f16b30 EFLAGS: 00010246
RAX: b07441ff5c2b4f00 RBX: 0000000000000000 RCX: ffff88803508bc00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffea00008cc8c0 R08: ffffffff81829232 R09: fffffbfff1d7ab08
R10: dffffc0000000000 R11: fffffbfff1d7ab08 R12: ffff888075b9d130
R13: 1ffff1100eb73a26 R14: ffffffff8c839248 R15: ffff888075b9d010
FS:  0000555581ea4380(0000) GS:ffff888125080000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb8bd341e36 CR3: 000000003002a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 migrate_folio_move mm/migrate.c:1312 [inline]
 migrate_folios_move mm/migrate.c:1664 [inline]
 migrate_pages_batch+0x1e86/0x30b0 mm/migrate.c:1911
 migrate_pages_sync mm/migrate.c:1941 [inline]
 migrate_pages+0x1e13/0x3470 mm/migrate.c:2050
 compact_zone+0x365d/0x4dd0 mm/compaction.c:2689
 compact_node mm/compaction.c:2958 [inline]
 compact_nodes mm/compaction.c:2980 [inline]
 sysctl_compaction_handler+0x498/0x9a0 mm/compaction.c:3031
 proc_sys_call_handler+0x54b/0x820 fs/proc/proc_sysctl.c:601
 iter_file_splice_write+0xbdf/0x1530 fs/splice.c:738
 do_splice_from fs/splice.c:935 [inline]
 direct_splice_actor+0x11b/0x220 fs/splice.c:1158
 splice_direct_to_actor+0x595/0xc90 fs/splice.c:1102
 do_splice_direct_actor fs/splice.c:1201 [inline]
 do_splice_direct+0x281/0x3d0 fs/splice.c:1227
 do_sendfile+0x582/0x8d0 fs/read_write.c:1368
 __do_sys_sendfile64 fs/read_write.c:1423 [inline]
 __se_sys_sendfile64+0x102/0x1e0 fs/read_write.c:1415
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0011f6cc49
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffeb8797248 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0011f6cc49
RDX: 0000200000000180 RSI: 0000000000000003 RDI: 0000000000000004
RBP: 00000000000f4240 R08: 0000555581ea5378 R09: 0000555581ea5378
R10: 000000000000000a R11: 0000000000000246 R12: 00000000000161d0
R13: 00007ffeb8797280 R14: 00007ffeb879726c R15: 00007f0011fb503b
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
