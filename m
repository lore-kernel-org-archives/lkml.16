Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB2F1F4604
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680666; cv=none; b=KhjwjqjQ1X3n9TY/vXpIFJ8yva6yqZpgtvTZUKKwM+jV6hPmgYRzuUAMpGcRAe4sBfdFsmpvNVUpVyX34dDBT5pPf1PNtHV6kVpShVitUy+Dx2gxCHdYCFkbUPUoh98yTCyXZRkqWsgoGz/zcuoiF4pGl/OH7n+433XX+Oua8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680666; c=relaxed/simple;
	bh=7nT0WrDBykZ5FvNSeezUjkmVFkAs4KtAsHGFkCHZR58=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ePPPFRwKMHOP4olBVX1QyJEMVuAcqMRWITfw7oXW0acjm0LLy6FIyj4JFLgsutU7NsBdmk+7kWQlHoI6Y3JuFbHYZuD1+uGYyEiqSvPXGpB72mSm2P6am3SeuWaA1XUVioVYQ1CL3WzSB6Zr9X4NYFJJsTBje8x5RrJA8qKzJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so342625539f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680664; x=1751285464;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zO4sbHLEdySPElpGPfo7IA6d34cxe0lvbaegVabyiY=;
        b=oO5z/QOt75qyO2+H59tGZjiJDvzglRft5zVjk05cYtTVP1Wn4XHR/CLEx2CtfrsOYI
         F6hXavChHyT9ZaVAYD6uyremsYRGFwgYtuvL3D/OnWXsmQGj6AutQuqUTm9U38KOsqt1
         uIvuHpNHEOXNSRpQNPkX45utw9EcHJXmOPAxkgDTm/SnT9qMS3gkgKCSZcEPJvw9PxaQ
         dYz24v3CcGBHy7AqrWRgk10aykeRkOxG/taMVFgE/mMe1VKd8LgqfJlp2OsW0ArpsFuW
         g4dt7Pxw8J7JRlqBKXkUG37xl8koCCVAEDVFOmfD/jE+P3cpzA2YwEVO5tTCOUfOTFix
         cuiQ==
X-Gm-Message-State: AOJu0Yw6NAhMoTKzqypofi4LRrgEiqTkmSkWIvH8wbgcoWs1jsnbiGNb
	nNIN156fMMg4ZivPpxfhXYBL55YwNWc7yPOL6Y1mmc3GKFWnscgkfZTuCsi9vSgHPKKEYBF7nEF
	kPnrp9kob0qzz72ZULUrk4RFQ9RQUqDycRZWoqOHm5D+0vktLfKIrnMEJWuY=
X-Google-Smtp-Source: AGHT+IGRrUNCG8Sur4C7BVl05Wf1HdQDtWQoZZrEH7BfMTjJ2XYmn5Esj/MccN+x8ZSVEil3Mv9JDOgvsWPPdKpDE8CSWnU4Hqwm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3102:b0:3dc:7c9e:c3aa with SMTP id
 e9e14a558f8ab-3de38cc2b51mr148221765ab.21.1750680664057; Mon, 23 Jun 2025
 05:11:04 -0700 (PDT)
Date: Mon, 23 Jun 2025 05:11:04 -0700
In-Reply-To: <20250623094537.3353300-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68594458.a00a0220.2e5631.0021.GAE@google.com>
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
 vmci_host_do_receive_datagram drivers/misc/vmw_vmci/vmci_host.c:445 [inline]
 vmci_host_unlocked_ioctl+0x1e9b/0x52c0 drivers/misc/vmw_vmci/vmci_host.c:945
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
Memory access of size 40 starts at ffff888013c6bf80
Data copied to user address 000000000000a4bf

CPU: 0 UID: 0 PID: 6740 Comm: syz.0.16 Not tainted 6.16.0-rc3-syzkaller-g86731a2a651e-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         86731a2a Linux 6.16-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150a0b70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10726b0c580000

