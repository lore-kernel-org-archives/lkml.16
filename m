Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5C2586E7
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746973534; cv=none; b=KS/2zAEY6ZPnCMSXKhbh/elQLYTaxzhRtoixmI7EInM1A6kGaNIUdo1VpnUP0Ng0kw9YRFdldmU4ENW+xfUWIbyFjuw5nrI1RxM6BOm0gytB/tJTJA2Y7aNQt9FowkPqC/YoqgClt9hhoGFYkwt1OMq4WDEPfgigyKy6cxt5vkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746973534; c=relaxed/simple;
	bh=y3J+7MI0az595JaDrnxtEQLwb9JPbJpyiQXorZ67cDM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AVwM50pOGC6sIWlvLOwbLiV+HOO+12jhzafI6Af3p0+EQTzE/zNTPjlaNq2Efm+jph4GrOKmdYcZT/QuAMTRJgIo3p2J3kCRrDwH5kdFYZo2ZPZavAQaSLV++ZNTwxzV0m8U9HSlvU2YunuSaN7jo7a7etFze+rp9zPRzOAFYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d93e2ac7fbso84828645ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 07:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746973531; x=1747578331;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GJaxEZAUkn9eq5k3MMnDC9FoRewprCI27h82+9QWww=;
        b=uzzwDv1u5DffncYjKbxbgTW4h4bDXZXms9lOUlezWTaSfmGCgm1USPZvwOEJ5tOKet
         2K5+qG5B2FHN22G/ZAraRxI5Sb1j9A2h9+m79nc0IeixNhLEXK0Y9bmb/qE+W/ZW872v
         axCyxqUNEOJDnh7UFlgbZVNJJJeTGAozQnzF1F8fcX8bgIDY8BclK2WT1/psAEwdjMtM
         LNM6efH9GPZu4UdhVm4utChPRVV6mYEXMJbZfB29TdyVgNp6oSGKl7jDlu/0VUZvUMid
         goh6NA7aiyuL67Sh/o2sgJdo4Zb4E90r4d5OOavwgsO0hZ4O4MCl+50L8PXbMH7DYDKQ
         X5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOdc5k3WYpESugddFrsyA+z+vnfr1N0tE9yNBXO7jObqqjvEOlWoMmRrzfMo6UxPcD4Ifs1avSmrXJMXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxDXrrJOpG3GFKIhECqcIlZslIybdJcFShEyQlhk0HEcIUBIpE
	lOYvR/t6mztNa8I2GUlCR9F9ntgY9MWxPw9j92g9aO3nYq/l4UYD33st5lCrQS8m/yd+4F9cwgc
	uBy3jr++WhLTqD19f9kqxtNEqkFMw4E6MRhX9shwf0R5iGnXe23Jsacg=
X-Google-Smtp-Source: AGHT+IHgMI9zT3NGMPZGNPi0yOEEdOfc1BlwlNSb1B+V4eoRIxFqsZqcZJXGCiTgHIDDpUMrsIa+mOU56GTQ3uCJkWjttxFZkJbc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1544:b0:3da:7cbe:f47b with SMTP id
 e9e14a558f8ab-3da7e211dd9mr130203115ab.21.1746973531676; Sun, 11 May 2025
 07:25:31 -0700 (PDT)
Date: Sun, 11 May 2025 07:25:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6820b35b.050a0220.f2294.003a.GAE@google.com>
Subject: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in cfg80211_wiphy_work
From: syzbot <syzbot+040397292a3251bc7bf6@syzkaller.appspotmail.com>
To: johannes@sipsolutions.net, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    43745d11bfd9 bpftool: Fix regression of "bpftool cgroup tr..
git tree:       bpf-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13dda8f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9a25b7a36123454
dashboard link: https://syzkaller.appspot.com/bug?extid=040397292a3251bc7bf6
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/12e6142613b2/disk-43745d11.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b04790cbafaa/vmlinux-43745d11.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a60fd74040d2/bzImage-43745d11.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+040397292a3251bc7bf6@syzkaller.appspotmail.com

wlan1: Trigger new scan to find an IBSS to join
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in net/mac80211/scan.c:1208:5
index 0 is out of range for type 'struct ieee80211_channel *[] __counted_by(n_channels)' (aka 'struct ieee80211_channel *[]')
CPU: 1 UID: 0 PID: 6353 Comm: kworker/u8:9 Not tainted 6.15.0-rc4-syzkaller-g43745d11bfd9 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
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
CPU: 1 UID: 0 PID: 6353 Comm: kworker/u8:9 Not tainted 6.15.0-rc4-syzkaller-g43745d11bfd9 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x99/0x250 lib/dump_stack.c:120
 panic+0x2db/0x790 kernel/panic.c:354
 check_panic_on_warn+0x89/0xb0 kernel/panic.c:243
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:453
 ieee80211_request_ibss_scan+0x600/0x8b0 net/mac80211/scan.c:1208
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


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
