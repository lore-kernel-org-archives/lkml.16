Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07141296159
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867123; cv=none; b=ew1yAv/H8stLFY8TQ+Gs99P21GxePf4A9XwOpFLAafpzn+FrR1rvdEKFj2Sgb2/khsdoxAwGEdrJL/R9hMZpcosplxux/1EMYtYHncCw+9SjzF5TaTnsO++UTYQza2+fCfYT7Ci65Z5LdvY+ClOBa5hJOceiD4IL7H/gfBILAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867123; c=relaxed/simple;
	bh=GrJ4TlYWIvOwm5ewrhRvrrk7RniJIEXmtDWAmYFWUN0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uy6nHgI/pzjhZazzHHyamPUCt5fQbMyX91F67mNbGk81RjYwErbe5n5DGR1tp9MMPT0hsVfiF2fAqHLMHtgkR3vdCkvPOf3k1QM9tHND0l4+8KFtdrp4wWBLtXyVevCS8cR3BA7sKWhdxMURRKpMCmpC7rVZ8lCIu1F2O3Jmvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85ed07f832dso473442439f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745867121; x=1746471921;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hz5dELjQsdYxeuu2b7u4N9XuZqC3CQB3u5mPsKUNGaA=;
        b=G66JhOoWN5vfcH+l9yxYXcLhkkfHV/B3q8yQdDIra7OR4+pfXmboR+Ev4G0wyaEOvM
         x4GmoxMnQDcl+L/3nAEx5oHlDsiFvy+Rl5UU1ANkNz0xteOVIvsdFnF2JIoZmuX8GAWS
         ABlW+FapXm/FmZ/tGKtVOGzl8S3G1NEMmmIwteXuD8xVq8VyU3hx2oz+6g2cnSAhwQI3
         tTbmsOjaE6W5DHFVTmkHP2UbRjyTKQ4JBCO03Jd6NhiGnRNnk4eXjXUQxzTEY9yc+SMg
         5Q13e4++n+TdU6KKGyA4gHh8qfn17mWII836XA283iRNl+VMtBtFvLE0S/MDgfZxDH1u
         8Gpg==
X-Forwarded-Encrypted: i=1; AJvYcCVgQ+Tr2LWGo9wrQIET06sv1vQioG2eBwJwpl30/k1n2JYV8Wlb5U+EmgauMzhTACj3JVILWBMS8uKNnP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwd2GkkcD9oIqREqR6HolPwOOmybxcPpPQQhc/rjF9TByTtAdE
	mTARguxB+NgTZ6hXipi+4wnxO9xWkHLnaaC+4d/M2ovjngQ9CkKTcGehQHESw8yZkqT/xt5sBpd
	P8Prmm60ihkqLaEPmSd10PhRhOMSNgNm3n+iFEEhXHB8zhtEqNxGiI7E=
X-Google-Smtp-Source: AGHT+IF/ciP+C+7gCkf8QtAU5aPBuuGzMsKR79+P4YtYAMyWG9LSjh4jcP7YWw60Foq0aKGOsJcv9XyBuTHy+QQ+s/yTaCgHEBjN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3fd0:b0:862:ba37:eb0e with SMTP id
 ca18e2360f4ac-8645cd71475mr1635299339f.12.1745867121165; Mon, 28 Apr 2025
 12:05:21 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:05:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680fd171.050a0220.2b69d1.045e.GAE@google.com>
Subject: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
From: syzbot <syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com>
To: johannes@sipsolutions.net, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5bc1018675ec Merge tag 'pci-v6.15-fixes-3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17ca0374580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90837c100b88a636
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a39d74580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106fa270580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-5bc10186.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3a2f39285e07/vmlinux-5bc10186.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2a37a55f34fb/bzImage-5bc10186.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/cc5918853785/mount_4.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com

wlan1: Created IBSS using preconfigured BSSID 50:50:50:50:50:50
wlan1: Creating new IBSS network, BSSID 50:50:50:50:50:50
wlan1: Trigger new scan to find an IBSS to join
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in net/mac80211/scan.c:1208:5
index 0 is out of range for type 'struct ieee80211_channel *[] __counted_by(n_channels)' (aka 'struct ieee80211_channel *[]')
CPU: 0 UID: 0 PID: 131 Comm: kworker/u4:5 Not tainted 6.15.0-rc3-syzkaller-00342-g5bc1018675ec #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: events_unbound cfg80211_wiphy_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:231
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
---[ end trace ]---
Kernel panic - not syncing: UBSAN: panic_on_warn set ...
CPU: 0 UID: 0 PID: 131 Comm: kworker/u4:5 Not tainted 6.15.0-rc3-syzkaller-00342-g5bc1018675ec #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
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
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
