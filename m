Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8BF1FAC54
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936973; cv=none; b=HuFWFfcxOrx/lfauc4QZA1Qx7e6VfbMeLmZMlapJZ8uKUBLdRnn8pXQ1TqxBxH6yk5AkOI3NcH4atzHz1U+i7I44cbRoZ7OUj5E3K4IqMiL6Pk2RKuQ11zWBzuNhTZxxbQnPNaOxCwi5pcYTwXZpulncF7XC6+NmoVlj2QmNBs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936973; c=relaxed/simple;
	bh=6feLSEvWANFSgugM0sTx7dNCji40r8iCDXNOfSR/Xbo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=A7fshoaT//JnJm2klvhlCOx7rTuLOUzHssg3xsNzKWMnqtH0vNE+mWIOqXeh8EMm7DKy5fn0yjSXAv3O6NERGdFuPbxgB+ghOMLrduKh3OVYYjbMSUcSp9hFn2FLmz4mIwO31QR1dG81jHJ/qe2ti5P/1RDUCSuGp4M0ONSvYJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so2602955ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936971; x=1749541771;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgfOAFmCrXCH7PwD/lLah60dOJ4d9zbh1pFCDkjU2GE=;
        b=TL7MUMo8iCtpa4YF5essh2SRlRKUFwHavx4a4/qAUvTtUMiaq3/aLd3XVFAqVKp+dq
         xXhZhmi1/feLy1FpEgsIeqTyzovnFspkBWtm2T7HvIeMXGIG/rkt9KgtTnOAH7QRRk1u
         r3Mz6gCCsUQ4ePgIaZR50crMk/ueiJ61IGoTzs+5OW/tjPB9OmcHQhHbRK5W5g7HK1Re
         u+5NLAuI8b/iA+U9uhyGObTmGASDrhDk/jub3m5iXPC06r7oUzWzEx2SYtPRyQdYvO89
         33mxbSFHJeSoxxs28seWOIQcRe6AmhviqQeUFAXR3JYQm3MhP3dK9GfSVKUJ9rTHzfX1
         eIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGVGq6H6XydcOLWs5IzrNIDKTflr8Cvt3+n0Tzzm4dN36sKLE989Cse6ZLLFDOSeCRE3snSc54d2+H1i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNyMOzODQcL+EGDnLVwxwBKyYDYLHOOxs9L1H0UEpcAaFq5Ode
	o/Z3Av1ZsgAp17+EYIm2SjPRUeZgnty9AtEYGzyeP6kdNKQXhZ5BhnkeABC2MY7r5dluWHcHd9P
	8iUAKNcgARy+x+LbMrBWfG/o4W5Ztou06iaKsqqkzHxGx301iIwU/3hqYhvo=
X-Google-Smtp-Source: AGHT+IEJjxEam6barcslJx2yhhaF2Q7P/P974RajlrdjkY3LUGodlvgVEohyw/0mKz0ccLrVmHtzIPvMgwbKoCKtC6okFEpaZTyD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:164c:b0:3dc:7fa4:834 with SMTP id
 e9e14a558f8ab-3dd9cc02b5bmr154536675ab.15.1748936971155; Tue, 03 Jun 2025
 00:49:31 -0700 (PDT)
Date: Tue, 03 Jun 2025 00:49:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683ea90b.a00a0220.d8eae.0060.GAE@google.com>
Subject: [syzbot] [udf?] WARNING in udf_fiiter_add_entry
From: syzbot <syzbot+969e250fc7983fc7417c@syzkaller.appspotmail.com>
To: jack@suse.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e0797d3b91de Merge tag 'fs_for_v6.16-rc1' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12c847f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5035170c334b10e0
dashboard link: https://syzkaller.appspot.com/bug?extid=969e250fc7983fc7417c
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1540a970580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=129e9ed4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/87203e463647/disk-e0797d3b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b7c4b444e00e/vmlinux-e0797d3b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/632be8fa8cc2/bzImage-e0797d3b.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/b2be54974ef9/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+969e250fc7983fc7417c@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 7408 at fs/udf/namei.c:214 udf_expand_dir_adinicb fs/udf/namei.c:214 [inline]
WARNING: CPU: 1 PID: 7408 at fs/udf/namei.c:214 udf_fiiter_add_entry+0x183e/0x1e10 fs/udf/namei.c:262
Modules linked in:
CPU: 1 UID: 0 PID: 7408 Comm: syz-executor141 Not tainted 6.15.0-syzkaller-08297-ge0797d3b91de #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:udf_expand_dir_adinicb fs/udf/namei.c:214 [inline]
RIP: 0010:udf_fiiter_add_entry+0x183e/0x1e10 fs/udf/namei.c:262
Code: 44 89 f1 41 d3 ef 41 01 df 44 89 7c 24 20 48 8b 5c 24 10 e9 f0 fb ff ff e8 3f 11 8c fe 89 d8 e9 a8 fe ff ff e8 33 11 8c fe 90 <0f> 0b 90 e9 1e f9 ff ff 44 89 f9 80 e1 07 38 c1 0f 8c 93 e8 ff ff
RSP: 0018:ffffc9000c857320 EFLAGS: 00010293
RAX: ffffffff833418cd RBX: 00000000ffffff8b RCX: ffff88802c835a00
RDX: 0000000000000000 RSI: 00000000ffffff8b RDI: 0000000000000000
RBP: ffffc9000c857730 R08: ffff888022e45b43 R09: 1ffff110045c8b68
R10: dffffc0000000000 R11: ffffed10045c8b69 R12: dffffc0000000000
R13: 1ffff9200190ae88 R14: ffff888074dd2020 R15: 0000000000000200
FS:  000055557eba4380(0000) GS:ffff888125d98000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f95825da00a CR3: 000000003333e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 udf_rename+0x69b/0xcd0 fs/udf/namei.c:843
 vfs_rename+0xb9c/0xec0 fs/namei.c:5128
 do_renameat2+0x878/0xc50 fs/namei.c:5277
 __do_sys_renameat2 fs/namei.c:5311 [inline]
 __se_sys_renameat2 fs/namei.c:5308 [inline]
 __x64_sys_renameat2+0xce/0xe0 fs/namei.c:5308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f95825912d9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdb0ba3048 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f95825912d9
RDX: 0000000000000004 RSI: 0000200000000080 RDI: 00000000ffffff9c
RBP: 00000000ffffffff R08: 0000000000000000 R09: 0000000000000000
R10: 0000200000000980 R11: 0000000000000246 R12: 0000000000010000
R13: 00007ffdb0ba30e0 R14: 0000200000000500 R15: 0000000000000003
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
