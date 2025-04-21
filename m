Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780D19992E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245504; cv=none; b=S7V5meARnPYSzmgOGPWpLEVhljuX0qtYeItiGfm38ssgAJy24ktMAOBdVEqqnGuawungBFwYCT+2mYxhb+XEUe+eURSZ2C5HtxylJ7eOAxU8jxQ1+rFL6XuDtBLBpaDQ8mr2k+4UVkqR5i12lCt71SeIWhsW1jB+hiGwt9qmJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245504; c=relaxed/simple;
	bh=Qx/N3Fuh6XHV/0Dtff20k5ghO0pyHBvD7NgpyeeD4JE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ok/7COxnsFZ7EvVFYqYBdD6Eg86oaKHEnLrGUmijCVArklPcIaiOjMywClXi4n1ZnnOus0xGiUcs22LxzC1OU/vdqbxJ6sBjNsZcAxGfXR0uxQTkaFsHOzd1Yw5uQP1NC6Twp730kN7TC8GcGeLTvgZd3mMQmjb5QI1iuxyNQhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d7f24a7582so69512815ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245502; x=1745850302;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YG5zHplMpZCE1YBljBoQ+84JiS4+dvXY4CYai+dn0Co=;
        b=YnE3wq3D2+4ODaUKIBCT/fPawPuHqhqyZE84efiv23TR2ieeVc62GD1MEe73QaMzYZ
         R3sK5LgJSK+es7bCgRew1+XyHLl6F+naklAE37ahdR/3j4cTQL8jmPbmcG+Nh2Jkxf9R
         ioU0u2o3EmIRXTg3T3PwipJwnoYKKf10gw1BBzKoq/ZDBe78L/0hDO2E3R8RVw2cRqlC
         xieU94PlkxCESlwb+YA+kDleHgv7FvvmCMtM2xdm5atY6YIOUjUOl+H6/Q97CrVyoANe
         Jrv8EPJeX6S+y3KtEaaFKq0UZwUxhfkwkHaCMCcLX3AZ6X7RfaQz/emHMFNttY5SJlBj
         +0Zw==
X-Forwarded-Encrypted: i=1; AJvYcCU0scaCpwyL5YE0qY1lA2suGvSgqupBLXmoS1C4eVRfwPFabOVMZfJOhNGGbkRJNqzQrKPZnDmj7MwCX8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYcxZ8znroj4o/labA1jkrs41ygLx47+N0aYwVXi8lFSvMAOZ8
	ASYaHgsJSY4bZZmUYjzPOCmFR7p1PNgxyCy6tHN2QdzfR1tOqVFOfotyA9jjNBAV13+Bv9u9M84
	MXBJ+s6QUnsjvmy1NVDMgqj9QBQW5CBDl+QRq0Vt410EcPZFAd429Q8c=
X-Google-Smtp-Source: AGHT+IEvsSCfSAFVVkuBy/KkUNdM9EOHsLevzhXBtIEtpWjj0LyJRmmAcV4+F/PcViA7zyUmSbCwDyEgKQNHZF+aTV6Hi4Zcwo8/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1848:b0:3d4:6ef6:7c70 with SMTP id
 e9e14a558f8ab-3d893bbe7f5mr131369505ab.21.1745245502262; Mon, 21 Apr 2025
 07:25:02 -0700 (PDT)
Date: Mon, 21 Apr 2025 07:25:02 -0700
In-Reply-To: <tencent_D8747F769166163CDB36A697FE36984AB009@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6806553e.050a0220.243d89.003e.GAE@google.com>
Subject: Re: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
From: syzbot <syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in az6007_i2c_xfer

 slab kmalloc-8k start ffff888061394000 pointer offset 80 size 8192
list_del corruption. prev->next should be ffffc900041a7960, but was ffff888061394050. (prev=ffff888061394050)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:62!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 1 UID: 0 PID: 7547 Comm: syz.0.109 Not tainted 6.15.0-rc3-syzkaller-g9d7a0577c9db-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:__list_del_entry_valid_or_report+0x17a/0x200 lib/list_debug.c:62
Code: 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 8d 00 00 00 48 8b 55 00 48 89 e9 48 89 de 48 c7 c7 a0 69 f4 8b e8 b7 82 c5 fc 90 <0f> 0b 4c 89 e7 e8 ec 48 29 fd 48 89 ea 48 b8 00 00 00 00 00 fc ff
RSP: 0018:ffffc900041a7870 EFLAGS: 00010086
RAX: 000000000000006d RBX: ffffc900041a7960 RCX: ffffffff819aaf39
RDX: 0000000000000000 RSI: ffffffff819b2dc6 RDI: 0000000000000005
RBP: ffff888061394050 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000002 R11: 0000000000000001 R12: ffff888061394050
R13: ffffc900041a7940 R14: 0000000000000246 R15: 1ffff92000834f22
FS:  00007f3527db26c0(0000) GS:ffff888124ab2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000025c0 CR3: 0000000028dda000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del include/linux/list.h:229 [inline]
 __mutex_remove_waiter+0x1a/0x1a0 kernel/locking/mutex.c:206
 __mutex_lock_common kernel/locking/mutex.c:714 [inline]
 __mutex_lock+0x85b/0xb90 kernel/locking/mutex.c:746
 az6007_i2c_xfer+0x8e/0xc30 drivers/media/usb/dvb-usb-v2/az6007.c:755
 __i2c_transfer+0x6b3/0x2190 drivers/i2c/i2c-core-base.c:2259
 i2c_transfer drivers/i2c/i2c-core-base.c:2315 [inline]
 i2c_transfer+0x1da/0x380 drivers/i2c/i2c-core-base.c:2291
 i2c_transfer_buffer_flags+0x10c/0x190 drivers/i2c/i2c-core-base.c:2343
 i2c_master_recv include/linux/i2c.h:79 [inline]
 i2cdev_read+0x111/0x280 drivers/i2c/i2c-dev.c:155
 do_loop_readv_writev fs/read_write.c:845 [inline]
 do_loop_readv_writev fs/read_write.c:833 [inline]
 vfs_readv+0x6bc/0x8a0 fs/read_write.c:1018
 do_preadv+0x1af/0x270 fs/read_write.c:1130
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3526f8e169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f3527db2038 EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00007f35271b5fa0 RCX: 00007f3526f8e169
RDX: 0000000000000001 RSI: 00002000000025c0 RDI: 0000000000000004
RBP: 00007f3527010a68 R08: 000000000000007e R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f35271b5fa0 R15: 00007ffcd08bc1d8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x17a/0x200 lib/list_debug.c:62
Code: 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 8d 00 00 00 48 8b 55 00 48 89 e9 48 89 de 48 c7 c7 a0 69 f4 8b e8 b7 82 c5 fc 90 <0f> 0b 4c 89 e7 e8 ec 48 29 fd 48 89 ea 48 b8 00 00 00 00 00 fc ff
RSP: 0018:ffffc900041a7870 EFLAGS: 00010086
RAX: 000000000000006d RBX: ffffc900041a7960 RCX: ffffffff819aaf39
RDX: 0000000000000000 RSI: ffffffff819b2dc6 RDI: 0000000000000005
RBP: ffff888061394050 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000002 R11: 0000000000000001 R12: ffff888061394050
R13: ffffc900041a7940 R14: 0000000000000246 R15: 1ffff92000834f22
FS:  00007f3527db26c0(0000) GS:ffff888124ab2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00002000000025c0 CR3: 0000000028dda000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         9d7a0577 gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16dfcc70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14c78fcf980000

