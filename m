Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BEC28934A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417348; cv=none; b=NGzL34vSObrQANB/DyDXv5qLUnr4IrmRSjPy2VQ5opAI4rxjISe3rQA/Px7gkxPQWBTkZYeTcHY3Qlde3moKg0hoNXYz5pEcxQ26UXi0Wn+21xvx6ZTQD/Dhw8vXuziq+sKCLwTfVD3GQCp1eeU8RUuAybsZkaR72HeItYG7IA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417348; c=relaxed/simple;
	bh=iKD3mOzrfDWywd4Zfuvy+Y9C7Kn49H/mvCcbac8muPY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=mKjTdKQuzWog2qnFFOT8L9rXwc4xh0DCNFDRSbI8MKicasWrbAFcQXnAlgVhbFQ70kVPH58iR/GC29mX3q+h/3ZbxJ1Qcn1qxvuo11yj42JfL2VXFXyEhI9v+3ep+mlSyinzPnjA8HCoxSdcIKx+lEJma1BHJLViiDZnXjhdiiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-87595d00ca0so128514939f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 04:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750417346; x=1751022146;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjmGfFdQ3OW7xmT/wki6+bin2IsFnsHG1ciZdNAwxz4=;
        b=ZKFpnSVpQR2020Tx711Rww7sgeES1cpzDTy3U7tZp96y017YsVz3kLHg4oxgKbLSuc
         bAtBs/UwlZr6qX2guvbVVFBX1P2PaVbF0eCiEnKl4J2bMCztMzcBXn8ZHmD/o6KMWHla
         /UZyxmEr6me6BfYg6EmR7FGJRkYm7fhQ0f7uT4UU3Z44M73/W5RDMef86c/QWVvisyhn
         Cezugz+YXVaK0jOgY5ofDPm6CoYsHluzDh7NgnFs6twy0F//Jf65wcI9KMo+Sy2qGI6A
         p5bs09GIo06L998zpeCEMOeyChUxFrO60vFymxJ6wrwDTSjEjMC0vfF+ACSgyZfuVOOa
         FDeg==
X-Forwarded-Encrypted: i=1; AJvYcCXidpuzLhAC2rksKTwr7/iH61KTrJvruLZ0LF4ORRjgzYSubFXS5sdQ6KVw/e/PmR8cOvJs/45GFnrwDG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxBmUz/TgaKsrJ8IvgDeRsRl25t+YNwwCBKzeYu8uUndhO/cm
	v6mSLgSTuutwdLGpcKPmzMH+6g3TnwDCu4yEFoASpJ5DNttgW2UzEJ2djmuosMX4HU+6EFjHepK
	HGD4YAnXfaPWgAR8Tkznu43gHHNd4vmX6xM64Vtbd/N+VqEY0rn+ckV7a7Hg=
X-Google-Smtp-Source: AGHT+IF9BaVS6lJ2URCIGUDTxUO/JdHanbROVlj+8/hRjlRnpgM/ucvo/8p6DFj7zif39oqhi0C3+/Y7bGmGvuKR/KMn+UcNACPb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2703:b0:3dc:7f3b:aca9 with SMTP id
 e9e14a558f8ab-3de38ca2cedmr22167895ab.14.1750417346068; Fri, 20 Jun 2025
 04:02:26 -0700 (PDT)
Date: Fri, 20 Jun 2025 04:02:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68553fc2.a00a0220.137b3.0048.GAE@google.com>
Subject: [syzbot] [kernel?] BUG: unable to handle kernel paging request in netdev_unregister_kobject
From: syzbot <syzbot+59e97f6296ecdc571f71@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    39dfc971e42d arm64/ptrace: Fix stack-out-of-bounds read in..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15af690c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=941e423b930a32dc
dashboard link: https://syzkaller.appspot.com/bug?extid=59e97f6296ecdc571f71
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ee1a7942f1b9/disk-39dfc971.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5b94ed3d0f7e/vmlinux-39dfc971.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9ce219d3314e/Image-39dfc971.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+59e97f6296ecdc571f71@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address dfff80000000000b
KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[dfff80000000000b] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 7660 Comm: kbnepd bnep0 Not tainted 6.16.0-rc1-syzkaller-g39dfc971e42d #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : klist_put lib/klist.c:212 [inline]
pc : klist_del+0x4c/0x110 lib/klist.c:230
lr : klist_del+0x28/0x110 lib/klist.c:229
sp : ffff80009e977720
x29: ffff80009e977720 x28: dfff800000000000 x27: ffff0000cda2c028
x26: 1ffff00013d2eef4 x25: ffff80009e9777a0 x24: 1fffe00019b458e5
x23: 1fffe0001ed3f28c x22: ffff0000cda2c728 x21: dfff800000000000
x20: 0000000000000000 x19: ffff0000f69f9460 x18: 00000000ffffffff
x17: ffff8000892f3474 x16: ffff800080520d04 x15: 0000000000000001
x14: 1fffe0001eb56768 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60001eb56769 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : 000000000000000b x7 : ffff800080c3eef0 x6 : ffff800080c3b260
x5 : ffff0000cded8998 x4 : ffff800089214348 x3 : ffff800080f87888
x2 : 0000000000000001 x1 : 0000000000000004 x0 : 0000000000000058
Call trace:
 klist_put lib/klist.c:212 [inline] (P)
 klist_del+0x4c/0x110 lib/klist.c:230 (P)
 device_del+0x234/0x808 drivers/base/core.c:3858
 netdev_unregister_kobject+0x2bc/0x3bc net/core/net-sysfs.c:2308
 unregister_netdevice_many_notify+0x1934/0x1fac net/core/dev.c:12112
 unregister_netdevice_many net/core/dev.c:12140 [inline]
 unregister_netdevice_queue net/core/dev.c:11984 [inline]
 unregister_netdevice include/linux/netdevice.h:3379 [inline]
 unregister_netdev+0x15c/0x1f8 net/core/dev.c:12158
 bnep_session+0x208c/0x223c net/bluetooth/bnep/core.c:525
 kthread+0x5fc/0x75c kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
Code: f9400268 927ff914 91016280 d343fc08 (38756908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f9400268 	ldr	x8, [x19]
   4:	927ff914 	and	x20, x8, #0xfffffffffffffffe
   8:	91016280 	add	x0, x20, #0x58
   c:	d343fc08 	lsr	x8, x0, #3
* 10:	38756908 	ldrb	w8, [x8, x21] <-- trapping instruction


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
