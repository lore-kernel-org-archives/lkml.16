Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25C2253F1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831107; cv=none; b=Z3h4XWK1QTcaUg6MEsbQCMBs/m0H2PgfVNQsGi4vBYjWo5JWENrBrOKtYbd/i+MyTTlInDu6W63gU5JKZuMi2TeR1WO0dRRa6Ly+vRH+cZHUlNKYvYgejxZ3r/0xMljOcsYCLaDpcFKIsNwuCL9hkJLxQ9SpAWcKL8IyBGQwkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831107; c=relaxed/simple;
	bh=GotyDy/3hixvnVJ+W495VcYzvSyIL2tMCytTVnnxr6g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=d+FfliI91z2ZH0d028tmBklnEsrZE9K2qlJSZjL2puV9WjYj+DNmhSuGWFi1B2huv6LB3/l4gZlGEMCl8CP8OfapL9bHiN9G6bOQtHmcoiTJYP4cBn7FvocMg/mbjPyPFXnh5VtM/+BqolHe9K46QMU+elt+/K0Mb43c8TgKEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d04b390e9cso4021495ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738831105; x=1739435905;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNU0XucLC8CzlRubQHYRv8FWriq2+A0FqQsY5s+cVis=;
        b=sYsQyl7V01DlZ3AfTkC3nA4QJWhBGm+9FopeB9VCUm+6ulb1YVM4TmOLSDM/MJjSMm
         gNOVjKpLKzUVSWwxAbUH1U6khAPEE5D4GHPH3rCjKCotGAt8hqYHhRbCj1E/Udm1P5Xd
         XjSZtrSJnY+RtKMyUmPh15Vl0QcWwpvIOnUABMi1V1ZWubMfiM5h3woaQ9jt/RzHbK1x
         t0yonxwyQXU89Tq6ZT14DfVwU+uDZuTF79Px1mTdM7p7Sxg5beVIgreCTjh50m67m3/F
         sS/lVMN33tBwT/JR13KxNiUnkusmmRWETPuUPKeA8O4/oh68OZ6k/1bt1yLY0699yX4m
         i8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRZ8hXVY6Y5FVpM2KCfECIQihgV4yfhaxB1c95XhlwdzTHP8hjJmI8yuNEF3XQfy8ilbQMX7e8ZkMLJco=@vger.kernel.org
X-Gm-Message-State: AOJu0YwelN4JoWPHfS3qDZJWXkEFZSyo8K5JV/za51kfowIXMB8OIS99
	Sd5uu7UPZyr4fuIyTDJ5+oyZ/C3t+lKdwRyNTdl4iHe2G9T+ehUZmvSJhQOp8revXwY615pCzdz
	wGKygJ5WNK7BGnaCCrPEgQS4Zv4tr4nRBQk+SYhs2lF8Q950zlTa4GHg=
X-Google-Smtp-Source: AGHT+IFHHumyfEON0maZgp5NQ+/WAh0tAs/W4saltkncAIefLIH/HkpzkaMlHiy8M/kjjKtdwO5NBcpm7m7CroRdZcJuv64+Qnpk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda5:0:b0:3d0:4d38:4e5b with SMTP id
 e9e14a558f8ab-3d04f922983mr61266865ab.22.1738831105064; Thu, 06 Feb 2025
 00:38:25 -0800 (PST)
Date: Thu, 06 Feb 2025 00:38:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a47501.050a0220.19061f.05f9.GAE@google.com>
Subject: [syzbot] [nfs?] [net?] WARNING in remove_proc_entry (7)
From: syzbot <syzbot+e34ad04f27991521104c@syzkaller.appspotmail.com>
To: Dai.Ngo@oracle.com, chuck.lever@oracle.com, jlayton@kernel.org, 
	linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, neilb@suse.de, 
	netdev@vger.kernel.org, okorniev@redhat.com, syzkaller-bugs@googlegroups.com, 
	tom@talpey.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    92514ef226f5 Merge tag 'for-6.14-rc1-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=151e9318580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c48f582603dcb16c
dashboard link: https://syzkaller.appspot.com/bug?extid=e34ad04f27991521104c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131e9318580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b3df3b128344/disk-92514ef2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/30f6f3763191/vmlinux-92514ef2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/caeb03ac3f9c/bzImage-92514ef2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e34ad04f27991521104c@syzkaller.appspotmail.com

name 'nfsd'
WARNING: CPU: 1 PID: 6518 at fs/proc/generic.c:713 remove_proc_entry+0x268/0x470 fs/proc/generic.c:713
Modules linked in:
CPU: 1 UID: 0 PID: 6518 Comm: kworker/u8:8 Not tainted 6.14.0-rc1-syzkaller-00034-g92514ef226f5 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: netns cleanup_net
RIP: 0010:remove_proc_entry+0x268/0x470 fs/proc/generic.c:713
Code: 08 eb a2 e8 1a 9c 62 ff 48 c7 c7 20 7e 41 8e e8 4e c4 f2 08 e8 09 9c 62 ff 90 48 c7 c7 c0 db 81 8b 4c 89 e6 e8 29 76 23 ff 90 <0f> 0b 90 90 e9 72 ff ff ff e8 ea 9b 62 ff 49 8d be 98 00 00 00 48
RSP: 0018:ffffc9000bec7a80 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 1ffff920017d8f52 RCX: ffffffff8179c889
RDX: ffff888031a35a00 RSI: ffffffff8179c896 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 00000000000ca440 R12: ffffffff8b8f7460
R13: dffffc0000000000 R14: ffff88807e22da00 R15: fffffbfff1cb7dc4
FS:  0000000000000000(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000000237ba000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 nfsd_net_exit+0x27/0x50 fs/nfsd/nfsctl.c:2259
 ops_exit_list+0xb0/0x180 net/core/net_namespace.c:172
 cleanup_net+0x5c6/0xbf0 net/core/net_namespace.c:652
 process_one_work+0x958/0x1b30 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x3af/0x750 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


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
