Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3522257F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102892; cv=none; b=tZkHtHQ/SWVmet3VyuN+77rNpzcDdEDr8T0wITxYDM+TumhMLiaVLbUhmLoYY1akkhvpXkVD+WWEQXRHHZ7yAx4eotY7FWyWlxrqZTT8kDT+g69IN2BLSul7p4sPTy7+gBqGA1+Hqie5uy/bYM5zOSkYc1cRLXI86zYFTupFrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102892; c=relaxed/simple;
	bh=384l3PTbeYSwCorTutkbhVMp6kKpAlQaOmRq97Jqrj8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=myayStA6Di23Wr4GgrtJ/tXJ7EzatDwbhiQTnMQSJnxM6gDhmpl7KHfuYnQDBUNKJoAH9gRMsldt4mmzZ7RTbtYQbL78yJG8VEsGDjGbZCf7ublytApxwb8QyhR00IdKijijv+M+eLSw5X7tl1uPccc171kTIB3BzvTxHCcIQ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso589582039f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102890; x=1744707690;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPm2Fj3K9bOe54x0wglZkU5Qak+qbf+/DlnHrO1S04c=;
        b=C6q3fVe4skMUMVk/hofNBc4yBp9/lKs4NdEM3PAHRniJ6+QED43Oypt9L+AGS0w04a
         AfBUPaG2SdvtLHLKu0ZLcbi+cVDGdDmBjBICsdbeWsQ5F2T10E/e68Qho7QUd9aMj5c6
         iX/3sDRaFVDemW68SoH32dph0sqJ726C23m4KkBnY5rBazgoDzF8Hp2gPRBf1vF0mjP0
         8Em/lUGbk1uU0EccX1b0HbUdHDg4A7NFP1bQje9+Wjl8jTDP2WpZ+WHZqkaWkCx79hwK
         TL+nGS8o2oZDo2wqf1jcTxtgapCJRka0aGRRj01/CDxsCrJIo3cZ8rFBI/XkOHs5p40b
         70lA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Gcmk9fH8N2e42XvEP6ZLYvncZuqqKAABuB8xgZeWPH3Ju2Azm2+VtRr4cSIn8gwMsW87pmrtLaV2Rjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnora1f79wVaSdx7/N3Ajb2xQLm+0Qf7o7VuGc8vLLzyKX0RVA
	edTdfU8l3lqfJ+MZKZDjiO5H6Trm2F7QnlMyfsghXQUGVZM9SZl/OZA6oTe0e5i/NWtbG6Dzcxs
	TAtsGBSZBliMreanmae9yJsBQVs+d/kkEhgV9hz4kmmUvWCpHI1xYIr8=
X-Google-Smtp-Source: AGHT+IHvOmHTaxKw32IHfBibRmPBaLK8bfWab8je54uO/jfBP8shxFJjrhVyBu0cSggEvkPgXqT5kSTTfL7IjrCOn04x0iS6YY8y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c25:b0:3d3:fdcc:8fb8 with SMTP id
 e9e14a558f8ab-3d6e3f056ebmr135999395ab.10.1744102889953; Tue, 08 Apr 2025
 02:01:29 -0700 (PDT)
Date: Tue, 08 Apr 2025 02:01:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f4e5e9.050a0220.396535.055c.GAE@google.com>
Subject: [syzbot] [fs?] KCSAN: data-race in file_end_write / posix_acl_update_mode
From: syzbot <syzbot+dbb3b5b8e91c5be8daad@syzkaller.appspotmail.com>
To: brauner@kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0af2f6be1b42 Linux 6.15-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c98070580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e5bf3e2a48bfe768
dashboard link: https://syzkaller.appspot.com/bug?extid=dbb3b5b8e91c5be8daad
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d90ae40aa6df/disk-0af2f6be.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/616ed7a70804/vmlinux-0af2f6be.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ed2c418afc9a/bzImage-0af2f6be.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dbb3b5b8e91c5be8daad@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in file_end_write / posix_acl_update_mode

write to 0xffff888118513aa0 of 2 bytes by task 16080 on cpu 1:
 posix_acl_update_mode+0x220/0x250 fs/posix_acl.c:720
 simple_set_acl+0x6c/0x120 fs/posix_acl.c:1022
 set_posix_acl fs/posix_acl.c:954 [inline]
 vfs_set_acl+0x581/0x720 fs/posix_acl.c:1133
 do_set_acl+0xab/0x130 fs/posix_acl.c:1278
 do_setxattr fs/xattr.c:633 [inline]
 filename_setxattr+0x1f1/0x2b0 fs/xattr.c:665
 path_setxattrat+0x28a/0x320 fs/xattr.c:713
 __do_sys_setxattr fs/xattr.c:747 [inline]
 __se_sys_setxattr fs/xattr.c:743 [inline]
 __x64_sys_setxattr+0x6e/0x90 fs/xattr.c:743
 x64_sys_call+0x28e7/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:189
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff888118513aa0 of 2 bytes by task 16073 on cpu 0:
 file_end_write+0x1f/0x110 include/linux/fs.h:3059
 vfs_fallocate+0x3a5/0x3b0 fs/open.c:350
 ksys_fallocate fs/open.c:362 [inline]
 __do_sys_fallocate fs/open.c:367 [inline]
 __se_sys_fallocate fs/open.c:365 [inline]
 __x64_sys_fallocate+0x78/0xc0 fs/open.c:365
 x64_sys_call+0x295f/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:286
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x8000 -> 0x8072

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 16073 Comm: syz.6.3255 Not tainted 6.15.0-rc1-syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
==================================================================


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
