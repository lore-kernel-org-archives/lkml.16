Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448102512FB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744948386; cv=none; b=bkok+H/Z3JtaLFAXjpl2qoM6iLp3DwB2X+lDF1JLPr5LdyDECsVEMSacqr7P2otJiONWJ/fsIDYGraOXUyU2/Chalm2DACCGxjRp24Jl80Wjqi4/Acdn5JHHKD3w2sY3j2K8Tzm7SzSMw5FQHyiYMT4wLiTRpzvJKp6seFN+Kzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744948386; c=relaxed/simple;
	bh=3vPJDlOIvJYPjKyQ1DnLM+r9tJ35blA2Pg5+wxGkkWM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WGxRblbWJJ9vO8Lk4dFpuFPeY+oWQeO3VqhySG1X1mKLwSC3zF9uOq92LcSYcm1uPyyBYAoxHu3QfDuis75893W49wnD4AcZl28tDErEnzKQEaeh/kZk6qNZA1U6KMVpxqZ7/6THcPiIGa69G2JMQDd1UgBtjXf+iDdI4W5hX2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d81820d5b3so26382245ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744948383; x=1745553183;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dXkMvHeXco4tPqbLuPzOZYrGw1p8mvJfoRXOmiMhdM=;
        b=PmrANNoQVZ3uYLnOxDZD5RZnaKYjf6QD1aZ0XM8ym9g/1+ZJi650DY3UUSx5Ii72VO
         lVToLZkjrQQLBwkKAjrJHXgYEnjsDi/aafVi3+SQOK+LOzcPDIOk22S9ni7HlZrMdWC1
         d3Jqn95GEBp+7eFbUMMSnrpNcr27Nb/aUgqsyTiOE0FJBovGB+WuhnzzLwDnWFZtzx3t
         9Aw6tJjYCEmQFTiTgz3k0W+m+d8Vnq50SB+UqYNtlIvGVUEiF+W+WYO6NbajYjH5qE0W
         HFzk7kYHKWHPIe+LXrmfwv54dZqNKs7rDbaef3eNId53v1oElNsAdYseiZOKTBqpI8Zy
         b0Dw==
X-Gm-Message-State: AOJu0YwUU0dLr903mV5cDE+FGypGqWa6g5S9uDbewbl4ls25JVWR6mmY
	h56SDKghbOJoIDjZ8+UiGSumb+vYlC9ZimlxKRTBqnEo2ksfJMgYLD5z0/bA8FxMA97AC/kiuls
	qOgp4uVJsqRpP8hi3gBxnZfa1yiP3kOS4cjdDFd9alYsm7z5J2nEqijA=
X-Google-Smtp-Source: AGHT+IHv36Mj7hd40uadGCz2HOlRQpI8bQ+FfpuldYfjs/pwLxJAlO6Rhf0i10AqoHzEgc0EaOre0kjfx0Zfv8rX+VzAA885gspW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160d:b0:3d8:1dc7:ca7a with SMTP id
 e9e14a558f8ab-3d88eda8703mr15039925ab.5.1744948383335; Thu, 17 Apr 2025
 20:53:03 -0700 (PDT)
Date: Thu, 17 Apr 2025 20:53:03 -0700
In-Reply-To: <20250418032543.128924-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6801cc9f.050a0220.243d89.0017.GAE@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dtDelete
From: syzbot <syzbot+4f9c823a6f63d87491ba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
divide error in dtDelete

Oops: divide error: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 6398 Comm: syz.0.176 Not tainted 6.14.0-rc6-syzkaller-00115-ge3a854b577cb-dirty #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:dtDelete+0x1d29/0x2de0 fs/jfs/jfs_dtree.c:2133
Code: 04 28 84 c0 0f 85 ef 0c 00 00 44 0f b6 3b 49 8d 5e 14 48 89 d8 48 c1 e8 03 42 0f b6 04 28 84 c0 0f 85 ed 0c 00 00 41 0f b6 c7 <f6> 33 0f b6 dc bf 81 00 00 00 89 de e8 86 ec 68 fe 80 fb 80 0f 87
RSP: 0018:ffffc9000d54f4e0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888012dc3014 RCX: ffff88801d184880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000081
RBP: ffffc9000d54f7d0 R08: ffffffff83586b02 R09: 1ffffd4000096e18
R10: dffffc0000000000 R11: fffff94000096e19 R12: ffff8880598a81f0
R13: dffffc0000000000 R14: ffff888012dc3000 R15: 0000000000000000
FS:  00007fc17c5f26c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc17c5f1fe0 CR3: 0000000012d60000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 jfs_rename+0xf91/0x1bf0 fs/jfs/namei.c:1239
 vfs_rename+0xbdb/0xf00 fs/namei.c:5069
 do_renameat2+0xd94/0x13f0 fs/namei.c:5226
 __do_sys_rename fs/namei.c:5273 [inline]
 __se_sys_rename fs/namei.c:5271 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5271
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc17b78d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc17c5f2038 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007fc17b9a6080 RCX: 00007fc17b78d169
RDX: 0000000000000000 RSI: 0000400000000f40 RDI: 0000400000000300
RBP: 00007fc17b80e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fc17b9a6080 R15: 00007ffcc2700f98
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dtDelete+0x1d29/0x2de0 fs/jfs/jfs_dtree.c:2133
Code: 04 28 84 c0 0f 85 ef 0c 00 00 44 0f b6 3b 49 8d 5e 14 48 89 d8 48 c1 e8 03 42 0f b6 04 28 84 c0 0f 85 ed 0c 00 00 41 0f b6 c7 <f6> 33 0f b6 dc bf 81 00 00 00 89 de e8 86 ec 68 fe 80 fb 80 0f 87
RSP: 0018:ffffc9000d54f4e0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff888012dc3014 RCX: ffff88801d184880
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000081
RBP: ffffc9000d54f7d0 R08: ffffffff83586b02 R09: 1ffffd4000096e18
R10: dffffc0000000000 R11: fffff94000096e19 R12: ffff8880598a81f0
R13: dffffc0000000000 R14: ffff888012dc3000 R15: 0000000000000000
FS:  00007fc17c5f26c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc17c5f1fe0 CR3: 0000000012d60000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	04 28                	add    $0x28,%al
   2:	84 c0                	test   %al,%al
   4:	0f 85 ef 0c 00 00    	jne    0xcf9
   a:	44 0f b6 3b          	movzbl (%rbx),%r15d
   e:	49 8d 5e 14          	lea    0x14(%r14),%rbx
  12:	48 89 d8             	mov    %rbx,%rax
  15:	48 c1 e8 03          	shr    $0x3,%rax
  19:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
  1e:	84 c0                	test   %al,%al
  20:	0f 85 ed 0c 00 00    	jne    0xd13
  26:	41 0f b6 c7          	movzbl %r15b,%eax
* 2a:	f6 33                	divb   (%rbx) <-- trapping instruction
  2c:	0f b6 dc             	movzbl %ah,%ebx
  2f:	bf 81 00 00 00       	mov    $0x81,%edi
  34:	89 de                	mov    %ebx,%esi
  36:	e8 86 ec 68 fe       	call   0xfe68ecc1
  3b:	80 fb 80             	cmp    $0x80,%bl
  3e:	0f                   	.byte 0xf
  3f:	87                   	.byte 0x87


Tested on:

commit:         e3a854b5 Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14ad9470580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=522f1f3e5f61442b
dashboard link: https://syzkaller.appspot.com/bug?extid=4f9c823a6f63d87491ba
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1167ba3f980000

