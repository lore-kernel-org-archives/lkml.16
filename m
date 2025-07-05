Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE211CA9
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751713355; cv=none; b=dz4d3gcdxTn/oGuKRULDV7qSiYFH/u2BgshegcUCgfn6v/n/UwQ5jyIKTJxmqwtXdRurBWp3kyTvP3s131yTHzwhVfGLQsvv6a8PEnjIwX9OqvOCErg+90Q79UGqipID7hSPPAcoxMA038svEkrSjrqoxxZOh8CppTSe/xOuNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751713355; c=relaxed/simple;
	bh=RgXwy1FMDkEYSIWIpAgj3yeCpsfoFw+NqvMRIacTzsc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uvCgayHUl0x0yWR5jrTKfI0DQkjNt8XTtXCN5UEzDPwyFMJzZXDPJsEbvOhN92/r/RA/CKICy/PEkiSzsOfEuEN2lUZW/Uquo4zqcnNP0T7GMlLFGwbHBiTZxh6YX29B8YUSWgFl7MZyyXiSvhG1QQV/MJpgreBAevkurGnrMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86d126eabcbso249958239f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 04:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751713352; x=1752318152;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSF63fpjgOziLoZiNaAFiHQZugbJ+bn7NXeVfpFuQTc=;
        b=KODh9y1SiHubuE7gz5BvOVWYvmTmxgfd2Z49W0erig6AWET9DMRtivPMYj/wHkqmmR
         KLcAJuZGvn9Af7EEAak//yEEk+4977rT/NW7KNvyaNSAmm2jehqQxXsNGaXU35ymHi+m
         nZUpRtbblijoTEnHjSEdhFG1kcfBXIGe88+gC8nKl++ywBekmTzxbvmWWghZidu38CDd
         /WCUqu1d3Ym/eccG2ein/5SGLKWrvxObfj4Ur1dJC7KvPJ0Fk4z3mskhzjeCn2MTQ8uL
         P6mN+R/xPHgqFycAAGgsh4TsM8DXf4xImTQ4HPUJxpOcK1Js2IQnWnkIfFpNJ8qIzPCV
         rZGg==
X-Forwarded-Encrypted: i=1; AJvYcCUdNf3exgB3pUm3aRP+oeZn6isz1Qa898TT+C23bXm86Dj52gQ1VCqzRv/x1/ndIgMgXCra/KEa33M7ldE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVNtzqElsB4FlR7sBtzwfopZPQqHabVpQb1vyjyEDf84DLZkF
	xozlZNyN2L2c8YJsRHZSw2jGxn4OHyNsIgT4pODV+D8iedshzgiq4P46ePutGnTnRW999iRH/d6
	/lBWbw6TeVOA0v/x6L4iFHIIKWXlbp9x9u/ZbN/T1Yke3qyGY5U4OKkUxgYE=
X-Google-Smtp-Source: AGHT+IFp2aHAgpgxgKwotpCecd4bB0YiSiL1FRmcmX2yvY8W2cnNVir5HR4z3TaeYeHB2YnbVCd78tGNMluwUmewqsu3gSvCx885
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b47:b0:3dc:87c7:a5b5 with SMTP id
 e9e14a558f8ab-3e13ee92ed1mr17189675ab.3.1751713352147; Sat, 05 Jul 2025
 04:02:32 -0700 (PDT)
Date: Sat, 05 Jul 2025 04:02:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68690648.a00a0220.c7b3.0037.GAE@google.com>
Subject: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in pcl726_attach
From: syzbot <syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c435a4f487e8 Merge tag 'riscv-for-linus-6.16-rc5' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ea4f70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
dashboard link: https://syzkaller.appspot.com/bug?extid=5cd373521edd68bebcb3
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1116c582580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12ea4f70580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c435a4f4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/691cd7284e87/vmlinux-c435a4f4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e61b1a511aab/bzImage-c435a4f4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5cd373521edd68bebcb3@syzkaller.appspotmail.com

------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/comedi/drivers/pcl726.c:331:46
shift exponent -2147450880 is negative
CPU: 2 UID: 0 PID: 6107 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-00286-gc435a4f487e8 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:233 [inline]
 __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
 pcl726_attach.cold+0x19/0x1e drivers/comedi/drivers/pcl726.c:331
 comedi_device_attach+0x3b0/0x900 drivers/comedi/drivers.c:996
 do_devconfig_ioctl+0x1a7/0x580 drivers/comedi/comedi_fops.c:855
 comedi_unlocked_ioctl+0x15bb/0x2e90 drivers/comedi/comedi_fops.c:2136
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcefa58e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd9f2c5a28 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fcefa7b5fa0 RCX: 00007fcefa58e929
RDX: 0000200000002b40 RSI: 0000000040946400 RDI: 0000000000000003
RBP: 00007fcefa610b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fcefa7b5fa0 R14: 00007fcefa7b5fa0 R15: 0000000000000003
 </TASK>
---[ end trace ]---


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
