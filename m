Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C73023AB98
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409344; cv=none; b=sxyuknp1a95HbNZzMIaDIOY+YvRbZLft0GUNIbVVlYsXeXcVrAa7nfRe9A7ktoqEoN+sOUOjEKuaH9X5VDguzkH3Ki9obWWZTKeStRPTQ1if4d1QupilEii66SR7WzuB/BvbdRDxaeQgpqmAA9ncqLeVezbACBqW2DWl3wtEqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409344; c=relaxed/simple;
	bh=4Cduu0PiAyTfHMt0xDlKWHudMH6r4p0zCoccUUb9VSg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RL5bjaWbSVhq5ZZrq9fD0XQUtHYtCwQtCX8R8DJmxfQWOp182SCFqI/lHMhowIOV67Fspm4b6+brUSAtKaKoQVHhFguoP6hI8E26729dQK07U0EyZjusD8eKs1VkhihSOaJ4RLQjDlj5GIoiSCGp9P4vS9wHjeXa3x2/Vd5VoFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so16297585ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750409342; x=1751014142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdVW9F5ZncPgUoo0T9QdBpdyAP6BE2IsFqHGJoXzcUU=;
        b=bTofCCSwlCMgRrv4UH+xEmUESJWvU/tALrGeFMXOclRiG1avWRdwuPfkTNuTxYQPNl
         ZlaYMS0xnIj6hipi8NJtQdn0SeVQi6pXyyAsdSLfFGPdqaiAznWeHXifZuIx721yAz6h
         2A6px8Ldi7c15lmK8+/aAKJZvskzY46hkt/ehNYdIDj5r/X5GzBa9PaVr70nQH0se2ZV
         uoaIGPq9CAZpQgmzpZFf3xiqbBfY3q9cidmTSrvKVyyxer+bqClPLWUaoRnOP0kHfRd8
         3ulhcbXpioF7joaE7Zvr9MiL92TtxqqMiWugq06P4jVg52rdBK4eA39u8Qg6RJKlAL+8
         sb7A==
X-Gm-Message-State: AOJu0Yx9bPtSHduLyoXvmeLOgYAXIQAUXeY7HxzhYOY/aLRXsX7RRilU
	VSO8zECWUJ5Gqtkk2zOahaPQIkoCheL4Vy9Jzjw8Lx45TQWVFTHoXVzGefhKUdFtBnowYnxqMvy
	vNd1qUd5lJyJaJ0X/s5IIdWhknyijSUqPsXbS8O9rgQm5EOjg/AloZ4zbtYw=
X-Google-Smtp-Source: AGHT+IFd7ePwM9n9WVIbCODZaaf1w58MJuDctisSI2dGknDQfIgaSyEplP8OaTAQsKlo4x3FMK3twAKI2eLWzbKFM+jnVaXp1vN2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b83:b0:3dd:c4ed:39c0 with SMTP id
 e9e14a558f8ab-3de38c159a7mr23626995ab.1.1750409342359; Fri, 20 Jun 2025
 01:49:02 -0700 (PDT)
Date: Fri, 20 Jun 2025 01:49:02 -0700
In-Reply-To: <20250620065230.1552640-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6855207e.a00a0220.137b3.003b.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl

=====================================================
BUG: KMSAN: kernel-infoleak in instrument_copy_to_user include/linux/instrumented.h:114 [inline]
BUG: KMSAN: kernel-infoleak in _inline_copy_to_user include/linux/uaccess.h:196 [inline]
BUG: KMSAN: kernel-infoleak in _copy_to_user+0xcc/0x120 lib/usercopy.c:26
 instrument_copy_to_user include/linux/instrumented.h:114 [inline]
 _inline_copy_to_user include/linux/uaccess.h:196 [inline]
 _copy_to_user+0xcc/0x120 lib/usercopy.c:26
 copy_to_user include/linux/uaccess.h:225 [inline]
 vmci_host_do_receive_datagram drivers/misc/vmw_vmci/vmci_host.c:439 [inline]
 vmci_host_unlocked_ioctl+0x1d05/0x5260 drivers/misc/vmw_vmci/vmci_host.c:933
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 kmemdup_noprof+0xb0/0x100 mm/util.c:139
 kmemdup_noprof include/linux/fortify-string.h:765 [inline]
 dg_dispatch_as_host drivers/misc/vmw_vmci/vmci_datagram.c:272 [inline]
 vmci_datagram_dispatch+0x4eb/0x1560 drivers/misc/vmw_vmci/vmci_datagram.c:340
 ctx_fire_notification drivers/misc/vmw_vmci/vmci_context.c:257 [inline]
 ctx_free_ctx drivers/misc/vmw_vmci/vmci_context.c:435 [inline]
 kref_put include/linux/kref.h:65 [inline]
 vmci_ctx_put+0x88e/0x15d0 drivers/misc/vmw_vmci/vmci_context.c:497
 vmci_ctx_destroy+0x15d/0x250 drivers/misc/vmw_vmci/vmci_context.c:195
 vmci_host_do_init_context drivers/misc/vmw_vmci/vmci_host.c:341 [inline]
 vmci_host_unlocked_ioctl+0x45c1/0x5260 drivers/misc/vmw_vmci/vmci_host.c:929
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x23c/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable ev.i.i created at:
 ctx_fire_notification drivers/misc/vmw_vmci/vmci_context.c:248 [inline]
 ctx_free_ctx drivers/misc/vmw_vmci/vmci_context.c:435 [inline]
 kref_put include/linux/kref.h:65 [inline]
 vmci_ctx_put+0x76b/0x15d0 drivers/misc/vmw_vmci/vmci_context.c:497
 vmci_ctx_destroy+0x15d/0x250 drivers/misc/vmw_vmci/vmci_context.c:195

Bytes 28-31 of 40 are uninitialized
Memory access of size 40 starts at ffff8880231f26c0
Data copied to user address 000000000000a4bf

CPU: 0 UID: 0 PID: 6787 Comm: syz.0.16 Not tainted 6.16.0-rc2-syzkaller-00231-g75f5f23f8787-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         75f5f23f Merge tag 'block-6.16-20250619' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a13d0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15f39d0c580000

