Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D21459F6
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750569544; cv=none; b=HpOs4AoNKpplsMRMMvNcNI5/X9BmrU8HaIfKmXUXyHL3Q85NlDIwZcAUNsuHdfG03LJLKrUOTRWDiuxG6F5ky5Bbfo3iB3Byiufqs7Ezks4C7RIE4IjP+SuhQn8xUQqLZVReQWx0QqJiYvSGfNuNQ05oXWl2B0pX4gAsWiHO8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750569544; c=relaxed/simple;
	bh=U4AiRsbPPCAHbz/XLAd6rrTpFIr7TntUer09KzM2vlc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dGRHY0Yrt1Gk88GHMQ6K+iErZPfIWutUWWjKyGa4OqQ8D4mOSpFLv+DmvjHthumEHnOaL9Ua3Nkdus3YWE/2EdbsFg7kn2CpSM5QJ61y0q30Au2oVdw/y3f4tOPKubtXu7fLv3CGjYTvVPycl6bkNXnKx0p7W+lryltQpNd/6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3de0dc57859so30672105ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 22:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750569542; x=1751174342;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpv2ROL0LWyoxEugpot2FMMru148+1TNHtu5oP9SL0w=;
        b=uXWhsHMz7ML1Gb+R1fDbdsFLbbH3eDNOq3omASOhhttjt742XQZs7Xh9bMi9PypCLv
         0QikJIECNlNHSRsVOL053flCDXvqjbodaU3xKL2p2t42Sfdbax0fyQKXtuelrFM5TWDy
         U8G94QOhO/7e/U1jS6mXF2oc27o1TGp8Kkxt9RQ26PC6pzXHuhRgdDG94NyT1KjSBB+B
         irXZHSjw3z8EuCceEfxzcIfGCCCx4kXrbuycrtlmzV9dN2Ue2tzDnAa+pqZAJY7+ACJQ
         jpKhaBw7Rtgpvtb+LYtLPfkQPAY2PSxZ/j1+wayw7APA8j7yQEXWXU2SOI1bds8XbAIU
         ZU5A==
X-Forwarded-Encrypted: i=1; AJvYcCWBQbBd9gcs6WivrfBGmKZtZe7hA2ufAe3Iqzf2pTZ+7v7CruBnJ24DP4Xa/JnzQptNpwrei7XdraaZji4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi8woulvWSts3HXaeq0MWxHxI0YBCPzijQbrhv0wZl0UDmaz5P
	4VjK2Ka6G1yGWZnxzKz/kqpsz2BE1u1sTJyZEUVwb+uCzrkpYDZ1mq+OZVAPNbKjZjmUgA6CrnX
	U5pNjYYrC4Ef7clqUGoBF+2+XpB0TdiNIJxAr8RfJ+4CDslIBx/AwT0YGCqk=
X-Google-Smtp-Source: AGHT+IFd0dAJuj69QITmP1AaUqSU20aHJEyvElVUMyOXCo3cNAiYPZD/BrdFzsR8O/Xc6fZQFNYTT2zK3TIF0qVETV+huV6xTuE6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:178e:b0:3dd:b4f4:2bcc with SMTP id
 e9e14a558f8ab-3de38c986b2mr74603765ab.13.1750569542396; Sat, 21 Jun 2025
 22:19:02 -0700 (PDT)
Date: Sat, 21 Jun 2025 22:19:02 -0700
In-Reply-To: <20250622044632.1474-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68579246.a70a0220.62859.0001.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl
 (3)
From: syzbot <syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
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
 vmci_host_unlocked_ioctl+0x1e74/0x51f0 drivers/misc/vmw_vmci/vmci_host.c:932
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
 vmci_host_unlocked_ioctl+0x4579/0x51f0 drivers/misc/vmw_vmci/vmci_host.c:928
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
Memory access of size 40 starts at ffff8880470d5780
Data copied to user address 000000000000a4bf

CPU: 1 UID: 0 PID: 6789 Comm: syz.0.16 Not tainted 6.16.0-rc2-syzkaller-00318-g739a6c93cc75-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


Tested on:

commit:         739a6c93 Merge tag 'nfsd-6.16-1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1392b30c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db26f33438d76de9
dashboard link: https://syzkaller.appspot.com/bug?extid=9b9124ae9b12d5af5d95
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=167c2182580000

