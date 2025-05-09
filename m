Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DE5220F56
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820767; cv=none; b=XijOxFGKhjm3JACoZTRmQ3rUQy3SPaf1lU2RizQw9i7POWCLcxfk0YMEsh+4CyBcXIvrHOGsumUwnbU+VHbA/UCgt4LLqqn61Cjvr3zOtHsiaXrPrF2UvGcavNSaUJqAGVHqIdN7h3vWaHMVkeXyIpLUPvEWVfgZefGSdVOYbT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820767; c=relaxed/simple;
	bh=WBicAQQ7I7jD+BXfAXJcmzJUHZtYsTXi4lYFgkk6PiM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=k/tJrukUBmeLLodLx6EyBay6ItJ71A/fksMAme80txUhq4NXEsnS1D6T224esX4vry3LSDKAp0M0GLHEFvOjvlbbmAM/PJNViYK8VtTlmfAzxLU6aerH1XY0qkE2HBXXICag1b+uX/mUH8gf8lCQrxETCYNFVeoG3OlLVQ9Mbwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-85c552b10b9so213426639f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820765; x=1747425565;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5HHdjPaJZATsD4Stzjdp0FvRUeXTSmH41+zYifft2k8=;
        b=h0Gc9RfXh54GBNA+AkfkX294utm1Wl4DNN97C4w03qgson0Iths9xdDnnHPCTUDaom
         6qx+cv1iq44/+EFl9Q3szcLINOKY9WWzZT7G8j14xFJQi7RPhqMS7exN3drLyjgqA0yH
         QdNLC8mAC8rtSO3Yjw7/TkQfcZjHUgLuq3DK+iAnWbI80ThDyBhtRt1nsXsbY8IemkNP
         3YKCRc+v8x/5/FiXPCrLbnxBFaEPs41omhMliHE/LEjXR2zF1VoKEuPBGTEfSHbpBgnE
         xiSviz6yHBAbpIx/ErLyrDrZEusFdxVNwvFPy6cXSzfQf6uPhcA5yjCdQVIXMlCKXZvr
         DcOA==
X-Forwarded-Encrypted: i=1; AJvYcCW3OR1yQlmmp7wKzAAcFiOr/uyPZKMcRLPrKdiNDo7F+gBIZWX56inZU/SDbvOgzF4RnK10gASFj/vRIdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZPjEpxMJAjN9iSqh172AolYv+CScLboSdYASYsgv8eJxZLnrj
	fLREbEZPJSLTBSOye6TZBykHWRLapE44nIz4QXr5/hAMqSjktOxMxsyoWZJp/FX9ZmHIsJue6xD
	hh77Y387mUZepVWevFF80pe0uJH9PA3JdEvPS5sc0ONnv6cfvmIAM4ZU=
X-Google-Smtp-Source: AGHT+IHeboep2/ZgtFNAhDHSbks4MCSLzuCqS7IShy4118ffGTy8D7WOEd5KBH9UtQ1fVwyRzbNH/0MfHv8FulD/cQ+t4Xmd+ijv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:154c:b0:864:4a9c:1bd7 with SMTP id
 ca18e2360f4ac-86763392674mr650551839f.0.1746820765271; Fri, 09 May 2025
 12:59:25 -0700 (PDT)
Date: Fri, 09 May 2025 12:59:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681e5e9d.050a0220.a19a9.013c.GAE@google.com>
Subject: [syzbot] [net?] KMSAN: uninit-value in __ipv6_dev_mc_dec (2)
From: syzbot <syzbot+4472ecce287501aa597a@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02ddfb981de8 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a14670580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=4472ecce287501aa597a
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7dc8afe7520f/disk-02ddfb98.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3194559250c2/vmlinux-02ddfb98.xz
kernel image: https://storage.googleapis.com/syzbot-assets/86c7c494f08f/bzImage-02ddfb98.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4472ecce287501aa597a@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in __ipv6_dev_mc_dec+0x68a/0xd30 net/ipv6/mcast.c:1014
 __ipv6_dev_mc_dec+0x68a/0xd30 net/ipv6/mcast.c:1014
 addrconf_leave_solict net/ipv6/addrconf.c:2254 [inline]
 __ipv6_ifa_notify+0xf97/0x1990 net/ipv6/addrconf.c:6299
 addrconf_ifdown+0x1c61/0x32e0 net/ipv6/addrconf.c:3978
 addrconf_notify+0x183/0x1d10 net/ipv6/addrconf.c:3777
 notifier_call_chain kernel/notifier.c:85 [inline]
 raw_notifier_call_chain+0xdd/0x410 kernel/notifier.c:453
 call_netdevice_notifiers_info+0x1ac/0x2b0 net/core/dev.c:2176
 call_netdevice_notifiers_extack net/core/dev.c:2214 [inline]
 call_netdevice_notifiers net/core/dev.c:2228 [inline]
 dev_close_many+0x52a/0x8f0 net/core/dev.c:1731
 unregister_netdevice_many_notify+0x1106/0x4970 net/core/dev.c:11952
 unregister_netdevice_many net/core/dev.c:12046 [inline]
 unregister_netdevice_queue+0x3b1/0x600 net/core/dev.c:11889
 unregister_netdevice include/linux/netdevice.h:3374 [inline]
 __tun_detach+0x16c8/0x20c0 drivers/net/tun.c:620
 tun_detach drivers/net/tun.c:636 [inline]
 tun_chr_close+0xb7/0x290 drivers/net/tun.c:3390
 __fput+0x608/0x1040 fs/file_table.c:465
 ____fput+0x25/0x30 fs/file_table.c:493
 task_work_run+0x206/0x2b0 kernel/task_work.c:227
 resume_user_mode_work+0x105/0x160 include/linux/resume_user_mode.h:50
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x7b/0xb0 kernel/entry/common.c:218
 __do_fast_syscall_32+0xbd/0x110 arch/x86/entry/syscall_32.c:309
 do_fast_syscall_32+0x38/0x80 arch/x86/entry/syscall_32.c:331
 do_SYSENTER_32+0x1f/0x30 arch/x86/entry/syscall_32.c:369
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Local variable maddr.i created at:
 addrconf_leave_solict net/ipv6/addrconf.c:2248 [inline]
 __ipv6_ifa_notify+0xe6f/0x1990 net/ipv6/addrconf.c:6299
 addrconf_ifdown+0x1c61/0x32e0 net/ipv6/addrconf.c:3978

CPU: 1 UID: 0 PID: 10959 Comm: syz.4.717 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
=====================================================


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
