Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1598B22B5B5
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746182612; cv=none; b=Gt8JmbjDiBBOP7sLo2zBwou7z18BujeNesdmynZVamepNcM2az450sveFcpS81IK1NulYjVEa3MvxgCM2afD1ikgxEEdweTWXCV8wz1w1tb8KUVHIdiWDhln33ToloXyoDgZUA+Sz/0RzeAwvWOpFQgc2bi8t5cbvXXowF/jCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746182612; c=relaxed/simple;
	bh=LqGAKmAzwyg0XVFUhWqxijxlq8WDgC1Wxy6Z4qkCi80=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=A+Xf1Pux7I+OQMdaHsdeMFTgmbQsZvNAKP0kRUY2i6Da2GeBqvd/RhO+l11Y9oN7EhTIq1+Bvd9eWQIzBonKtRujoR+nbXjzWNf/SALkDSqJEuFvfMkBbZ2nSliqYsf34812M3Uv1bymwxkZdF2FSBWUh/hWgow4tc+n7suE7z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d81bc9b763so33234845ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746182610; x=1746787410;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OW7aX/OjwyhIpLSO/sfFTGqPwMo+bGiwO2sIjV9o5OI=;
        b=l7MDXJTaaTemxpMI6ikkYd8duKPENSbPRP1MubucDp/olsTR26ieZrJKnTDwMFFavI
         y5dm3tNRJK99gjwn1RIqYPDNxnsYf6yqSrJTgTUZaLJuc3+1ZQzB0pw3Hiph1cXax2Oy
         Nsm8gPYis1AIXpKsdViQ8XQA0VM0ygxDQlOwyeX+KjqohbiVI5mozfJtQFcUXWm38bhM
         T5os1tOV5jyopqw43v3OJJZsNFbrSo2xfIfbVMJibYiYLZksRKSUt6KlH4zEpkScSMWG
         En+6DhJX5moyGK6ZNoT00SiEZUjDpG+QiSbTM988gwwlnWJotap96gtX/iyK64xwKB9y
         JeTA==
X-Forwarded-Encrypted: i=1; AJvYcCWAZg62DfRDDM3ZFaydzBEfz4eyShtk8aBS/4R7jcIsJHiZAPnO+/Nscr6GEjVJbspSUjX5qcJiDZBt45o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+cSp/wV7wp9ENYVHbgyqaui+qapeB/Wtq8B3O9427JtOfUpQ
	vIiV6pfAzdqQ0Qjq+PmONVHDRgT5m4Jpp88cJwTFwflbMiw+0m1qBjYC6CBuEofCqOjYjKM0q7v
	FXaBmh0qWt8qa4C/7356RpnnXWhVcwDmsZ7pDnfrom6Lvbvfsh6bgsoM=
X-Google-Smtp-Source: AGHT+IEJyIfyJuPM1kc7xLeApATTlqhW/s0gdWTsPvDT9ZdWzyhQ8Trcxzy5B2ll6wEQTXFi0hji9aWC/cl6mNFDOUEWqGWfTEfT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3387:b0:3d9:666f:486d with SMTP id
 e9e14a558f8ab-3d97c237decmr28844435ab.15.1746182610260; Fri, 02 May 2025
 03:43:30 -0700 (PDT)
Date: Fri, 02 May 2025 03:43:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6814a1d2.050a0220.53db9.0009.GAE@google.com>
Subject: [syzbot] [ntfs3?] KMSAN: uninit-value in ntfs_read_hdr (2)
From: syzbot <syzbot+488af4b73b8ab6ed0f27@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02ddfb981de8 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13be6374580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=488af4b73b8ab6ed0f27
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ca57f5a3f77/disk-02ddfb98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3f23cbc11e68/vmlinux-02ddfb98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/73e63afac354/bzImage-02ddfb98.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+488af4b73b8ab6ed0f27@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in ntfs_dir_emit fs/ntfs3/dir.c:333 [inline]
BUG: KMSAN: uninit-value in ntfs_read_hdr+0x105a/0x1370 fs/ntfs3/dir.c:383
 ntfs_dir_emit fs/ntfs3/dir.c:333 [inline]
 ntfs_read_hdr+0x105a/0x1370 fs/ntfs3/dir.c:383
 ntfs_readdir+0xf21/0x1a30 fs/ntfs3/dir.c:494
 iterate_dir+0x716/0x920 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:403 [inline]
 __se_sys_getdents64+0x17e/0x550 fs/readdir.c:389
 __x64_sys_getdents64+0x97/0xe0 fs/readdir.c:389
 x64_sys_call+0x16c4/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:218
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_read_run_nb+0x7cf/0x1810 fs/ntfs3/fsntfs.c:1228
 ntfs_read_bh+0x6a/0xc00 fs/ntfs3/fsntfs.c:1289
 indx_read+0x450/0x1840 fs/ntfs3/index.c:1067
 ntfs_readdir+0xddf/0x1a30 fs/ntfs3/dir.c:489
 iterate_dir+0x716/0x920 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:403 [inline]
 __se_sys_getdents64+0x17e/0x550 fs/readdir.c:389
 __x64_sys_getdents64+0x97/0xe0 fs/readdir.c:389
 x64_sys_call+0x16c4/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:218
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_write_bh+0x6ae/0xe90 fs/ntfs3/fsntfs.c:1426
 indx_write fs/ntfs3/index.c:1027 [inline]
 indx_insert_into_buffer+0x287/0x2010 fs/ntfs3/index.c:1809
 indx_insert_entry+0xcde/0x1050 fs/ntfs3/index.c:1986
 ntfs_create_inode+0x47b0/0x5560 fs/ntfs3/inode.c:1616
 ntfs_mkdir+0x56/0x80 fs/ntfs3/namei.c:207
 vfs_mkdir+0x4e7/0x850 fs/namei.c:4359
 do_mkdirat+0x41a/0xf30 fs/namei.c:4392
 __do_sys_mkdir fs/namei.c:4414 [inline]
 __se_sys_mkdir fs/namei.c:4412 [inline]
 __x64_sys_mkdir+0x9a/0xf0 fs/namei.c:4412
 x64_sys_call+0x29b6/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:84
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 hdr_insert_de+0x471/0x550 fs/ntfs3/index.c:835
 indx_insert_into_buffer+0x1b6/0x2010 fs/ntfs3/index.c:1805
 indx_insert_entry+0xcde/0x1050 fs/ntfs3/index.c:1986
 ntfs_create_inode+0x47b0/0x5560 fs/ntfs3/inode.c:1616
 ntfs_mkdir+0x56/0x80 fs/ntfs3/namei.c:207
 vfs_mkdir+0x4e7/0x850 fs/namei.c:4359
 do_mkdirat+0x41a/0xf30 fs/namei.c:4392
 __do_sys_mkdir fs/namei.c:4414 [inline]
 __se_sys_mkdir fs/namei.c:4412 [inline]
 __x64_sys_mkdir+0x9a/0xf0 fs/namei.c:4412
 x64_sys_call+0x29b6/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:84
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_read_run_nb+0x7cf/0x1810 fs/ntfs3/fsntfs.c:1228
 ntfs_read_bh+0x6a/0xc00 fs/ntfs3/fsntfs.c:1289
 indx_read+0x450/0x1840 fs/ntfs3/index.c:1067
 indx_find+0xa80/0x1510 fs/ntfs3/index.c:1179
 indx_insert_entry+0xd74/0x1050 fs/ntfs3/index.c:1963
 ntfs_create_inode+0x47b0/0x5560 fs/ntfs3/inode.c:1616
 ntfs_mkdir+0x56/0x80 fs/ntfs3/namei.c:207
 vfs_mkdir+0x4e7/0x850 fs/namei.c:4359
 do_mkdirat+0x41a/0xf30 fs/namei.c:4392
 __do_sys_mkdir fs/namei.c:4414 [inline]
 __se_sys_mkdir fs/namei.c:4412 [inline]
 __x64_sys_mkdir+0x9a/0xf0 fs/namei.c:4412
 x64_sys_call+0x29b6/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:84
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ntfs_write_bh+0x6ae/0xe90 fs/ntfs3/fsntfs.c:1426
 indx_write fs/ntfs3/index.c:1027 [inline]
 indx_insert_into_buffer+0x287/0x2010 fs/ntfs3/index.c:1809
 indx_insert_entry+0xcde/0x1050 fs/ntfs3/index.c:1986
 ni_add_name+0xef7/0x11e0 fs/ntfs3/frecord.c:2995
 ntfs_link_inode+0x221/0x350 fs/ntfs3/inode.c:1698
 ntfs_link+0x20e/0x500 fs/ntfs3/namei.c:146
 vfs_link+0x8e8/0xb30 fs/namei.c:4847
 do_linkat+0x4af/0x1040 fs/namei.c:4917
 __do_sys_link fs/namei.c:4951 [inline]
 __se_sys_link fs/namei.c:4949 [inline]
 __x64_sys_link+0xd7/0x140 fs/namei.c:4949
 x64_sys_call+0x3567/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:87
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 hdr_insert_de+0x4c8/0x550 fs/ntfs3/index.c:838
 indx_insert_into_buffer+0x1b6/0x2010 fs/ntfs3/index.c:1805
 indx_insert_entry+0xcde/0x1050 fs/ntfs3/index.c:1986
 ni_add_name+0xef7/0x11e0 fs/ntfs3/frecord.c:2995
 ntfs_link_inode+0x221/0x350 fs/ntfs3/inode.c:1698
 ntfs_link+0x20e/0x500 fs/ntfs3/namei.c:146
 vfs_link+0x8e8/0xb30 fs/namei.c:4847
 do_linkat+0x4af/0x1040 fs/namei.c:4917
 __do_sys_link fs/namei.c:4951 [inline]
 __se_sys_link fs/namei.c:4949 [inline]
 __x64_sys_link+0xd7/0x140 fs/namei.c:4949
 x64_sys_call+0x3567/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:87
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4167 [inline]
 slab_alloc_node mm/slub.c:4210 [inline]
 kmem_cache_alloc_noprof+0x81b/0xec0 mm/slub.c:4217
 ntfs_link_inode+0x90/0x350 fs/ntfs3/inode.c:1686
 ntfs_link+0x20e/0x500 fs/ntfs3/namei.c:146
 vfs_link+0x8e8/0xb30 fs/namei.c:4847
 do_linkat+0x4af/0x1040 fs/namei.c:4917
 __do_sys_link fs/namei.c:4951 [inline]
 __se_sys_link fs/namei.c:4949 [inline]
 __x64_sys_link+0xd7/0x140 fs/namei.c:4949
 x64_sys_call+0x3567/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:87
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 5804 Comm: syz-executor Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
=====================================================


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
