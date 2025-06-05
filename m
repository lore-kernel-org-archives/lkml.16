Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701BA1C4A20
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749101914; cv=none; b=sXT7c8uC75RNidZYft4u8a1n/Aww9qgQQREnBiF5vpVK3FARQ+IWHiuZPWjyJFokrev3mx9hyAzYPbA/pd9TBGLWsdK+Kahp1uuSlzyDquWmX/h5kJcRepfb079p335Hsj+HNr+isy9zhbNADFrxiSJv6i6zf7QR8dVfyfMZd3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749101914; c=relaxed/simple;
	bh=tMqMAA3iVFoF1SuMHImtQIU8xCmSQzbCRJ6EArjILYQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RHXHSKZiWLvE2qT1lT7HaXLTzHEpudX2m/m++RhvdemkPr2NUTbKu3iUpK1pNhbKD8MXSZEGa+7ZPByAWm0gwPS6+KpHXWOlw5Gjd5vpugVkyZa6fUvpiUV4cAHKf5oVgbIIGbFtsVrGsJa8Y98zoTxPydzZQch3sPS/mo/Yd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-86cf8ce80e4so50879739f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 22:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749101911; x=1749706711;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/z+LQtVXLG6xTh29GCPAc32w5jdO5ogRdmbiKbJuFqk=;
        b=xJjuv98cZDZL+0aNsNdauDzFMUWe4TEEbyTEoRGcxKInfvgNGNUMFBK9wtS84X40Np
         ci/fojc3pn6y+0COcP2o1ZwBaP5LYv5SqMKoamxVrcPiModtgUPFPxTlEGFtLG5JGBXu
         lLZYkMxr3zayqRJsli+OxPftX9vAxy+kT1KbIHY2COhVdE6JJ97mjGvcgN8aOud6ebvE
         fiUh99+u9a/D0ExkUEhquDXemyYHw8va9GfpLEMqD75b9XWsM5Q20P6/f1XD9IcxL+fe
         n3E/RK1Z+B2Dhtn2fXIOvHVbjIGXdDEohQXAF3keIV4xauDGQ0S1lJnCDnL6/LY7PMQs
         pp3g==
X-Forwarded-Encrypted: i=1; AJvYcCXZVeZqhqFeiVRRYrzylHLQ97aMwSrEIyOpaPVIgagqMchBaNAAGjLzfAUReYbwNB92JZ1HiT6Kh61xJfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/yGSTFb7hg7wM2g/8GLcrfVw0pLjQs1v2afjtle/tIWb0+Bo
	zlBk1+b2omcP4EI6RKn7noW0bm6DWIWX5XJ7GzCFqDdlg+YSkZTNbQrnFCqU0Ay23VDw2T+0Gpg
	+w29pmBEsqDBE1xTMb0xYQ1jrLhRApOOTYVfW1yCr48iRSOJgQX9pF++LO+A=
X-Google-Smtp-Source: AGHT+IEbDqBJiTkeootdL8HXdYfl9FLp8xb9KNkcNyZgJE4vrkPq9BZXR3dVRbdpopg2vuAL1bDO+z30QRvKUj8RKaVb8Km1+g0z
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19c9:b0:3d8:2023:d048 with SMTP id
 e9e14a558f8ab-3ddbedc9af7mr67269165ab.22.1749101911438; Wed, 04 Jun 2025
 22:38:31 -0700 (PDT)
Date: Wed, 04 Jun 2025 22:38:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68412d57.050a0220.2461cf.000e.GAE@google.com>
Subject: [syzbot] [mm?] kernel BUG in try_to_unmap_one (2)
From: syzbot <syzbot+3b220254df55d8ca8a61@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@redhat.com, 
	harry.yoo@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, riel@surriel.com, syzkaller-bugs@googlegroups.com, 
	vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1757300c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=3b220254df55d8ca8a61
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=150f7ed4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13745970580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3b220254df55d8ca8a61@syzkaller.appspotmail.com

head: 05ffc00000000309 fffffdffc6628001 0080000000000000 0000000100000000
head: ffffffff00000000 0000000000000024 00000000ffffffff 0000000000000200
page dumped because: VM_BUG_ON_FOLIO(!pvmw.pte)
------------[ cut here ]------------
kernel BUG at mm/rmap.c:1955!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 9503 Comm: syz-executor315 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : try_to_unmap_one+0x2c54/0x2d40 mm/rmap.c:1955
lr : try_to_unmap_one+0x2c54/0x2d40 mm/rmap.c:1955
sp : ffff80009e906380
x29: ffff80009e9065e0 x28: 0000000000000038
 x27: ffff0000c9dbee80
x26: fffffdffc6628018 x25: fffffdffc6628030 x24: dfff800000000000
x23: ffff0000d84efdc0 x22: ffff0000d84efde0 x21: 0000000000000001
x20: fffffdffc6628000 x19: 05ffc00000020849 x18: 00000000ffffffff
x17: 0000000000000000 x16: ffff80008adbe9e4 x15: 0000000000000001
x14: 1fffe0003386f2e2 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60003386f2e3 x10: 0000000000ff0100 x9 : 664e624a89365e00
x8 : 664e624a89365e00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009e905a98 x4 : ffff80008f415ba0 x3 : ffff8000807b4b68
x2 : 0000000000000001 x1 : 0000000100000001 x0 : 000000000000002f
Call trace:
 try_to_unmap_one+0x2c54/0x2d40 mm/rmap.c:1955 (P)
 rmap_walk_anon+0x47c/0x640 mm/rmap.c:2834
 rmap_walk+0x128/0x1e8 mm/rmap.c:2939
 try_to_unmap+0xc4/0x120 mm/rmap.c:2263
 unmap_poisoned_folio+0x278/0x4a4 mm/memory-failure.c:1610
 shrink_folio_list+0x608/0x4410 mm/vmscan.c:1131
 reclaim_folio_list+0xdc/0x5d0 mm/vmscan.c:2217
 reclaim_pages+0x420/0x544 mm/vmscan.c:2254
 madvise_cold_or_pageout_pte_range+0x1d38/0x20d4 mm/madvise.c:434
 walk_pmd_range mm/pagewalk.c:130 [inline]
 walk_pud_range mm/pagewalk.c:226 [inline]
 walk_p4d_range mm/pagewalk.c:264 [inline]
 walk_pgd_range+0xb4c/0x16bc mm/pagewalk.c:305
 __walk_page_range+0x13c/0x654 mm/pagewalk.c:412
 walk_page_range_mm+0x4fc/0x7dc mm/pagewalk.c:505
 walk_page_range+0x80/0x98 mm/pagewalk.c:584
 madvise_pageout_page_range mm/madvise.c:617 [inline]
 madvise_pageout mm/madvise.c:644 [inline]
 madvise_vma_behavior mm/madvise.c:1269 [inline]
 madvise_walk_vmas mm/madvise.c:1530 [inline]
 madvise_do_behavior+0x1940/0x2908 mm/madvise.c:1695
 do_madvise mm/madvise.c:1782 [inline]
 __do_sys_madvise mm/madvise.c:1790 [inline]
 __se_sys_madvise mm/madvise.c:1788 [inline]
 __arm64_sys_madvise+0x10c/0x154 mm/madvise.c:1788
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: f9404be0 b0051fc1 910c8021 97fdefe4 (d4210000) 
---[ end trace 0000000000000000 ]---


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
