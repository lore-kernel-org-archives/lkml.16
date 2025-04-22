Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DE1281537
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328545; cv=none; b=UnG6vGVE8z/cCJpFq1wQGo09YMRk9tuVnDmRDfMyybZF21KgIKwdjIqAn6kxPk+lZvCU1Z086huUEpV0z+0Eb9FCyTwVBg9A/bsrINvyM9MoHuqpzs1BOXLHPw9oIVKzZ0xZcxAAF8QuGEz1T0VfT9IbmT3x5RQYbrIOudW3jIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328545; c=relaxed/simple;
	bh=oEaz4sajvxstPkVoewoK7ucX7BeyvgmhEUktDtH/egU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V2QLlf09ZyM+0IewAWnmevgPw0ogOjzgzehMD5EBzlSvQrZgHMD9pv+N4kCc+WyYp8s6gMee+oWWDplqUVXnLHVi7fsCUTyRaR9wwcVXlGdsLK77cKqPCCp47c9DSHMTCDQ1MQ/s5CIPJEd2FyNA7waUuWPSyNpLX7oKZs1THeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44dc8a9b4so53470965ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328542; x=1745933342;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrkQHSnk7Bgd/HOxcVaI623uzuoAUcuVP5BZgrMXuh8=;
        b=rVGso0pt3nFVByZwzDgMtldufzdUgdbxkK5wEab12vQqQnJTaSqtW+p2ZJ1jvnIvUu
         CiLvwg2gwkefH7QMmuQgsMH6HhQeteosTWK/zPmZTcGNMm0Lt9XAKnJWvYcECYtP6gfX
         qh7DJRC/ZP/Pb46zfgVF0PtehZutpLjzEGpYORcejvVFo7+lKRNYp2/yemKPuvo/7xp4
         AMI6C40hJcu0Zf4LO+mXBeIfTIU6ky3vPIZ5AXFjv0hc+UWruBJm1mF2czfK3biGtSB8
         5Y72M8hh4PGV5pVnjRPwZiQc760D9tzy3J1Gvolwe7eZJ++D9BVFIaPqtTCQutOryS4u
         W+2g==
X-Gm-Message-State: AOJu0YxbnuXgX3lHCSZo4RbNz3MkW6rTBOhXIMTVqSNFKnn2Wio23l1u
	Y3T9gVppCg+6sYbOnlXAhMLeVNxCkhXtHAFN4FfahXQZczyzCMY91Y1bpUY/6VBG17iprdEW/Md
	PbNUwPrilB9qraSsx1T+/QLJ5LrBFvT04vEkNCawybFYL3vyrtUZLkVo=
X-Google-Smtp-Source: AGHT+IFWJxL+v5OwUQM81+I2IJPGiM0GPx0So2eEbhi0lSPGBwLSzdOUOgGI7LFr+XclV3F+ByJQEWxXBjVgvhYocd7Gyt1Ki3li
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d8d:b0:3d8:1ed0:e167 with SMTP id
 e9e14a558f8ab-3d88fccbc02mr138758465ab.14.1745328542692; Tue, 22 Apr 2025
 06:29:02 -0700 (PDT)
Date: Tue, 22 Apr 2025 06:29:02 -0700
In-Reply-To: <20250422111827.536480-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6807999e.050a0220.8500a.001b.GAE@google.com>
Subject: Re: [syzbot] [wireless?] memory leak in cfg80211_inform_single_bss_frame_data
From: syzbot <syzbot+7a942657a255a9d9b18a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in path_openat

BUG: memory leak
unreferenced object 0xffff888104372300 (size 192):
  comm "syslogd", pid 4449, jiffies 4294938233 (age 148.950s)
  hex dump (first 32 bytes):
    08 81 00 00 08 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 29 37 04 81 88 ff ff  .........)7.....
  backtrace:
    [<ffffffff8169d671>] __d_alloc+0x31/0x2f0 fs/dcache.c:1769
    [<ffffffff8169d959>] d_alloc+0x29/0xd0 fs/dcache.c:1849
    [<ffffffff816a28c2>] d_alloc_parallel+0x62/0x610 fs/dcache.c:2638
    [<ffffffff8168dddd>] lookup_open fs/namei.c:3417 [inline]
    [<ffffffff8168dddd>] open_last_lookups fs/namei.c:3560 [inline]
    [<ffffffff8168dddd>] path_openat+0xcad/0x1bf0 fs/namei.c:3790
    [<ffffffff8168f931>] do_filp_open+0xd1/0x1c0 fs/namei.c:3820
    [<ffffffff81669104>] do_sys_openat2+0xf4/0x150 fs/open.c:1407
    [<ffffffff81669aef>] do_sys_open fs/open.c:1422 [inline]
    [<ffffffff81669aef>] __do_sys_openat fs/open.c:1438 [inline]
    [<ffffffff81669aef>] __se_sys_openat fs/open.c:1433 [inline]
    [<ffffffff81669aef>] __x64_sys_openat+0xaf/0x100 fs/open.c:1433
    [<ffffffff84ad6b78>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84ad6b78>] do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888109d04930 (size 776):
  comm "syslogd", pid 4449, jiffies 4294938233 (age 148.950s)
  hex dump (first 32 bytes):
    00 00 00 00 01 00 00 00 00 00 20 00 00 00 00 00  .......... .....
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff81540f35>] alloc_inode_sb include/linux/fs.h:2729 [inline]
    [<ffffffff81540f35>] shmem_alloc_inode+0x25/0x50 mm/shmem.c:4042
    [<ffffffff816a6f83>] alloc_inode+0x23/0x100 fs/inode.c:260
    [<ffffffff816a7085>] new_inode_pseudo fs/inode.c:1018 [inline]
    [<ffffffff816a7085>] new_inode+0x25/0xf0 fs/inode.c:1046
    [<ffffffff815420f3>] shmem_get_inode+0xd3/0x550 mm/shmem.c:2370
    [<ffffffff815426a1>] shmem_mknod+0x41/0x140 mm/shmem.c:3074
    [<ffffffff8168e877>] lookup_open fs/namei.c:3492 [inline]
    [<ffffffff8168e877>] open_last_lookups fs/namei.c:3560 [inline]
    [<ffffffff8168e877>] path_openat+0x1747/0x1bf0 fs/namei.c:3790
    [<ffffffff8168f931>] do_filp_open+0xd1/0x1c0 fs/namei.c:3820
    [<ffffffff81669104>] do_sys_openat2+0xf4/0x150 fs/open.c:1407
    [<ffffffff81669aef>] do_sys_open fs/open.c:1422 [inline]
    [<ffffffff81669aef>] __do_sys_openat fs/open.c:1438 [inline]
    [<ffffffff81669aef>] __se_sys_openat fs/open.c:1433 [inline]
    [<ffffffff81669aef>] __x64_sys_openat+0xaf/0x100 fs/open.c:1433
    [<ffffffff84ad6b78>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84ad6b78>] do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff88810ad9bc60 (size 32):
  comm "syslogd", pid 4449, jiffies 4294938233 (age 148.950s)
  hex dump (first 32 bytes):
    f0 4a d0 09 81 88 ff ff 80 91 31 82 ff ff ff ff  .J........1.....
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8231aab2>] kmem_cache_zalloc include/linux/slab.h:693 [inline]
    [<ffffffff8231aab2>] lsm_inode_alloc security/security.c:632 [inline]
    [<ffffffff8231aab2>] security_inode_alloc+0x32/0xd0 security/security.c:1479
    [<ffffffff816a3d4d>] inode_init_always+0x1ed/0x230 fs/inode.c:231
    [<ffffffff816a6fa0>] alloc_inode+0x40/0x100 fs/inode.c:267
    [<ffffffff816a7085>] new_inode_pseudo fs/inode.c:1018 [inline]
    [<ffffffff816a7085>] new_inode+0x25/0xf0 fs/inode.c:1046
    [<ffffffff815420f3>] shmem_get_inode+0xd3/0x550 mm/shmem.c:2370
    [<ffffffff815426a1>] shmem_mknod+0x41/0x140 mm/shmem.c:3074
    [<ffffffff8168e877>] lookup_open fs/namei.c:3492 [inline]
    [<ffffffff8168e877>] open_last_lookups fs/namei.c:3560 [inline]
    [<ffffffff8168e877>] path_openat+0x1747/0x1bf0 fs/namei.c:3790
    [<ffffffff8168f931>] do_filp_open+0xd1/0x1c0 fs/namei.c:3820
    [<ffffffff81669104>] do_sys_openat2+0xf4/0x150 fs/open.c:1407
    [<ffffffff81669aef>] do_sys_open fs/open.c:1422 [inline]
    [<ffffffff81669aef>] __do_sys_openat fs/open.c:1438 [inline]
    [<ffffffff81669aef>] __se_sys_openat fs/open.c:1433 [inline]
    [<ffffffff81669aef>] __x64_sys_openat+0xaf/0x100 fs/open.c:1433
    [<ffffffff84ad6b78>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84ad6b78>] do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff8881068f4db0 (size 576):
  comm "syslogd", pid 4449, jiffies 4294938233 (age 148.950s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    01 00 00 00 00 00 00 00 60 bc d9 0a 81 88 ff ff  ........`.......
  backtrace:
    [<ffffffff84acc59f>] xas_alloc+0xef/0x110 lib/xarray.c:375
    [<ffffffff84ace31c>] xas_expand lib/xarray.c:582 [inline]
    [<ffffffff84ace31c>] xas_create+0x10c/0x6f0 lib/xarray.c:653
    [<ffffffff84acf55b>] xas_store+0x7b/0xad0 lib/xarray.c:787
    [<ffffffff815438e2>] shmem_add_to_page_cache+0x2d2/0x4d0 mm/shmem.c:735
    [<ffffffff81547137>] shmem_get_folio_gfp+0x497/0xd10 mm/shmem.c:1978
    [<ffffffff81548981>] shmem_get_folio mm/shmem.c:2079 [inline]
    [<ffffffff81548981>] shmem_write_begin+0x91/0x1a0 mm/shmem.c:2573
    [<ffffffff815050b6>] generic_perform_write+0x116/0x2e0 mm/filemap.c:3923
    [<ffffffff8150f407>] __generic_file_write_iter+0x127/0x130 mm/filemap.c:4018
    [<ffffffff8150f493>] generic_file_write_iter+0x83/0x160 mm/filemap.c:4044
    [<ffffffff8166e518>] call_write_iter include/linux/fs.h:1871 [inline]
    [<ffffffff8166e518>] new_sync_write fs/read_write.c:491 [inline]
    [<ffffffff8166e518>] vfs_write+0x328/0x5c0 fs/read_write.c:584
    [<ffffffff8166ea0d>] ksys_write+0xad/0x170 fs/read_write.c:637
    [<ffffffff84ad6b78>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84ad6b78>] do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd



Tested on:

commit:         2772d7df Merge tag 'riscv-for-linus-6.5-rc2' of git://..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17b39174580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c6665cc8fad72d2
dashboard link: https://syzkaller.appspot.com/bug?extid=7a942657a255a9d9b18a
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16a672cc580000

