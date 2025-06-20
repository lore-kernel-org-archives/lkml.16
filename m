Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656F221C18E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750399086; cv=none; b=HY6BN7WIxdGt3EypuMGoj1LQq22SDGZe9FhW6oiUr5KCQK0bbSV+N57lNt2ixITPHMxs3JYDaKvmlSqhbiyLryImW7QCwPlGRi7Yln+LwJicrWGq7VJftndNh4eS7emPxNrYMK8HZ+5xczKMhYqrBGnAZgMo9LMKsW4KxMH7Wjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750399086; c=relaxed/simple;
	bh=BSCEYiaS+fGcvu5Z2sC8v5yb8W/TX3BAKBzI445SwOU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SJJgsFlV2pJuFnx0vYBwKuQOf5B5v6+j4wLOaPvTx37scuUZMp8TX1rJmcHjsqjQ0YlurKsJpVdXpgoU2khqEOnV82X74+cclqYa6LaXGpP/tHoXozjmjZH6zS1PX3fQcod7+ZzHKVymGw+R5mviBAhNjxKY5tfF6Gw6mam2x+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3de0f73f9e0so14281125ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 22:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750399083; x=1751003883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ygRVccr4dNW9i/toJAUUbN0X0I/j6BzWjyVBKJ46yqM=;
        b=fnuJDmpXxhmoKLRc7cxNsX5M87dooSpfCUPhaDXc9r/Mn+8kMtAtcLGw7KK0MwKGDs
         mZtNjjyirx7hwGfI3p9XyNpm2Ke6cqY3dZA4upmWo3ly5hgbrdqQvz1rAjPr2T3G9rID
         aOyPFIaiUvEXVAOW/ZNYb2I06sG1BXwrtRdAz2ktiWvnc6FJS9breeJWV2L8impPU6+D
         FpL2dox+2cr2Y+9v/J6TykSOiXRjfX5zo2PB5SK2AGTzo34HnjqLIxqk5LjSiQQLMg+y
         jgoRVhcbjg66IJiCWUB9dxSgqsGDE5sTEkiXfir9Mheff4po/QCZaQ3L3A4j79XU40gR
         DZPw==
X-Gm-Message-State: AOJu0YxC1rolII9ldOUQDNBPSJpUZa/1HvWNJDEX4MgIMofyXCtGWdRd
	Eai1GpD441KBzfcDZpm7Qy3UaIZBBaSu1/Zfqq/xIz8CtDL3m0GjuXT5sGm9gcr0ZnLkL7qTYhN
	SN3xobbsP1L7JQ+Jhfmkw4GX8WZgwN3Yd0cuMRsppxf8MPpZ02K322Q9H+v0=
X-Google-Smtp-Source: AGHT+IHhKeSHOAUROYa49UkTXrFSN7G+JMwdsihraV3SV7GtqL32CcBkXHsUFAMpZfw1ldz5f8ihbytKSZCnD2LG5PMbfAk2+RFF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154c:b0:3dd:c946:a273 with SMTP id
 e9e14a558f8ab-3de38c5878amr16262855ab.9.1750399083538; Thu, 19 Jun 2025
 22:58:03 -0700 (PDT)
Date: Thu, 19 Jun 2025 22:58:03 -0700
In-Reply-To: <20250620052310.1280771-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854f86b.a00a0220.137b3.002e.GAE@google.com>
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
 vmci_host_do_receive_datagram drivers/misc/vmw_vmci/vmci_host.c:444 [inline]
 vmci_host_unlocked_ioctl+0x1e1d/0x5360 drivers/misc/vmw_vmci/vmci_host.c:938
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
 vmci_host_unlocked_ioctl+0x4524/0x5360 drivers/misc/vmw_vmci/vmci_host.c:934
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
Memory access of size 40 starts at ffff888013ca72c0
Data copied to user address 000000000000a4bf

CPU: 1 UID: 0 PID: 6602 Comm: syz.0.16 Not tainted 6.16.0-rc2-syzkaller-00162-g41687a5c6f8b-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         41687a5c Merge tag 'spi-fix-v6.16-rc2' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=166d9d0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15659d0c580000

