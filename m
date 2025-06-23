Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E119CCEC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670885; cv=none; b=TI5n9WAtCWCOzlQQW3fVvOC5WZ223Io4T0bf7F30Qx3Datg7Kjg7iy4TAL0LPNhLm0/Mck+2nXKDC30v13g8q+MvCGQ1HCsB+dVoqG0p7r+9McwXS8ZiHMBIchodfpopJLYSTxpMHBrf6TvJHmJV3ievzVbkmqTd68iKBEhSJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670885; c=relaxed/simple;
	bh=kWp+U3SeloDqZK9P9oT/FPSgJQMzRGNUhDhwOD1oUrg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dTLUdso+3fEU7UXiSiRqyGrAZC4gKQcVRn3qifUuF3UxDbzCWMuHoaNvjoh7u4yAdhJrIETdQ1nKOw11TEhk3VQ0F+v49jd4FsFkbXI/TxkjFKFUt4YNPwC8MVH1rlmKWg4Pwg+tyAxj6IvRN9l7k+cjg8HUC437ANDJPxOcAcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddcfea00afso54835325ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670882; x=1751275682;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGmrMuMpdWZSYI6DROsbSwsitajxWTPLRmdhRxd70Ck=;
        b=hOK/NqJrUDkERBaG5qljrBoyxsYd+xLGNF/ORNCPW51els9Rgm0WyBIRJLxmLqY8B9
         L6L7b3TOlSTD2vy278ta9bx/jGBLVoqlssAJWI0vrnRkLHreMPIg00gz/vGXC4l3hwi6
         gs0L/BoDCrJyRBxZHE/fhXD9kf7t35SQNDEvdRVVAj4V8Zu2qoWYTx12jawAR+MmGoN3
         xISEWe82rFWHDssoMZVAcdupzlavkAu+8uojBAtCQ473iMR44xdHd2ub1ROCzJmUIpUU
         HnWb9Wa4EM1k6ja/JVs/g62NKS4Pd5/x1eHFmQ0yawEvZrsLKA5M7xnqnOYnxuFTBJiC
         38Uw==
X-Gm-Message-State: AOJu0Yymdehr1sUhspgMj2cqbehew/ssrtFC27RL0rzRC4SQ5F8n860f
	Y8KoG8cbxlc5K0A4+2prfDMSd504Von5AMweiVy3DnmB0ALBO8fKzVgazRzip7k70AmWLEZDhZT
	bNSB0KwmbpT210YSOSI1IKFJO8TMAIB+RXtEgRrTIK/II99girFNVC16hjso=
X-Google-Smtp-Source: AGHT+IGimlpY+7tSSY+1JTQhrY5dOIclOv4Tu1SBePPsf/BpXwQGY+lAQZ/rfHBqJT/niL8nivob/UMAXKd4YdavUUCDDT4E/Vr/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1546:b0:3dd:c78c:ec3e with SMTP id
 e9e14a558f8ab-3de38cc5e7fmr141650165ab.22.1750670882622; Mon, 23 Jun 2025
 02:28:02 -0700 (PDT)
Date: Mon, 23 Jun 2025 02:28:02 -0700
In-Reply-To: <20250623085022.3182174-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68591e22.a00a0220.34b642.0006.GAE@google.com>
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
 vmci_host_do_receive_datagram drivers/misc/vmw_vmci/vmci_host.c:442 [inline]
 vmci_host_unlocked_ioctl+0x1d6f/0x52d0 drivers/misc/vmw_vmci/vmci_host.c:942
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0x239/0x400 fs/ioctl.c:893
 __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:893
 x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable filename created at:
 ima_file_mprotect+0x78/0x800 security/integrity/ima/ima_main.c:500
 security_file_mprotect+0x141/0x590 security/security.c:3012

Bytes 28-31 of 40 are uninitialized
Memory access of size 40 starts at ffff888021ad2880
Data copied to user address 000000000000a4bf

CPU: 1 UID: 0 PID: 6749 Comm: syz.0.16 Not tainted 6.16.0-rc3-syzkaller-g86731a2a651e-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         86731a2a Linux 6.16-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112fdb0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16bff370580000

