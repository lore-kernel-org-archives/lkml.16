Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F60284674
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397636; cv=none; b=Ig6n5PZIDMntecO7qpv4xP0qEM+B5ygSzpEyS5E4OzR5XBKTuAWBDior2gNLtXB1fnRkxuNWshmZ0s6pok9yRLTuoMiWGEP1PEmR1/f1WprUCrYjW+0YD+n21dM08pvVzYjkUf/N4DTcCZChSqwsMtJr0b3ZL1A0ehZYVWTtBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397636; c=relaxed/simple;
	bh=s+fpz3JvFEIY4fBoDI4pcfP3wn1rXJMjSEhByfSDrHc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YxKBi+VEs/r878uHZKhpQg0BG0UKUNXkxyKLbyw8/z4LmxNd+8izSm7rqLr1wuaNnW8zfm8inHDpdYQup4x19/nCTSADwHAULkOaCuLpdmTv0sGHhZsX3H/BLErmTCOUYlpviAqnCbccr+dU/waLc9T7Rk1cvLkI4oa+Nl9eK+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so318319639f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751397634; x=1752002434;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKM3zhh4aLiS5GxnZCJ+eCUZQpLt3IZ88OhQSIhquS0=;
        b=iXV3ZWrGQul0EGGkGIQvIcAvN8Ucl+9EHs/YKcPCQ9AzIb2SBul6w06DbghFQFtIo0
         kfNP1c1/ZEBzolJGsQTSTykuJu+QWZpuSZe8O3AY5rdNV0G6CeclynhK1HEsbC8o/QKQ
         pWHw+Udut8Tsq1ApFkD0pa8Fs/Si7py56Q+iX7Vx0n6fK5Y8+wSsXVwh0tCst3RLY4IS
         59fYwnXndxCtSeIZ1QxoFBBgH6FGIqN2yrZKga85LilwDf1fSBm64T4i0R/KXADZUXhH
         hJRdBQeMVYuDSp8qQMwh/Ho0uLxpP6SX0q77V+kaMstI7GgKgiYwxh/dpqabY+o/78p2
         kNEg==
X-Forwarded-Encrypted: i=1; AJvYcCVU9FjOimhcsRcn91GrCxDWoll6IfzgAMMnNccg3ieVTw84AQs8TlRvz+hSoqv4p1pvJHyA01DVrOkAP00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPOtOChxBAP0ax5pgTuvmDaltbTc52bEyMwfJDvmw0A1U6EL55
	Zf4SsjjuvCY+CHNdR/Gg6q3dEtSZW3GbxvMPHGq69LF+aXXa1wSHjAhJsUhVx9jxeK32cCge6LP
	Yh5ME/jW5JwmH48HhT0ZlM8+2kg2lVyPqN9R/Rx+s3UUiTjvCUqv5+AInt2I=
X-Google-Smtp-Source: AGHT+IGk7tOJ4PfLZCJO4CRU66nNx6bA2e2HT/eIDboOpXbCqiYQavb777Zx64eOMJTXDxpHZByiQLkWdyOp08PYxkPVlSqW4JEC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fe5:b0:3df:4c0a:a3 with SMTP id
 e9e14a558f8ab-3e054b14b5bmr1488225ab.20.1751397633721; Tue, 01 Jul 2025
 12:20:33 -0700 (PDT)
Date: Tue, 01 Jul 2025 12:20:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68643501.a70a0220.3b7e22.1f46.GAE@google.com>
Subject: [syzbot] [bcachefs?] KMSAN: uninit-value in bch2_check_subvols
From: syzbot <syzbot+377f67f96ce8b673a57b@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d0b3b7b22dfa Linux 6.16-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b3b88c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d5c61bcebaf295a
dashboard link: https://syzkaller.appspot.com/bug?extid=377f67f96ce8b673a57b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a76770580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10db988c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/20baa44346a0/disk-d0b3b7b2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8b99eb399d29/vmlinux-d0b3b7b2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ccabd4354061/bzImage-d0b3b7b2.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f1f67d5353ee/mount_2.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+377f67f96ce8b673a57b@syzkaller.appspotmail.com

bcachefs (loop2): bucket_gens_init... done
bcachefs (loop2): check_snapshot_trees... done
bcachefs (loop2): check_snapshots...
 done
bcachefs (loop2): check_subvols...
=====================================================
BUG: KMSAN: uninit-value in check_subvol fs/bcachefs/subvolume.c:76 [inline]
BUG: KMSAN: uninit-value in bch2_check_subvols+0x1297/0x48c0 fs/bcachefs/subvolume.c:187
 check_subvol fs/bcachefs/subvolume.c:76 [inline]
 bch2_check_subvols+0x1297/0x48c0 fs/bcachefs/subvolume.c:187
 bch2_run_recovery_pass fs/bcachefs/recovery_passes.c:484 [inline]
 __bch2_run_recovery_passes+0x49e/0x1330 fs/bcachefs/recovery_passes.c:539
 bch2_run_recovery_passes+0x284/0x310 fs/bcachefs/recovery_passes.c:610
 bch2_fs_recovery+0x53bf/0x66d0 fs/bcachefs/recovery.c:1039
 bch2_fs_start+0x1159/0x1920 fs/bcachefs/super.c:1212
 bch2_fs_get_tree+0x113a/0x2ae0 fs/bcachefs/fs.c:2490
 vfs_get_tree+0xb3/0x5c0 fs/super.c:1804
 do_new_mount+0x738/0x1610 fs/namespace.c:3902
 path_mount+0x6db/0x1e90 fs/namespace.c:4226
 do_mount fs/namespace.c:4239 [inline]
 __do_sys_mount fs/namespace.c:4450 [inline]
 __se_sys_mount+0x6eb/0x7d0 fs/namespace.c:4427
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4427
 x64_sys_call+0xfa7/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 ___kmalloc_large_node+0x2e2/0x460 mm/slub.c:4283
 __kmalloc_large_node_noprof+0x3f/0x1f0 mm/slub.c:4300
 __do_kmalloc_node mm/slub.c:4316 [inline]
 __kvmalloc_node_noprof+0x9f/0x1530 mm/slub.c:5015
 btree_node_data_alloc+0xe2/0x5f0 fs/bcachefs/btree_cache.c:150
 __bch2_btree_node_mem_alloc+0x1eb/0x880 fs/bcachefs/btree_cache.c:195
 bch2_fs_btree_cache_init+0x4fc/0xd20 fs/bcachefs/btree_cache.c:656
 bch2_fs_alloc fs/bcachefs/super.c:998 [inline]
 bch2_fs_open+0x46ac/0x54e0 fs/bcachefs/super.c:2432
 bch2_fs_get_tree+0x955/0x2ae0 fs/bcachefs/fs.c:2474
 vfs_get_tree+0xb3/0x5c0 fs/super.c:1804
 do_new_mount+0x738/0x1610 fs/namespace.c:3902
 path_mount+0x6db/0x1e90 fs/namespace.c:4226
 do_mount fs/namespace.c:4239 [inline]
 __do_sys_mount fs/namespace.c:4450 [inline]
 __se_sys_mount+0x6eb/0x7d0 fs/namespace.c:4427
 __x64_sys_mount+0xe4/0x150 fs/namespace.c:4427
 x64_sys_call+0xfa7/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:166
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 6242 Comm: syz.2.21 Not tainted 6.16.0-rc4-syzkaller #0 PREEMPT(undef) 
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
