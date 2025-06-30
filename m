Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7D1C84DE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303263; cv=none; b=D8M2BSi7dnGyq6q0NFKLgpGWRyGGsNDf9yhMTcvZu3t99Xd6KsyHCcs/uHzS7ygCJ2Gi1MaG3cW/OmGhIMlXPDvaareBvepe4D/EKq3t5QEMol73U2v54796X8GDctTRN28D4kS+/VCpGbtcBgYlpWzIhRJQG+htIyPW0v2qVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303263; c=relaxed/simple;
	bh=c3JLAcs7m9aTtuXVUB+C3D0BVbgAzHP8C3+vbqYZodk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RfEy/vmcoOz+Chmgk5Mn+vuBtaHWuSCYVq26a3+0I0a0gI0lDGtp+I6B6iK3f064177gcYtBajcnU4Rvfc2nYolyBs63qtiY2ZicKtszvxnSvDGNoNMQfHJUZ1a6PyaN7zLZ3k/2IwgVTH/R0kGliBa/wYPM1u6LCXGGzR93+7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so200186639f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303261; x=1751908061;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eVH34/JyElyGCncpABHXHf6kfIN2WmIJvCTUgA3HEQ=;
        b=Rp33njavjtxagY1nJaAJakXVDjU/t5y3byvirCB8o/sRZr+KT1hntSpROSrv3T9GIQ
         maguOOzRd3m7mSvSCjzWV82ZqFBe8HxLhi5sTxn0uXBz0RjthCWjW8x/pFh3o4ENk4NZ
         eJH9kSUTjuWXcUzyd25GkWKmIDABeA9e32zrKWhHvySH0NWn0f+AFZUHRGqHHIbhLcl3
         LeDKXgTINrK202pZ5I2P7E3ZjqtNZTW5g36AVOrI2+KBQPBwK70Ubex8JZ4plpqyrFMy
         pwCLx6KoqlG5Fc/gtw4W3TFVQy+m7ISySSIwobhaBIOamIcJbSK/JgOxO+oOkcaATHeq
         WAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtJxNvMV73SjMDKC5PJBFf1IezPt5GjO0c8NxXpg1zwxT/1O+9G+KM333AiRt5gGW/50JS8H/s1X96uU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5vRs7/wVVfmznVHtjyfuBSCrHYvvb6dk9TTIi+HhXGna3Jpc
	XmykDaNsTREtNsUYyZ8qJgkMR5yRsQpsym1lkuW3u1nn3SHSo81d7oHkm3qF+89D12S1ZkE44X3
	53HI2zYi/48J2/3vE+YifywzjC1AdLZQAkfPz2hf2CQnzZgaWGTkR8VaJhyw=
X-Google-Smtp-Source: AGHT+IFnc7V73z7h/yTZD0NLdobDmnUYkaIBhp0J7a3EbG/eiKtDvFtwI3av4DgI57JfmgOGsh/VTEJ+bL5aJvfAIgeVVThTd/4T
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188e:b0:3df:3ab2:cc7c with SMTP id
 e9e14a558f8ab-3df4abae83emr151790175ab.13.1751303260942; Mon, 30 Jun 2025
 10:07:40 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:07:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6862c45c.a70a0220.3b7e22.10aa.GAE@google.com>
Subject: [syzbot] [batman?] KMSAN: uninit-value in batadv_mcast_mla_update
From: syzbot <syzbot+1daa6a8aecb922ad3c30@syzkaller.appspotmail.com>
To: antonio@mandelbit.com, b.a.t.m.a.n@lists.open-mesh.org, 
	davem@davemloft.net, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, marek.lindner@mailbox.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, sven@narfation.org, 
	sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ee88bddf7f2f Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12b1db70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595d344ff0b23ac5
dashboard link: https://syzkaller.appspot.com/bug?extid=1daa6a8aecb922ad3c30
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/405f6113ec86/disk-ee88bddf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/57f4fa239393/vmlinux-ee88bddf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/32892fe29e1c/bzImage-ee88bddf.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1daa6a8aecb922ad3c30@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in batadv_mcast_mla_is_duplicate net/batman-adv/multicast.c:347 [inline]
BUG: KMSAN: uninit-value in batadv_mcast_mla_tt_retract net/batman-adv/multicast.c:692 [inline]
BUG: KMSAN: uninit-value in __batadv_mcast_mla_update net/batman-adv/multicast.c:920 [inline]
BUG: KMSAN: uninit-value in batadv_mcast_mla_update+0x35f4/0x4f80 net/batman-adv/multicast.c:948
 batadv_mcast_mla_is_duplicate net/batman-adv/multicast.c:347 [inline]
 batadv_mcast_mla_tt_retract net/batman-adv/multicast.c:692 [inline]
 __batadv_mcast_mla_update net/batman-adv/multicast.c:920 [inline]
 batadv_mcast_mla_update+0x35f4/0x4f80 net/batman-adv/multicast.c:948
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e3/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 __kmalloc_cache_noprof+0x7f7/0xed0 mm/slub.c:4354
 kmalloc_noprof include/linux/slab.h:905 [inline]
 batadv_mcast_mla_meshif_get_ipv6 net/batman-adv/multicast.c:477 [inline]
 batadv_mcast_mla_meshif_get net/batman-adv/multicast.c:535 [inline]
 __batadv_mcast_mla_update net/batman-adv/multicast.c:911 [inline]
 batadv_mcast_mla_update+0x1c17/0x4f80 net/batman-adv/multicast.c:948
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb91/0x1d80 kernel/workqueue.c:3321
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3402
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x1e3/0x310 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

CPU: 1 UID: 0 PID: 68 Comm: kworker/u8:4 Tainted: G        W           6.16.0-rc3-syzkaller-00072-gee88bddf7f2f #0 PREEMPT(undef) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: bat_events batadv_mcast_mla_update
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
