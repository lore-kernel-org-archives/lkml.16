Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF32C33FD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 02:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743819448; cv=none; b=ldhVW18QH0hfNZn1Vx5ifg7PXfws8kHst6tImPg28qG1b3fJYdOAcqG45iyEoRTD7JRpVQiHYK60ZSELR/whuOI9L1AggQckUmTV3meb37Xq/4qXZiFjyDqdLp+U9NNO5VlKFxhOIKq3jBBBKt+fUBhhkYwu6oax+S6+1EdkzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743819448; c=relaxed/simple;
	bh=VE4ZqmH9qeb2H5bgc34Kqry1FAWH4BX2S79NGkfvMD0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pGnaWqyrrqfhEXiYHhp87j1u6f8lZVf7T76E7zbjarCVYHfibgFBHLS6xNPfp7rTy9AaKu3wb20o7mIU2E/y7o01M0/fbhveAMRcb6tQFUto129zVUaTBR3k87oAVpmLVVUTF/znAaKC+aSsWnAuADKw+zszIwBfaNJRtQEOZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d43b460970so54035515ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 19:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743819446; x=1744424246;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpnBAfM4qhuAgDMWO83CoYcvdmUbKhSinhUkIuqQoTk=;
        b=HiLPFsjna9OOf9X6rlqOsRzkZie8InopeMhfO3+9QYnXOjxsoCwRcREmu6xJkOImZ4
         e0Xk0HcGb649twLeIzwk1pyI/r8BqdF2UCTVZxJFGvMirWDWFo/KMiFY+Wh9XW6Rg3yO
         y7VYw3jLOMG6Y/QTM/Ab+YIjqm4EkQRLN7uMoEGI63z4pcVtGG0RDzYL6/2TFzL/M5VV
         VkL6YDdsK+OtoSQMkT65vx7pylFPIm+wNYLeSiz8C2jR7rJwbZIEmdKsfUuOrASOQ+bl
         9fi62P61whLF6dIqX6I04+qEvYVuVZMhpfxK+8l4tjntpbc1i4CGyQr/uGBzAEmF8F84
         AA0A==
X-Gm-Message-State: AOJu0Yy9xIfiYRv6WkAdsilI6RB6UWKG/JfGQ/PkTxbfMHPXf8t8sW3i
	TqWQulcahb/pAaKKOEK8XceZwbQV50oJhjLjFqTkXlBpE6tyvXyUmnrhI7YpRbRTuyAzXbELVrf
	iPFtrzaAtvByN6wkTwSwko4tvRZPtWWpW5W92jSRKkX5i5QOAVIKSUDXGrw==
X-Google-Smtp-Source: AGHT+IG3G67a6Sgd7/mRMdBUyMuLMc2OZnTB9uJeOwPl6HE/W8B/zWSxy68OaplcgyH36x24pIW2fzADSIRBT9rCHy8g+yNproe1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3186:b0:3d4:3ef4:d4d9 with SMTP id
 e9e14a558f8ab-3d6e58722dfmr50493145ab.14.1743819445985; Fri, 04 Apr 2025
 19:17:25 -0700 (PDT)
Date: Fri, 04 Apr 2025 19:17:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f092b5.050a0220.0a13.0229.GAE@google.com>
Subject: [syzbot] [media?] KMSAN: uninit-value in cxusb_i2c_xfer
From: syzbot <syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, mkrufky@linuxtv.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4e82c87058f4 Merge tag 'rust-6.15' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=166a7bcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=378acbc45ac948ee
dashboard link: https://syzkaller.appspot.com/bug?extid=526bd95c0ec629993bf3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13488fb0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1595dc74580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6045aa9da8ac/disk-4e82c870.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1adf8802c9fe/vmlinux-4e82c870.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9eb6c71670e3/bzImage-4e82c870.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com

dvb-usb: bulk message failed: -22 (3/0)
=====================================================
BUG: KMSAN: uninit-value in cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:124 [inline]
BUG: KMSAN: uninit-value in cxusb_i2c_xfer+0x153a/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:124 [inline]
 cxusb_i2c_xfer+0x153a/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 __i2c_transfer+0xe25/0x3150 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x317/0x4a0 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x125/0x1e0 drivers/i2c/i2c-core-base.c:2343
 i2c_master_send include/linux/i2c.h:109 [inline]
 i2cdev_write+0x210/0x280 drivers/i2c/i2c-dev.c:183
 do_loop_readv_writev fs/read_write.c:848 [inline]
 vfs_writev+0x963/0x14e0 fs/read_write.c:1057
 do_writev+0x247/0x5c0 fs/read_write.c:1101
 __do_sys_writev fs/read_write.c:1169 [inline]
 __se_sys_writev fs/read_write.c:1166 [inline]
 __x64_sys_writev+0x98/0xe0 fs/read_write.c:1166
 x64_sys_call+0x2229/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:21
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable i.i809 created at:
 cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:116 [inline]
 cxusb_i2c_xfer+0x323/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 __i2c_transfer+0xe25/0x3150 drivers/i2c/i2c-core-base.c:-1

CPU: 0 UID: 0 PID: 5806 Comm: syz-executor225 Not tainted 6.14.0-syzkaller-10892-g4e82c87058f4 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
