Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AEF1E492D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123685; cv=none; b=XnRkUCIhkZ17eTNqYeow+LXAU18+I7lHZ82wS/KsS4gzuis123Gt0H3ut8qXWNhqeScydjaktNDlr5FbB1uTiwrizTgW7UfGo+nP9dPS+mYLrZ5rtraFEy3I6zGNu/Qpn5HAAE3xm7yZYzvw+SDdgav+TLpzl90TlOJI444elvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123685; c=relaxed/simple;
	bh=V7+8a/C1J8Qp77LV3ic2+/6x11RnzAbS9JrRzqi5SdQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fgB0Zr4EdwU01ollM4THsB02QHmJ+JqmhbAbw3yMPx1r9q91I0nFHRWfyJweyxkxUrzmyNC76V9YGuvGzuS4ZCxvA1JnTsAlkyrI1PsZL/FGGIRLq71dsp7qp7SDUYhJeFgZezbfUo44coMBxRh3o78h+jNVcbtKib5qbt5bKZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85db4460f5dso1103912839f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123683; x=1744728483;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWbbH62VrCQ4vVbyGghFOwf4gqdUfPtMVI90dLrk/Is=;
        b=RiUayIf5gC62wqZT+LBmzVc7ha5961eh6vI2Z/x5MY36PjD5uTtJEppby9v+t4oGsG
         IFEyZ29Skm9faBDjtwuTNfVKZGn6cnPbGp0Z3AYI7BE+DU37anyzqfnSlMZ1ZZXbxhIO
         M5JywFRzRxGh2KnCbh/Dv2ixPUKqFdhH2hCctDNylofDcQSmXYns3p7NLceQ4eE915QP
         YFQke1SqhVG905nbX0F1waZAifcje94USOvrmTysF/HU9wXs3w9IfNbSiqw3Wm69Cp0m
         qjDWpI+/6reIQEjdOcjFjSAAOb79yHeqt1dnGkPDbKR+1PN9TtGM6wt5HrUpnVdzNwNY
         ydjA==
X-Forwarded-Encrypted: i=1; AJvYcCWhb2ydKwr0CJmusGiQP4TQ0kKhxmkM4ANneAqMJ813bkc2f7v7YMvRWBKz+AyMIfBbPl2Qf4WUnx10De8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmAZmsr6Bhu+7psSqSBzI61ZUDrc+Q4BBt7ekzpEr86CjLuUr+
	PtEuST25EZh9iwxeREDWgcvrUvU6urwmvUfq66TEnyStdPoTG4uwKMJDXIDJ5IuQq/tBlW7Zmz1
	+gBBtqpCqGlnOFqG2Aivgn+QfRiPkwny38xLb6HGs+9o+fNY8aMkMgWM=
X-Google-Smtp-Source: AGHT+IG6J/yEAf5OhgyDyHT3WuPRDAh7WJx58cdjk2cgG1prytbrA81YWGNvtGVCu66PZtbmsZ+pkTgLOkzeyugMLiUh8i87zpzl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2284:b0:3cf:c9ad:46a1 with SMTP id
 e9e14a558f8ab-3d6e3f16e62mr166922005ab.13.1744123682808; Tue, 08 Apr 2025
 07:48:02 -0700 (PDT)
Date: Tue, 08 Apr 2025 07:48:02 -0700
In-Reply-To: <tencent_7D179E301BED4B391BC12537BA47BB6D3308@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f53722.050a0220.107db6.05ab.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
From: syzbot <syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in cfg80211_mlme_deauth

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 790 Comm: kworker/0:2 Not tainted 6.15.0-rc1-syzkaller-g0af2f6be1b42-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events cfg80211_conn_work
RIP: 0010:ether_addr_equal include/linux/etherdevice.h:355 [inline]
RIP: 0010:cfg80211_mlme_deauth+0x35a/0x940 net/wireless/mlme.c:514
Code: 8d 9c 24 b0 00 00 00 48 89 d8 48 c1 e8 03 42 0f b6 04 28 84 c0 4c 8b 7c 24 28 0f 85 25 03 00 00 44 8b 23 4c 89 f8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 2b 03 00 00 45 8b 37 48 8b 44 24 20 48
RSP: 0018:ffffc90001acf160 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8880437a4e40 RCX: ffff888000784880
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90001acf248 R08: ffffffff8b8395d8 R09: 0000000000000003
R10: 0000000000000009 R11: ffff888000784880 R12: 0000000000000000
R13: dffffc0000000000 R14: 0000000000000003 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88808c596000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001080 CR3: 0000000011f84000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 cfg80211_conn_do_work+0x369/0xed0 net/wireless/sme.c:229
 cfg80211_conn_work+0x35e/0x5b0 net/wireless/sme.c:279
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd50 kernel/workqueue.c:3400
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:ether_addr_equal include/linux/etherdevice.h:355 [inline]
RIP: 0010:cfg80211_mlme_deauth+0x35a/0x940 net/wireless/mlme.c:514
Code: 8d 9c 24 b0 00 00 00 48 89 d8 48 c1 e8 03 42 0f b6 04 28 84 c0 4c 8b 7c 24 28 0f 85 25 03 00 00 44 8b 23 4c 89 f8 48 c1 e8 03 <42> 0f b6 04 28 84 c0 0f 85 2b 03 00 00 45 8b 37 48 8b 44 24 20 48
RSP: 0018:ffffc90001acf160 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8880437a4e40 RCX: ffff888000784880
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90001acf248 R08: ffffffff8b8395d8 R09: 0000000000000003
R10: 0000000000000009 R11: ffff888000784880 R12: 0000000000000000
R13: dffffc0000000000 R14: 0000000000000003 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88808c596000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001080 CR3: 00000000124d8000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	8d 9c 24 b0 00 00 00 	lea    0xb0(%rsp),%ebx
   7:	48 89 d8             	mov    %rbx,%rax
   a:	48 c1 e8 03          	shr    $0x3,%rax
   e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
  13:	84 c0                	test   %al,%al
  15:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
  1a:	0f 85 25 03 00 00    	jne    0x345
  20:	44 8b 23             	mov    (%rbx),%r12d
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax <-- trapping instruction
  2f:	84 c0                	test   %al,%al
  31:	0f 85 2b 03 00 00    	jne    0x362
  37:	45 8b 37             	mov    (%r15),%r14d
  3a:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  3f:	48                   	rex.W


Tested on:

commit:         0af2f6be Linux 6.15-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c8b74c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=66996a2350ef05e0
dashboard link: https://syzkaller.appspot.com/bug?extid=00778a9a557a2a5e1a33
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15217b4c580000

