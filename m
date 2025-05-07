Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBAE2CCDE
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618365; cv=none; b=CpVINsfVIt/EISfE0FGCfKwsVgHE0tAOxePhcoxi44ODJhxqmHntTCCQvicfaNr5Ejwe0ILE1Zi5KaKlsx+HlW6yxpOoS7RkDjIk6mIdSgOWsk7uNrEskoWeaKFpLktr8SiDtykzJL1/AIoqbteEi4iyAtkmi49xzXawzIQcyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618365; c=relaxed/simple;
	bh=26AKvwGp96M6BovSs3jhhTygZ+qxyg9Lx1TYd8iKfPo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jM7tReCce3581O/MLsaANfJxJtHwmGFKTd0rqjdRQm/IWzClu9E7z/md+SYY1D6VsVrx5OsBUOhKWI/UGDZX3zYCT13KB4oEipVl0Q90BYGp8OGPWmU6Yopgf+fcpTwSTxRuVrXgX7RR0/7/kKyevCDt0gkw85sE53pGzXUwWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85e310ba2f9so541141139f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746618363; x=1747223163;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCITP9jylK2Q/NrxMzZhC4cdE1loXMCW6yeSyu/MKxg=;
        b=Lp12oZgCwnmB5UrHenKW3SdjFycXWf9fQ4WTyPSWleyNJaX/zYViBt0J/VSC42WnWs
         RBYtpXjfwgqybu7hbsPfYK8CeWowZWJbL34srGND2Z4zdUkIA7w1WvDtuk/QT4uMDN6Q
         hBJaLqZLj3Gsi2DtVd7bAaPl7WrTA30nCi1hwUsvqyvS7VMMJcNpk7IyKMjN6uvonOjR
         T9q1pTJly0mlT/B79Hhm/lvtIrBI+1W1+o4Fxe3pFVnmV0q13zJG44Qyxi86wvGSRY1k
         Vfgfg5QXOtNhfCS4f0qEdJJJcYDpJR9DeltDdd8O5/G9NqFY8dLp7324jrffwjr7Yk2u
         i3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX0xtabdJy/7NXVrwQit1UTFyGmyMjQweMSo57M8StcNygVLHhaqaRCL0dC15o5AKV3AUMukUjlKYubTUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww2DWUWKzXpfmbKWuZfD36oOZu7xpFukv9ps0c/6p9ZzMhNDy8
	CrJ6os7dPi5S7zMRYEskpj2TSj0PqsbgUI98J9gKtsLcg7u8PKeXUIcKrkR8bmiDTWnWuglutqX
	fECXXdhYFHFETgtzrh+rpEPmPn2oyaVhOEf5dohnn71Ldq0NKUXeIcxs=
X-Google-Smtp-Source: AGHT+IHz1c7PFIaZ7u8vhlxD93T55qlqIhoUW5Taso9Fyt01Q8A9oyV2sdzriuvD0xjOR09ahGuGLRLUlHEbMRIbi50md3azvRfU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:148e:b0:864:4a66:f4df with SMTP id
 ca18e2360f4ac-8674728353bmr432542139f.6.1746618363360; Wed, 07 May 2025
 04:46:03 -0700 (PDT)
Date: Wed, 07 May 2025 04:46:03 -0700
In-Reply-To: <tencent_06AC9518E9DAEE02CC847A366C002D4D6C0A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681b47fb.050a0220.37980e.0403.GAE@google.com>
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
CPU: 0 UID: 0 PID: 3017 Comm: kworker/u4:10 Not tainted 6.15.0-rc5-syzkaller-00032-g0d8d44db295c-dirty #0 PREEMPT(full) 
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
CPU: 0 UID: 0 PID: 3017 Comm: kworker/u4:10 Not tainted 6.15.0-rc5-syzkaller-00032-g0d8d44db295c-dirty #0 PREEMPT(full) 
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

commit:         0d8d44db Merge tag 'for-6.15-rc5-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=153684d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=923d9ad0afad47e5
dashboard link: https://syzkaller.appspot.com/bug?extid=4bcdddd48bb6f0be0da1
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122571cc580000

