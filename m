Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E8522A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751237251; cv=none; b=OJSVtwXbz9rspyAMdPiobk9i5NocNqrG3fssy0kUCyJNGcEuQ1VCA1Y2bZLSSbGD1EDbxwb7ostvhKX9e+YumefOJ/+udZTjDLZodmi2Yz2ePzc/QTVPCb9lyIcGWHAl2Frb/d5Nxk8g5cex+jQTXKU0qAqyfX0xuc8Az6ixAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751237251; c=relaxed/simple;
	bh=FoZuMJujFDI5bYL8jF5JCAy+0py1jSIHGd55MZ0JifM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=R3llvdPuI/vSoU9X7RN3IYnhxaXqRP0VgGHryx8FgH+UHdEYG8BBrcZTS0c5wlw+eBLmfdKnCuriEOPxsahy233oq+RwGP4JQsrzzjyJciS1tznHMhddny+ZY3QrOWuA5vlefApsDpKA9VF67sZqIe1mSXC1k18GYNDNiBaOEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86cff1087deso292945739f.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751237249; x=1751842049;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAWxAutbzVBX5M9sP5xu9qbqXWmOV8FGtcIllKiYO5A=;
        b=vqULbxl0CSRGO6T2UgRv24EB0emcOOsnoThLpBB+THbWvny7mF/1b5ntg3lc/RpKDU
         D9x6kgJ3nQtbFpS+l1JvszT/z8gabp0cj0DF/rXeXZDy8f0tm+kcThTAb3dbyJfx0C9i
         Kk93F6L9dJ9ogXkcifStfPdV9lzmmOMygZfurWB1MprCSPMDE9WzY0LpdHVzjQnROeKe
         7Ge5MB/Q//hbTE3SWEyQTZOLYgNZnzx829ugTlv1gYzqaa+bPMcGCkdGiIUT07CRTkME
         TizjqaQBAi4/k3bLyhRc+CE7krlstwQVZnkbEgOM1BsX7EQvCwVFakCG8QIM4B26IOpF
         ECHg==
X-Forwarded-Encrypted: i=1; AJvYcCV14lo+D7kLs+ZNnPcDmZDus+Nd3Qan0JF6UBG6qL+GuRqA5HcUi15dZom6UvXGrqFmtpkGKhPzIE+GzJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6cjYkgVnpJL+a5Uu4Tf2tMrRoOKdcbPt2p8MawPshiyKEitXy
	jbpHwPcKZ54CwZ1iGJ7xLPwCRsDdk0YtiSpbBNJp7eoOVZwX2BCGLxyxLRWEbohJ/enPhdi1I0/
	gPXb4AGYWdS3w3F7tHMUXr1ZsjhumdLaCs4DJR2gR/tm7yS5i3QwHVVLcWfE=
X-Google-Smtp-Source: AGHT+IE/1C2vOS+OAXfjSHFx58ah4bUloUomtTlhIlHHmxwlST+ZJIM4QXGLVH+He0PIo6tSs4zc+3z/oMXlztkteo25TjmcVM6z
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2d:b0:3df:5206:1e1 with SMTP id
 e9e14a558f8ab-3df52061f4amr97174095ab.16.1751237249044; Sun, 29 Jun 2025
 15:47:29 -0700 (PDT)
Date: Sun, 29 Jun 2025 15:47:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6861c281.a70a0220.3b7e22.0ab8.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in xfs_init_fs_context
From: syzbot <syzbot+359a67b608de1ef72f65@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com, 
	david@redhat.com, gourry@gourry.net, joshua.hahnjy@gmail.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, matthew.brost@intel.com, 
	rakie.kim@sk.com, syzkaller-bugs@googlegroups.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    dfba48a70cb6 Merge tag 'i2c-for-6.16-rc4' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a62982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=359a67b608de1ef72f65
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-dfba48a7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/783560258712/vmlinux-dfba48a7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/685ad235ac7b/bzImage-dfba48a7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+359a67b608de1ef72f65@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5325 at mm/page_alloc.c:4430 __alloc_pages_slowpath+0xcb3/0xce0 mm/page_alloc.c:4430
Modules linked in:
CPU: 0 UID: 0 PID: 5325 Comm: syz.0.0 Not tainted 6.16.0-rc3-syzkaller-00329-gdfba48a70cb6 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__alloc_pages_slowpath+0xcb3/0xce0 mm/page_alloc.c:4430
Code: d8 48 c1 e8 03 0f b6 04 08 84 c0 75 2e f6 43 01 08 48 8b 14 24 0f 84 a2 f3 ff ff 90 0f 0b 90 e9 99 f3 ff ff e8 ae 09 50 09 90 <0f> 0b 90 f7 c5 00 04 00 00 75 bc 90 0f 0b 90 eb b6 89 d9 80 e1 07
RSP: 0018:ffffc9000d62f970 EFLAGS: 00010246
RAX: 1378840d66abe400 RBX: 0000000000000002 RCX: dffffc0000000000
RDX: ffffc9000d62fa80 RSI: 0000000000000002 RDI: 0000000000048cc0
RBP: 0000000000048cc0 R08: ffff88801b68003f R09: 1ffff110036d0007
R10: dffffc0000000000 R11: ffffed10036d0008 R12: ffffc9000d62fa80
R13: 1ffff92001ac5f4c R14: 0000000000048cc0 R15: dffffc0000000000
FS:  00007fcd1cbf46c0(0000) GS:ffff88808d250000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcd1bd726e0 CR3: 0000000043166000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __alloc_frozen_pages_noprof+0x319/0x370 mm/page_alloc.c:4972
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab+0xe2/0x3b0 mm/slub.c:2627
 new_slab mm/slub.c:2673 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3859
 __slab_alloc mm/slub.c:3949 [inline]
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4354
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 xfs_init_fs_context+0x54/0x500 fs/xfs/xfs_super.c:2279
 alloc_fs_context+0x651/0x7d0 fs/fs_context.c:318
 do_new_mount+0x10e/0xa40 fs/namespace.c:3881
 do_mount fs/namespace.c:4239 [inline]
 __do_sys_mount fs/namespace.c:4450 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4427
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd1bd900ca
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcd1cbf3e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fcd1cbf3ef0 RCX: 00007fcd1bd900ca
RDX: 0000200000000040 RSI: 0000200000009640 RDI: 00007fcd1cbf3eb0
RBP: 0000200000000040 R08: 00007fcd1cbf3ef0 R09: 0000000000208800
R10: 0000000000208800 R11: 0000000000000246 R12: 0000200000009640
R13: 00007fcd1cbf3eb0 R14: 000000000000964b R15: 0000200000001340
 </TASK>


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
