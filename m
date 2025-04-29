Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341D72BCF6D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917266; cv=none; b=XA2xsCIGclSZoEGaKazKpyflsUlz+0YjPs4Wt3yVWx+8ghe2UDyyhysX2XBjioZ4RLO7deYtoTY5UpYkkOCICx6w2yzkAcfPQqvivsQMuyX115OfNFKTxiffEPNZ9gTVgyQIxtqcWkpDmonMY2dIdoKXqd7tlbzsYiH6vkBpJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917266; c=relaxed/simple;
	bh=hiabI30mRZZ4MdJcsJi8SMGD5sfa+ucxvEPRBH/zqwM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=k5ZtFmc7WMgZTnrB9ctaiJ6e4ECITzrRb/Zakiuwx4KexpdUQ5BnqlqmtjzgoYHmpp9vNdmtENm646oTRxM7DRolnhhvmv/MQ6FIVzKhXw7J7cyXC/SmnXy5c8Mfg5dPdyM/cnXrUX4ZmJo/3hoc10k+FndvBot96T+BgfgKlb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b402f69d4so558839739f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917264; x=1746522064;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2lC+GUJOB/mLT9V86EV+PtfcC1K+rrVOrQZHYwtXgY=;
        b=D6Up45q+PGltDUcRJncCCMCNFj9KG1M8HSzUUba8KdZSM0od2QjGs13WKpeKS1oSnI
         u6tvRcLjoG/nwtDIGuDVMPnF+Jx+zfS6b9hG3yF5dy3ILiWtbdNDisUs+gqvlFRW9PFf
         G4wF+yt9W/vi0/uvUZe2dbKWOxlcYtVWAuqysp54U0TS0vtQ4fd51VYSR6LECml11ARR
         23W6Se7b6MLz8Q/KttRhykVjzqy5kJ6OtKetasioZFqh8HVmkyzYpMGRmkslqVm3KKfn
         tKZuzaNZO9ZsC2VabQMbUEf696jF5ykEongQYDcdgsBgEDjIa6oUCXPb+J8mAzwHTQoN
         fWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPdLFi/5YRrx80SJbElX3mQHorvxqnj2QfDwdlZmSe8FC/nvlX12EhykPLylWkT0Dgh9/98XVWWDJ+3mM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYGjdJPwlTFT4vamPUyZxyEjtqX46p4vzhfBtmH/sWr2hwFtW
	VOAXdgafecKowwbaeQ/mCh/umLLLxt90oJYEhpVhT0cwK6LAq3AhEqBHW7KZj830TmRNA95BOiQ
	nkgTLKdS1REDNClEhjVFUg8R2svs2mKcjqIPbHLH/JAqp5P5zO8G3+uI=
X-Google-Smtp-Source: AGHT+IFI/ihTqoFT04GJTHQXB2LR/lP+hUvXL7whIC+MXMoBW5uZXRy+q7Txv8rywiSrGjm5Ii/4BJnLm1M2N3g62RpprByLcgN5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1401:b0:864:48f7:56aa with SMTP id
 ca18e2360f4ac-86467b0da7dmr1337945739f.7.1745917264273; Tue, 29 Apr 2025
 02:01:04 -0700 (PDT)
Date: Tue, 29 Apr 2025 02:01:04 -0700
In-Reply-To: <tencent_40C361A96683BE84519777576D06D0737D05@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68109550.050a0220.2b69d1.05ca.GAE@google.com>
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
UBSAN: array-index-out-of-bounds in net/mac80211/scan.c:1208:5
index 0 is out of range for type 'struct ieee80211_channel *[] __counted_by(n_channels)' (aka 'struct ieee80211_channel *[]')
CPU: 0 UID: 0 PID: 1038 Comm: kworker/u4:7 Not tainted 6.15.0-rc4-syzkaller-gca91b9500108-dirty #0 PREEMPT(full) 
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
CPU: 0 UID: 0 PID: 1038 Comm: kworker/u4:7 Not tainted 6.15.0-rc4-syzkaller-gca91b9500108-dirty #0 PREEMPT(full) 
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


Tested on:

commit:         ca91b950 Merge tag 'v6.15-rc4-ksmbd-server-fixes' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12847374580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714654674710be70
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10911374580000

