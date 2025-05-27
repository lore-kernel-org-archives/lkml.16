Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE39323D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748318135; cv=none; b=SibfLBDuZxjgFrmRWoO2IvOa7Y5hLC+WBIcY0dNl8sY72BvBKh0eqkuqFItSvLsZ4ikz2sy2u5YikrMTwM3XO9ow+4acELFN3clH3muBiupCqhlYXhqV94BKLYcycqZW8cbSYmu4u+kWAAQdADx0voE6BGiYTkjUDA3HNL2TBwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748318135; c=relaxed/simple;
	bh=pBZf/EfZt381TDNXfNPJ92AxhqJvAbGV3MLOKOIZljw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IktGndH9Pzgbv2iNqNpjYBHO+ON+4FNjT15vBhXX2FhJ2tcBnykjbrrcBbfcqRoqRUw5U0lEymREPM5Xvaw5p3654FYC3WDmsaO2EtNJ8fqi4uT4i9oGPq2AV8ntdrwx1GB5wOBvS9x0RhibOatcAboXTtLUmWcuW7m5fC3ouDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3dc64e4abbfso29728565ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748318133; x=1748922933;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZcGdG0/KS5GIAQfo/8JuhndB3aLpUpHij+KhUjGwTs=;
        b=gJEYL48b9MJ5KoydO0VKsiCK1QUIxoMRuErH1AeYCYkCqvZthqQNlchqcI2xvHrVe7
         Bv5VwOcShVrD6azFLN/2P8d+6uV0AJHJqQ9LN1tEmwuN+KvXBEdaVYm92E4dZpKBT1Mj
         pPqz5FoE5pZvaWy0yMX1PeISZ83YaroUNfWm9aXkm6foHIPORD+QtlGzkhVmd/9ivufj
         t5TQgEUcD84id6VJDjddSAsM4+335yrs863PephibdfaC6mLdEFz6RZiLmjMIvpBryFR
         gD+ml4N8ZHjpJr3OcQ/nFAfXTLRpHA/2alaHvnqjaXY04teYX8rs9d19r/cWNUUo9Vki
         3iqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqbh04Q29zoCMP3XfEBM5Hgp0JHyh5bp5eflLqfdgZbUYKXA4XVOKIsrDmdwurpE8J46jD3JqLEgi+56E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hPNJF4pjNlfFb5R77+wPRm/hm6UbUXFTpr2LydwiJ4GsQvpk
	nxTsB0sDWBsAD368kphFQNSEF/EQcFAur440tP0Py1MYcmfG5Gudd/52dBpieT9f00/bsSjSu2s
	Mo8JWg4bwa4FdAafBItyomXZxk6arMAkiSWOpzTSy4PAwcX2QdWriUO/cgZk=
X-Google-Smtp-Source: AGHT+IEb9UuwSY+/5g2EwnOTd0p21WZFTGdFPpEgJBsYcSYin5ukO9sFbBTj2pCOwC6Uc2dN772s/PRvieQt3wlEvzVNKFCiCpFn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c6:b0:3dc:5be8:9695 with SMTP id
 e9e14a558f8ab-3dc9b663fccmr97955485ab.3.1748318133107; Mon, 26 May 2025
 20:55:33 -0700 (PDT)
Date: Mon, 26 May 2025 20:55:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683537b5.a70a0220.253bc2.00a1.GAE@google.com>
Subject: [syzbot] [udf?] WARNING in udf_expand_dir_adinicb (2)
From: syzbot <syzbot+545e45805722d117958f@syzkaller.appspotmail.com>
To: jack@suse.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    94305e83eccb Merge tag 'pmdomain-v6.15-rc3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17f16ad4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2081c3a965c46af8
dashboard link: https://syzkaller.appspot.com/bug?extid=545e45805722d117958f
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1a34b8dc8a46/disk-94305e83.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c681a228903b/vmlinux-94305e83.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0e9a269fffc8/bzImage-94305e83.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+545e45805722d117958f@syzkaller.appspotmail.com

UDF-fs: error (device loop1): udf_fiiter_advance_blk: extent after position 0 not allocated in directory (ino 1408)
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6313 at fs/udf/namei.c:214 udf_expand_dir_adinicb+0xbf6/0xf00 fs/udf/namei.c:214
Modules linked in:
CPU: 0 UID: 0 PID: 6313 Comm: syz.1.99 Not tainted 6.15.0-rc7-syzkaller-00099-g94305e83eccb #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:udf_expand_dir_adinicb+0xbf6/0xf00 fs/udf/namei.c:214
Code: 01 00 00 00 e8 8b 1f fe ff 8b 5c 24 60 e9 aa f6 ff ff e8 3d 15 80 fe 4c 89 ef e8 f5 cb 09 ff e9 ac f8 ff ff e8 2b 15 80 fe 90 <0f> 0b 90 e9 88 fe ff ff bb 8b ff ff ff e9 80 f6 ff ff bb f4 ff ff
RSP: 0018:ffffc900031cf400 EFLAGS: 00010283
RAX: 000000000000c8b9 RBX: 00000000ffffff8b RCX: ffffc9000d82f000
RDX: 0000000000080000 RSI: ffffffff833b3015 RDI: 0000000000000005
RBP: ffffc900031cf680 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000ffffff8b R11: 0000000000000000 R12: 00000000ffffff8b
R13: ffff888057f059f8 R14: 0000000000000000 R15: ffff888078f40180
FS:  00007f83ae78c6c0(0000) GS:ffff8881249e1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f83ae749f98 CR3: 00000000304c8000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 udf_fiiter_add_entry+0xcf0/0x10d0 fs/udf/namei.c:262
 udf_rename+0x902/0xd90 fs/udf/namei.c:843
 vfs_rename+0xf64/0x2250 fs/namei.c:5121
 do_renameat2+0x82b/0xc90 fs/namei.c:5270
 __do_sys_renameat2 fs/namei.c:5304 [inline]
 __se_sys_renameat2 fs/namei.c:5301 [inline]
 __x64_sys_renameat2+0xe7/0x130 fs/namei.c:5301
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f83ad98e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f83ae78c038 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 00007f83adbb5fa0 RCX: 00007f83ad98e969
RDX: 0000000000000004 RSI: 0000200000000080 RDI: ffffffffffffff9c
RBP: 00007f83ada10ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000200000000980 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f83adbb5fa0 R15: 00007ffc327b5ec8
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
