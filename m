Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294EB229B02
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320755; cv=none; b=FqgUzkTo1hdTQdY5VmWUFO6hx/9RprMAg9/qqAMskPXGf5dEUHULZWhbGoG7KBxhcBwtRnEUSWKa4e3Ovicqtljo+GD26XTwtaMXwq/qTxaae8XxxOpzVXkPan6lqn7b6Md1eUCbw3ASpQjwo2x6g7UaAVAM1PZs+fB2v1wlPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320755; c=relaxed/simple;
	bh=fZDd2QEBhBxFp765iDz4UkzBpf2+EIFoG0m7o2T2XHY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JXRQ++PgTY9Jdb1CFQqT1K+ujcmA80usv2tN4oYfOMSrq1s1M49LlR2vhXHQargWQdjo1wvUrNKid/x0m3gbUP7JxYtK982SjAnieuX0sAXH+qtsv4kK5UnTxj9kBr4rd1aRlqAWV4epZicSsFyLxkPYHwFg52rfKWH5CO8UgQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddc9e145daso9789025ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320753; x=1750925553;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QwoRwYwJcF9xzb+aF468RPfwVm0aF6GUPn9yJF7qKE=;
        b=OWSvbHh3HHcdnpIUMDRAo5Nkz95R3iyroah1FDE9iRn5kp9uO9gEfIU9GZ24JXTgve
         rfgQ3ZD3+BfilXSJOXkOHaML4Q8VSnVRkAdntkkYyfLj2ibbF3aXfM5vN6DckbxumnJj
         DdQNRMThDmxGWAkyTlU+sTvCiqI8NoaAP1I7SVNK3sGTuSmwzzif20ffBYfG4Q663uKd
         BvPCOtryUH3MQYyalOBrc6xjaA15DXrbRu13m065/zZEmL8i+WekT4JLgSMhZq1FlACU
         wEHLRBFOtNzQpjyn2IL7uR9mgVw/HbE8jfZGo9gE9KsbYPs5k89qoxFIs5d5rG+ndYFz
         JIDg==
X-Forwarded-Encrypted: i=1; AJvYcCWeJ4QVJxosEgM6fAgwQW9REjKhlQnkK/5p/eVsLTgQwtooX1KcqjAEp3ccEGGqIQAYG4QWnzIQ028eMyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzzKkS83OSqJY/7IV+o8vHGURQmA0pKFZ9nP3B7NNhecaxINVD
	BRo8TfBzvjJOT5nA1h7m7YPOkkmlaV6/1CU8C7iFERoaO4WNvqbj6R67VoXVdJcYcdSNfgPeebX
	ZLNCnUzlu4DigdcHrJ29f1zA3qSj6JUAKF9+/QKbmaZO8ZWhE3m4ZWiCmAr8=
X-Google-Smtp-Source: AGHT+IFOLMlXAuzzUyOTLwQFPM2bBi8X1YF58EQni0Knyk0o4mU2qnbHTS7GOvRmqbiGqTDOKOQoMpOOwHaAOiLliGSvdMG9baaQ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca4e:0:b0:3dd:fad4:7c61 with SMTP id
 e9e14a558f8ab-3de07c5588dmr240916945ab.8.1750320753399; Thu, 19 Jun 2025
 01:12:33 -0700 (PDT)
Date: Thu, 19 Jun 2025 01:12:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853c671.050a0220.216029.01c8.GAE@google.com>
Subject: [syzbot] [ntfs3?] WARNING in wnd_add_free_ext (4)
From: syzbot <syzbot+323f07d372f692a127b3@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4663747812d1 Merge tag 'platform-drivers-x86-v6.16-2' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13f2750c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=323f07d372f692a127b3
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-46637478.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bde908b9f3d9/vmlinux-46637478.xz
kernel image: https://storage.googleapis.com/syzbot-assets/87a1193c8552/bzImage-46637478.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+323f07d372f692a127b3@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 1
CPU: 0 UID: 0 PID: 5334 Comm: syz.0.0 Not tainted 6.16.0-rc2-syzkaller-00045-g4663747812d1 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 fail_dump lib/fault-inject.c:73 [inline]
 should_fail_ex+0x414/0x560 lib/fault-inject.c:174
 should_failslab+0xa8/0x100 mm/failslab.c:46
 slab_pre_alloc_hook mm/slub.c:4101 [inline]
 slab_alloc_node mm/slub.c:4177 [inline]
 kmem_cache_alloc_noprof+0x73/0x3c0 mm/slub.c:4204
 wnd_remove_free_ext+0x902/0x11b0 fs/ntfs3/bitmap.c:476
 wnd_zone_set+0x106/0x160 fs/ntfs3/bitmap.c:1396
 ntfs_look_for_free_space+0x1cd/0x600 fs/ntfs3/fsntfs.c:383
 attr_allocate_clusters+0x1c1/0x6d0 fs/ntfs3/attrib.c:159
 attr_set_size+0x14a4/0x2c70 fs/ntfs3/attrib.c:574
 ntfs_set_size+0x164/0x200 fs/ntfs3/inode.c:861
 ntfs_extend+0x1d9/0x970 fs/ntfs3/file.c:343
 ntfs_file_write_iter+0x3f4/0x820 fs/ntfs3/file.c:1192
 iter_file_splice_write+0x937/0x1000 fs/splice.c:738
 do_splice_from fs/splice.c:935 [inline]
 direct_splice_actor+0x101/0x160 fs/splice.c:1158
 splice_direct_to_actor+0x5a5/0xcc0 fs/splice.c:1102
 do_splice_direct_actor fs/splice.c:1201 [inline]
 do_splice_direct+0x181/0x270 fs/splice.c:1227
 do_sendfile+0x4da/0x7e0 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1425 [inline]
 __se_sys_sendfile64+0xd9/0x190 fs/read_write.c:1417
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9976d8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9977c79038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f9976fb5fa0 RCX: 00007f9976d8e929
RDX: 0000200000000080 RSI: 0000000000000005 RDI: 0000000000000005
RBP: 00007f9977c79090 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000e0000000 R11: 0000000000000246 R12: 0000000000000002
R13: 0000000000000000 R14: 00007f9976fb5fa0 R15: 00007ffc92c50238
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5334 at fs/ntfs3/bitmap.c:217 rb_insert_start fs/ntfs3/bitmap.c:217 [inline]
WARNING: CPU: 0 PID: 5334 at fs/ntfs3/bitmap.c:217 wnd_add_free_ext+0xafd/0xdb0 fs/ntfs3/bitmap.c:352
Modules linked in:
CPU: 0 UID: 0 PID: 5334 Comm: syz.0.0 Not tainted 6.16.0-rc2-syzkaller-00045-g4663747812d1 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:rb_insert_start fs/ntfs3/bitmap.c:217 [inline]
RIP: 0010:wnd_add_free_ext+0xafd/0xdb0 fs/ntfs3/bitmap.c:352
Code: 00 00 fc ff df 42 80 3c 28 00 74 08 4c 89 f7 e8 99 a5 20 ff 49 89 1e 48 89 df 4c 89 e6 e8 bb 8f 5e 08 eb 18 e8 74 26 bd fe 90 <0f> 0b 90 49 bd 00 00 00 00 00 fc ff df 4c 8b 7c 24 10 48 8b 44 24
RSP: 0018:ffffc9000d247058 EFLAGS: 00010293
RAX: ffffffff830335cc RBX: ffff888052c3a600 RCX: ffff88801f7ea440
RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000003
RBP: 0000000000000001 R08: 00000000ffffffff R09: 0000000000000000
R10: ffff888052c3a600 R11: ffffffff81acf690 R12: ffff88801e8be2d8
R13: ffff888052c3a5a0 R14: 0000000000000003 R15: 0000000000000003
FS:  00007f9977c796c0(0000) GS:ffff88808d251000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f56af384000 CR3: 000000003f180000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 wnd_zone_set+0xb2/0x160 fs/ntfs3/bitmap.c:1393
 ntfs_look_for_free_space+0x1cd/0x600 fs/ntfs3/fsntfs.c:383
 attr_allocate_clusters+0x1c1/0x6d0 fs/ntfs3/attrib.c:159
 attr_set_size+0x14a4/0x2c70 fs/ntfs3/attrib.c:574
 ntfs_set_size+0x164/0x200 fs/ntfs3/inode.c:861
 ntfs_extend+0x1d9/0x970 fs/ntfs3/file.c:343
 ntfs_file_write_iter+0x3f4/0x820 fs/ntfs3/file.c:1192
 iter_file_splice_write+0x937/0x1000 fs/splice.c:738
 do_splice_from fs/splice.c:935 [inline]
 direct_splice_actor+0x101/0x160 fs/splice.c:1158
 splice_direct_to_actor+0x5a5/0xcc0 fs/splice.c:1102
 do_splice_direct_actor fs/splice.c:1201 [inline]
 do_splice_direct+0x181/0x270 fs/splice.c:1227
 do_sendfile+0x4da/0x7e0 fs/read_write.c:1370
 __do_sys_sendfile64 fs/read_write.c:1425 [inline]
 __se_sys_sendfile64+0xd9/0x190 fs/read_write.c:1417
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9976d8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9977c79038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007f9976fb5fa0 RCX: 00007f9976d8e929
RDX: 0000200000000080 RSI: 0000000000000005 RDI: 0000000000000005
RBP: 00007f9977c79090 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000e0000000 R11: 0000000000000246 R12: 0000000000000002
R13: 0000000000000000 R14: 00007f9976fb5fa0 R15: 00007ffc92c50238
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
