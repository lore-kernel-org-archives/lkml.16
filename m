Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D85226548
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835962; cv=none; b=KdB1AjJm2qKtcLcgzJSS9YGMcaApdfWMM4+v1Z6QFKw4bNqtPppntPdofircyRmnbnPw9V0G7MGBMpcGeNzTbXa74LIwyv/EuLdclW6/J1PeJiZJlDUP7WiATKz9LHo+0cxL4s75rhRGyDxnxXD5UsQkdh2mRQ5pslNtff+WEKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835962; c=relaxed/simple;
	bh=lLPON5uvuuRb4IDbkhfUo70o24dzWrCXkEanux6lwEk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Kdk+rlMgWGk+Ffrcu4ssg4t0uPaV6mTz9sErsQ7gyLx+ohjghtQiilnj5o4RzoG8You9uRUsBWbVjq0yBVXjMbe2G8tR8c/VQnLczXmeU4AUQut6KEmCqgwyXIBvMRnlAYGhUY5mn54bzrS/HsNrS3tLarvlpLBWytjZcqi+Tsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ce3bbb2b9dso4441995ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835959; x=1739440759;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85xtEr8Ohbu3YWz5FuQdgJLwhhuGhih3nI4GUnlJgpI=;
        b=WuIyzydThaD9e/GWxKu00WfTfCQ5c1xOO9MNCInsxS5PI175yOlexRY0hH9Au3PxVh
         Ev9hY2lKnjGFqiNIt2UIhg5e8RPsinjQkW37Jgflw+kL8/AJ/qi98a6j7nvlw0gYhQyC
         8VHIFOQ0gn4eU5HiF/TCag8VoGaVAW3gBJTOuBJUGssiyyAcLaLNau/uLQ0erlC4OadH
         CvfDVbTlOh8vixx56ib1DbIG1NUXcd/217jgpPMtWiLgIM8c11sQ+GLRWpQmbXYsESu5
         DnfRViGZNfFiM0bc1ZkH8ByphC1q9j4SlFFDfo729YvXZaO9KZsXH1K8Rfkki17rmEXi
         GTeA==
X-Forwarded-Encrypted: i=1; AJvYcCXS7omnvuyXnl8nZTEq/ZTnX7ZlpU6MU4VOMA+tFQIpWTuGmRoXbRmNO0TeXwPMYobHAvX7D5rjw8Q+Zkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQgzkqEhDC3jcWTwZSp/FTzAHhslcu65OKZgT4Llj/mGLGp+j
	RxjcyfpnlO/n0/3/F5xagEksmJN0X/iuyyyWULAa45ss6tpVvbazBqhJkchWCnZnODaWV2j+Bx7
	KYUYv3/SmeIHo8KG4LubyOchMHrM8nRw1GjqhJvpRAF24Qf1ixAsx+U0=
X-Google-Smtp-Source: AGHT+IF4CqNbDiPP4hRqzo95a2ie/Iu1KMZsxCaI/Mpxk77ACsSOAW9LIa4/U4j9IVoaGdpOxD+Yvh/FTYtgX2n3uHosn3JuMfmo
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2198:b0:3cf:c9b9:3eb with SMTP id
 e9e14a558f8ab-3d04f2c1fc5mr51420535ab.0.1738835959165; Thu, 06 Feb 2025
 01:59:19 -0800 (PST)
Date: Thu, 06 Feb 2025 01:59:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a487f7.050a0220.19061f.05fc.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in fsnotify_file_area_perm
From: syzbot <syzbot+7229071b47908b19d5b7@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=135c1724580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=7229071b47908b19d5b7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-69e858e0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a53b888c1f3f/vmlinux-69e858e0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6b5e17edafc0/bzImage-69e858e0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7229071b47908b19d5b7@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
XFS: ikeep mount option is deprecated.
XFS (loop0): Mounting V5 Filesystem a2f82aab-77f8-4286-afd4-a8f747a74bab
XFS (loop0): Ending clean mount
XFS (loop0): Quotacheck needed: Please wait.
XFS (loop0): Quotacheck: Done.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5321 at ./include/linux/fsnotify.h:145 fsnotify_file_area_perm+0x1e5/0x250 include/linux/fsnotify.h:145
Modules linked in:
CPU: 0 UID: 0 PID: 5321 Comm: syz.0.0 Not tainted 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:fsnotify_file_area_perm+0x1e5/0x250 include/linux/fsnotify.h:145
Code: c3 cc cc cc cc e8 fb 8f c6 ff 49 83 ec 80 4c 89 e7 48 83 c4 08 5b 41 5c 41 5d 41 5e 41 5f 5d e9 01 9f 00 00 e8 dc 8f c6 ff 90 <0f> 0b 90 e9 0a ff ff ff 48 c7 c1 10 73 1b 90 80 e1 07 80 c1 03 38
RSP: 0018:ffffc9000d416320 EFLAGS: 00010283
RAX: ffffffff81f8dce4 RBX: 0000000000000001 RCX: 0000000000100000
RDX: ffffc9000e5c2000 RSI: 00000000000008fa RDI: 00000000000008fb
RBP: 0000000000008000 R08: ffffffff81f8dbdc R09: 1ffff110087dca2e
R10: dffffc0000000000 R11: ffffed10087dca2f R12: ffff888033d4b1c0
R13: 0000000000000010 R14: dffffc0000000000 R15: ffffc9000d416460
FS:  00007f5bca7346c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000100 CR3: 0000000033fd2000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 filemap_fault+0x14a9/0x16c0 mm/filemap.c:3509
 __do_fault+0x135/0x390 mm/memory.c:4977
 do_read_fault mm/memory.c:5392 [inline]
 do_fault mm/memory.c:5526 [inline]
 do_pte_missing mm/memory.c:4047 [inline]
 handle_pte_fault mm/memory.c:5889 [inline]
 __handle_mm_fault+0x4c44/0x70f0 mm/memory.c:6032
 handle_mm_fault+0x3e5/0x8d0 mm/memory.c:6201
 faultin_page mm/gup.c:1196 [inline]
 __get_user_pages+0x1a92/0x4140 mm/gup.c:1491
 __get_user_pages_locked mm/gup.c:1757 [inline]
 __gup_longterm_locked+0xe64/0x17f0 mm/gup.c:2529
 gup_fast_fallback+0x2266/0x29c0 mm/gup.c:3430
 pin_user_pages_fast+0xcc/0x160 mm/gup.c:3536
 iov_iter_extract_user_pages lib/iov_iter.c:1844 [inline]
 iov_iter_extract_pages+0x3bb/0x5c0 lib/iov_iter.c:1907
 __bio_iov_iter_get_pages block/bio.c:1181 [inline]
 bio_iov_iter_get_pages+0x4f1/0x1460 block/bio.c:1263
 iomap_dio_bio_iter+0xc9c/0x1740 fs/iomap/direct-io.c:406
 __iomap_dio_rw+0x13b7/0x25b0 fs/iomap/direct-io.c:703
 iomap_dio_rw+0x46/0xa0 fs/iomap/direct-io.c:792
 xfs_file_dio_write_unaligned+0x2ef/0x6f0 fs/xfs/xfs_file.c:692
 xfs_file_dio_write fs/xfs/xfs_file.c:725 [inline]
 xfs_file_write_iter+0x5c6/0x720 fs/xfs/xfs_file.c:876
 do_iter_readv_writev+0x71a/0x9d0
 vfs_writev+0x38b/0xbc0 fs/read_write.c:1050
 do_pwritev fs/read_write.c:1146 [inline]
 __do_sys_pwritev2 fs/read_write.c:1204 [inline]
 __se_sys_pwritev2+0x196/0x2b0 fs/read_write.c:1195
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5bc998cda9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5bca734038 EFLAGS: 00000246 ORIG_RAX: 0000000000000148
RAX: ffffffffffffffda RBX: 00007f5bc9ba5fa0 RCX: 00007f5bc998cda9
RDX: 0000000000000001 RSI: 0000000020000240 RDI: 0000000000000007
RBP: 00007f5bc9a0e2a0 R08: 0000000000000000 R09: 0000000000000003
R10: 0000000000007c00 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f5bc9ba5fa0 R15: 00007fff90caf808
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
