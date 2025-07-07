Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EABA27E7EB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892086; cv=none; b=EokJJcqfeafXj18Kv4DMahtxTA3VxpXwOoTFPgxZU9a23hZCaouDgxK1fhIrKlXuOaVcS/HemRAkzi6X70vNkL6XS8KV07qD9YPmDgCj1ahKKLo20rHglf9X3cuynC7E+EeVjS/WtPG8lnuFUHEUFA2e7WsnpITxNGkXZNWO7cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892086; c=relaxed/simple;
	bh=bj+Odb3qgJDQs2022pS0mtdf26UysnvMaJvSZm3GnYw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aIAHZbFTFqWdVNsAiAndmEw8hG2nPYqwVGRdVr2QB++00SqTzqlZLyITAqwNkozgxcNnvhCVTT0bINXtp6CEQJV4yw5Nt5mOk/IXn2mF0/S2jxOvDT4zr8r5Cj5ZcbHerTPF0bjRlkxJEjES7U/gSaJIzZBHfhFqohLJrKRFUCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so23366235ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892083; x=1752496883;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UL8DGv3u86BZ2iy7UUrWxmj4dXg/MEAtl5jj3qd+64=;
        b=ipMswg7yLrMH1H7J0+zMKgJiFet3LmHeM97BjvT/DS7HyxmyRfcI5nu4CSIheHzVNS
         AROi6UfyccG9EjqvanshcklK8WFzNRTwNRlUpEXHzjnuhRU7wLCmxSUjinvOHuZZhYUW
         w+bv3HzO0IhaSt4aYzUaxJYGp0FnGxvVcJIQBaRRc1CQJt2MxFwuPXSjVDLtgPD0vfIS
         JvguaaBfp1f1RbIKc5rNti1d3YJbf1tL/Y4WfkYCSCoxFxF/F2AqTfOlMx2l72PNFGv2
         r5e4jWw8UnUjakRzCCc1qq4iMgDKQNBhdATa1/1dSYuJelhPsXLuPiJx7hKuu4auL5AX
         S8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWxRQNm1k8Tpioe9XNAieQWV4IY3a1uXcrKqBWA6mo4g1/RYFCXTA3DuBeD4FaplPKZqzhxEbFzInff+qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9sOEM+17aBDswFh712gU6WSbwAC0iCE1Zd8/b5nRUNHqZcS3Q
	s/M6oZBEjZ5bhOZVwRoxdqAVFooHrbFXlH/9K9Pqg/ACEvo35mZbcEmRK2t9yuP/3GABm80vbQR
	4dGMIlgl+akzAQInPIzZPRb+mEmTdzLG9vq3B3zKssdyjNjSVmWWC0aZshH8=
X-Google-Smtp-Source: AGHT+IGX2iLZw64s3HkH71g7lS7g1rKZCKC+sOzM+LLesgWuBX51pg8fZP00pc0h6TNx86q4HBrlUs14QO2DU5fWYU5k8Qinys+P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3f10:b0:3df:3bc5:bac1 with SMTP id
 e9e14a558f8ab-3e13ee8c225mr73500965ab.5.1751892083675; Mon, 07 Jul 2025
 05:41:23 -0700 (PDT)
Date: Mon, 07 Jul 2025 05:41:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686bc073.a00a0220.c7b3.0086.GAE@google.com>
Subject: [syzbot] [netfilter?] KMSAN: uninit-value in nf_flow_offload_inet_hook
 (2)
From: syzbot <syzbot+bf6ed459397e307c3ad2@syzkaller.appspotmail.com>
To: coreteam@netfilter.org, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, kadlec@netfilter.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, pabeni@redhat.com, pablo@netfilter.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1f988d0788f5 Merge tag 'hid-for-linus-2025070502' of git:/..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=162bef70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa9af7332485152e
dashboard link: https://syzkaller.appspot.com/bug?extid=bf6ed459397e307c3ad2
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1433e582580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16a6828c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/84da6415798d/disk-1f988d07.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/62abf67637e4/vmlinux-1f988d07.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0bb719d426ed/bzImage-1f988d07.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bf6ed459397e307c3ad2@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in nf_flow_offload_inet_hook+0x7e4/0x940 net/netfilter/nf_flow_table_inet.c:27
 nf_flow_offload_inet_hook+0x7e4/0x940 net/netfilter/nf_flow_table_inet.c:27
 nf_hook_entry_hookfn include/linux/netfilter.h:157 [inline]
 nf_hook_slow+0xe1/0x3d0 net/netfilter/core.c:623
 nf_hook_ingress include/linux/netfilter_netdev.h:34 [inline]
 nf_ingress net/core/dev.c:5742 [inline]
 __netif_receive_skb_core+0x4aff/0x70c0 net/core/dev.c:5837
 __netif_receive_skb_one_core net/core/dev.c:5975 [inline]
 __netif_receive_skb+0xcc/0xac0 net/core/dev.c:6090
 netif_receive_skb_internal net/core/dev.c:6176 [inline]
 netif_receive_skb+0x57/0x630 net/core/dev.c:6235
 tun_rx_batched+0x1df/0x980 drivers/net/tun.c:1485
 tun_get_user+0x4ee0/0x6b40 drivers/net/tun.c:1938
 tun_chr_write_iter+0x3e9/0x5c0 drivers/net/tun.c:1984
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0xb4b/0x1580 fs/read_write.c:686
 ksys_write fs/read_write.c:738 [inline]
 __do_sys_write fs/read_write.c:749 [inline]
 __se_sys_write fs/read_write.c:746 [inline]
 __x64_sys_write+0x1fb/0x4d0 fs/read_write.c:746
 x64_sys_call+0x38c3/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_node_noprof+0x818/0xf00 mm/slub.c:4249
 kmalloc_reserve+0x13c/0x4b0 net/core/skbuff.c:579
 __alloc_skb+0x347/0x7d0 net/core/skbuff.c:670
 alloc_skb include/linux/skbuff.h:1336 [inline]
 alloc_skb_with_frags+0xc5/0xa60 net/core/skbuff.c:6665
 sock_alloc_send_pskb+0xad8/0xc70 net/core/sock.c:2999
 tun_alloc_skb drivers/net/tun.c:1461 [inline]
 tun_get_user+0x1019/0x6b40 drivers/net/tun.c:1782
 tun_chr_write_iter+0x3e9/0x5c0 drivers/net/tun.c:1984
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0xb4b/0x1580 fs/read_write.c:686
 ksys_write fs/read_write.c:738 [inline]
 __do_sys_write fs/read_write.c:749 [inline]
 __se_sys_write fs/read_write.c:746 [inline]
 __x64_sys_write+0x1fb/0x4d0 fs/read_write.c:746
 x64_sys_call+0x38c3/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 5890 Comm: syz-executor738 Not tainted 6.16.0-rc4-syzkaller-00324-g1f988d0788f5 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
=====================================================


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
