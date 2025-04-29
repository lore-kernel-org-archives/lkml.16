Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2688C148
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745895306; cv=none; b=rhpD1yECzM6la3Or2H5GQrU1rNZjU+nZcGN+02JhBGqtrzB9+MKuuCS17W1Z0ykAgGwnO2JbsT6sVLNND0HW7lYNryF+5djuQ1d6vB4aeu8CTS/FOa2fFPVT5WqbyCeBktOBnbHeRrkb5aQzbEIvAfxq0xlUBFzmmvfJu3JsHOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745895306; c=relaxed/simple;
	bh=63k2SaUvKAxfSAT3LAKwiaa8tdJ2Tji+K7s1YcGNGaY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=E1jhawIFU3gVOYwmo5aP+0KWd4V3oOnt9t5sXPAQxNypn9aaBHyrPhS6FW3f9VKlLwIfMlF2uKr058xB0fKw/twJx8hQ8ItZb29E1CrB4cGrHaD9e8FQIgWzBKXQviows3wt5WvCIPfkgIq8qEqKcxs6oFidOGPqrrNdKYu2+DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d817cf6e72so47134805ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745895304; x=1746500104;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXZI1jHa0hVwyU1LvdZmT3i3tG8X/Q4ImaPz5nPoqSc=;
        b=rCXlqqrceZH3jT4P+CArPAhpQT8r/XiM5J0xi9mimm7BKwIQb8rQ44EvpuD0HM9zIi
         kxatiXipEzYf/+haZSW6O22L9QVydr5s32SeKUrknoZnaGtq8ULr1n3UGUjYnBQTripu
         jLyIt0F7aWPhMzJuFAhwp00g/g5LjDRNHiwGvv8orIuKySzHDsYdGol9V5cQXznSrJ4/
         6kwRB/74dUBhBUGCdGCuA0ETPY1JfmZCWcPjwrRtBN7ycn7/uUoDIys2dYMQRoqTZfem
         MjUJcVpuyLJ6keFfS/whK3fJe2Vyk4fmOzTpsJ8uIdzgyIzUJKa80NMY7k/Z6D3NTpid
         KLNg==
X-Forwarded-Encrypted: i=1; AJvYcCUwd0m2RcPdBdBSVk8UUk23UnVVpKFnCqfBVV/5JpvjF6wHwmY8w6FTzfNVeT6Igk6js1l8i5hlIdocOxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWK2fE5mr9Ro5528kWZE1NSL7r+Zxle1wQkJjkmV71vyRV+RWF
	391LZYgvhqFKYOPYw9w1oWSxy2VzK29ar1cuQTi/Mkd4oXFSdyZL7UU9YSsFboyBFrLDhVsZAf/
	I2V8zIUExhMlJTWO1ZjIpHsXef4h6KlJGwiN0TZ3c9CYNF9Wt1KWBvR0=
X-Google-Smtp-Source: AGHT+IGAz+bNifhLchCvech2/6KXOycukf8Mh4GgSKNfxSCqOqBnlt9m0ZA4sDTv4xNSvDYEEIMhM0T1EehJj4TH6rGl9z2zgAx3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349f:b0:3d6:d147:c6a2 with SMTP id
 e9e14a558f8ab-3d95d89a1c4mr18312415ab.8.1745895304091; Mon, 28 Apr 2025
 19:55:04 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:55:04 -0700
In-Reply-To: <tencent_594577BB67C03CF3364296D2374E4ACA7509@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68103f88.a70a0220.23e4d2.0036.GAE@google.com>
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
From: syzbot <syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ieee80211_request_ibss_scan

wlan1: Trigger new scan to find an IBSS to join
------------[ cut here ]------------
WARNING: CPU: 0 PID: 42 at net/mac80211/scan.c:1215 ieee80211_request_ibss_scan+0x83f/0x8c0 net/mac80211/scan.c:1215
Modules linked in:
CPU: 0 UID: 0 PID: 42 Comm: kworker/u4:3 Not tainted 6.15.0-rc4-syzkaller-gca91b9500108-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
RIP: 0010:ieee80211_request_ibss_scan+0x83f/0x8c0 net/mac80211/scan.c:1215
Code: e8 16 68 f7 f6 eb 05 e8 0f 68 f7 f6 b8 ea ff ff ff e9 ea f8 ff ff e8 00 68 f7 f6 90 0f 0b 90 e9 aa f8 ff ff e8 f2 67 f7 f6 90 <0f> 0b 90 eb dd 48 c7 c1 50 f8 7e 8f 80 e1 07 80 c1 03 38 c1 0f 8c
RSP: 0000:ffffc900005df8a0 EFLAGS: 00010293
RAX: ffffffff8ac856de RBX: 0000000000000000 RCX: ffff88801d0cc880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000033 R08: 0000000000000000 R09: 1ffff920000bbec4
R10: dffffc0000000000 R11: fffff520000bbec5 R12: ffff88803e1ca9a8
R13: dffffc0000000000 R14: 0000000000000000 R15: ffff88803e1c8e80
FS:  0000000000000000(0000) GS:ffff88808d6cc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4a7adaf8e5 CR3: 0000000058672000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
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


Tested on:

commit:         ca91b950 Merge tag 'v6.15-rc4-ksmbd-server-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1059d374580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714654674710be70
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14a01374580000

