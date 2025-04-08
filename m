Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D7126FA6E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116568; cv=none; b=gvZOt+zWfvKpbwjJeOqTiAx1EQ1CbORQCoGbhn0vli2v52hlzJdy9JGoio1rp7kfG/gQfJddgyeMVfNB4a74vjUvKEeXpoCbmxWCPiyRMHescQNTaKmsrklXnOCEKvU1YMkpOSI0N5SY40wEssOzm0h60bXmnXsr5A0fxh5lc68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116568; c=relaxed/simple;
	bh=pch9NfcEaAb6kTEmouM9XSRHR+9NzIggCml4uNOfBHE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aC/zmwVXFUawMpq/Buwolqtfe77++/VHZKTNrSUaUkAAmBkW5FCWSZL6IetQhPK9xtmXTh5DlAlRIYSpPP+3sGsB8llCLC6aCguOZQWY8tbW0Boi8yVRb/xR3V0MTyt4HJf9u8GcCcFSr9QY6KzDmPxSy9GT4IrUXBgXB1qUPwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-85d9a52717aso829329539f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116566; x=1744721366;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNJL6LfHAiP3KJWb2wuOAHiaVr60J8JSQGmdiSuj5a4=;
        b=NMG+/dqp0cb4N4yIUaR4bMpwBFGQAJbgAD+f4bI9LOIqQKk39sYxtAK9XFZs4s9oHN
         ycl4Erpe7vu/WxFBTH6GTivhcjCmAhZVR9DTgGV0c/7qY62CTGPMcbBtDpKQMDFE/zNR
         GvGzQM0GoF1FD+iHU1afM4glLw9oLVGfehwZb4OtRCmc4UvLqP02q22ty41rBAQ7zl11
         bIYqC6qpJYYSMnU0pmMaSLEIzmOwSeBMyLaz1lwhrZ4E/gx9Vkwh6XgT0s2p/w0fiPm9
         ygfEyUzzYM+jIrGXpl+HN6WVVxg8Ymu9I5JFnKjZH8kV+KfEX5e/JDBrlYZE+ZLkUSX+
         fU4w==
X-Forwarded-Encrypted: i=1; AJvYcCUD32eDVsfxXEO0CAD1m6GT1HsJneYfOAka6PpBuUqzkJ5SuzTzyjybDcBhCwGL+Dlfd5/xKDSECCZl/W8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HtaWdag8Ando0K7RkHRhSEfNQBy+j/IeX5ZWqrD6TaneQdsZ
	fo3YlPg1a2iI4eVSFxwBJoAXZ2WPb+6tYkJ4gjGZ1zD8GsbsqN+3zs4D/RU4HIICOjOSxyJ9qH4
	1XlS0VUZhgodE0bFhJf36HKwUuCUo3Pj6EoUsO2ohG9tDXLtBVYeo/xM=
X-Google-Smtp-Source: AGHT+IEZHlhzQBj6HYESAaj7kpxM6PvfAq3EzWLH4KdtxIcaedQ92eIKUn9dcb9RdezdB3Aj5hKX971JeSI3WiwktVhjHzcLKxVS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2785:b0:3d3:d965:62c4 with SMTP id
 e9e14a558f8ab-3d6e5329212mr153676435ab.10.1744116565947; Tue, 08 Apr 2025
 05:49:25 -0700 (PDT)
Date: Tue, 08 Apr 2025 05:49:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f51b55.050a0220.107db6.05a9.GAE@google.com>
Subject: [syzbot] [xfs?] WARNING: Reset corrupted AGFL on AG NUM. NUM blocks
 leaked. Please unmount and run xfs_repair. (2)
From: syzbot <syzbot+e0e774741360f6c74414@syzkaller.appspotmail.com>
To: allison.henderson@oracle.com, amir73il@gmail.com, cem@kernel.org, 
	darrick.wong@oracle.com, dchinner@redhat.com, hch@lst.de, 
	hsiangkao@redhat.com, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e48e99b6edf4 Merge tag 'pull-fixes' of git://git.kernel.or..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12b18be4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=695196aa2bd08d99
dashboard link: https://syzkaller.appspot.com/bug?extid=e0e774741360f6c74414
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11aea7cf980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1727c94c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bacf2069a3a3/disk-e48e99b6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6b2b20d05f13/vmlinux-e48e99b6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a5ab8f6aba17/bzImage-e48e99b6.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/635c0241b9a9/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=1327c94c580000)

The issue was bisected to:

commit 29887a22713192509cfc6068ea3b200cdb8856da
Author: Darrick J. Wong <darrick.wong@oracle.com>
Date:   Mon Aug 17 17:00:01 2020 +0000

    xfs: enable big timestamps

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16ceafb0580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=15ceafb0580000
console output: https://syzkaller.appspot.com/x/log.txt?x=11ceafb0580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e0e774741360f6c74414@syzkaller.appspotmail.com
Fixes: 29887a227131 ("xfs: enable big timestamps")

XFS (loop0): Mounting V5 Filesystem d7dc424e-7990-42cb-9f91-9cb7200a101d
XFS (loop0): Ending clean mount
XFS (loop0): WARNING: Reset corrupted AGFL on AG 0. 1 blocks leaked. Please unmount and run xfs_repair.
XFS (loop0): Unmounting Filesystem d7dc424e-7990-42cb-9f91-9cb7200a101d


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
