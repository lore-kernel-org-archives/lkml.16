Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5CEED8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888586; cv=none; b=GFEVM2IU3dnTN1iAzcYqj87xCsFTIaUe53lqoYkaH+63eComB+JE6uO0UWfTA1jQkUIpGaFXlenxcYuo2kFYeewqM/oCkQ5FaopIHx7/lgdHIygyXNchOltfm7K1EZtBuz+2tPaxgQrpYu5BsbL/DXog6p2hsvR+xn65AQeATdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888586; c=relaxed/simple;
	bh=bM5uFDI/89Vewk982cO6NNBzNc3lFxQEjp9Jhy0ftV8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O0LR8NY3m6+el6PIoj4HUrMnTftqwkWOr36GGOMZIi20Klcukt0coHY7xH3nztfWvl0OXEDpePjiRee6UG8hlDpqmodbARliqd7VeBKEliyKH2iQz/qeRrhZ29xZxdgO20j48IzzhaKHnCxzbvZmBzYtS11/oJOLsdDym/ws+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso76678465ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 04:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888584; x=1752493384;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dz4R1nZMeUJHDuES5J0gldgKeBiQ95ERLlYNq5qWJFg=;
        b=ThVMMioPZSkaG1JOuu4Rywrylpiskoyo9ipxc0x8+eh0Q0V6D4Le1C6rbcsdOyBw3E
         k+Wxhe6CHHU9TXt7DY9vXhVI0WhPYxhlrefWu+ZsLUQv6nFE0BGjge1vIWHBYqyLhrM5
         d1NHxMz1Zn1dypyIJXDadwNLHy3DC5SCh+Yir5nyQb0Ee/CNxwy7bxpqj0FM/JYEUAtm
         mWUTQFOB9tfy7+UtDB392OGuAnks1m01gzkB9yMmo2pP3GHkcZwJQnUrrLS1vvT5Z8RP
         3Hdmmx0UkhEzTwbu3DmcabaL+msdgrWa3HEbSiHq2EIsCcbaKQRgmnSDMgLcYIZyjEf5
         byVA==
X-Forwarded-Encrypted: i=1; AJvYcCWNTNhyV7Rwg20t3RXdZxj/H3TxQg3BVFsZqijI0VFnNTm83l+BNBbRudFtJI3mV/TPbGaGVPENB/6DIC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyl7Y1UG7r+GKTBrhcgiSVBhBFqF7N0i84d9EDLd5/QcMvhJwS
	3zLcthFY92NZliAge0Yh1SpoBrzo3QGbW12qCajXSAmh0MN0sLKtxdlmoTU7eltlKfJiL0+Toem
	7jlll/YIJ4CFFWrusSvSrNcTZBHNSDFSDutG7Q71pUEUYU+fGJRRInU2h9TY=
X-Google-Smtp-Source: AGHT+IEzNKl6BCRwSM9sG8UcehKCNYMj6kDaFNJEHDhzNtIN6eNw44+NIlft/kP+3gSBNzZn7wnKY5FiJK378xmhBkwvF0FIMqrz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2781:b0:3dd:c40d:787e with SMTP id
 e9e14a558f8ab-3e13545e526mr120896535ab.2.1751888583943; Mon, 07 Jul 2025
 04:43:03 -0700 (PDT)
Date: Mon, 07 Jul 2025 04:43:03 -0700
In-Reply-To: <20250707112658.2733-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686bb2c7.a00a0220.c7b3.0082.GAE@google.com>
Subject: Re: [syzbot] [fs?] BUG: corrupted list in remove_wait_queue (2)
From: syzbot <syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in remove_wait_queue

 slab kmalloc-8k start ffff8881457ec000 pointer offset 1480 size 8192
list_del corruption. prev->next should be ffffc90003d8fb98, but was ffff8881457ec5c8. (prev=ffff8881457ec5c8)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:62!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 6485 Comm: syz.1.17 Not tainted 6.16.0-rc5-syzkaller-gd7b8f8e20813-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:__list_del_entry_valid_or_report+0x17a/0x200 lib/list_debug.c:62
Code: 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 8d 00 00 00 48 8b 55 00 48 89 e9 48 89 de 48 c7 c7 a0 26 f5 8b e8 07 ca bf fc 90 <0f> 0b 4c 89 e7 e8 dc e7 23 fd 48 89 ea 48 b8 00 00 00 00 00 fc ff
RSP: 0018:ffffc90003d8f880 EFLAGS: 00010086
RAX: 000000000000006d RBX: ffffc90003d8fb98 RCX: ffffffff819a6f69
RDX: 0000000000000000 RSI: ffffffff819aeb6e RDI: 0000000000000005
RBP: ffff8881457ec5c8 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000001 R11: 0000000000000001 R12: ffff8881457ec5c8
R13: ffffc90003d8fb98 R14: ffffc90003d8fba0 R15: ffffc90003d8fb70
FS:  00007f2a989306c0(0000) GS:ffff888124a0d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc742be1a8 CR3: 0000000077286000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del include/linux/list.h:229 [inline]
 __remove_wait_queue include/linux/wait.h:207 [inline]
 remove_wait_queue+0x30/0x180 kernel/sched/wait.c:55
 free_poll_entry fs/select.c:132 [inline]
 poll_freewait+0xd5/0x250 fs/select.c:141
 do_sys_poll+0x6a9/0xde0 fs/select.c:1010
 __do_sys_poll fs/select.c:1074 [inline]
 __se_sys_poll fs/select.c:1062 [inline]
 __x64_sys_poll+0x1a6/0x450 fs/select.c:1062
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2a97b85d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2a98930038 EFLAGS: 00000246 ORIG_RAX: 0000000000000007
RAX: ffffffffffffffda RBX: 00007f2a97d75fa0 RCX: 00007f2a97b85d29
RDX: 0000000000000106 RSI: 0000000000000005 RDI: 0000000020000080
RBP: 00007f2a97c01b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f2a97d75fa0 R15: 00007ffddfb83ed8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x17a/0x200 lib/list_debug.c:62
Code: 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 8d 00 00 00 48 8b 55 00 48 89 e9 48 89 de 48 c7 c7 a0 26 f5 8b e8 07 ca bf fc 90 <0f> 0b 4c 89 e7 e8 dc e7 23 fd 48 89 ea 48 b8 00 00 00 00 00 fc ff
RSP: 0018:ffffc90003d8f880 EFLAGS: 00010086
RAX: 000000000000006d RBX: ffffc90003d8fb98 RCX: ffffffff819a6f69
RDX: 0000000000000000 RSI: ffffffff819aeb6e RDI: 0000000000000005
RBP: ffff8881457ec5c8 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000001 R11: 0000000000000001 R12: ffff8881457ec5c8
R13: ffffc90003d8fb98 R14: ffffc90003d8fba0 R15: ffffc90003d8fb70
FS:  00007f2a989306c0(0000) GS:ffff888124a0d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc742be1a8 CR3: 0000000077286000 CR4: 00000000003526f0


Tested on:

commit:         d7b8f8e2 Linux 6.16-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13ec9f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9b42a4fcb738e08
dashboard link: https://syzkaller.appspot.com/bug?extid=4e21d5f67b886a692b55
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=143c928c580000

