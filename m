Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987901ADC8D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963042; cv=none; b=X9jgEeiyLTXQdXEfDg4P4hqDdwcMXG6eUmtKIsDFbud1i6U/7FLvVcTu+0vQbViPd8uBqScShFZrC1YDU9qChlsG+UYYM9Qhz5J5/o3F130YvetWVWT/cfz9aZHszTRcVxDqdZvK+H3IGM458XNf2o/JpdkTDDJmx+3lNWq4r3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963042; c=relaxed/simple;
	bh=6Hy8zVzPzkZgCq5GpSyXMgZ7/AA9rCnGVEP4DvXoOCM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GfkryeBsF0pg/37dPU3euXOi9vwIpqhB26VS3tEAbJ9CbtjGzGn5OBRRheMhmw7rEFXj7Vcn24aZviCC2fyD9x5LMJrR8pLOnjtGcgEqS+/8+ULeRIYLaG/9d3E1HEDq9j3cnUZyHKOAYgc0jiZYeimY8TEBbRL6lm1onmNk5Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so16226565ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963039; x=1745567839;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHsUU6+jU7jVdPVUvoJvihopkWZvyuOuD44t9zAO1fA=;
        b=KxH4KJXcp8dyTNvskunHuTgPIupIq7O9DaNDF92KEuE/pwixYt0Ze9pCl9vWBSjSrh
         Z+YVTMi56I7Ska/m/UpdWvNX6/7f7YCJQ6PQ7D1P27YpRM4ePu1aLRaXLwxd4XYzE3UZ
         GGPaZQ7t7dfo3x1NM26VT631NtfNkLwOf/MxfYMsJWfGeI84jBWYQSlURtyThOB1Zzmz
         eq/mv+za7/Wo4lJSP2KIsNo8S0MlHUrJFf/uVUVZSPbJEyA+GQsfwp0wr042S5oLqFmX
         ZCXm1iaAmlBB7pOVu+LhQ5ztfp1LHShRo6LtCFmHGEbqZHul42jJxdfvSBUOXbd1lana
         Ia1g==
X-Forwarded-Encrypted: i=1; AJvYcCUvHIiK4UB1+rPyjhW1nOzn9qItq4OqsFcRzPNec0WvPo38C7SnPZqYpFrPHwsS/3AkTMOlkfx9h8K8Obg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjzFGKWwuDIVaPzL7gpIqoY5ZGfGc58jd36xA7Cq+s3/xP6fzD
	XvbGjxd1ZEWVwnPsllQ7TsXoEGPptrSj4jITZJgSNq3zQUye3mA5hE6atgPBO+C4ZXL7GbOr55x
	y4xqJnN3lY1aTZw9pwrvJEeVkudkOgglM3DBd0PJpHNNHv6PxrAvRL1M=
X-Google-Smtp-Source: AGHT+IFdfk18cor5y25v2vgQe6DRErLb7W35+OZfRcMMrBaUSx89TmzXX7X/WARGvLOQ4EnYgIMlEy+gC2fAxrJnBeXVjPxzSZxC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd84:0:b0:3d5:891c:13fb with SMTP id
 e9e14a558f8ab-3d88ed7c316mr16756365ab.4.1744963039685; Fri, 18 Apr 2025
 00:57:19 -0700 (PDT)
Date: Fri, 18 Apr 2025 00:57:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680205df.050a0220.297747.0004.GAE@google.com>
Subject: [syzbot] [hfs?] KMSAN: uninit-value in hfs_brec_keylen
From: syzbot <syzbot+5405d1265a66aa313343@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8ffd015db85f Linux 6.15-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=104d20cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e30b69a28cc940e1
dashboard link: https://syzkaller.appspot.com/bug?extid=5405d1265a66aa313343
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1790ea3f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e17398580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b099795f8c63/disk-8ffd015d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a10b15dc31a5/vmlinux-8ffd015d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/24a20f2e33c6/bzImage-8ffd015d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/acf63dfb20d0/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5405d1265a66aa313343@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 64
=====================================================
BUG: KMSAN: uninit-value in hfs_brec_keylen+0x423/0x610 fs/hfs/brec.c:46
 hfs_brec_keylen+0x423/0x610 fs/hfs/brec.c:46
 __hfs_brec_find+0x111/0x830 fs/hfs/bfind.c:69
 hfs_brec_find+0x436/0x980 fs/hfs/bfind.c:138
 hfs_cat_move+0x116d/0x12e0 fs/hfs/catalog.c:372
 hfs_rename+0x344/0x500 fs/hfs/dir.c:299
 vfs_rename+0x1d9d/0x2280 fs/namei.c:5086
 do_renameat2+0x1577/0x1b80 fs/namei.c:5235
 __do_sys_rename fs/namei.c:5282 [inline]
 __se_sys_rename fs/namei.c:5280 [inline]
 __x64_sys_rename+0xe8/0x140 fs/namei.c:5280
 x64_sys_call+0x3a1e/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable data created at:
 hfs_bnode_read_u16+0x3d/0x90 fs/hfs/bnode.c:-1
 hfs_brec_keylen+0x23e/0x610 fs/hfs/brec.c:45

CPU: 0 UID: 0 PID: 5794 Comm: syz-executor252 Not tainted 6.15.0-rc2-syzkaller #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
=====================================================


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
