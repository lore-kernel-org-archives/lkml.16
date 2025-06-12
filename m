Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0181F16B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736924; cv=none; b=f5VTOvrKqkK+hlzRPG0G8VR56xRHQyc+hSBfF6WDU8U2CFB+tbcb9PTwTXlgJDam0lYKxs8kd+4PTzqGvDubE69+sghnMfG6ipOhy2BnJyfeW8SzKaWOaZ94M1Q2Ny6mLC9RTKOiX3A4/sfPknRA3BzAXSYcAkOnCIrDRmWiw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736924; c=relaxed/simple;
	bh=nwl8W/RZHkuYppr5jyUPpmXpIo88K05WJu/kPlyf1Z8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UZPXEsvjp7Fn02K112zI6rphFyIZtSL5363+P3zu+KFn16U7q2Vh8jTqMUFAC/ZVWNlIbRFNGNDHKvtyuA6lj5Hc3m5qjTWu3wzgpouloDHXsFmFPnYUpb5pD3WcNFeFbgx1AGilooZbB9yFdBW4MoJA8Ff/T2p2PP9d/qCwnBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so13433825ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736922; x=1750341722;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+i9vHprFNLNOlDBkx00sZ98dPI753hc/y0R4egk3hU=;
        b=fp03KT3ixTcGqZL8iejYs2MW6d6tzzCt8VgXcbUjvAjhXZQbL6K5Jy199qInfkglGs
         xWFurC9xDAH75SjDKWxT7RbK70bhcGsITYwrxkaxWDzjIyEC+4kSrKncqYV6L5pl9a0V
         Lv6tmEeBrn6/PTnjtluWPAdV0/YhWZKp2LheBc9buTCjgbLRupYKJLwjykP6x2h+URds
         AAoCwZQUoU+8JiOYPvnIVsIbe58DkNNmieNf/hYxeCPZVsw3OQSq2pYBO6VHYDXCwjaD
         cxiJ+XxX0nboCphMqFELptHHP4iy+vDDmwS83CWYH9MhxsMIwNUMNHXGbs09rl+kwMAa
         z1jA==
X-Forwarded-Encrypted: i=1; AJvYcCW4veQXoQWPwkjVLJ9ZMkR6SWnQu9vabXEXwlSRzuJd98A3+52XljMD806OKit1m5n/1KsvPhk6SWSEx4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykr0NVs1tQCnZ2y2WMhz2fbytV/Di8cKp1dlNjR5U+4cTLF+VI
	qEi26BX998WQNJOJLybissEjSf61qpkyJ1W3BFvZ/O11VSKyPQrw2reuRudU2SYIACCIPgDXvV9
	SWnNRe6n+WQLwkL/KoRjOvVX7wz4i8PPt6mLvuKOy05ENj/mmet/VaqzEoKM=
X-Google-Smtp-Source: AGHT+IG0Ujhmz/+JgqoSPclYtaSRfSFa37gmT+4O4fgQkRuYAoKNDab9EmKB1kXseU+35LPDtk/+FKsNs1gug5qUGsbJNQ88aeWw
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d84:b0:3dc:8bb8:28b3 with SMTP id
 e9e14a558f8ab-3ddf422a7efmr84141805ab.5.1749736921902; Thu, 12 Jun 2025
 07:02:01 -0700 (PDT)
Date: Thu, 12 Jun 2025 07:02:01 -0700
In-Reply-To: <tencent_5E3CDD374E968636024A8A75FD7697660209@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684addd9.050a0220.be214.0290.GAE@google.com>
Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
From: syzbot <syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ovl_listxattr

3inode: ffff888078108508, buf: , size: 182, res: 17, remaining_size: 116, simple_xattr_list
buf: system.posix_acl_access, size: 182, res: 17, sb: sysfs, vfs_listxattr
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6609 at fs/overlayfs/xattrs.c:136 ovl_listxattr+0x3a3/0x400 fs/overlayfs/xattrs.c:136
Modules linked in:
CPU: 0 UID: 0 PID: 6609 Comm: syz.0.16 Not tainted 6.16.0-rc1-syzkaller-g2c4a1f3fe03e-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:ovl_listxattr+0x3a3/0x400 fs/overlayfs/xattrs.c:136
Code: 08 f2 fe e9 47 ff ff ff e8 2a bc 90 fe 4c 89 f8 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d e9 84 17 32 08 cc e8 0e bc 90 fe 90 <0f> 0b 90 49 c7 c7 fb ff ff ff eb d7 e8 fc bb 90 fe 90 0f 0b 90 e9
RSP: 0018:ffffc90002f67d98 EFLAGS: 00010293
RAX: ffffffff832fa1e2 RBX: ffff888029d53400 RCX: ffff888025afda00
RDX: 0000000000000000 RSI: 0000000000000011 RDI: 0000000000000012
RBP: ffff888030fa9001 R08: ffffc90002f67a87 R09: 1ffff920005ecf50
R10: dffffc0000000000 R11: fffff520005ecf51 R12: ffffffffffffffff
R13: 0000000000000012 R14: ffff88807afcfc88 R15: 0000000000000011
FS:  00007fe253dad6c0(0000) GS:ffff888125c86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001000 CR3: 00000000748d2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vfs_listxattr fs/xattr.c:493 [inline]
 listxattr+0x26d/0x320 fs/xattr.c:925
 filename_listxattr fs/xattr.c:959 [inline]
 path_listxattrat+0x179/0x3a0 fs/xattr.c:989
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe252f8e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe253dad038 EFLAGS: 00000246 ORIG_RAX: 00000000000000c3
RAX: ffffffffffffffda RBX: 00007fe2531b5fa0 RCX: 00007fe252f8e969
RDX: 00000000000000b6 RSI: 0000200000000200 RDI: 00002000000001c0
RBP: 00007fe253010ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fe2531b5fa0 R15: 00007ffedfdb19e8
 </TASK>


Tested on:

commit:         2c4a1f3f Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112be60c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=4125590f2a9f5b3cdf43
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14a2d9d4580000

