Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F71AA782
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329896; cv=none; b=LPBLfLdW+QvucoF+NAZUvoKUMS2Lao5atjGnWye0DxRM9PCz6E1Zh44OswHiYPMbw/B9N1X3AU4P6hzQpldKPjw8pyceCFIWtzUoUBsu7DXs0gyDoxE5HJbVs1Qqjb7tZOBY+ViW88d++WC0h7XTX66VSYhiT0XWWzQMPTEQ7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329896; c=relaxed/simple;
	bh=1wRBr8MISaRX/gJFqqiBgm2GtlAYyxJHYzAPHNQ1hRA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=N0qtEyXOnd6L+6Jhl/ftAKIn/9w/XtdLRLpGc8cbDJzvybk6bS2SgMc21uPMabvZR4ntDm/kA7r2wYTmfyPaviVHbIpOanj9KbIaPGFTR40JUecAIbElscJ0LQoLC6lk0k2mv3AS3u2tEGfzx43bF4pSXjzbzZdysjVliqJ6ldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85e6b977ef2so464138039f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329894; x=1748934694;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qdVC1qqfV3k7KgfUrPCnHVDMQy0fd3QQpVZA0AprQc=;
        b=VQ1UtnkscF+6pKTpakkvoZJMODolt506VA3OtSfMfTfwsWc3GFQIAjHA982kN80wBu
         7TEFb7KSS/F9adn9YirDtRGfQn+P2DXbBxROW3XdhHUbMSa9/Th3Ij0VbsvTzK1Wj2A6
         GNRC8fPLZ1lL4/qQWqrQ68zofAfUlHZ1yQRrNNJCyRX4iolTbW3oXZRF9CBLX0ROE24a
         qOfxrjVOcqHKJSGtQXfNHr2MUsuqWt4MYZoqvLeT71kBDQkrQt1yZ/El5r656WEEeC8N
         zLXuUFhkKuf2qbbGegT1wltTW6CqzDOeqeMjfK59iFBsU9PP9Lygtz+CZMeIGzWopDh8
         NSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV43x+5Ceb1jUcwERxDtj5+ikY/ZUxG7lvYxguXC9lcHDfWrQQ6q/bTIOL8KdlqX4/Xv27gY1tEcOFkitg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwdaaJ/nNas+q1UTW3khMux/ho/EnLjaOSF7eUDhoNltRR3M5n
	RKzqHxRsqLaGrm7Ea6OJUXuOPgsaaGICU2qQTL50xI6lhB5HeGNnGffT5JZDCRD93Qrx+fM+4oR
	EtbBuWQVcwWHrDnZagUvI1+aslc5kVSIeuAxXwMvKFa0hV4CdhvlQ2OZMqQQ=
X-Google-Smtp-Source: AGHT+IH/yazLZh9Qt+PNJPBSnPX97xYHHDEUOgBXQAeWFxBiezmpZwC95aCKgujC/lr6PpYweinmGonIl4+1+sqZLrr4qbiv7a+T
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:d516:0:b0:86c:bbea:a6ee with SMTP id
 ca18e2360f4ac-86cbbeaa74bmr1084678839f.6.1748329894295; Tue, 27 May 2025
 00:11:34 -0700 (PDT)
Date: Tue, 27 May 2025 00:11:34 -0700
In-Reply-To: <683537b5.a70a0220.253bc2.00a1.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683565a6.a70a0220.253bc2.00a8.GAE@google.com>
Subject: Re: [syzbot] [udf?] WARNING in udf_expand_dir_adinicb (2)
From: syzbot <syzbot+545e45805722d117958f@syzkaller.appspotmail.com>
To: jack@suse.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0ff41df1cb26 Linux 6.15
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=100ebdf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d36610c9196ca06c
dashboard link: https://syzkaller.appspot.com/bug?extid=545e45805722d117958f
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12623170580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a9580d21a471/disk-0ff41df1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/07e34f19a1eb/vmlinux-0ff41df1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ba0789ed259f/bzImage-0ff41df1.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f048818abd29/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+545e45805722d117958f@syzkaller.appspotmail.com

UDF-fs: error (device loop4): udf_fiiter_advance_blk: extent after position 0 not allocated in directory (ino 1408)
------------[ cut here ]------------
WARNING: CPU: 1 PID: 6315 at fs/udf/namei.c:214 udf_expand_dir_adinicb+0xbf6/0xf00 fs/udf/namei.c:214
Modules linked in:
CPU: 1 UID: 0 PID: 6315 Comm: syz.4.100 Not tainted 6.15.0-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:udf_expand_dir_adinicb+0xbf6/0xf00 fs/udf/namei.c:214
Code: 01 00 00 00 e8 ab 1e fe ff 8b 5c 24 60 e9 aa f6 ff ff e8 0d 12 80 fe 4c 89 ef e8 c5 c8 09 ff e9 ac f8 ff ff e8 fb 11 80 fe 90 <0f> 0b 90 e9 88 fe ff ff bb 8b ff ff ff e9 80 f6 ff ff bb f4 ff ff
RSP: 0018:ffffc9000a8ef400 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000ffffff8b RCX: ffffffff833b31ce
RDX: ffff888028135a00 RSI: ffffffff833b3345 RDI: 0000000000000005
RBP: ffffc9000a8ef680 R08: 0000000000000005 R09: 0000000000000000
R10: 00000000ffffff8b R11: 0000000000000000 R12: 00000000ffffff8b
R13: ffff88805b37d740 R14: 0000000000000000 R15: ffff88806dd16de0
FS:  00007fbcfa36c6c0(0000) GS:ffff888124ae0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f052b2a4000 CR3: 000000006e0ca000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 udf_fiiter_add_entry+0xcf0/0x10d0 fs/udf/namei.c:262
 udf_rename+0x902/0xd90 fs/udf/namei.c:843
 vfs_rename+0xf64/0x2250 fs/namei.c:5121
 do_renameat2+0x82b/0xc90 fs/namei.c:5270
 __do_sys_renameat2 fs/namei.c:5304 [inline]
 __se_sys_renameat2 fs/namei.c:5301 [inline]
 __x64_sys_renameat2+0xe7/0x130 fs/namei.c:5301
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbcf958e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbcfa36c038 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 00007fbcf97b5fa0 RCX: 00007fbcf958e969
RDX: 0000000000000004 RSI: 0000200000000080 RDI: ffffffffffffff9c
RBP: 00007fbcf9610ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000200000000980 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fbcf97b5fa0 R15: 00007ffc16b0f758
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
