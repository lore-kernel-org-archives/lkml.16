Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4100DEED7
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 03:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750561325; cv=none; b=SS2PQvLw2MjTJ7Ayo7/WpTcd52wfGViI62Fg6mfBQEwQIgt3nVGbER3cJ/09i+yRKrRgjAn4VXbxorQSDASKtsEhKTDdKBYURMaIq7lt5DjAkhZzmNfC1UhyGLkcIGCy2yxuprGRKh8NnkSHu9PdHNB+8TpYHDLshUs5lk9rdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750561325; c=relaxed/simple;
	bh=uQY/pXON+7kqcAGGakGhKkhOBDfTHZ5BowFGH3CFrSw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J52KT/qybrtAJS1lP06RXptwlllKSulqiqq/qjlykRav5vxdTwiRPzYB3gtnVRthef4Foxeg34dfPyKCISUncRDhq0+eArIqoi76MSaXmhR4vyS7cLnYj569Fmjg8g/3B++U+WAsG595geMCF64kJcZrwbVwsWErBt4ei2TQmbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd045bb28so27297955ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750561322; x=1751166122;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=goLFxmuyVJniXx7jhyhulLsErD/Y27Ozu1KoHtUs2sQ=;
        b=pFcd85hkdAGXpSQvzDr//cTm7nWD3siKCFVimQRKLHe0IXm98vhPfzYuSHxwpqtGax
         h29SvNrD/cZX5s+CndiU6KcQ2Vs+SKpB7s48t7D2qZGV3d6HlOeC5V7ExT8pdjo8OnNR
         nUOgU4JqbXw+rs3e8ebjRelGUZOSzNgCMwOnzs8SYfT9G/WKbx+RiGVj7fKupuWedX8a
         fo1Cv+NAU4iH9/dmxV0VUd46g9TE94+cMu6qv6scIdT/WPwINl7pRiwHa6DCjs26XZAn
         CRvcGhhabKVqoEvuX6WiEHS7ZReyLm6IrPqbdtdfQ3n+KGkM8fVS5TzyKZhhEQOkScRs
         3+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcbKOxGZmPe0EgaohbG3y7Bsi6TbpTyqg35Qig86SpqGEBL8nCAg/peBFKesBiE3WUt6qHQTWINh6ciXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmkjoY+WzMj5cj+DmsJOHy77o6agKkkxRuc2MD5uayIgys2rNZ
	TZbqsuJJ5BgJdldBHoVONfBKkSrTvneC+aIuPDtWVKTIjvGz2iKJP9YPnuxYF4zy+qJZU1+gsbV
	lYfBUbBsfiUfUq8D2SCtk63XkokVbGAEGITz8lkaeTnY1p0xqVnYwv/mNQqQ=
X-Google-Smtp-Source: AGHT+IGbzJfApNYmL8DEg3WCeAKuXq+iVU5LpmXPlq9wslssayX7jksn+ah0wWIML/CAycsYlQ7FlSQ5wxEyLUan3prmmV5Fvtjp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cc:b0:3dd:cbbb:b731 with SMTP id
 e9e14a558f8ab-3de38c54871mr80690615ab.9.1750561322290; Sat, 21 Jun 2025
 20:02:02 -0700 (PDT)
Date: Sat, 21 Jun 2025 20:02:02 -0700
In-Reply-To: <tencent_DC992CCFD60DA625808DAC12465DA2DDA907@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6857722a.050a0220.bba34.0002.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
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
 vmci_host_unlocked_ioctl+0x1ead/0x5240 drivers/misc/vmw_vmci/vmci_host.c:933
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
 vmci_host_unlocked_ioctl+0x45cd/0x5240 drivers/misc/vmw_vmci/vmci_host.c:929
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

Byte 31 of 40 is uninitialized
Memory access of size 40 starts at ffff8880219a0880
Data copied to user address 000000000000a4bf

CPU: 0 UID: 0 PID: 6814 Comm: syz.0.16 Not tainted 6.16.0-rc2-syzkaller-00318-g739a6c93cc75-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         739a6c93 Merge tag 'nfsd-6.16-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12580ebc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16fdf30c580000

