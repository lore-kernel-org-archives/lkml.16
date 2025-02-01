Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4303D66
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 20:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738443089; cv=none; b=dEkbM4qle/6EkkzAvzXg5mz3asHbI30rP0Ih0Vkao5HQbgD2RUW0WVudvDib3sR47AO8cRTY6agmxbtw087/Ty3BKE+deQYToLgK7BZsLR/6FKMvFCdMYyA1h6ZyfHDB/zpDyxO89fIilWI3irjTE5eitfFSGVXoZVQEBp/i4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738443089; c=relaxed/simple;
	bh=is2wiLf8nkaYsLA6LsoHb8Ol+2Y1GB2txhBlSZVWiMk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XzcrqNlkFAtGsRSpd0nDeJq4SXf+W9O09UDfDvLvU5LtNOPeMRFwW4Q5Mc4rln+/MIsGkf69harBbIVfLbzo4/+/zeVWcBcu9Dhrdz5DtWJIk8T5nnxB7CrJBWOhzNS/SgSbj6Kgb/XkrZL8jkNHLTeV+7tWedigFLW70LVxM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a9c9b37244so57480145ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 12:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738443087; x=1739047887;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GSWWCozoFb1QOqbQgyy8ub72qnv1yGm9/mfPo45tNE=;
        b=WNBDph8rFQTdbKWnXzh3G10e4LTlZVX4kgoB8Maa4O6cGBV8YhMXhgcUc12Wgjs0VQ
         UU+PRFZKHm0UZz8YjwNQHzgv3A8pbboe87xTq9Rbe4EieV/WkUCMdQ2FXRt6kGZJEk3x
         bC335b2YZX0dPbU2TOTkoo+WfxMYVL1pL/VW6iqVwgqq2eXMuDrIlj/FTX/QSiAfj5ks
         ivwzzPgFzfd3X1oOX0VlGiUyEjO8TGa8s8VQyHV0dpCX0H55+bpAI5yZylwwwhiEcqVB
         DQt5EgKlO/0ZoTVeOeougW5goY8EyE7zfeA897QzIUIkmc5xROkVRk6XwyHwFn4AaWFv
         5DGw==
X-Forwarded-Encrypted: i=1; AJvYcCWDseQzCk8USVmI6o25mvCY3moy9r9xoBgXU3wW3SOn1nyQ+7aXA8W9dkXUojPcivYcQc0WEpRcJ7PmVrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YymWm44SF8iqDmozA/aTTB+mR4LdFMw7CQXfy792eVYQBc305ao
	TCHB4f4ElVWxPRn/OfnpKLNfHLdzccSM91WbSW5UX5GoYbGEnocpDQxMZWPWFqypnbIrEKSCYta
	RuWRowqxGS2ZLuf7+VJwa9FijiGm53gMcfe+tA/uV0GmQL/ip3T0BVDs=
X-Google-Smtp-Source: AGHT+IFU/CfR7irtqtvwg6ik1XKwgYgwT2C6RI4lAyPaJhVWygBKDk/nkFeJM3NUb9yBaAMSXSYwLaRaL6l6CmSUvq+dHs7LcOR3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1707:b0:3cf:c5b0:6a0c with SMTP id
 e9e14a558f8ab-3cffe3d1744mr152049775ab.4.1738443087155; Sat, 01 Feb 2025
 12:51:27 -0800 (PST)
Date: Sat, 01 Feb 2025 12:51:27 -0800
In-Reply-To: <677928b5.050a0220.3b53b0.004d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679e894f.050a0220.163cdc.0027.GAE@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in alloc_hugetlb_folio_reserve
From: syzbot <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, david@redhat.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, muchun.song@linux.dev, steven.sistare@oracle.com, 
	syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1431cb24580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1324fddf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128b55f8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/144a7468bf1b/disk-69e858e0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/86d7d452eecc/vmlinux-69e858e0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f56e292b01f5/bzImage-69e858e0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at mm/hugetlb.c:2333!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 UID: 0 PID: 5832 Comm: syz-executor274 Not tainted 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:alloc_hugetlb_folio_reserve+0xbc/0xc0 mm/hugetlb.c:2333
Code: 1f eb 05 e8 c6 e9 9f ff 48 c7 c7 40 56 61 8e e8 1a 9b d8 09 4c 89 f0 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 a5 e9 9f ff 90 <0f> 0b 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
RSP: 0018:ffffc90003e3f7f8 EFLAGS: 00010093
RAX: ffffffff821f831b RBX: 0000000000000000 RCX: ffff888034813c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 1ffffffff348b4d1 R08: ffffffff821f82d3 R09: 1ffffd40005a2005
R10: dffffc0000000000 R11: fffff940005a2006 R12: dffffc0000000000
R13: dffffc0000000000 R14: ffffea0002d10000 R15: ffffffff9a45a688
FS:  000055557d1c0380(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563d6d164000 CR3: 000000007abaa000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 memfd_alloc_folio+0x1bd/0x370 mm/memfd.c:88
 memfd_pin_folios+0xf10/0x1570 mm/gup.c:3746
 udmabuf_pin_folios drivers/dma-buf/udmabuf.c:346 [inline]
 udmabuf_create+0x70e/0x10c0 drivers/dma-buf/udmabuf.c:443
 udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:495 [inline]
 udmabuf_ioctl+0x301/0x4e0 drivers/dma-buf/udmabuf.c:526
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd524733a9
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffddb5cce58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffddb5cd028 RCX: 00007fcd524733a9
RDX: 0000000020000040 RSI: 0000000040187542 RDI: 0000000000000004
RBP: 00007fcd524e6610 R08: 0000000020000000 R09: 00007ffddb5cd028
R10: 0000000020000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffddb5cd018 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:alloc_hugetlb_folio_reserve+0xbc/0xc0 mm/hugetlb.c:2333
Code: 1f eb 05 e8 c6 e9 9f ff 48 c7 c7 40 56 61 8e e8 1a 9b d8 09 4c 89 f0 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 a5 e9 9f ff 90 <0f> 0b 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
RSP: 0018:ffffc90003e3f7f8 EFLAGS: 00010093
RAX: ffffffff821f831b RBX: 0000000000000000 RCX: ffff888034813c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 1ffffffff348b4d1 R08: ffffffff821f82d3 R09: 1ffffd40005a2005
R10: dffffc0000000000 R11: fffff940005a2006 R12: dffffc0000000000
R13: dffffc0000000000 R14: ffffea0002d10000 R15: ffffffff9a45a688
FS:  000055557d1c0380(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563d6d164000 CR3: 000000007abaa000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
