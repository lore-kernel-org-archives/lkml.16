Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F464219E93
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509925; cv=none; b=XDo3F4dtDtGD6T4X34EBOh3HLtLVKwkKMPXtyUSZTgIFrhU2F8mjW70xLL/FmYTTapYme41k6P9GnVHm+fgcn7xiF8cyXaZ5VhMibn21YDVW/XUf4XNEEK79s5F5BsDPf30ZaqOr4FzFBSFQJT+42PvcAGOV3aC1YExGxxrWAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509925; c=relaxed/simple;
	bh=UJ6ezAlAShPnmVgIwZDMjYr9pcRvMP/YLoLr6IYK5UI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=H1hK2gYf7/vltSqN+kFNVW5G+HfwSFCSZYZyRfrddoYFnYsjzVRwjLKuvLDrpX/amrF4PfoP86T+lo8aebiunf7e+6Kz9l0kyjyA4N56Y/JcVruOC1xEZdZflWUXQrw3QQd3zSKHXwPfEdNBi/jMLmYVsqS8gsxwIIYSwhHjTx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dc78b79129so6571065ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748509923; x=1749114723;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgqA6WYLlv6HaseaNManWLRCIGCkg9e+ZyO7LDpoLW4=;
        b=mvzEEpv4owUrwLTPicO8dB3jtq6++lkiDrfwMdTQzX91m7ASlU32RUVi/aS36/Sz3a
         kQEGZ6ucSgZVxj6qjuXOLxPwbD4JG9A9VApoqDa+4uJKDU2zYjcKZrbEducT+AdIFbTZ
         E8H+9myJsWIP52NL+WL7xPh8HwE3LYiA4+sFr22qh+asAnX7fBVzLLJm2TccpinrC8/1
         76U1By6eDZ9VenDHqPllPgL1GJSBeIVgbck2/g6FVO+z9juvlcntYQp0EsN2gtU+MrGw
         fdmThzhMYnVtjv//ROj13xQMSUsKQbFLcwPQig99p+V2gRYcC+jLi/Bl49hQa0x1h4va
         rVJA==
X-Forwarded-Encrypted: i=1; AJvYcCU8v0xeNpcnR4U0WbOekhZ06onjR7GjAAF06L/p+6nDvmA6GNaCHtJKXfFeoeboh1SzXypqsvzg+rv91cI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLddJ//ycbmjskyIjYl8+y/OGYVeW1ig+nN9s4+YOvyb45YSNd
	0TUiZ06D+9X05COHBvMFPn30mBn4pvqh/xuz7IRtjygj4NY31tlC/ycIbRLqR3xDL8HjeqlSAPM
	WrmtDvfGHSE30SqE86ZdL+x+z00MkFoRuq60vHQsnQRytfolm/MjDqQiYJPk=
X-Google-Smtp-Source: AGHT+IEPWGixRGapfARq187CTUE/YoqnJN7QP3ehKMBybddukrFsnjZn6jS8HwW1x42NZGf+n7904+bb6BtixjU2v24A8EZ6CPJb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160c:b0:3dc:8b29:3097 with SMTP id
 e9e14a558f8ab-3dc9b697412mr224679275ab.12.1748509923226; Thu, 29 May 2025
 02:12:03 -0700 (PDT)
Date: Thu, 29 May 2025 02:12:03 -0700
In-Reply-To: <CAGR7w81Zq-HhXvfgXpRM9FPpy67uxQaM_DM8nwN5vEU23oPRqA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683824e3.a00a0220.52848.0001.GAE@google.com>
Subject: Re: [syzbot] [i2c?] KMSAN: uninit-value in __i2c_smbus_xfer
From: syzbot <syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KMSAN: uninit-value in __i2c_smbus_xfer

=====================================================
BUG: KMSAN: uninit-value in i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:484 [inline]
BUG: KMSAN: uninit-value in __i2c_smbus_xfer+0x2542/0x3140 drivers/i2c/i2c-core-smbus.c:610
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:484 [inline]
 __i2c_smbus_xfer+0x2542/0x3140 drivers/i2c/i2c-core-smbus.c:610
 i2c_smbus_xfer+0x31d/0x4d0 drivers/i2c/i2c-core-smbus.c:548
 i2cdev_ioctl_smbus+0x4a1/0x660 drivers/i2c/i2c-dev.c:389
 i2cdev_ioctl+0xa14/0xf40 drivers/i2c/i2c-dev.c:478
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x239/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable msgbuf0.i created at:
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:335 [inline]
 __i2c_smbus_xfer+0x864/0x3140 drivers/i2c/i2c-core-smbus.c:610
 i2c_smbus_xfer+0x31d/0x4d0 drivers/i2c/i2c-core-smbus.c:548

CPU: 0 UID: 0 PID: 7066 Comm: syz.0.33 Not tainted 6.15.0-syzkaller-07774-g90b83efa6701-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         90b83efa Merge tag 'bpf-next-6.16' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13654970580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1da44e3e5e6013db
dashboard link: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12534ed4580000

