Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0F1DED59
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185705; cv=none; b=ZWmBMX5/cI3mZF15R4hUcrEhNVMOU5ERyyu5px6nsz/cfUoz3LobXDjFTLQLL+qLdxOkO7D2H7FEDqtdudqP/j3fK42Co5TB8GGwj/BjOkS6zvfsX0uqWnYZ2EvWcXuTG9wT8aPp6+gTXibz5MKbEh53y7k+vO4StCY4DzRZfqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185705; c=relaxed/simple;
	bh=auytqwmfmZdmxud7+ikGTeVRUyAcwLoMT+aVsOP1upQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RVUBUq5hTi/rLtjq7Dh2qTysdDglEJVI5FBtPaJfbSmADuMKp83miPMUkRQ/57cs/hchzs6LETvYh0YeR4spuGXwiQC9DLcBz4txrb7fPkMxBQwa+WL2r1vrG1x3+s4MDfZ3VBhS8vfwoJJG92HSiKE0uPxiLQ9722flQrkMAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85db3356bafso537106039f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743185702; x=1743790502;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Od2ayAfPIfaoTthbROKToHzuWfc9MXJFkm8vY5m2028=;
        b=Tqbk6LX7zknxPQj522zCTUMwNIALTtDLF9PCkY67QI0fo8hMolYX/F3TLvA0I40GnC
         vlmaPGXXSMBnBsXoiH8PZkl3HcHxqcl6OsJxdyIF3lKkTssdKL+qPgNCxQtyaXbp1Xxu
         QvXZ+6cd4BfGeA2fsyKHhHMMUmubxVFEmYnRuEGHlwMW8F7hzZi2Fn5v6czPo1eeetxV
         1DwN6pxnJlb8E0Z0lr/+MwEPbBwL3geg4VrgBAv+2j/UtT0BwqvxwWU6feSF5GwF0EfR
         sgIMpU63GtEvdW0O7iPhaeHSp9HubaHmR2oomhY2dRV5YSoja0AGz0bi2Z+S0QsN70dF
         eEsA==
X-Forwarded-Encrypted: i=1; AJvYcCXtm1GmSkYw7ghFhX3K68K+QLFaoL+N3pgusBxrLUv4TYPmeAcltiyJlr13qjBhzVzTH3mYbYGuKLjeviQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+LFuCpVs6gMxulO2YGJFBlOQ8rOIi8E/tonY0L78mfiRcXWq
	cZiKXgLiNTBZJ/mhUhvoK0Ao9nl3QxuslvjzyruW+0f8XHMEpyUCcpZaaL2UzAAVQV8ZTCXZXgQ
	5+u8VtzzuGhUXCBPb+Y0bPNnOHxtjvrbuMg/M0wOGyC4XuaGqc3n+9y4=
X-Google-Smtp-Source: AGHT+IEkXIj68rOgamqULFpajMuN1jDdr4AwRpkW/srbIH22FpMPr0HhEfac3lMdYy+t2NOGA/FEtiR8cZOUNTmVU/iNS+uCkfFt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194e:b0:3d5:8103:1a77 with SMTP id
 e9e14a558f8ab-3d5e08eda71mr7008115ab.1.1743185702307; Fri, 28 Mar 2025
 11:15:02 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:15:02 -0700
In-Reply-To: <85011.1743183886@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e6e726.050a0220.2f068f.0080.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in __alloc_frozen_pages_noprof
From: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in afs_dynroot_readdir

loop0: detected capacity change from 0 to 512
EXT4-fs: Ignoring removed bh option
EXT4-fs (loop0): mounting ext3 file system using the ext4 subsystem
EXT4-fs (loop0): 1 truncate cleaned up
EXT4-fs (loop0): mounted filesystem 00000000-0000-0000-0000-000000000000 r/w without journal. Quota mode: writeback.
============================================
WARNING: possible recursive locking detected
6.14.0-syzkaller-07422-gacb4f33713b9-dirty #0 Not tainted
--------------------------------------------
syz.0.16/6130 is trying to acquire lock:
ffff888011d70148 (&type->i_mutex_dir_key#9){.+.+}-{4:4}, at: afs_dynroot_readdir+0x49e/0xb10 fs/afs/dynroot.c:351

but task is already holding lock:
ffff888011d70148 (&type->i_mutex_dir_key#9){.+.+}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&type->i_mutex_dir_key#9);
  lock(&type->i_mutex_dir_key#9);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by syz.0.16/6130:
 #0: ffff88807e06bcf8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff888011d70148 (&type->i_mutex_dir_key#9){.+.+}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101

stack backtrace:
CPU: 1 UID: 0 PID: 6130 Comm: syz.0.16 Not tainted 6.14.0-syzkaller-07422-gacb4f33713b9-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_deadlock_bug+0x2be/0x2d0 kernel/locking/lockdep.c:3042
 check_deadlock kernel/locking/lockdep.c:3094 [inline]
 validate_chain+0x928/0x24e0 kernel/locking/lockdep.c:3896
 __lock_acquire+0xad5/0xd80 kernel/locking/lockdep.c:5235
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 down_read+0xb3/0xa50 kernel/locking/rwsem.c:1524
 afs_dynroot_readdir+0x49e/0xb10 fs/afs/dynroot.c:351
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents fs/readdir.c:322 [inline]
 __se_sys_getdents+0x1ff/0x4e0 fs/readdir.c:308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdd5b98d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fdd5c816038 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007fdd5bba5fa0 RCX: 00007fdd5b98d169
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 0000000000000004
RBP: 00007fdd5ba0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fdd5bba5fa0 R15: 00007ffe6a4f5bb8
 </TASK>


Tested on:

commit:         acb4f337 Merge tag 'm68knommu-for-v6.15' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10922a4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=982413b40f90fdf8
dashboard link: https://syzkaller.appspot.com/bug?extid=3b6c5c6a1d0119b687a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f51198580000

