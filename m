Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5989264FB2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626510; cv=none; b=umASV1YBe4shyCT2yhNhwlMS2KQ7yShSDxTSQ51GGsk1gTO3TMsGucfo9790nGdxynpQdiPMtELqxS09BUzwBXtBIekr6Rh2V45ZALIWq16AkUwZaoC10xgkYgMxSutFl9Zb9VS+rVAIE1ETlJ269urHP8tmb1rGsbpRbkXlmIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626510; c=relaxed/simple;
	bh=QNiJHg9Iujt1moPmGobOFK6daWoEJc1K+6mlltSx2uE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lgcGjefhycFlEsXYKuQzJ/6vE0fdzFsXZQHb0rtVncEbzSRRUQnkOddHlt+vNr8989UITECZlQwR06f2L1idb4vN+vn0Z4YKXxljZDQ5r0hXnLp3DVzz0MgE1U9ddfrKX0jL7xPtDqlkpeIXPz3ITXI/PYFjiS0C05w2K0rprcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so44966685ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626508; x=1745231308;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4lkqFzcwZSPlruU27nDVJ6UGYkL8otXTJejXiJ31xA=;
        b=XdoePmMKriYZ/qE1tZQ/zLNI0USwnNPAZxkmh8yvyOKvTjurCKBkR6kEbwf9vqiUvn
         wkNydsDWhLz+MzZjjhYKn3G3j5Rt4ElRPSnCOGtQlQm5gPhDas3zqUiZvALifc160rvL
         Qhu1Gw2iS0V/t6UNY7ZZMDaILlRwH9ZfiWmhS8lMO0jdFStpIoOeT2DgmHQBgSMUREml
         rxOipV/SEQFIq1zKb+esjAi+DnCVB52Ypp0ncBYoC22kBTpzJQ+tAPOaX/XZHzbsCofK
         fLxn5pShzAvaYqGW+WzqFaeAlBvusrpNfT9ObNZva0g3AWxfI5/rXHTTeDKCGxD9RmOW
         V5XA==
X-Forwarded-Encrypted: i=1; AJvYcCXxWXjCNetgA9H3zpev6WwFLs9Zh7OaxerS9ODRz9FnB13bjBDLo5zoQcH2eJsUOSp9yAmowjb8mGbS8v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpX89dYUXd1XFgUVlZn/cBgCU3MYHD6F2aVjOuW4MKEKfUsxZn
	xcKggVXO/p7Qp2tRpA7sSkMan4NxtomX/OiDiKxNI+zuY8VhBeLJiVr9MFlfQ3QZLhUJ+E5kf+p
	fqlY7SWjU0gJu+l5nhXOwYPRVDjmrDN5mU221z1t4y+OVBccaVO870xI=
X-Google-Smtp-Source: AGHT+IEt+Fh5uVgjBVrVafvE3hyl1o9ukLCIlOwSsdgbSzTGHmbglZoRewnX7GJEexlFpfhubmdyc1cgY+oAXzt7JQcjvcfceMyB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f0e:b0:3d3:deee:de2f with SMTP id
 e9e14a558f8ab-3d7ec1f3891mr121392875ab.7.1744626507803; Mon, 14 Apr 2025
 03:28:27 -0700 (PDT)
Date: Mon, 14 Apr 2025 03:28:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fce34b.050a0220.3483fc.0026.GAE@google.com>
Subject: [syzbot] [kernel?] linux-next test error: WARNING in switch_mm_irqs_off
From: syzbot <syzbot+c2537ce72a879a38113e@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, luto@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b425262c07a6 Add linux-next specific files for 20250414
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10ddb398580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cc26bd6fced8397d
dashboard link: https://syzkaller.appspot.com/bug?extid=c2537ce72a879a38113e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e04788e9f74f/disk-b425262c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/32ac1bacc159/vmlinux-b425262c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/99cc84c793ed/bzImage-b425262c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c2537ce72a879a38113e@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:919 switch_mm_irqs_off+0x686/0x810 arch/x86/mm/tlb.c:918
Modules linked in:
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc2-next-20250414-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: events once_deferred
RIP: 0010:switch_mm_irqs_off+0x686/0x810 arch/x86/mm/tlb.c:918
Code: 90 41 f7 c5 00 08 00 00 0f 84 ee fa ff ff 90 0f 0b 90 e9 e5 fa ff ff 90 0f 0b 90 e9 76 fe ff ff 90 0f 0b 90 e9 cc fb ff ff 90 <0f> 0b 90 4d 39 f4 0f 85 eb fb ff ff e9 31 fc ff ff 90 0f 0b 90 e9
RSP: 0000:ffffc900000e7680 EFLAGS: 00010056
RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffffffff816ffd4d
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88801b070940
RBP: ffffc900000e7750 R08: ffff88801b070947 R09: 1ffff1100360e128
R10: dffffc0000000000 R11: ffffed100360e129 R12: ffffffff8ee49240
R13: ffff88801b070940 R14: ffffffff8ee49240 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124faa000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000001b078000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 unuse_temporary_mm+0x9f/0x100 arch/x86/mm/tlb.c:1038
 __text_poke+0x7b6/0xb40 arch/x86/kernel/alternative.c:2214
 text_poke arch/x86/kernel/alternative.c:2257 [inline]
 smp_text_poke_batch_finish+0x3e7/0x12c0 arch/x86/kernel/alternative.c:2565
 arch_jump_label_transform_apply+0x1c/0x30 arch/x86/kernel/jump_label.c:146
 static_key_disable_cpuslocked+0xd2/0x1c0 kernel/jump_label.c:240
 static_key_disable+0x1a/0x20 kernel/jump_label.c:248
 once_deferred+0x70/0xb0 lib/once.c:20
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd50 kernel/workqueue.c:3400
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
