Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8032026E161
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394692; cv=none; b=gUItjqJiFAVYK+Gbun43zS5w27AJqz9u/TZSHox/AnlYH641NaFR8Chzmqk84AcU+J7dBajBeva4qeM/AoFqs5lGsvE7p8t67E5/gA1JVOZkL5TWWEuXEVkAvIp2ubXl/cE+QTOif/DExXJKKIcLYeZYbhTF6UB1Z7gYtpPn+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394692; c=relaxed/simple;
	bh=JVM+D2cPD5kJCHNUnkFYFbPV/xrj7r3Yu2JBXWM/bAw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ePHIYdlTBPpdox8T9yhqJRkqojzCBwVxcyjhbYzrS7BFHTEs7NgpWyKvtxIM2tmsIdIrBM/LmngCYI5J2rNtOkfU6YrO8N3AshKQoLzjJj9XClecGcN3HLUiBUR/2pBN0LLhYAu+hePOfKaLjear6S4ZfluR+TcLLvOcbOpwsa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d81bc9b763so92775795ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394689; x=1745999489;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndzc6o3PQmddI86XNaY5hOBgE+u1I/s9h4gsKtPCnXA=;
        b=AqGfaksAP41c3DQ4iXiOa3u5z9uiFA2V6jbZoUp1dQDOA+SqxOYx9U6QBAEfnf8giZ
         MVxTr7W/X4On4AwHBJTRbccY9RQzNPgCo4wPXKTCCXx8wm2G+aLJkx2ZVO/j5JU7NsSf
         xNWa6BPlErGjE9oI547nWUT7HfviiA4J5I6Nx9lpeQfugaSgyLHmJqmcTPbdA913fF43
         kWavtUPaWzqiWjL8BZ5QA69l7v5xTrry2KyxiyZFZpJUeDXWPT6+1rpemjJ9EYFL9diA
         91J34jvBHeYhpcI7MakhK+v2jXnB3tWXiKdNsFKo3CidxEO3RCNAjFQZrPRyTVo6yP2l
         CV6w==
X-Forwarded-Encrypted: i=1; AJvYcCWdcD9LBz4BT3GyqEMtrNGstg4DKFGqFmNL116iV2wCJHnkrsP7JrQ/jugbNy68lwFfJ/tcaBky8Rw7RPM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf8ifKp9KPcqngCJQ26/chtTt/au4NP8ziZ29qP1RoiC1hRCiF
	ahMhmtlsOA8KNS/tigG8LMKrpuSs53cviStYRVcl+23LZw1wPrndQisiCeyL6o/i29w9ykqHchi
	kh8OV/5fNw3xFmtyqI82t2zSoVRs7VkqmQ/WWeHKIpffKMqXD+s1jKvk=
X-Google-Smtp-Source: AGHT+IG5YLRkPk6ll0iD2rCSjwKFuFfurI2t2jOfecpW+WGCbVLdc1PkvWWxpmLjuN7Eii/AIBDV3eP249+/8w8J/XBuHeUt6u3x
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1946:b0:3d8:1d7c:e192 with SMTP id
 e9e14a558f8ab-3d88ed8839bmr182605365ab.7.1745394689606; Wed, 23 Apr 2025
 00:51:29 -0700 (PDT)
Date: Wed, 23 Apr 2025 00:51:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68089c01.050a0220.36a438.000f.GAE@google.com>
Subject: [syzbot] [net?] KASAN: null-ptr-deref Write in dst_cache_per_cpu_get (3)
From: syzbot <syzbot+c71bf8ad5b74c29baa2f@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fc96b232f8e7 Merge tag 'pci-v6.15-fixes-2' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1049063f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=170d968a88ba5c06
dashboard link: https://syzkaller.appspot.com/bug?extid=c71bf8ad5b74c29baa2f
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fd977d7e57de/disk-fc96b232.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ffa0a3b5b655/vmlinux-fc96b232.xz
kernel image: https://storage.googleapis.com/syzbot-assets/44df3bd100d2/bzImage-fc96b232.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c71bf8ad5b74c29baa2f@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: null-ptr-deref in atomic_add_negative_relaxed include/linux/atomic/atomic-instrumented.h:1475 [inline]
BUG: KASAN: null-ptr-deref in rcuref_get include/linux/rcuref.h:67 [inline]
BUG: KASAN: null-ptr-deref in dst_hold include/net/dst.h:238 [inline]
BUG: KASAN: null-ptr-deref in dst_cache_per_cpu_get+0x7d/0x2b0 net/core/dst_cache.c:50
Write of size 4 at addr 0000000000000043 by task kworker/1:0/24

CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted 6.15.0-rc2-syzkaller-00278-gfc96b232f8e7 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: wg-crypt-wg2 wg_packet_tx_worker
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_report+0xe3/0x5b0 mm/kasan/report.c:524
 kasan_report+0x143/0x180 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x28f/0x2a0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_add_negative_relaxed include/linux/atomic/atomic-instrumented.h:1475 [inline]
 rcuref_get include/linux/rcuref.h:67 [inline]
 dst_hold include/net/dst.h:238 [inline]
 dst_cache_per_cpu_get+0x7d/0x2b0 net/core/dst_cache.c:50
 dst_cache_get_ip6+0x8c/0xf0 net/core/dst_cache.c:133
 send6+0x466/0xbf0 drivers/net/wireguard/socket.c:129
 wg_socket_send_skb_to_peer+0x115/0x1d0 drivers/net/wireguard/socket.c:178
 wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
 wg_packet_tx_worker+0x1bf/0x810 drivers/net/wireguard/send.c:276
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd50 kernel/workqueue.c:3400
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
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
