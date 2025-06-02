Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978213213E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748834104; cv=none; b=aq+XJlQUSmaITf2mUILp8b50e+nxN35YPq5l41C6bjEXpLnzktMjtDBSS5e2UoUlLhitpxYWFTfXL8BGzj1y+ml6RbmUiqshR/B519J5uTVVXaGKCQtSZpr+LO2aKA8ZcFAz1q5+gVOYeTI+nUAD4AHomPeuTBHGU6+UX4U4o8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748834104; c=relaxed/simple;
	bh=D6DLBeL90bmiLH5bMFl8ypCqGax7lp1oYuoYkh1PNGM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h6K+unJ3AOUtvnetYtlz1Z7NYQsJt2QbZ5YYa2aeB/HTUIObq+E1YD7TWfwTjTr9UClvyS8GqRMPVvEd9xRArre/CXcluAHoWkT/vKmef93TjRCqqv01RSCFuD/NrddVy15xy2kf881QGEcF53nG5cj9PIgRrrhU4zZyp9F2Vzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da6fe2a552so80401415ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 20:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748834102; x=1749438902;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ1Lf5dRi/YXJa1clEEDd5X4sNe6zO9b/e4yStQscrE=;
        b=NZqmvVna5uLfaxwbQ1+eavdqlcqu6eVRrN2nH3oIvHYxjR3IOtkAl6BlF2O6G5HIuc
         Qo6EWT26/PmkNjK3k2jgYt5LOCdXZOBUDP+z8xr7p2CfPvuIDIRNILqu/Mvur7qVUrn+
         Z2/fsao5zAQ+L9tgLnWoV9m6B6zDSXyV5Qk5JLyYPkteYU8IgXWIRcRFa6gBf2iuJMPf
         h1ezMMfRV1uNe0Tso31z06Njrg6w7vbXhVNN+05j5EgVoXfYS3ml4RfEg3469mbPOsn7
         chuTtIXsZV1wQwhHF+hrUKLDYo+hzLodgqv5xS5KawTSTzUpqq/HDeWz5QAdeb5VY7VI
         bq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXo3LdtSyc/CRCquq49wwGx3XMMBF/yvu51V6kXIKljGC8d3WFiDnFCfWv337OJ/94T/fX9ihw/MRXMIs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZcfDy5RP6oF+9tW3aGKIEBLDHHjC/aHiUUiacMC2+NEuWZjS
	V4BRgt1gSFF1t2Z1XM1rPg/gmmwlZl4/74/iRwx6WgvqWyRHLTVnqegLgXrDb7wKI7502OZeJBw
	lYYyVH7dXghe4rLMIiGtja0XyNw4dw6/IBJbQsbUJH0ruCZJo8gibDtrq5FA=
X-Google-Smtp-Source: AGHT+IHLnj6Xq+L6LjnJUtJUx805MezyK6EV45LNiLdAUfS/nPpElXOaAzelGuxRF4AeKuvf6oTC5/SuHSKiMJ13qcIsrEMsQwYJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a23:b0:3dc:8058:ddfc with SMTP id
 e9e14a558f8ab-3dda3363edamr53070925ab.11.1748834102566; Sun, 01 Jun 2025
 20:15:02 -0700 (PDT)
Date: Sun, 01 Jun 2025 20:15:02 -0700
In-Reply-To: <tencent_BEF362E363C960C3BD0448D77DF76066D105@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683d1736.a00a0220.d8eae.003e.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
From: syzbot <syzbot+0a5079ee014f4b907817@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: trying to register non-static key in futex_hash_prctl

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 3 UID: 0 PID: 6500 Comm: syz.0.16 Not tainted 6.15.0-syzkaller-gcd2e103d57e5-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 assign_lock_key kernel/locking/lockdep.c:987 [inline]
 register_lock_class+0x4a3/0x4c0 kernel/locking/lockdep.c:1302
 __lock_acquire+0xa6/0x1c90 kernel/locking/lockdep.c:5115
 lock_acquire kernel/locking/lockdep.c:5871 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
 __mutex_lock_common kernel/locking/mutex.c:602 [inline]
 __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:747
 futex_hash_prctl+0x2fc/0x770 kernel/futex/core.c:1758
 __do_sys_prctl+0x171f/0x24c0 kernel/sys.c:2825
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f516c98e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f516d8a5038 EFLAGS: 00000246 ORIG_RAX: 000000000000009d
RAX: ffffffffffffffda RBX: 00007f516cbb5fa0 RCX: 00007f516c98e969
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 000000000000004e
RBP: 00007f516ca10ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f516cbb5fa0 R15: 00007ffc88069c38
 </TASK>


Tested on:

commit:         cd2e103d Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=104b700c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4df26174733e11f3
dashboard link: https://syzkaller.appspot.com/bug?extid=0a5079ee014f4b907817
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1574b970580000

