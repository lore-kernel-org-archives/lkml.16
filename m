Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2A328B7F8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291441; cv=none; b=orVcApsm6hTMxlo8BwRVicSXgETTVxMgOMb37fqZ6wrsuwaTyQOwsahGIcn0bwHQwJZ7sZmtpG4jyilt6C5IygaVfUorh1hja/3tUkmQDpiyMtn0Pv47geqbQPNkE1kaF0MBjfXmFl0E1JOuQyTlEGmSYD7dPauDaR6DASYzemY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291441; c=relaxed/simple;
	bh=Vg9nGVU0uFpGqFaJ21lWzf1qScLwRwSjeWE1zKUiVQc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KIeaJnSqS4Z9zYAYWWpk09YvQd9BmAyy6kXS6vyOjiY3PtPPQ28wC5mbtIBKJ6XwaOPsXy8JsKLnEWd5EtzIdx94S6KMyjMm9TyUl3n6RQ87yqrCjnggedVWboauyPmzSe3mdOGiSUTTFmveLmzxe21eGVNp1hMgnVYdFf8oAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddbec809acso50252055ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291438; x=1751896238;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhrN57tRASQZfXCRJf6lFHVz7sDmGWR5JpV8E4+RqZA=;
        b=UG8R2OrPafa540NIGjsMf4e8do51fB7D8FrkgHQOtsqsxrIDjYn0Bk2zQ3FsQSm+S1
         5EzAMoBDbAGfCw5OtI3ldjYkM34VVbkNuzcui7TZD+b2+lVtqjcKJWy2pOnCbqSCx3nu
         LWQ3cENXwIuB8ChwuariMqHAQbN7Ip5KRvjIS6inqum8B0e+xiwxi+xgtCw5bh3mUO7z
         UHa44OmLFb0dkcWC7AzeNdKpEpDAJKY4zAoQDEt4doq0H6oWEZ2Qu89G+x4MxNWsBwBS
         kQ5/6V+w96yYF8AWiMKkWjosBM+slz/nfIvyaspB7YK1a5p23TwU+HbtLYshgUj6afjy
         yKHQ==
X-Gm-Message-State: AOJu0YwnP0JiWKqNbNc1ouqFt4qnShLVcXJO5/BZHHAJvvSWqjOQKcM5
	3C1WeJC8R0cpUOR60TkWFqDdzgZM6uTa9Nk7S/YUoeNINZdTWCNpphf5gJFxeB18JZOeLWmDA+K
	ZAa8WFjr76YmYMCfB9ZHuPDNIQbSeMZzLyV6aiq3unxItyJKluah3Mz6hb6s=
X-Google-Smtp-Source: AGHT+IGnW+FdwNrYZR2a5VJorB1IX7+kDdx9+91bbAC1L5jYkYbkQAg9yiiGKA1oBML+wL228F2oskVfElE75gVH7ZcqbEc1bM+7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f0e:b0:3dd:d18a:2d71 with SMTP id
 e9e14a558f8ab-3df4ab5dd4cmr134340385ab.2.1751291438706; Mon, 30 Jun 2025
 06:50:38 -0700 (PDT)
Date: Mon, 30 Jun 2025 06:50:38 -0700
In-Reply-To: <68610b72.a70a0220.2f4de1.0019.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6862962e.a70a0220.3b7e22.0f14.GAE@google.com>
Subject: Re: [syzbot] Private message regarding: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Private message regarding: [syzbot] [ntfs3?] WARNING in ni_rename
Author: kapoorarnav43@gmail.com

#syz test: 
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

From 00325fe8a9658ef0d9e0082dd98c09adc01875fa Mon Sep 17 00:00:00 2001
From: Arnav Kapoor <kapoor...@gmail.com>
Date: Sun, 29 Jun 2025 15:29:27 +0530
Subject: [PATCH] ntfs3: log error instead of WARN_ON in ni_rename cleanup 
failure

If ni_remove_name fails and undoing ni_add_name also fails,
add an error log and mark the inode as bad,
instead of triggering a WARN_ON.

This avoids kernel WARNING reports from syzbot,
while still keeping the error visible in logs.

Reported-by: syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com
Signed-off-by: Arnav Kapoor <kapoor...@gmail.com>
---
 fs/ntfs3/frecord.c | 2 +-
 1 file changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.cindex 
b7a83200f2cc..xxxxxxxxxxxx 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3029,11 +3029,11 @@ int ni_rename(...)
        if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo)) {
                ntfs_err(sb, "ni_rename: failed to clean up after add_name 
failure");
                *is_bad = true;
-               WARN_ON(err);
+               ntfs_warn(sb, "ni_rename: incomplete rename cleanup, 
marking bad");
        }


On Monday, 30 June 2025 at 17:25:07 UTC+5:30 syzbot wrote:

Hello, 

syzbot has tested the proposed patch but the reproducer is still triggering 
an issue: 
WARNING in ni_rename 

loop0: detected capacity change from 0 to 4096 
------------[ cut here ]------------ 
WARNING: fs/ntfs3/frecord.c:3030 at ni_rename+0xee/0x100 
fs/ntfs3/frecord.c:3029, CPU#0: syz.0.16/6714 
Modules linked in: 
CPU: 0 UID: 0 PID: 6714 Comm: syz.0.16 Not tainted 
6.16.0-rc4-next-20250630-syzkaller-g1343433ed389 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS 
Google 05/07/2025 
RIP: 0010:ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029 
Code: 8b 05 66 63 9a 0f 48 3b 44 24 10 75 22 44 89 e0 48 83 c4 18 5b 41 5c 
41 5d 41 5e 41 5f 5d e9 49 ac 6c 08 cc e8 b3 fe b9 fe 90 <0f> 0b 90 eb c5 
e8 18 d2 69 08 0f 1f 84 00 00 00 00 00 90 90 90 90 
RSP: 0018:ffffc90002eb7ab8 EFLAGS: 00010293 
RAX: ffffffff8305ccdd RBX: 00000000fffffffe RCX: ffff888020b28000 
RDX: 0000000000000000 RSI: 00000000fffffffe RDI: 0000000000000000 
RBP: 00000000fffffffe R08: ffffffff8fa17437 R09: 1ffffffff1f42e86 
R10: dffffc0000000000 R11: fffffbfff1f42e87 R12: 0000000000000000 
R13: ffff88803385e600 R14: ffff888077140758 R15: ffff888066ebe6d0 
FS: 00007f59ac0016c0(0000) GS:ffff888125c1d000(0000) knlGS:0000000000000000 
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033 
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
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff 
ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48 
RSP: 002b:00007f59ac001038 EFLAGS: 00000246 ORIG_RAX: 0000000000000052 
RAX: ffffffffffffffda RBX: 00007f59ab3b5fa0 RCX: 00007f59ab18e929 
RDX: 0000000000000000 RSI: 0000200000001040 RDI: 0000200000000280 
RBP: 00007f59ab210b39 R08: 0000000000000000 R09: 0000000000000000 
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000 
R13: 0000000000000000 R14: 00007f59ab3b5fa0 R15: 00007fff104b3398 
</TASK> 


Tested on: 

commit: 1343433e Add linux-next specific files for 20250630 
git tree: linux-next 
console output: https://syzkaller.appspot.com/x/log.txt?x=10bfa770580000 
kernel config: https://syzkaller.appspot.com/x/.config?x=c1ce97baf6bd6397 
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64 
compiler: Debian clang version 20.1.6 
(++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 
20.1.6 
patch: https://syzkaller.appspot.com/x/patch.diff?x=1147848c580000 

