Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC921EB2F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750123864; cv=none; b=ZjLATrbBj5p5YJ1cdwoSeM8RA4b6C+ey3KdFYQ1dPaiZmuSmir4KwPpH4UipvPloCgNBCON7VPFIaPR7wsMNbcciYE4HsSsefh1NO68yDX4gfCHp4iKUYFr6h0mD7a3tGzpj7s9+7H9gtpcztcXT0WpkgWMmu1Vnv5OQT1wZKQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750123864; c=relaxed/simple;
	bh=I+zqYwAfK+YiEx7uIfOv1HGtGN28Ut7HY8HBmwKNkIk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HkupLiGDKEeLgbm4Tt6ZR0zxYuVOiq0Hx27r1YWRx6iD2wp4QjyQL+hfHNv97FuItUfZTaoRw0uL8yRVbUPmtiBOfAjP5BQQ18eyJ6FGWpMzv7fs7WVZq6dmIcE131mlU+MJl1Ya4iX9r5/05LocqWsv6jMuve0brBGF7b2xTMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd03db24dso43704665ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750123862; x=1750728662;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FdNNSnjRFE5bmr7BMXeWp1oDtnA0sIisCoz5qpy4pE=;
        b=Vt5uh9W1uDLY/npzUs9noag8uPy9ohhr/zT2TsXXBqrhtQfomQy29qL/0knGJZ7VRl
         YTFKyWLv1v9LnqatPWmJTgiDXT9WWiUxnmxFiruFpPML/AUMCfA0C0mCV8w0VB5ryED/
         xWJ+g1QeZV1ZdmhEAN7ByH4QfsXpK83Hlvy11rVoj/TxlirVBsoPaVZ0uTGXnYoXoYQ0
         WrTRPWfS0eF2dvMMTYr7uebMcILkx3u346frq8MaqhkeY2qkMm8KHwBjkAURHVUrUl+6
         bmRifGKYdMJONZ31VGAQdxK3vnnsbj2d/jZWwPSXIIqLKYuhqfPsRDW9z8XAbew/JxML
         3osw==
X-Forwarded-Encrypted: i=1; AJvYcCUJIztvweMqVwruBBe8f0i/v49UXaI2APgE3oe9CMIZKAgDlI8hv8W0RPdoC10UzqEIf1oq4r5GSQdzU1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KrTVusRLpetiPkfHsW6tyCJwXdyXYrHDjwtrJ0zBZCGeNvaI
	cZxH4/2cOchQqoTMIIHblSlLWTBwe02ns5yqSleFzW466OMM2cUMGVt9VF+q1iC4uLBFkHz9Tyg
	IlJhgOdwEOqD9M1168lpV51F50R0KTlV53snrc+w+cau5vjt+wRrUQxSulj8=
X-Google-Smtp-Source: AGHT+IGzTAA6QX46exnUcGEVeRIZkqCnSUQnFanMcn11v+cWM7IV6+oruhWuq+3WeMhpnGvP3tkS85acA6X+nYCmGkMZv7Rbyl66
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:338d:b0:3dd:cc26:61c7 with SMTP id
 e9e14a558f8ab-3de07d34062mr133154915ab.20.1750123861978; Mon, 16 Jun 2025
 18:31:01 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:31:01 -0700
In-Reply-To: <tencent_E537B64A4A759576C7662A3C9D3784977009@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6850c555.a70a0220.395abc.01f6.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
From: syzbot <syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon

------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in net/mac80211/mlme.c:7224:41
index 4 is out of range for type 'u8[0]' (aka 'unsigned char[0]')
CPU: 0 UID: 0 PID: 1041 Comm: kworker/u4:8 Not tainted 6.16.0-rc2-syzkaller-g9afe652958c3-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:455
 ieee80211_rx_mgmt_beacon+0x24be/0x2f20 net/mac80211/mlme.c:7224
 ieee80211_iface_process_skb net/mac80211/iface.c:1630 [inline]
 ieee80211_iface_work+0x49c/0xfe0 net/mac80211/iface.c:1722
 cfg80211_wiphy_work+0x2df/0x460 net/wireless/core.c:435
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---
Kernel panic - not syncing: UBSAN: panic_on_warn set ...
CPU: 0 UID: 0 PID: 1041 Comm: kworker/u4:8 Not tainted 6.16.0-rc2-syzkaller-g9afe652958c3-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x99/0x250 lib/dump_stack.c:120
 panic+0x2db/0x790 kernel/panic.c:382
 check_panic_on_warn+0x89/0xb0 kernel/panic.c:273
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:455
 ieee80211_rx_mgmt_beacon+0x24be/0x2f20 net/mac80211/mlme.c:7224
 ieee80211_iface_process_skb net/mac80211/iface.c:1630 [inline]
 ieee80211_iface_work+0x49c/0xfe0 net/mac80211/iface.c:1722
 cfg80211_wiphy_work+0x2df/0x460 net/wireless/core.c:435
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         9afe6529 Merge tag 'x86_urgent_for_6.16-rc3' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12db1e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=6554b492c7008bcd3385
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ae190c580000

