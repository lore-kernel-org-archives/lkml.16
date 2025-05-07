Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F2B1519B4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625445; cv=none; b=KT2AIWGUvUbZ8Irzl3SHngxM9b6MfB9GBGT7Im0lLFxjinjdPw869Xk8BuR8d//cUwsVcriZeE7+S+7EP3uJ84+xYf/BSH5amDKJfLnCYXPpeM+NZDpx8OMQ0CFOwQ+OyC8n8zs4DMQAuALj14jKaR49ZmGPeoU18MiRNgTLgXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625445; c=relaxed/simple;
	bh=bU6M64ozOuHXh4rzHPfcADY+m10TphbPzKq2+bK8xbQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V3y1NbOwMhpoqHsQk033Io53Vzbo8fY+JYq/+7S/devx+Co6OSwgpkb76aTnjpY/Rlpm0d0RuJp1ncMoEcy0bS4NN3hVpLIX1k4ERb/iLaKo3JhpEuTZqKv12f7f1W1xX7SMwEa/wMksu8DY6rp/luB+dcAMh5Pmmx5McbXlb6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d81820d5b3so129208355ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625442; x=1747230242;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iDa93ES83plZpL7tb6k2OHPH5S1SQ+Bz65S5AwwmaB4=;
        b=ieQSwq1RN8ksvo5sg+tkYHzVDpaiZyZXk5Q0Hm6BuecpzKLhyKba/hhsrNHL0T4qxr
         qfYe8OjVjpsl4fjrlkMtp6rbI20inRdbff5xhN2cgp3nwXbf6h3WipyEgum3uZ/CoXPO
         y/aUXnAjVoMAabKNGH3fkGGNkkPWYw865PpQ5qDnPqrhl1uVGpRwJNF6vwr3aNLJjXWx
         7GiBaMfr44rDV49gXNBunl/r9MsEtYX8M+BK0meh6L/wA0Tv6GGt/RKKM8KU4U3uQQ98
         3ETeaMFH5isB7XGn6R1z+Sr2pla7L9N20Zyu/6mVVFWpFjTR9KUxu7z47CU/IOqKhCcX
         LOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDcibWXYjmQjhrn93lT+jt1B4Z3t+AUZzV1UbezNIrk1M28CVjMBuxzJd4FhFPSKf4A+wJO6Azj/JGP00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcnWNVS9czMf053LOOfr7z2GYwU+NVbNmR/GA83xR1vs/WPxeG
	GHrUrnWh1NhLVEm3QXFHnBgBE7DRQaMzaSZOkRjE6/P6l5augl2v6yUIm40iCP/DBK6WkHNcL71
	Noi8UbJreyqY8D+4Tr9qczuU1ayQt4U+UKzU+0zlJt4hUMmt3bMXWBJ8=
X-Google-Smtp-Source: AGHT+IG0QsNl8GqWWKtOKaV2g1S4lDM/OBbuYY9h9Npkr0TqZ/4CCoBU6/ffn6MunDHRUwLdvmDYSAxtdJ13ywbtIlwvcYBxjTmv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:258e:b0:3d9:6c9a:f363 with SMTP id
 e9e14a558f8ab-3da738f9654mr28445295ab.6.1746625442548; Wed, 07 May 2025
 06:44:02 -0700 (PDT)
Date: Wed, 07 May 2025 06:44:02 -0700
In-Reply-To: <tencent_E9E91EEE86CD84787A6EF82C196CD494640A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681b63a2.050a0220.a19a9.0021.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
From: syzbot <syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan

wlan1: Trigger new scan to find an IBSS to join
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in net/mac80211/scan.c:1214:5
index 0 is out of range for type 'struct ieee80211_channel *[] __counted_by(n_channels)' (aka 'struct ieee80211_channel *[]')
CPU: 0 UID: 0 PID: 47 Comm: kworker/u4:3 Not tainted 6.15.0-rc5-syzkaller-00032-g0d8d44db295c-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:231
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:453
 ieee80211_request_ibss_scan+0x600/0x8b0 net/mac80211/scan.c:1214
 ieee80211_sta_find_ibss net/mac80211/ibss.c:-1 [inline]
 ieee80211_ibss_work+0xde7/0x1060 net/mac80211/ibss.c:1670
 cfg80211_wiphy_work+0x2dc/0x460 net/wireless/core.c:435
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---
Kernel panic - not syncing: UBSAN: panic_on_warn set ...
CPU: 0 UID: 0 PID: 47 Comm: kworker/u4:3 Not tainted 6.15.0-rc5-syzkaller-00032-g0d8d44db295c-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x99/0x250 lib/dump_stack.c:120
 panic+0x2db/0x790 kernel/panic.c:354
 check_panic_on_warn+0x89/0xb0 kernel/panic.c:243
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:453
 ieee80211_request_ibss_scan+0x600/0x8b0 net/mac80211/scan.c:1214
 ieee80211_sta_find_ibss net/mac80211/ibss.c:-1 [inline]
 ieee80211_ibss_work+0xde7/0x1060 net/mac80211/ibss.c:1670
 cfg80211_wiphy_work+0x2dc/0x460 net/wireless/core.c:435
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         0d8d44db Merge tag 'for-6.15-rc5-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1177282f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=923d9ad0afad47e5
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14f918f4580000

