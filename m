Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABE3323D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745544784; cv=none; b=CEveXbap02yxHVullWocnY5AtdICLcgNKjlZ8QXBa3zCzPKOYHxBlflOk5EaAoN35kmsvqNZ3ex94tminsDaEUb3rvd7X8Pr/7Fk23J2+1Zm9iyPLiKzr3Z+3uFcmGP2A085/OjeNoLd+2t2ZYtxL+6o5/W+MkFFJOlNSUpo6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745544784; c=relaxed/simple;
	bh=9ug4xSUAW9TuIdoLjeg96yqPQK1QHyVTG8oAI+Lw9w8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QI89Ggh5G8TY7rAg6wfgGOjb61FlO0mLXEEeyP4FwRK2yHfRmQH5Nd8nEPbjM5RDOinNiTEVWhwY50hzVTheVcPnk70PYstQDpxBik3TvbE3iudUVn25BtALjA29M/mnaJLdoagkofl4j1qb+na+qTvbtXNsYKezhAm74P4eHVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b3a6c37e2so177235439f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745544782; x=1746149582;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPXbTjTNryLJ3uxLAOdoyWlXwAcDBcy4Qhd1GulMYZY=;
        b=jsuL6gyNX9TAtPSgAkEr4xa8r9AiT2K9IR4oAFktx1xMeNqbj4+QubVWqtFEjzY9i+
         1Zjky6RETttx2aSnA/WatDtsb577x6+K0YLN5VvvGOnzUAc3daLaL8DwxD6+Pq+AK2Bd
         4efLZd0w7BYMfaocW4/fUuqAr/wgQoSziY4heYLe5rOqlH9iqxdkYbjwbgPPnxLB9NR9
         tmmooPHlo63Zx24edRHHdnF2l/OjoV3FnPLgs36vq4W9shHggSb09c3offBHHfw9VDN9
         CzhF5A82p+6P9fa3qy24u6BiyzW7vOtESmacTyrVFgGsJRoVL11BOTZhtn3q3A/IbaZS
         61yQ==
X-Gm-Message-State: AOJu0Yx7ZbMN9O62I5BQf8rYP+zvLOp6PYQKE+lOouX4Oehb5vGW2JRY
	vzIzlOxILKnjas6GIV3cs9rUvKtMOtAipIiSFpb/kVZKzE7YoCs6gm1VoGNU7nfDmxl4SBVul3Q
	smp0fmuTUmvOvblSohRD3VnRmn7eriBlYFQkDcogllh9b8C9CQhwCsSM=
X-Google-Smtp-Source: AGHT+IG510kJ7Matk+027ubJeIYq7UBceG+IcFWrvSpVMRlPXT8LT12ltGXoE+pwZEEXHx4NDckC0iJG41tbRayKqwEOEXczJt2n
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1343:b0:861:c75a:27a2 with SMTP id
 ca18e2360f4ac-8645ccb259emr78927539f.4.1745544782365; Thu, 24 Apr 2025
 18:33:02 -0700 (PDT)
Date: Thu, 24 Apr 2025 18:33:02 -0700
In-Reply-To: <20250425011940.3072994-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680ae64e.050a0220.317436.0052.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel NULL pointer
 dereference in lo_rw_aio
From: syzbot <syzbot+6af973a3b8dfd2faefdc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: unable to handle kernel NULL pointer dereference in filemap_read_folio

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 0 P4D 0 
Oops: Oops: 0010 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 46 Comm: kworker/u32:2 Not tainted 6.15.0-rc3-syzkaller-g02ddfb981de8-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: loop8 loop_rootcg_workfn
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90000a3f5a0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff81f2b3ae
RDX: ffff88801f2bc880 RSI: ffffea0000e2d740 RDI: ffff88801fc48e00
RBP: ffffea0000e2d740 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000002be0 R12: 1ffff92000147eb5
R13: ffff88801fc48e00 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d6bb2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000012f76000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 filemap_read_folio+0xc5/0x2a0 mm/filemap.c:2401
 filemap_create_folio mm/filemap.c:2536 [inline]
 filemap_get_pages+0xf39/0x1c20 mm/filemap.c:2597
 filemap_read+0x3d2/0xe90 mm/filemap.c:2702
 generic_file_read_iter+0x344/0x450 mm/filemap.c:2894
 lo_rw_aio.isra.0+0x9c2/0xd90 drivers/block/loop.c:393
 do_req_filebacked drivers/block/loop.c:424 [inline]
 loop_handle_cmd drivers/block/loop.c:1866 [inline]
 loop_process_work+0x8a4/0x10d0 drivers/block/loop.c:1901
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffc90000a3f5a0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff81f2b3ae
RDX: ffff88801f2bc880 RSI: ffffea0000e2d740 RDI: ffff88801fc48e00
RBP: ffffea0000e2d740 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000002be0 R12: 1ffff92000147eb5
R13: ffff88801fc48e00 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d6bb2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000012f76000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         02ddfb98 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16aefd9b980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=efa83f9a6dd67d67
dashboard link: https://syzkaller.appspot.com/bug?extid=6af973a3b8dfd2faefdc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=110efd9b980000

