Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C025DCE5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284507; cv=none; b=Mz/z1RKrRgVnj7eLt0ZR9d/TvC1viyMACVmXZN7IeFqmXbTM+8ytu23xaLT0lC+N+50X7PKkaRIzECGFzqFpaQvosy8O4wFuze44pbrcgC0sTfIrYEIK9HilBIGMn3bQG/BDQnE6/xcW9G/+PW2KwZwiOz3H5PkWGU9aQ6acDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284507; c=relaxed/simple;
	bh=Ws6DFGRoSDTRT92XZumHmgCt5koISWrAkrtJoXcaQ+s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=imQU7X+hFmhbJjANtEtU2WILGZkY2Z+4BY6dlKRbS1FRu95yMR3TyZw5mXH/iaiqgj/O8KWE1pRuPUvc/g9oGYlxzUTI/RS5FXZ5FrCD7DBuGTl6DUjVdWu+s6e9Nf1r/eNHdv7/YUoz6CV3IKzddHbN8HI9IF2GJjWPVaGNA9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddce213201so37753105ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751284505; x=1751889305;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkonErfnUrUyv0V4wfwSaciJeRp1ywEAqrtvBjZZHvQ=;
        b=SRE3xW9k4hLHroi7EDtlMIHlIEKzGZy2TuQHvjLRKjvCXHQjnDqG9eTcih025u0fNU
         /byGApsDMc3Mi2BDZdh0JSBn5eUBFTLbTcg5KsSXpkbCQY7BgcTqFgepL3uGeJrVjlTy
         Y030xi3qzasvnbFr5ov8D19G6D235vSZkZPf0OKhyiPAovJAVIoTn4RyL3z6y6V2XL27
         YahEBMgK/65qcykM3JQAWa8ss7BtP3x0qjXcDb9EA+FYI0h81ZmmGJyvKEWG7daWpkBR
         NDVxm5ha3pBwv+BZ3B8gVSn3AdK0t5Kh7Yw1IZRRFrzqwjY8Ot0+C7DANrWZOXWQNhOi
         O2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk9y0CMKpiOQf/tpAzeQzHhJ05NQW2bnSY8K0Pu53nek59uELcL5AtRUxaWuuqXvaK1xX1QbK8FOq2YFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsEOwmqptrF2VuqUIxnOK3euC1CfI7mpwAxpEoU+xi2CZdnbt
	+jlAEztvX6DCq1vjyz+QzHr9Hf2Cj20Gj6s/ZNub7edYs2t99WScK7VB5myG/ZbDZX24TIEAeY5
	v/AzbgFLOavV6e1AD38mW7uBVp4S7twJuEHsu3PWqPtL7wBqynS+Ox4aZGis=
X-Google-Smtp-Source: AGHT+IFagh6Ptgc8wY+wTGvPTvxsU14zR0OzeUl1X2QUWjUMLo8SJL4ESc+r4K+zrxa+xz7vRdBTC6e2jA4FoLeVxOX/BEabdeZE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b41:b0:3de:e74:be13 with SMTP id
 e9e14a558f8ab-3df3e09c6b5mr214978595ab.0.1751284504896; Mon, 30 Jun 2025
 04:55:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 04:55:04 -0700
In-Reply-To: <0620687c-30d7-405d-b4f3-636546ef1823n@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68627b18.a70a0220.3b7e22.0dcc.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ni_rename

loop0: detected capacity change from 0 to 4096
------------[ cut here ]------------
WARNING: fs/ntfs3/frecord.c:3030 at ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029, CPU#0: syz.0.16/6714
Modules linked in:
CPU: 0 UID: 0 PID: 6714 Comm: syz.0.16 Not tainted 6.16.0-rc4-next-20250630-syzkaller-g1343433ed389 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029
Code: 8b 05 66 63 9a 0f 48 3b 44 24 10 75 22 44 89 e0 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 49 ac 6c 08 cc e8 b3 fe b9 fe 90 <0f> 0b 90 eb c5 e8 18 d2 69 08 0f 1f 84 00 00 00 00 00 90 90 90 90
RSP: 0018:ffffc90002eb7ab8 EFLAGS: 00010293
RAX: ffffffff8305ccdd RBX: 00000000fffffffe RCX: ffff888020b28000
RDX: 0000000000000000 RSI: 00000000fffffffe RDI: 0000000000000000
RBP: 00000000fffffffe R08: ffffffff8fa17437 R09: 1ffffffff1f42e86
R10: dffffc0000000000 R11: fffffbfff1f42e87 R12: 0000000000000000
R13: ffff88803385e600 R14: ffff888077140758 R15: ffff888066ebe6d0
FS:  00007f59ac0016c0(0000) GS:ffff888125c1d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8e813c3000 CR3: 000000007f64a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 ntfs_rename+0x6e2/0xb40 fs/ntfs3/namei.c:316
 vfs_rename+0xbd7/0xf00 fs/namei.c:5129
 do_renameat2+0x6ce/0xa80 fs/namei.c:5278
 __do_sys_rename fs/namei.c:5325 [inline]
 __se_sys_rename fs/namei.c:5323 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5323
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f59ab18e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f59ac001038 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007f59ab3b5fa0 RCX: 00007f59ab18e929
RDX: 0000000000000000 RSI: 0000200000001040 RDI: 0000200000000280
RBP: 00007f59ab210b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f59ab3b5fa0 R15: 00007fff104b3398
 </TASK>


Tested on:

commit:         1343433e Add linux-next specific files for 20250630
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10bfa770580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c1ce97baf6bd6397
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1147848c580000

