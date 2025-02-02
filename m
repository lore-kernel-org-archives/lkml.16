Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3A1320F
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738458064; cv=none; b=lmQ2gBodBLW5W1dZPj+JKJ9tk42uKH0TIxm1kvz5ciwSFs7w+QxGD7O6REJQevHlzfovjerK1CrDBxaX/1KQ0bO9tvxUxNp5ZzWTFyen5TPLk98wWPKsnUCyU9Mli5EQt3xyTs2F402gZqp2rqHzoH4CgvVHW0OmVngyXl4kyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738458064; c=relaxed/simple;
	bh=vhvBhX2sCC/FH9XWKkn2MFupkH49quV96G81QgCOdhg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ILTFB99KDy4hhE6XUirvi5kKzPPj07hRvDJ1yInUatuhr7HJFklIsHDlDI5oGIzxu7Wk7VIjx9IlDruDKXMGIClO1LLTupWaP1hMZAXUq60iRwt/Cv+zdf3+GXrL/3gsV2Mf3qjwzae66ynysTpoIAS25xMnq1p6dgvfgyJ//ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-844d02766f9so220149239f.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 17:01:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738458062; x=1739062862;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVxVY2qy6z83lIZ1D1JTeVAsGXcc/2zKkEUGi6xFTyw=;
        b=ug83/qjCFh8mmC5J2IeTAzoJiM8t/ENEQZ9B+X/lO40fcqiXGfmVT4vnsI6n4kVRvQ
         7SkI9okRUw517xDFp5sXKV1dHMbN80A1jkCwj5ozow9NdxQMDVVwxT4Gi+HVMdI+xHBI
         5h+MJhjwCP1PYiE3eYQuye5XmAj2Ic1Z2ECDHDl5H6GlU16pNqjWh4EhxhYGJ/LjNo7p
         ldwBSiEi8ym9wrtCtU5ACaGCqMoJYDaTKJIldDDXKlMQSiq5d0+u3FnuAmEk6mPjX+fQ
         T7OCHLTPp8k/aiEo0UCrRXG0Gwgxov4zpPEQK3tr7I42qA+y2Lt1ckFWdsBs+LpHwfyc
         a9gw==
X-Forwarded-Encrypted: i=1; AJvYcCVOFT4YiyD6kcfMFAiZs/h/TvGBh5Zu10GpssRDg949YOUXftYAwoftRHNNJzeJ7xHx/vItRi3ocUawH48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZ/G6TNC1mGQWGwQV9miy4Vpg6bWTsmVUBvBvW7s7JcK2bD08
	Ssuebc/BCQ39SH9FGpfLgsCfFvnekGS6MOEGaspbectOtDvqxAhqclS4nG2A3zAzJkmfc2eK4NC
	knnQHz1OnVi1pDWXUNDyOi0GFcYjs9RPfUC2tHWNm4fD5saUsKyyZ4kg=
X-Google-Smtp-Source: AGHT+IFkRL6HCZi/rkNYCWEXJo22IHEe5P3zY3wlzSutgh2VvUNPT30ojj/oO4uQI3QFQ5QMQSoyv4BOcHxPyl373pYonLvAvwPG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20ee:b0:3ce:5a7c:6b5d with SMTP id
 e9e14a558f8ab-3cffe396c5emr150221975ab.2.1738458062321; Sat, 01 Feb 2025
 17:01:02 -0800 (PST)
Date: Sat, 01 Feb 2025 17:01:02 -0800
In-Reply-To: <tencent_59AE5DFD9908CFEC0DD3A5D50DA69272DD07@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679ec3ce.050a0220.d7c5a.0064.GAE@google.com>
Subject: Re: [syzbot] [mtd?] WARNING in release_mtd_partition
From: syzbot <syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in sysfs_create_file_ns

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000000 R14: 00007fb7345a5fa0 R15: 00007fffd549f308
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 1 PID: 6732 at fs/sysfs/file.c:376 sysfs_create_file_ns+0x148/0x1d0 fs/sysfs/file.c:376
Modules linked in:
CPU: 1 UID: 0 PID: 6732 Comm: syz.0.16 Not tainted 6.13.0-syzkaller-ga86bf2283d2c-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:sysfs_create_file_ns+0x148/0x1d0 fs/sysfs/file.c:376
Code: e9 03 80 3c 01 00 75 7f 48 8b 7d 30 4d 89 e9 4c 89 e6 8b 4c 24 38 44 8b 44 24 48 e8 02 fb ff ff 89 c5 eb 0e e8 a9 4a 5f ff 90 <0f> 0b 90 bd ea ff ff ff e8 9b 4a 5f ff 48 b8 00 00 00 00 00 fc ff
RSP: 0018:ffffc900031678b0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 1ffff9200062cf17 RCX: ffffffff8643ddcb
RDX: ffff888031e29e00 RSI: ffffffff82599ea7 RDI: ffff8880615d91a0
RBP: ffff8880615d91a0 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8f24c880
R13: 0000000000000000 R14: dffffc0000000000 R15: ffff8880615d91d0
FS:  00007fb7352246c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055f98dcaf950 CR3: 000000001e686000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 sysfs_create_file include/linux/sysfs.h:788 [inline]
 sysfs_create_files+0x6c/0x1d0 fs/sysfs/file.c:390
 mtd_add_partition_attrs drivers/mtd/mtdpart.c:238 [inline]
 mtd_add_partition+0x32b/0x650 drivers/mtd/mtdpart.c:283
 mtdchar_blkpg_ioctl+0x20d/0x250 drivers/mtd/mtdchar.c:562
 mtdchar_ioctl+0xbbe/0x2050 drivers/mtd/mtdchar.c:1216
 mtdchar_unlocked_ioctl+0xb0/0xf0 drivers/mtd/mtdchar.c:1239
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb73438cda9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb735224038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb7345a5fa0 RCX: 00007fb73438cda9
RDX: 0000000000000008 RSI: 0000000000001269 RDI: 0000000000000003
RBP: 00007fb735224090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000000 R14: 00007fb7345a5fa0 R15: 00007fffd549f308
 </TASK>


Tested on:

commit:         a86bf228 Merge tag 'pull-misc' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1451fddf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714e7008e8c086ea
dashboard link: https://syzkaller.appspot.com/bug?extid=074732af3fc6c528f8a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17c1fddf980000

