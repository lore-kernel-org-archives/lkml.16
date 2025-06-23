Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25542FB2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750652884; cv=none; b=KiK9NRSmHoyc792CuGSHOCB8i/6kIExMfU1Qxcfyi9Xct9KIZMKV2GmdnvoF2gG5yN4xOc4CdSuLGcwowJPFauouzAGWc7JHse3HlI/NALjWntjZYGpOsgnFGouuL9g5wT3NAh952nbzDBAeO160EMw647BKGCNwKZOuaPUJWzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750652884; c=relaxed/simple;
	bh=sszOZ04ExISycRNK4B4fQqqZeSX1CdavOXWPDv/kvqk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZLVHtWcsF4f7g3Ygx2sW5w2/2gPeeUlCOQNoC2VyiPPVduqnk4jYD2PyyXs+yFwDKYaBph+zTouKFi6jL9XniKLCCez5KnB7orYkuApQ+R+vo9gTevTmtmkjyOpn79ifkgEgsOJ62tXTE5QKPvOqmuANc8x68vOO7IOemnMdf4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddb4dcebfaso105405895ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750652882; x=1751257682;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zct5OHhk6ecwHi0znPKz8+T1+4MxcnWRqgw9X0N5X3A=;
        b=AHgs7//dn0LiWIz0VYT718xIHmU6c2GQRc8WF+YkrXzak8n17Kolt4Y08WZVRwfDVa
         LJohgvup2ILz4/3YcUjz39KqpmbAq2iRulZ5KbKApIehsixSRgSDQxnqh2xMz+HGGhi4
         9SuM9km8vJi8m+sBXVidkcw5+jLyST01bhNRxkR1hFnxpo9mTN287+0/FAN2n9BerQWT
         DgdcUPxHqXnc6O9s3PKG/Aejhdf4zRiRKDbK7BzWPwToxPuZWR1vmkLXFJyUdgXRXnrJ
         UgkQaij5owvr9e3t1E+FGjsMhRGrs2WS931Ad4mIC0SDpECFft+f4onoU0DtRhW0351u
         v6BQ==
X-Gm-Message-State: AOJu0Ywab3Sg8t9U1f9nr81KrQYbDWRhVJNEcW87xr7OnthL/HLC9vHP
	+/BMIkEwKcYOMR1JzdG3SvV1Pa2fyM7YEGbt7N1ZhkO8w435jaFi0HZBrMbWSSGg+mvRszGdymo
	d6tpw/mcuyQi2O1GRMJn5TfpiCDI6Z8ixX7ES9v2aeGLDZdW3K9d743YzDz8=
X-Google-Smtp-Source: AGHT+IH7Tl0kjsU+uef2QWz7SdbF2RX930Yk4uSXB0KxLhEnNPI0++naHL/KiHE6hG6DQQkPE3QMfqXY/AkTVUdyXdJWWtwGHUSU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:11:b0:3dc:7563:c3d7 with SMTP id
 e9e14a558f8ab-3de38caae76mr147290625ab.12.1750652882086; Sun, 22 Jun 2025
 21:28:02 -0700 (PDT)
Date: Sun, 22 Jun 2025 21:28:02 -0700
In-Reply-To: <20250623030312.2337101-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6858d7d2.a00a0220.2e5631.0005.GAE@google.com>
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
 vmci_host_do_receive_datagram drivers/misc/vmw_vmci/vmci_host.c:441 [inline]
 vmci_host_unlocked_ioctl+0x3d49/0x5340 drivers/misc/vmw_vmci/vmci_host.c:935
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x239/0x400 fs/ioctl.c:893
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
 vmci_host_unlocked_ioctl+0x46a7/0x5340 drivers/misc/vmw_vmci/vmci_host.c:931
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x239/0x400 fs/ioctl.c:893
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
Memory access of size 40 starts at ffff88804ac905c0
Data copied to user address 000000000000a4bf

CPU: 0 UID: 0 PID: 6748 Comm: syz.0.16 Not tainted 6.16.0-rc3-syzkaller-g86731a2a651e-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         86731a2a Linux 6.16-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1707a182580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1176f370580000

