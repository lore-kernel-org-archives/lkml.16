Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742E1C6FF6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388104; cv=none; b=YSB2G7m/o3TNdTjZn+3H6bde37GkAz9/unp5e93on+X4jJz5I40kk0hU/j2FY9FTWVwpvVhv/x6AdVFy7ku2uHy84jWPXw00f7V2RJrqlQHpp4ptNZpIh2lfTAXXjABIf1ZztZrj/Umh2yVhDGayM5LzNrRzU56bXEU5V93aa9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388104; c=relaxed/simple;
	bh=cYGY3TMzcFrWsX8fOfHYads2hVgZdY9ImtwwofI9e68=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kpHV22iuvqr9mvbK0ujRPW1VNJqLn2ABkgmsUoL04v5dITVcWsHei+vsfF36VP/qJRZWHJBA0Ydbfth05amDX2Kv6hGd6XsOmSG3p+gtMdu9aM3xZz3NpuIx5COUByhmS+PKW4imiVzRHlfmz+AzsVLB1ehMGWH++dcTDAmuXO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddd01c6f9bso11749425ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750388102; x=1750992902;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTrAc34fwpTa9OvQF1m1SekLDA+MuqrKVemdltoX3iI=;
        b=G0E0socZxErqs4cBg2FxIiHU21rw35kPOdFWslykxEV7TNgeYCbA0VLL2sAVi5rk7h
         GwS2KEmw+AmMZPs8IFayLIAgAwtQ3rd7Vv1e83OW9cS8n/2iHL38jzifiEFQulfMuz/B
         WKVkpLztGN2GS8w42pM1mmN6JEiPcRsg7KA4oVqc85rJHiYx3ufH0YdOYs/mOSmhy8cp
         ZB0+kMpgc0P8W5+KR8m2RP3/sAOxjo78KaM6sjz5n0oEXrRngaya0EX0Z83BcNoXmJSU
         xeTZOozTpU4TheJ4/VJht3aM//rDX67ExV1V/Q0mQ2nnM0ypAvTIJodwOXIjscZcK4qP
         2EQw==
X-Gm-Message-State: AOJu0YznuG7naGACGrlxt4FzxHVC/CCI2ubq2HpeytW5amg2dtCDOUHP
	ead+gAiC6poJUCAQmx++cYOPgvUXDdvX1e3SgMhKRCozWsd22D++mZIJX6RA4ybnUV/gKGkHHtE
	ISxKmXWXCzNZu+gvGu/umRE4ONXArvb26QrvWqzeuFjxvdY53PB26amWDD34=
X-Google-Smtp-Source: AGHT+IGOkJ+f92RcH20P6FRvCUb4ZB4ZG7Ir5PTUGtr/6sJ16N4Q6tuHxxE1VcR2WN2KsnT7qKBGT5wv/l/2hK/T1XVYMJ7+fZDK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ca:b0:3dc:875e:ed8d with SMTP id
 e9e14a558f8ab-3de39550e6fmr6269045ab.4.1750388102139; Thu, 19 Jun 2025
 19:55:02 -0700 (PDT)
Date: Thu, 19 Jun 2025 19:55:02 -0700
In-Reply-To: <20250620010300.3380487-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6854cd86.a00a0220.137b3.0027.GAE@google.com>
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
 vmci_host_do_receive_datagram drivers/misc/vmw_vmci/vmci_host.c:438 [inline]
 vmci_host_unlocked_ioctl+0x1e7e/0x5200 drivers/misc/vmw_vmci/vmci_host.c:932
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
 vmci_host_unlocked_ioctl+0x4592/0x5200 drivers/misc/vmw_vmci/vmci_host.c:928
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
Memory access of size 40 starts at ffff888116238bc0
Data copied to user address 000000000000a4bf

CPU: 1 UID: 0 PID: 6732 Comm: syz.0.16 Not tainted 6.16.0-rc2-syzkaller-00162-g41687a5c6f8b-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         41687a5c Merge tag 'spi-fix-v6.16-rc2' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=136a9d0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1567dd0c580000

