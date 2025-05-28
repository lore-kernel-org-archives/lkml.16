Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E528DF41
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451426; cv=none; b=UClJruEjqHWF5gecv3enqh3SClVGdbOjbm1g4UpbAm51hz51zpT373u5vGO6iGnZMd1KiYqiSaz3TWr9MCBZtgLczrWCVgXPzTtXtABPKqOCrSPg8H37tEXRJUKOEyaFLJ3+SK8VUbv8Ytyqe0SnlNgTVKMcjt5vm4mgf9bj3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451426; c=relaxed/simple;
	bh=G/D7Acd8G/tPi26hJnsGneLY2cGyqNunka+FSsBwaUU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=R8bFucz25m8sU/fbI8in8PpIcbDkXDQqa4t17wqV+F7lxn95PG4hn+pQ+kj6Uyc8EM281SGb/cVyc3cw4yPB9sGHwvN8zpILW7oCZrhh/wdaopbMxMfDPrgt5QBW2eq4J2t0hZ8VJ4s+0go4CbKqI5ChGKjVBwSKRet/3F3k4/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso444106239f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451424; x=1749056224;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7H3H7eCiNyuyZVnlj9d0GWKlPMBbKRnaV4AOhCLhKo=;
        b=GG3zqr4AqVQHEYGCbpLZpxrwxtqutSjIxmp3sDbx0VwxainL9N5KfME1doSHvSJQiE
         mrYzrq03E7wt0qIKbC3pNmoNNRNQmdo8ng5I6TvRQLXWLIChAQc199oL/RbNPhrK+m0d
         3pF6iFr9SBMmhiNxaVKk7gmxUwTL4IQQw9nIxaIcF6l/9ocC6DtJ/vxNVZ9FSh3aNX67
         gDjJ/5NcC1N3tdOx6BohvxthNkgYA4Pp4PpEOvZYJNFwIu0ukzVMEifqzvlkk7iJKZ8B
         lNx4Q+RycfBz/08+V//PbcvIJLi61wqxOLuJWwYl2IMiNgodndzgLlcKW+49FyKiUXkj
         lhpw==
X-Forwarded-Encrypted: i=1; AJvYcCXQTOSI9qUxKB4SPRjOYalOwG+o+hgIF3F07uiXWrugOtrrjxgtG8KkdJQEI/ClChiQfAG5cIr68NGLC8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkp55uXy+RzSdkOgqaAb6uMzSVKQYHqMtYOsCB9fQQ3W9aI3dJ
	fxZPgIJsa3YBrMjfoaeJmSSBSlSamHAX4173CvXVzaqPR8wPwRONxuF+giJswMFFzaRZLgmX4s9
	YNawPi6F7Z9beTQY5Z1LF3LGXkCiFjiHambxjYd81ojVdT4HThjZOFse6FPk=
X-Google-Smtp-Source: AGHT+IFghkfLwWgoUMX2nNRgIj/2xBbHXxIjXqhZE1d9JPXLzjHmcYFj+yl80q/gVQJ64/iK3kgEDFsIF+tXd0UMeTo90okLQRjT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3810:b0:864:4b3a:9e3a with SMTP id
 ca18e2360f4ac-86cbb9019d1mr1780175739f.13.1748451424232; Wed, 28 May 2025
 09:57:04 -0700 (PDT)
Date: Wed, 28 May 2025 09:57:04 -0700
In-Reply-To: <CAGR7w83NuUmNhvLTHXC1g7O-dxJQw-Ur6Lsk+YgGtLafkOrdFQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68374060.a70a0220.1765ec.016f.GAE@google.com>
Subject: Re: [syzbot] [i2c?] KMSAN: uninit-value in __i2c_smbus_xfer
From: syzbot <syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com>
To: abhinav.ogl@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KMSAN: uninit-value in __i2c_smbus_xfer

=====================================================
BUG: KMSAN: uninit-value in i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:481 [inline]
BUG: KMSAN: uninit-value in __i2c_smbus_xfer+0x23e7/0x2f60 drivers/i2c/i2c-core-smbus.c:607
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:481 [inline]
 __i2c_smbus_xfer+0x23e7/0x2f60 drivers/i2c/i2c-core-smbus.c:607
 i2c_smbus_xfer+0x31d/0x4d0 drivers/i2c/i2c-core-smbus.c:545
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
 i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:333 [inline]
 __i2c_smbus_xfer+0x84e/0x2f60 drivers/i2c/i2c-core-smbus.c:607
 i2c_smbus_xfer+0x31d/0x4d0 drivers/i2c/i2c-core-smbus.c:545

CPU: 1 UID: 0 PID: 6939 Comm: syz.0.19 Not tainted 6.15.0-syzkaller-03645-g3d413f0cfd7e-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         3d413f0c Merge tag 'audit-pr-20250527' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=164083f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d8d64ec943874853
dashboard link: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1157abf4580000

