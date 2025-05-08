Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514BC1EDA16
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674432; cv=none; b=ZOcHlM1z4ZE3v4X8HSeVP/FQSfwoz4W3An/mSrWcG8sLFyd0D3O0E/bVEvTbUx4Ok16Vtoi7kdVSDdmbiw2R5fHokoqjC8BPd5sAs5eDbjoV3JubgmAaUgvWc0CVguHwY61uUhNc3UVY0pU3+fVFgzUMYUq3ueQ70ys+zE/v4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674432; c=relaxed/simple;
	bh=toexBCWtC/QzbHDuKQBajTpHcp2ESpxMHyTg8BYyoRU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iYX3/grauyij7y6uOSkHO32sJ2cJ8Q7AAkS5Ex8qMAaZo3ze8WLHaEYilS2PSDpQdd70/hOD8E+qfTdN+Nozw33EFwONzDpO0J4oRHf5Kqq7PJ1PY27QMEfkiLTf807wzeb8QJG08/c5EDqIiB1kMZx5n7GTgYO6BZAOXmsRtQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so7018725ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 20:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746674429; x=1747279229;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njkK5Q/+P60k2xOwOK/nWx/93V6V59fxM7hC5u6zxwA=;
        b=CTaHX1U4N29AJR1t3Cv5vu/M8NiMHiV0cSv6N86fgrQJDxH1xR7XAl1fB1uO4N7mKS
         29O9Ovw4JOFlTytkEyA/2VTa7gyAjIldcHt2Sb4VoBRSN9FMiwuCAILWm1u/9+dMMIcu
         s7KrLd+60bRfqKu7iCTMjrxE/WS5EY52hFPgwRvqYQnz4GpR/fT2wLi3lLDtWgGem8qs
         Uw+9T9LODMXSNP6BYG5ZgHOppgZ/6X+RrYLTFm8yKH6IWsl4M+40z0nyHInjydBnpu5e
         t4gFEKeL7zi1nHIl3naotuy59O3ExwhU+d1VDlcBEXWbSv3Bup/ZMuAdeOzJp62ca6nQ
         Iz5g==
X-Forwarded-Encrypted: i=1; AJvYcCVjqwANaXwiSNxKBf350p05CYJMPo779ToRN9YAONOcWVcjBUnuK0CX8rtjvBkoyvChb9rRLGRUdeqFe7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUsqY+ggJBd1HW+VAb5+Y6ogClvbo/AyW4qzHk+U7Y0cqQrH5
	SsduVYSrzfh0whC+198A37uWGhSpG0idREtk82hCdSZeOyrQkwMfyor8QVBiRqi2kKa7ItEI9ya
	Xp+I9DG7CCzpsyQ3gRCbrUOeVVxRaw2jbkVa8ra2CPiLc21KcC3SzULk=
X-Google-Smtp-Source: AGHT+IE6lxlmSyVY8kD0bT7EPbcvlshDmvxVYqfCOQF4jQudWLi4dlviiCxNJ4i8l6UygrjSvB8/km+xiC4Xu+AgTJW4wuVZAJT9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378e:b0:3d8:8900:9a30 with SMTP id
 e9e14a558f8ab-3da785a5601mr26876625ab.20.1746674429523; Wed, 07 May 2025
 20:20:29 -0700 (PDT)
Date: Wed, 07 May 2025 20:20:29 -0700
In-Reply-To: <67810cc6.050a0220.216c54.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681c22fd.050a0220.a19a9.009d.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in errseq_set (2)
From: syzbot <syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    707df3375124 Merge tag 'media/v6.15-2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=173c8670580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9683d529ec1b880
dashboard link: https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ae0768580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17fa98f4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b678b69ad07a/disk-707df337.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/747856a66c71/vmlinux-707df337.xz
kernel image: https://storage.googleapis.com/syzbot-assets/69a1d9539047/bzImage-707df337.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/44a5023af4cf/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com

------------[ cut here ]------------
err = 556
WARNING: CPU: 1 PID: 5826 at lib/errseq.c:75 errseq_set+0xed/0x120 lib/errseq.c:74
Modules linked in:
CPU: 1 UID: 0 PID: 5826 Comm: syz-executor335 Not tainted 6.15.0-rc5-syzkaller-00038-g707df3375124 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
RIP: 0010:errseq_set+0xed/0x120 lib/errseq.c:74
Code: 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc cc e8 3a 4a 0e fd eb e9 e8 33 4a 0e fd 90 48 c7 c7 80 b5 c0 8b 89 de e8 84 a6 d2 fc 90 <0f> 0b 90 90 eb ce 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 2f ff ff
RSP: 0018:ffffc900041c73a0 EFLAGS: 00010246
RAX: 5edf3f3cab771a00 RBX: 000000000000022c RCX: ffff888033313c00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: 0000000000000000 R08: ffff8880b8923e93 R09: 1ffff110171247d2
R10: dffffc0000000000 R11: ffffed10171247d3 R12: ffff8880769766d0
R13: dffffc0000000000 R14: ffff888076976c70 R15: ffff888076976768
FS:  00007fd18cfee6c0(0000) GS:ffff8881261fd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd184bffe00 CR3: 0000000077516000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __filemap_set_wb_err+0x22/0x1e0 mm/filemap.c:711
 mapping_set_error include/linux/pagemap.h:244 [inline]
 ntfs_resident_writepage+0x114/0x200 fs/ntfs3/inode.c:886
 write_cache_pages+0x61/0x100 mm/page-writeback.c:2613
 do_writepages+0x3ae/0x7b0 mm/page-writeback.c:2656
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 filemap_write_and_wait_range+0x217/0x310 mm/filemap.c:691
 kiocb_write_and_wait mm/filemap.c:2792 [inline]
 generic_file_read_iter+0x19f/0x510 mm/filemap.c:2866
 copy_splice_read+0x54f/0x9b0 fs/splice.c:363
 do_splice_read fs/splice.c:978 [inline]
 splice_direct_to_actor+0x4d0/0xcc0 fs/splice.c:1083
 do_splice_direct_actor fs/splice.c:1201 [inline]
 do_splice_direct+0x181/0x270 fs/splice.c:1227
 do_sendfile+0x4da/0x7d0 fs/read_write.c:1368
 __do_sys_sendfile64 fs/read_write.c:1429 [inline]
 __se_sys_sendfile64+0x13e/0x190 fs/read_write.c:1415
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd18d039e89
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd18cfee218 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fd18d0e16c8 RCX: 00007fd18d039e89
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000004
RBP: 00007fd18d0e16c0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000fffe80 R11: 0000000000000246 R12: 00007fd18d0ad820
R13: 0000200000000100 R14: 0000200000000400 R15: 0000200000000080
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
