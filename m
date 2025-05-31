Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC9B238C2F
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748697569; cv=none; b=kYZLkyccZWpTYQIFPMJHBr7DOnpN72O8oFiAmyhmbChSb5WTc+klGC4VIoBrB6fn0d0udndq2rGUqssEOPZYMRXfWTr+N8GcqFxNZdCDOrYdE+PYjxVl8xk/fAOGqkJWI9265xzEtLzu+c9fgt49z9981TDNSidwlnCGKXPvoI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748697569; c=relaxed/simple;
	bh=75vO5bAg0mmoxKQNMdC8+Jw704lsdM4wtphxrMDvmSs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Wqy6+3w2xd/US/kMo8czUAmJ68xO5Woa1BJX1+a0cvJUCs/bLRNWJO9k6FPr6PsiuT7bXUkmR4YyIs2ftmRPV1WXv5Sgk1lEi1kH2XrKmOolVuUYVr+HXB0jA4Me8qhhPgm5ChQqu/gelZmfxfNFNh4YurYZWWfMMbHjBWSTxw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3dd75f23947so25851795ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 06:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748697567; x=1749302367;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FBI91K8uB+RDcd0LMyH7RlMPNa3HZlVIkIx4V4UNB2Q=;
        b=UYMFihpu/BC9F6BeYmCB2Qwlz7XZ88KddQZgdMha/RfFoQaI588HoeUChf8yO3xMc6
         rZHZFwXXI7omM3TEZ4JSJ81cVRN5P4ZAPZylWhdXL6vt/3YSR3jXlBng29cUPdmwPcNZ
         oQgWeX9mdsVG6WbXiENZxO3LVgF7EhdBD+gcTxD2thK7RNWLgrbKe2PeZQD3jDr2M5XE
         c4cM4Yk12P6xcmGtNzuSYdd1tu0B13tw8TGxzJZ1GuwXLSMgUzUhfVYpKfPs7N0A+HDS
         RPnNm+CS5fIP7ZFy41Lr86UE+w2h5els4SFseMPuru3nfGxIZrKUXpAr9ncN/JwovJUw
         XbnQ==
X-Gm-Message-State: AOJu0YxYsbag2EDnCrU9SJUqxhsDx/MxMaAsXHFwl7CI7BN1k0ObobxL
	oJBhWoqvu6u8pUWXOIPPLOsv/M0f7qkAT9WNfgviCCiuvXYcwNZThEFT3TvxazpRmbZvPR+CEm3
	bDQ14dO3LEgyyiXnjiJ5tqsv5f4e3KviMFUcYFm8/qeWM7duH3SYI+a2cwkdkew==
X-Google-Smtp-Source: AGHT+IEnz2yOwbK2uabUndM6JHR2B1CyRoic/50eSSclJsW4v2CdRN4gISkeQEZeOBSbkDCKgxG6W0WV3Cqes31lEu0ggE8BhJMh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c29:b0:3dc:8b29:3090 with SMTP id
 e9e14a558f8ab-3dd99c2b6b5mr80622725ab.15.1748697566767; Sat, 31 May 2025
 06:19:26 -0700 (PDT)
Date: Sat, 31 May 2025 06:19:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b01de.a70a0220.1a6ae.000c.GAE@google.com>
Subject: [syzbot] kernel panic: Fatal exception (4)
From: syzbot <syzbot+7373cb2b2891da299db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e0797d3b91de Merge tag 'fs_for_v6.16-rc1' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=163777f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bae947dc86168857
dashboard link: https://syzkaller.appspot.com/bug?extid=7373cb2b2891da299db6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=113787f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10329ed4580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-e0797d3b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fff3ec96d8a9/vmlinux-e0797d3b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/04b015b9be19/bzImage-e0797d3b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7373cb2b2891da299db6@syzkaller.appspotmail.com

CR2: 0000000020000000 CR3: 000000000e182000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Kernel panic - not syncing: Fatal exception in interrupt
Kernel Offset: disabled


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
