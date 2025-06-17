Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24717BA1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128785; cv=none; b=bNE34PyrS8qCUgvR2BVmd6KpIsbiTU7lE67CFaeGsfP8wt/d6fN1aXPMXi8tjceTgm2sbzd9Uy9BDh2/h7ObnuUWfJuxlFOv/8QM2GmtGIB2Jp4L8zkuk21jSPjZiicSa5pKtzZApblrDxxmvAzD0l7FfwXnipIIn7D3tCBu9iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128785; c=relaxed/simple;
	bh=Ma1fNI91lcbO8HB+OuMK7VwNpwntZn/e8tc2AZPU5Sc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=o1WXCa2dXTx0KYmMGh1Nd1CXDiA/WoCMnhDpcgRp3vbFRoPcC5X2jytFr3xDf03sWS3uMMoebD4evHWDfPs6VLwtUJ7Ep/Ph5Oiy6PZsVi6Eugmsread078ij0TMqTVAGKt3EC2SaLdH23HWvMddkWhprpjzHyQJ8QxCCtMkprM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso557309039f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750128783; x=1750733583;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pIQQQ55YxrBtpjRv5Zzi7mN2PHh2kBOFO2YwLCSOasE=;
        b=LM/gjGGtt9n5nSX8cMIHci/mj3Nz6xrXkJwyKz0XTBPLVfOxpO+g08hmBr8+Ycluu/
         wzuiSKANB/mXayWw1JBIfYYNy77NgCgkwkmJxdTWOLF/p2htbOZTuxDnCV+6rpfGtqP6
         2n4KxGmisUKz3UFPZOouVc7IMoALib/5NgbN5k2DPgsoadSV7tFvTfT4rym/t7o794qu
         p356Z3BxaubyX58BeiVfJbK/dFXP/dHGj17fAP9qyFLeHkHRTclqW66CljFhZUdO/GJf
         Ewzrbb/DF6YKmIKXoShk/LSSZfMjqxdHXSDNrLHv9aqr63/4IC8cThjo6kfmlQRfxdt1
         Jskg==
X-Forwarded-Encrypted: i=1; AJvYcCVV7bOjzojiLMO5w5InbPqT+2268svMXW5ghM966OnPxOb8LODMUw9CmKlTTQo2aHeEi438sE7tK1e217E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwatOXWUjCBmgfrkDDFDBN2VtTtKpCETvulr3H2D4QzctGwtiCy
	8jEu5t5vRlafibooG7DfT04qOi79NMgnSPLOT3iev4s/ph/ifLIG2ZwufF1kA/m+zX3tfisac+0
	ElWXgvgydJhgwsAXOCwwRKnfSBANIYJiuK1FsI6vY5lkMqWreQo2C6x9E0NI=
X-Google-Smtp-Source: AGHT+IFpu7dIfxfQ3/2p5h0KzioY4HV41vMr1bykEVJtPp92THLg/yDZ908t661LI3GXSgcdFz/WJ8T1VRLz/YdOS5n4qbe0TjnA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a44:b0:3dc:7df8:c830 with SMTP id
 e9e14a558f8ab-3de07c55a19mr127001305ab.7.1750128783340; Mon, 16 Jun 2025
 19:53:03 -0700 (PDT)
Date: Mon, 16 Jun 2025 19:53:03 -0700
In-Reply-To: <tencent_B943771D66763DE13764960E36124B6C7509@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6850d88f.a70a0220.395abc.01fc.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
From: syzbot <syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon

wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in net/mac80211/mlme.c:7224:41
index 3 is out of range for type 'u8[0]' (aka 'unsigned char[0]')
CPU: 0 UID: 0 PID: 13 Comm: kworker/u4:1 Not tainted 6.16.0-rc2-syzkaller-g9afe652958c3-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:233
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:455
 ieee80211_rx_mgmt_beacon+0x21ff/0x2c10 net/mac80211/mlme.c:7224
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
CPU: 0 UID: 0 PID: 13 Comm: kworker/u4:1 Not tainted 6.16.0-rc2-syzkaller-g9afe652958c3-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x99/0x250 lib/dump_stack.c:120
 panic+0x2db/0x790 kernel/panic.c:382
 check_panic_on_warn+0x89/0xb0 kernel/panic.c:273
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:455
 ieee80211_rx_mgmt_beacon+0x21ff/0x2c10 net/mac80211/mlme.c:7224
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
console output: https://syzkaller.appspot.com/x/log.txt?x=15fdc90c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d11f52d3049c3790
dashboard link: https://syzkaller.appspot.com/bug?extid=6554b492c7008bcd3385
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11e195d4580000

