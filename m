Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B6717CA1B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699206; cv=none; b=iKZ/j1VpgIGfMogoOTEonZwgsIkBGTQa79av3lCqRil//vFzsh/YwnMfsvF8igSAvBgocGFUiefFMhQwtd//Hdq8V1hJMTIA++haZwi2+XEo1DZWej/mPeYnUmDC7+Z8A+6/qaehMhfdD81MjMkqUY8ErJCxN0pwDCttth0ay8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699206; c=relaxed/simple;
	bh=1Agwy2McflkDd2n0D9T68GvC0NXprr8N3WMFlvLi5rY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gN86Ggsae5t/5uTTibfKYXfy3YHqRosiPqJXpW6zO7UmxGKOompaHqgkpuR/Wb9igX4FXQlgV2TLHe8Z9BIFlBBKS3W7z2IHt1RuL6Y+dpc5tRNQucLRyqM0k3dtOi8Os94GBOftZnCpagh2K9Zj1ZElUSsarfn3LloPxa1CsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-85b402f69d4so69258739f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699204; x=1747304004;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUnzh125CmmU3uGSr3J0m2waWnKc2FnnnfAr1ztczng=;
        b=YZ1hL8EyaP5BLTFyXv6abzbM50YZNko4q4/L6P45Um5pcsBJXBJpgSAwZn/L1SnEcF
         aCe3FOYsTwLnkkBJIGce0EMrHi4PS23BBRs4U3FFXu+5MXR8Xh1ASIs3eVYZZgbVV8S3
         Ua2RAONslwVtDsBniHPJTIle/MLnEzI5UNeqDgXVMSFzXgy88jh4cLfI9fAfQU6NpX+Q
         YlhW+TVwGiWsAtqpi0/Blu99nupwvpRXrQPZQGunv/HCZqwe0kU6ICkbRrtgFp6UcekX
         YniBDJ5+2CCC9zOFrgSRMh4Qz1bKbaXFDwmsznnLE4Asarr75NCjXBZthIThJ1DO3Wsw
         7Tjw==
X-Forwarded-Encrypted: i=1; AJvYcCUyFIPkxE5v41YfywG9ENnJ3xBqTlctCebunTmKOfCF1UlBo0WnWE3HZD5RDfOitODJjes+GxpkHofMjuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfwhCW0dImg5Qx7UeaeNzPfinTSxXVWsvKHBVZzwDawW1M2OdD
	wysizuGlKaEmDNs4Nq465zmVg0wET2rPwATyLdHseXKrJQGB2TYwIQlefDZLsq6qEZY5g/Mg/Ac
	A+U/o6OsKFf3f9EcgFYlDYLaPzXoexYUzLXF65iBv3TgbBpexpCnyDbE=
X-Google-Smtp-Source: AGHT+IHJSnX2Ndkn/jvZhLJspTpxX8WZcmUCN3M66i1mlTQcp+DbJtrRKVEjKvvXjlzQqaWxXo5Ts9bXaqbm/8/KO8aHUxKL0Uyh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1486:b0:861:6f49:626 with SMTP id
 ca18e2360f4ac-8674784110fmr839271039f.6.1746699203939; Thu, 08 May 2025
 03:13:23 -0700 (PDT)
Date: Thu, 08 May 2025 03:13:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681c83c3.050a0220.a19a9.00d9.GAE@google.com>
Subject: [syzbot] [net?] BUG: corrupted list in __nsim_dev_port_del
From: syzbot <syzbot+ccf06e09fd9a78979179@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    707df3375124 Merge tag 'media/v6.15-2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12ac8670580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b39cb28b0a399ed3
dashboard link: https://syzkaller.appspot.com/bug?extid=ccf06e09fd9a78979179
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-707df337.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f71d162685b9/vmlinux-707df337.xz
kernel image: https://storage.googleapis.com/syzbot-assets/940cb473e515/bzImage-707df337.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ccf06e09fd9a78979179@syzkaller.appspotmail.com

list_del corruption. next->prev should be ffff888044a30400, but was ffffffff9af9a480. (next=ffff888031704400)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:65!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 2 UID: 0 PID: 16418 Comm: syz-executor Not tainted 6.15.0-rc5-syzkaller-00038-g707df3375124 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:__list_del_entry_valid_or_report+0x1b3/0x200 lib/list_debug.c:65
Code: 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 75 4b 49 8b 54 24 08 4c 89 e1 48 89 de 48 c7 c7 80 87 f4 8b e8 be 50 c4 fc 90 <0f> 0b e8 f6 7e 4a fd e9 6b fe ff ff 48 89 df e8 e9 7e 4a fd e9 7d
RSP: 0018:ffffc90003d2f980 EFLAGS: 00010286
RAX: 000000000000006d RBX: ffff888044a30400 RCX: ffffffff819a90e9
RDX: 0000000000000000 RSI: ffffffff819b0f76 RDI: 0000000000000005
RBP: ffff888031704408 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000000 R12: ffff888031704400
R13: ffff888044a30408 R14: ffff8880512ce000 R15: dffffc0000000000
FS:  0000555579180500(0000) GS:ffff8880d6bdf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc89863d68 CR3: 000000011723c000 CR4: 0000000000352ef0
DR0: 0000000000000007 DR1: 0000000000000002 DR2: 0000000000000008
DR3: 1000000100000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del include/linux/list.h:229 [inline]
 __nsim_dev_port_del+0x20/0x240 drivers/net/netdevsim/dev.c:1425
 nsim_dev_port_del_all drivers/net/netdevsim/dev.c:1440 [inline]
 nsim_dev_reload_destroy+0x10a/0x4d0 drivers/net/netdevsim/dev.c:1661
 nsim_drv_remove+0x52/0x1d0 drivers/net/netdevsim/dev.c:1676
 device_remove+0xc8/0x170 drivers/base/dd.c:567
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x44b/0x620 drivers/base/dd.c:1295
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:579
 device_del+0x396/0x9f0 drivers/base/core.c:3881
 device_unregister+0x1d/0xc0 drivers/base/core.c:3922
 nsim_bus_dev_del drivers/net/netdevsim/bus.c:462 [inline]
 del_device_store+0x355/0x4a0 drivers/net/netdevsim/bus.c:226
 bus_attr_store+0x71/0xb0 drivers/base/bus.c:172
 sysfs_kf_write+0xef/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:591 [inline]
 vfs_write+0x5ba/0x1180 fs/read_write.c:684
 ksys_write+0x12a/0x240 fs/read_write.c:736
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1c3858d41f
Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 f9 92 02 00 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 4c 93 02 00 48
RSP: 002b:00007ffc89864410 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f1c3858d41f
RDX: 0000000000000001 RSI: 00007ffc89864460 RDI: 0000000000000005
RBP: 00007f1c38611d05 R08: 0000000000000000 R09: 00007ffc89864267
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000001
R13: 00007ffc89864460 R14: 00007f1c392e4620 R15: 0000000000000003
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x1b3/0x200 lib/list_debug.c:65
Code: 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 75 4b 49 8b 54 24 08 4c 89 e1 48 89 de 48 c7 c7 80 87 f4 8b e8 be 50 c4 fc 90 <0f> 0b e8 f6 7e 4a fd e9 6b fe ff ff 48 89 df e8 e9 7e 4a fd e9 7d
RSP: 0018:ffffc90003d2f980 EFLAGS: 00010286
RAX: 000000000000006d RBX: ffff888044a30400 RCX: ffffffff819a90e9
RDX: 0000000000000000 RSI: ffffffff819b0f76 RDI: 0000000000000005
RBP: ffff888031704408 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000000 R12: ffff888031704400
R13: ffff888044a30408 R14: ffff8880512ce000 R15: dffffc0000000000
FS:  0000555579180500(0000) GS:ffff8880d6bdf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffc89863d68 CR3: 000000011723c000 CR4: 0000000000352ef0
DR0: 0000000000000007 DR1: 0000000000000002 DR2: 0000000000000008
DR3: 1000000100000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
