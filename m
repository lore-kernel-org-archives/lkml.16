Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B4E1F419B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282351; cv=none; b=T/zgvKwJDX/eoU29ub9KqC5Lt5L8kG0o5L+KhXG81dWxJKw9dU1p+oIOA9XJ64SS89og46Widny/AV/Z1CNj8r2qcj2E988j/4mF1lY8jd2Vt4HipOZ+9Xl1TYxzyvebgMcyenDfXz/0awhETzYdm3Zl5sd/qFosNoEeI0uvjFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282351; c=relaxed/simple;
	bh=1WmyG+hMazKB8fjl6eH33Fazc36CtKsBVc7aADnm5LQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lhnr8c8ePBI2YOYxuISU3V9X1wwKRSyyoD9gW3PH4ITPzZ8N+d0MFrwNyVhmYaG86PM8wcb15DNw/LHja2m97KCNmNy6Ucx0iZYdwwfQ7hRvGzDl5w0PuQ57Zf5x/79nSdmTqlirapJe/+W8UMxlEFLkLnxZ0Cr96OHU8hz/k/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so33271655ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282349; x=1751887149;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPz6P+CeLrWJe1ZaU3mrruBP+wIOp3bwKhleH/4aIag=;
        b=SwkPDUmH2E+aa/DXSWcSqFWF1/UKHIJpupWbIPXxeTaiOyR83BGDzKUQSL7LU4KM2M
         vpR3IwyZvrMxY2RcoT9w39lFouz8cwqQvDxnkQyZJ+C62ygYSMI7TNvWsctQ47+xlK3F
         U0HvFQ0yf1XI6GXP0EXiHrTWwvTKwTVGmddq10PeARqBmqulPExnwyN5E+PXSYPOshKH
         ugiengzpez20hvwV/xNk/OaURvQ/EodRBiumaoKtxXVmrgR0jmEXvus5CfeKZWbisqHc
         xXocUtqiniSNd3UO+8eXb8AbzehcZT6fwOoRL0TbDPZvtM9Jzj1+DB1cYNsyCOx+ND9F
         QSdg==
X-Gm-Message-State: AOJu0Yz+/6g4tauTb/g3hKdK5GWt1sZxazbAxzaOWRGHG9oDGTeAoSTa
	dA/YNlnX6gryYqtExR1iAkQD08Oy+11KsBO9CPwt9eyhrOFvalw8+5HxpMgCPwl/L8+TatrrBvU
	YYArZ5Cvtdz/uT60Z7Se61NrYSP7se8YqhWIsRkGEzoUndoQ0t55egwK6EDX6uw==
X-Google-Smtp-Source: AGHT+IFziUD3IJjV9AOx3jDXkajuaz62xocgG/I7c1OYXg0tR92TX5IrhR7U+ORLG4OuRZt7ApAfKhtKQH3Jby2KeSXOi/OWRWGt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2287:b0:3df:3bc5:bac1 with SMTP id
 e9e14a558f8ab-3df4ab5e330mr128858675ab.5.1751282349178; Mon, 30 Jun 2025
 04:19:09 -0700 (PDT)
Date: Mon, 30 Jun 2025 04:19:09 -0700
In-Reply-To: <68610b72.a70a0220.2f4de1.0019.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686272ad.a70a0220.d08a1.0006.GAE@google.com>
Subject: Re: [syzbot] Private message regarding: [syzbot] [ntfs3?] WARNING in ni_rename
From: syzbot <syzbot+b0373017f711c06ada64@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Private message regarding: [syzbot] [ntfs3?] WARNING in ni_rename
Author: kapoorarnav43@gmail.com


#syz test

From 00325fe8a9658ef0d9e0082dd98c09adc01875fa Mon Sep 17 00:00:00 2001
From: Arnav Kapoor <kapoor...@gmail.com <https://groups.google.com/u/1/>>
Date: Sun, 29 Jun 2025 15:29:27 +0530
Subject: [PATCH] ntfs3: log error when cleanup in ni_rename fails

If ni_remove_name fails and undoing ni_add_name also fails,
add an error log so the failure is visible.

Reported-by: syzbot+b03730...@syzkaller.appspotmail.com 
<https://groups.google.com/u/1/>
Signed-off-by: Arnav Kapoor <kapoor...@gmail.com 
<https://groups.google.com/u/1/>>
---
 fs/ntfs3/frecord.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index b7a83200f2cc..8e9d2ea4e37e 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3027,8 +3027,10 @@ int ni_rename(struct ntfs_inode *dir_ni, struct 
ntfs_inode *new_dir_ni,
  err = ni_add_name(new_dir_ni, ni, new_de);
  if (!err) {
  err = ni_remove_name(dir_ni, ni, de, &de2, &undo);
- if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo))
+ if (err && ni_remove_name(new_dir_ni, ni, new_de, &de2, &undo)) {
+ ntfs_err(sb, "ni_rename: failed to clean up after add_name failure");
  *is_bad = true;
+ }
  }
 
  /*
-- 
2.43.0


On Sunday, 29 June 2025 at 15:16:28 UTC+5:30 syzbot wrote:

Hello, 

syzbot found the following issue on: 

HEAD commit: 1b152eeca84a Add linux-next specific files for 20250625 
git tree: linux-next 
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1409df0c580000 
kernel config: https://syzkaller.appspot.com/x/.config?x=a3d8d413c6928dae 
dashboard link: https://syzkaller.appspot.com/bug?extid=b0373017f711c06ada64 
compiler: Debian clang version 20.1.6 
(++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 
20.1.6 
syz repro: https://syzkaller.appspot.com/x/repro.syz?x=1683770c580000 
C reproducer: https://syzkaller.appspot.com/x/repro.c?x=1183770c580000 

Downloadable assets: 
disk image: 
https://storage.googleapis.com/syzbot-assets/4fe40968b29a/disk-1b152eec.raw.xz 
vmlinux: 
https://storage.googleapis.com/syzbot-assets/edf810403580/vmlinux-1b152eec.xz 
kernel image: 
https://storage.googleapis.com/syzbot-assets/0b63be52ad9a/bzImage-1b152eec.xz 
mounted in repro: 
https://storage.googleapis.com/syzbot-assets/3256aebc06d8/mount_0.gz 

IMPORTANT: if you fix the issue, please add the following tag to the 
commit: 
Reported-by: syzbot+b03730...@syzkaller.appspotmail.com 

------------[ cut here ]------------ 
WARNING: fs/ntfs3/frecord.c:3030 at ni_rename+0xee/0x100 
fs/ntfs3/frecord.c:3029, CPU#0: syz-executor359/5838 
Modules linked in: 
CPU: 0 UID: 0 PID: 5838 Comm: syz-executor359 Not tainted 
6.16.0-rc3-next-20250625-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS 
Google 05/07/2025 
RIP: 0010:ni_rename+0xee/0x100 fs/ntfs3/frecord.c:3029 
Code: 8b 05 36 32 9a 0f 48 3b 44 24 10 75 22 44 89 e0 48 83 c4 18 5b 41 5c 
41 5d 41 5e 41 5f 5d e9 19 b4 6b 08 cc e8 73 fe b9 fe 90 <0f> 0b 90 eb c5 
e8 e8 d9 68 08 0f 1f 84 00 00 00 00 00 90 90 90 90 
RSP: 0018:ffffc9000420fab8 EFLAGS: 00010293 
RAX: ffffffff8305be0d RBX: 00000000fffffffe RCX: ffff888029afbc00 
RDX: 0000000000000000 RSI: 00000000fffffffe RDI: 0000000000000000 
RBP: 00000000fffffffe R08: ffffffff8fa18d37 R09: 1ffffffff1f431a6 
R10: dffffc0000000000 R11: fffffbfff1f431a7 R12: 0000000000000000 
R13: ffff88807c10a200 R14: ffff8880776e8758 R15: ffff888073d566d0 
FS: 0000555581b87380(0000) GS:ffff888125c21000(0000) knlGS:0000000000000000 
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033 
CR2: 000055e3bd1067a8 CR3: 0000000072ba4000 CR4: 00000000003526f0 
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000 
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400 
Call Trace: 
<TASK> 
ntfs_rename+0x6e2/0xb40 fs/ntfs3/namei.c:316 
vfs_rename+0xbda/0xf00 fs/namei.c:5129 
do_renameat2+0x6ce/0xa80 fs/namei.c:5278 
__do_sys_rename fs/namei.c:5325 [inline] 
__se_sys_rename fs/namei.c:5323 [inline] 
__x64_sys_rename+0x82/0x90 fs/namei.c:5323 
do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline] 
do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94 
entry_SYSCALL_64_after_hwframe+0x77/0x7f 
RIP: 0033:0x7fe16d5c28b9 
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff 
ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48 
RSP: 002b:00007ffcc6842518 EFLAGS: 00000246 ORIG_RAX: 0000000000000052 
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007fe16d5c28b9 
RDX: 0000000000000000 RSI: 0000200000001040 RDI: 0000200000000280 
RBP: 0030656c69662f2e R08: 0000000000000000 R09: 0000000000000000 
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001 
R13: 00007ffcc68426f8 R14: 0000000000000001 R15: 0000000000000001 
</TASK> 


--- 
This report is generated by a bot. It may contain errors. 
See https://goo.gl/tpsmEJ for more information about syzbot. 
syzbot engineers can be reached at syzk...@googlegroups.com. 

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

