Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDAB4317D
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748727928; cv=none; b=cOBpjRsPUshpKe/38vMJfgbBU8QJn+1KusC0cUMRp4AoQnPnfYcj9A5+bWZrodrcs+K5aGGLAZbmNsgQcVBZEJQCySbJJDdolK6C9xdFFJ33iFCs+gfjA7VeBzvQjaQVgkmyu0nPIPwetknGPv1IIuytFqh8IhiLz0zG6BIGcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748727928; c=relaxed/simple;
	bh=eGmxKSIDk+Pr2pjYrHxA/uwhqRwV2oa5bunGidKjwmQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H+MjfBBdxDNb3df9hqqVvAYkLdxz5pO0hdxEL/HEVKcPYzvrF3NHkhcawAKUjgc3kTf8kS6RFkuysTiEsj3pt90XnZKBIjWj93b44M75k9v9RQlWD/nHgw3FvOIzjr40f8B4iMCb1dPicWlKhOjFgJhFTtZZxI9+Krcjhxsm8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dc83674dbbso65262175ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 14:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748727926; x=1749332726;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ibbplstNDK/5Y1Z4W9x7q3Afr7C6j0t143rSJ76Bh5o=;
        b=Yvntj8lpYHoiMqys1US4+wIlhJMXfj6tzoPz4Ih+sn0H+woYwnpSGBFKIwJ4Cj7woW
         wSd6nqx2wZ0134Gm0Yx66ZmMKmVbdThIPBl8wYKX/Af6hU7iD2NEvPg8C0zkxoCA42jw
         rNVaOWXfczVAV1ZoGIJiXECdHgWtUcKbSNtG7Vpf6pkWAWFj9vshVVMcLYnrd9250u7Q
         4z17feTy+nfPav1f+p6HPBM8ARioJlp3FFpiaQLD1Q6QgVSEsTn/ofjWTpfPvLtwYlhA
         KTEwwPDwa6OwGeHiBIZt+7/SXOtqIU+8vn+A7/j4T3z4INuFbwZfFsjo5289j9FmtBmR
         AhxA==
X-Forwarded-Encrypted: i=1; AJvYcCXahKqwlCeueMRA+0XRdq482HAaLBdyu67sScfw6m5sdEqvjQDzqnv+q/f+wMmujFwWui0g8B7k6geo2WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymkfPWO63O4UU1XJrDNZ5DDOF+Xryu7lSAsobTqZ8YjE/PVyVb
	ID9ox8Ahrx2sn6hiA0Bkwni9OnUdsiuvgJCCagOub5ah5XDkTxznzPtfY94i1AhpxQeEb0nL5ES
	SOEvb0m7LLFlxeVbgAnE9ug5xzwiKC0JL/JEZPssJw9l+z6xqcJqPZWUAV7Q=
X-Google-Smtp-Source: AGHT+IFmnhT0nD3qkobzggNHBkQ07wkkIclVIq4D6SoJNqCcFvATr11HZs1zefSSNXgkjUUqI8UBl/QGQmI4jwoqNGkjU76hUduh
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc8:b0:3dc:88f1:d88b with SMTP id
 e9e14a558f8ab-3dd9c989d19mr65865385ab.3.1748727925739; Sat, 31 May 2025
 14:45:25 -0700 (PDT)
Date: Sat, 31 May 2025 14:45:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b7875.a70a0220.1a6ae.000d.GAE@google.com>
Subject: [syzbot] [dri?] WARNING in drm_atomic_helper_wait_for_vblanks (4)
From: syzbot <syzbot+70c83229f190c4cbf649@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
	tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    914873bc7df9 Merge tag 'x86-build-2025-05-25' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1550fdf4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99deacfb6378f156
dashboard link: https://syzkaller.appspot.com/bug?extid=70c83229f190c4cbf649
compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98a89b9f34e4/non_bootable_disk-914873bc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/55cb8ce834df/vmlinux-914873bc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6c2325ebf21a/zImage-914873bc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+70c83229f190c4cbf649@syzkaller.appspotmail.com

input: AT Raw Set 2 keyboard as /devices/platform/bus@8000000/bus@8000000:motherboard-bus/bus@8000000:motherboard-bus:iofpga-bus@300000000/1c060000.kmi/serio0/input/input0
input: ImExPS/2 Generic Explorer Mouse as /devices/platform/bus@8000000/bus@8000000:motherboard-bus/bus@8000000:motherboard-bus:iofpga-bus@300000000/1c070000.kmi/serio1/input/input2
------------[ cut here ]------------
WARNING: CPU: 1 PID: 47 at drivers/gpu/drm/drm_atomic_helper.c:1720 drm_atomic_helper_wait_for_vblanks.part.0+0x280/0x288 drivers/gpu/drm/drm_atomic_helper.c:1720
[CRTC:34:crtc-0] vblank wait timed out
Modules linked in:
Kernel panic - not syncing: kernel: panic_on_warn set ...
CPU: 1 UID: 0 PID: 47 Comm: kworker/1:1 Not tainted 6.15.0-syzkaller #0 PREEMPT 
Hardware name: ARM-Versatile Express
Workqueue: events output_poll_execute
Call trace: 
[<802019e4>] (dump_backtrace) from [<80201ae0>] (show_stack+0x18/0x1c arch/arm/kernel/traps.c:257)
 r7:00000000 r6:8282083c r5:00000000 r4:822585bc
[<80201ac8>] (show_stack) from [<802204e0>] (__dump_stack lib/dump_stack.c:94 [inline])
[<80201ac8>] (show_stack) from [<802204e0>] (dump_stack_lvl+0x54/0x7c lib/dump_stack.c:120)
[<8022048c>] (dump_stack_lvl) from [<80220520>] (dump_stack+0x18/0x1c lib/dump_stack.c:129)
 r5:00000000 r4:82a6fd1c
[<80220508>] (dump_stack) from [<802025f8>] (panic+0x120/0x374 kernel/panic.c:354)
[<802024d8>] (panic) from [<80259160>] (check_panic_on_warn kernel/panic.c:243 [inline])
[<802024d8>] (panic) from [<80259160>] (get_taint+0x0/0x1c kernel/panic.c:238)
 r3:8280c604 r2:00000001 r1:8223f214 r0:82246c00
 r7:80ae0220
[<802590ec>] (check_panic_on_warn) from [<802592c4>] (__warn+0x80/0x188 kernel/panic.c:749)
[<80259244>] (__warn) from [<802595b4>] (warn_slowpath_fmt+0x1e8/0x1f4 kernel/panic.c:784)
 r8:00000009 r7:822d4db8 r6:df921bb4 r5:832e0000 r4:00000000
[<802593d0>] (warn_slowpath_fmt) from [<80ae0220>] (drm_atomic_helper_wait_for_vblanks.part.0+0x280/0x288 drivers/gpu/drm/drm_atomic_helper.c:1720)
 r10:83833000 r9:00000001 r8:00000000 r7:00000000 r6:8334b500 r5:843cf050
 r4:00000000
[<80adffa0>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80ae166c>] (drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1696 [inline])
[<80adffa0>] (drm_atomic_helper_wait_for_vblanks.part.0) from [<80ae166c>] (drm_atomic_helper_commit_tail+0x84/0x94 drivers/gpu/drm/drm_atomic_helper.c:1796)
 r10:838a1c1c r9:00000000 r8:00000000 r7:00000001 r6:be5c55c0 r5:83833000
 r4:8334b500
[<80ae15e8>] (drm_atomic_helper_commit_tail) from [<80ae2d2c>] (commit_tail+0x178/0x19c drivers/gpu/drm/drm_atomic_helper.c:1873)
 r5:00000000 r4:8334b500
[<80ae2bb4>] (commit_tail) from [<80ae2eb8>] (drm_atomic_helper_commit+0x150/0x174 drivers/gpu/drm/drm_atomic_helper.c:2111)
 r9:00000000 r8:8334b52c r7:00000000 r6:83833000 r5:00000000 r4:8334b500
[<80ae2d68>] (drm_atomic_helper_commit) from [<80a9cff0>] (drm_atomic_commit+0xcc/0x100 drivers/gpu/drm/drm_atomic.c:1518)
 r9:00000000 r8:843cf520 r7:00000001 r6:00000001 r5:83833000 r4:8334b500
[<80a9cf24>] (drm_atomic_commit) from [<80ad4c3c>] (drm_client_modeset_commit_atomic+0x21c/0x25c drivers/gpu/drm/drm_client_modeset.c:1079)
 r5:838331ac r4:8334b500
[<80ad4a20>] (drm_client_modeset_commit_atomic) from [<80ad4d54>] (drm_client_modeset_commit_locked+0x64/0x18c drivers/gpu/drm/drm_client_modeset.c:1182)
 r10:838331ec r9:00000000 r8:822d3f0c r7:844b2a18 r6:844b2a00 r5:83833000
 r4:83833000
[<80ad4cf0>] (drm_client_modeset_commit_locked) from [<80ad4ea8>] (drm_client_modeset_commit+0x2c/0x48 drivers/gpu/drm/drm_client_modeset.c:1208)
 r9:00000000 r8:822d3f0c r7:838330ac r6:844b2ab8 r5:83833000 r4:844b2a00
[<80ad4e7c>] (drm_client_modeset_commit) from [<80aeef7c>] (__drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:237 [inline])
[<80ad4e7c>] (drm_client_modeset_commit) from [<80aeef7c>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0xa4/0xd8 drivers/gpu/drm/drm_fb_helper.c:216)
 r5:844b2a00 r4:00000000
[<80aeeed8>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<80aeeec8>] (drm_fb_helper_set_par drivers/gpu/drm/drm_fb_helper.c:1359 [inline])
[<80aeeed8>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<80aeeec8>] (drm_fb_helper_hotplug_event+0xf8/0x108 drivers/gpu/drm/drm_fb_helper.c:1970)
 r7:838330ac r6:83833000 r5:844b2ab8 r4:844b2a00
[<80aeedd0>] (drm_fb_helper_hotplug_event) from [<80aef428>] (drm_fbdev_client_hotplug+0x24/0xc8 drivers/gpu/drm/clients/drm_fbdev_client.c:43)
 r5:83833000 r4:844b2a00
[<80aef404>] (drm_fbdev_client_hotplug) from [<80ad44b4>] (drm_client_hotplug drivers/gpu/drm/drm_client_event.c:69 [inline])
[<80aef404>] (drm_fbdev_client_hotplug) from [<80ad44b4>] (drm_client_dev_hotplug drivers/gpu/drm/drm_client_event.c:98 [inline])
[<80aef404>] (drm_fbdev_client_hotplug) from [<80ad44b4>] (drm_client_dev_hotplug+0xd8/0x130 drivers/gpu/drm/drm_client_event.c:84)
 r7:838330ac r6:83833000 r5:83833098 r4:844b2a00
[<80ad43dc>] (drm_client_dev_hotplug) from [<80aea6b8>] (drm_kms_helper_hotplug_event drivers/gpu/drm/drm_probe_helper.c:735 [inline])
[<80ad43dc>] (drm_client_dev_hotplug) from [<80aea6b8>] (output_poll_execute+0x27c/0x2c8 drivers/gpu/drm/drm_probe_helper.c:847)
 r9:00000000 r8:838330d8 r7:00000001 r6:83833000 r5:00000001 r4:832a0000
[<80aea43c>] (output_poll_execute) from [<8027eb9c>] (process_one_work+0x1b4/0x4f4 kernel/workqueue.c:3238)
 r10:83016070 r9:83018205 r8:832e0000 r7:ddde2d80 r6:83018200 r5:838331ec
 r4:832a0000
[<8027e9e8>] (process_one_work) from [<8027f7e4>] (process_scheduled_works kernel/workqueue.c:3319 [inline])
[<8027e9e8>] (process_one_work) from [<8027f7e4>] (worker_thread+0x1fc/0x3d8 kernel/workqueue.c:3400)
 r10:61c88647 r9:832e0000 r8:832a002c r7:82804d40 r6:ddde2d80 r5:ddde2da0
 r4:832a0000
[<8027f5e8>] (worker_thread) from [<80286810>] (kthread+0x12c/0x280 kernel/kthread.c:464)
 r10:00000000 r9:832a0000 r8:8027f5e8 r7:df879e60 r6:832a0080 r5:832e0000
 r4:00000001
[<802866e4>] (kthread) from [<80200114>] (ret_from_fork+0x14/0x20 arch/arm/kernel/entry-common.S:137)
Exception stack(0xdf921fb0 to 0xdf921ff8)
1fa0:                                     00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
 r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:802866e4
 r4:832a1000
Rebooting in 86400 seconds..


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
