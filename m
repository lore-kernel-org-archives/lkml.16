Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B889D27A10A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281746; cv=none; b=nEC5ALSu0p+iWZdHoau+WiBz1Uy46qwb83/qw6ZSdP0Im0QWDgQWjFffjDHHQAjkwdx83ZTXMqKXV33in4XI3ynprMqY5CtWZuOkmpnVxJrsHlF4k/LskomRSMwZx+J/a689EE2YP5BMHcJ9BtYJCltozXetasHyK8la/5msRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281746; c=relaxed/simple;
	bh=nxtLAzFaDCOuCTEhnGiEugxqok5KAVAKJ7IaNV5PHwg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CjFsOFYNPlyT1oVEylmYgdnnt+oU23miZKWdFjyShgfowKcE3PEINaEjobT0AKbsPeRfaBqLN3XIWqN9k3vyKiVQsrZhlUewikAquC86NVFWU6QTgxM7r8crJhIdR07QMNJmhbRfDdTW0fp81mgpETo0QxIJHmtlOyc8h2h6PwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86cf306fc68so11340639f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281744; x=1750886544;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gyda97p0k8LMpqYwxXSUSu+cJ9FxoUrepV5dKozGTbs=;
        b=t8B7W5h1KziTJxcAJk+q9hCdz2QSFuXqCEgpCvlPuMtgPSHvpKL5MbvBWzgjhYg5Q+
         L+Oisv93bi1wHkpmr/yCUdQDG3wJIujdZAmnLdFv+PnJNWGuB0C8TomcbBuwdyaY/aEZ
         UdzZiU21IXviMabQNfINvGH/aV9PwgcyMU/l6UN4BZ4cZyAJXh72Vxl+WhwhraUUJJLH
         kxZc7F9tMKryhTwGcKyac6V/PdEuYi5nQY9ySrvUgzhgChN8VzkBEMXO6rxj3XSm1j7p
         azokXRcUZMolevnV71xiskmT3v4Kml20pgQct0eFptgnumRG7oa1Stl9m8T4AxCyzZjx
         bDAg==
X-Forwarded-Encrypted: i=1; AJvYcCU0A9D6PiK53h2xGn71koA4+/7i/gex1SPEjyLC5uJyI3mT8TPL7HNKkYm4zdTgvieajyE5c1aGFwRmMxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm4D06uEIcu3BAcfSECgqQe2AqIc+syTuE1iNxRTjG9TOJQSD9
	As4oONRnqWBGLC9aChMBGlVJYpox17b7zgm8eCaxv3wipWyj8wPB0RMpIDPX8thQ9lFcVSjZi0r
	1GkEiOaywl8tdxZsvwIb9CZDP9c3jKkWyzjw8NvpRCW3Eq0W7tgkGtcXDWz0=
X-Google-Smtp-Source: AGHT+IG972MFzHU6mHqcjmmOnulMds72kAVtT8v2nrX12zqUlz6DwYEfYZiyHxMCtv1ejD658G7RsJu0lyr+z4U7dKJLjA4xam3J
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2401:b0:3dd:f3e1:2899 with SMTP id
 e9e14a558f8ab-3de07c3718amr267678985ab.2.1750281743885; Wed, 18 Jun 2025
 14:22:23 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:22:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68532e0f.050a0220.216029.00aa.GAE@google.com>
Subject: [syzbot] [f2fs?] KMSAN: uninit-value in __try_merge_extent_node
From: syzbot <syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4774cfe3543a Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1219de0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61539536677af51c
dashboard link: https://syzkaller.appspot.com/bug?extid=b8c1d60e95df65e827d4
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c5c5e2dcd9e4/disk-4774cfe3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0ec9403177cd/vmlinux-4774cfe3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8c9c37a4fc0e/bzImage-4774cfe3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com

loop8: detected capacity change from 0 to 131072
F2FS-fs (loop8): Mounted with checkpoint version = 48b305e5
=====================================================
BUG: KMSAN: uninit-value in __is_extent_mergeable fs/f2fs/extent_cache.c:154 [inline]
BUG: KMSAN: uninit-value in __is_back_mergeable fs/f2fs/extent_cache.c:173 [inline]
BUG: KMSAN: uninit-value in __try_merge_extent_node+0x415/0x1600 fs/f2fs/extent_cache.c:546
 __is_extent_mergeable fs/f2fs/extent_cache.c:154 [inline]
 __is_back_mergeable fs/f2fs/extent_cache.c:173 [inline]
 __try_merge_extent_node+0x415/0x1600 fs/f2fs/extent_cache.c:546
 __update_extent_tree_range+0x1b53/0x2ae0 fs/f2fs/extent_cache.c:776
 __update_extent_cache+0x11cc/0x1420 fs/f2fs/extent_cache.c:950
 f2fs_update_read_extent_cache+0x20/0x30 fs/f2fs/extent_cache.c:1055
 f2fs_update_data_blkaddr+0x428/0x470 fs/f2fs/data.c:1142
 f2fs_outplace_write_data+0x1bf/0x250 fs/f2fs/segment.c:4011
 f2fs_do_write_data_page+0x2a11/0x3480 fs/f2fs/data.c:2752
 f2fs_write_single_data_page+0x15bf/0x29b0 fs/f2fs/data.c:2868
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
 f2fs_write_data_pages+0x2f66/0x5480 fs/f2fs/data.c:3309
 do_writepages+0x3f2/0x860 mm/page-writeback.c:2636
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 file_write_and_wait_range+0x6f0/0x7d0 mm/filemap.c:794
 f2fs_do_sync_file+0x79b/0x31c0 fs/f2fs/file.c:278
 f2fs_sync_file+0x107/0x180 fs/f2fs/file.c:395
 vfs_fsync_range+0x1a1/0x240 fs/sync.c:187
 generic_write_sync include/linux/fs.h:3027 [inline]
 f2fs_file_write_iter+0x3032/0x4650 fs/f2fs/file.c:5203
 do_iter_readv_writev+0x947/0xba0 fs/read_write.c:-1
 vfs_writev+0x52a/0x1500 fs/read_write.c:1057
 do_pwritev fs/read_write.c:1153 [inline]
 __do_sys_pwritev2 fs/read_write.c:1211 [inline]
 __se_sys_pwritev2+0x22f/0x480 fs/read_write.c:1202
 __x64_sys_pwritev2+0xe4/0x150 fs/read_write.c:1202
 x64_sys_call+0x22b9/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:329
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable ei created at:
 f2fs_init_read_extent_tree+0xe7/0xf10 fs/f2fs/extent_cache.c:417
 do_read_inode fs/f2fs/inode.c:541 [inline]
 f2fs_iget+0x7a0e/0x8950 fs/f2fs/inode.c:589

CPU: 1 UID: 0 PID: 24362 Comm: syz.8.5691 Not tainted 6.16.0-rc1-syzkaller-00203-g4774cfe3543a #0 PREEMPT(undef) 
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
