Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9B23D287
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517950; cv=none; b=INGM1aJfmxH6lrsTROmyTR18dpCpEgMwC+k+Uv9PfR3zBaD66ABYvyZjgUb8m87zWv+78TKmcGT7juzcUvU9sOxJ8q51t+wfTvrOzMzyK9CTQXPRhkAnA+VvhdBSt1oOqfNX87jkSB6UQXThZawup0b9YNh5tsCMm4Yb8SXv948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517950; c=relaxed/simple;
	bh=BtDyt2UFrNOoKlgcbIIR/8uenCycdB5p2V4g7UTDhX0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Oih6foWUGvECR2Kc6u5ENWo6Qgo+DfSehxRxPdJMnNJjaLdXxSxaJ4ByBr7xe5cjw7TVyUqJ29sVGZPDei7dpnwrK6KX2qxxUhGLlm2XXyk6V6Xz3IfMygZ2Gm2CaIV+2YfvaHFbaQbYCbDIrqUmK4Tu+mxpktTJ0HYvpMUkG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d817b17661so43885145ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746517947; x=1747122747;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKF1ErYQeMS2LAsXAlkKZC3QCEipg8mrCIYyD8W+Hdo=;
        b=YdEF83ylMDUljyRaouvWIVvQN+s/oVLXGNWCsL2tXR9ZEytx8fY0A565Ssot+Bv28l
         bSD/eH3lRHbCdIs21BdjK/7Ou6w3xfr9uw3jItKPg7V4l0d9rMybOwDt8u9Jx3R6Ccw6
         m+B03bsMQYZcEJsUIDLdkw+Qsql5JoeEGBGPokSYqUkBdgdtZwmlvx0Mr2jImjJOIbSb
         LbrJaB/F+2PG+cJsXm3Eki5wIjmEwP+7SjTPgoOfJ+3IrVQYsv9GBSXa4mzxHFPgMLIJ
         bcwDHMMOzxo5JvP+R0n8B0rOFBHawBRtrcbF8NPdPGrQFWYbdgK6rV/IWBDTUut4OIWv
         vM1g==
X-Forwarded-Encrypted: i=1; AJvYcCUh9odta7i3Szdxwy2v2l3Y8SPAGxDMbge6U9D+PeEldixSkfWA5n3Z3oNBUCdTaYe9lzKdoonFvMGlzwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMhHCgG7JguWmwbC6TGc6ZBUM/bh0qZqsmcBTNUYG5YWbegII
	hJUIePN0SlRkqaFANk+VmceNs74Z4fe5WLsNWcKAN4k2SrB0pNpsRKcB3y1o/281wMYgEOZVeYk
	nec2pkFRxRCA86NeYQgMjAC1LXAg4pk1R4UXcfw8vLZes/8o8vH1QgEg=
X-Google-Smtp-Source: AGHT+IEKLVR91TBPe4eYyoaPBkJZ4yi44af+i3Zdgo7jxVyxf1byGZoLu48pAoCPaxgkIaOevyJ5U2Ialqi6GP9177s4KEMNtzqM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2588:b0:3d1:97dc:2f93 with SMTP id
 e9e14a558f8ab-3da5b349058mr103163835ab.20.1746517947459; Tue, 06 May 2025
 00:52:27 -0700 (PDT)
Date: Tue, 06 May 2025 00:52:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6819bfbb.050a0220.a19a9.0007.GAE@google.com>
Subject: [syzbot] [mm?] KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_extended
From: syzbot <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17abbb68580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6154604431d9aaf9
dashboard link: https://syzkaller.appspot.com/bug?extid=189d4742d07e937d68ea
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8d61c7d3421d/disk-01f95500.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d86d0377eab0/vmlinux-01f95500.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a6f455ac4fd5/bzImage-01f95500.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_extended

read to 0xffff88811d47e000 of 2048 bytes by task 37 on cpu 0:
 memcpy_from_iter lib/iov_iter.c:73 [inline]
 iterate_bvec include/linux/iov_iter.h:123 [inline]
 iterate_and_advance2 include/linux/iov_iter.h:304 [inline]
 iterate_and_advance include/linux/iov_iter.h:328 [inline]
 __copy_from_iter lib/iov_iter.c:249 [inline]
 copy_page_from_iter_atomic+0x77f/0xff0 lib/iov_iter.c:483
 copy_folio_from_iter_atomic include/linux/uio.h:210 [inline]
 generic_perform_write+0x2c2/0x490 mm/filemap.c:4121
 shmem_file_write_iter+0xc5/0xf0 mm/shmem.c:3464
 lo_rw_aio+0x5f7/0x7c0 drivers/block/loop.c:-1
 do_req_filebacked drivers/block/loop.c:-1 [inline]
 loop_handle_cmd drivers/block/loop.c:1866 [inline]
 loop_process_work+0x52d/0xa60 drivers/block/loop.c:1901
 loop_workfn+0x31/0x40 drivers/block/loop.c:1925
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0x4cb/0x9d0 kernel/workqueue.c:3319
 worker_thread+0x582/0x770 kernel/workqueue.c:3400
 kthread+0x486/0x510 kernel/kthread.c:464
 ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

write to 0xffff88811d47e018 of 4072 bytes by task 4432 on cpu 1:
 zero_user_segments include/linux/highmem.h:278 [inline]
 folio_zero_segment include/linux/highmem.h:635 [inline]
 pagecache_isize_extended+0x26f/0x340 mm/truncate.c:850
 ext4_alloc_file_blocks+0x4ad/0x720 fs/ext4/extents.c:4545
 ext4_do_fallocate fs/ext4/extents.c:4694 [inline]
 ext4_fallocate+0x2b8/0x660 fs/ext4/extents.c:4750
 vfs_fallocate+0x410/0x450 fs/open.c:338
 ksys_fallocate fs/open.c:362 [inline]
 __do_sys_fallocate fs/open.c:367 [inline]
 __se_sys_fallocate fs/open.c:365 [inline]
 __x64_sys_fallocate+0x7a/0xd0 fs/open.c:365
 x64_sys_call+0x2b88/0x2fb0 arch/x86/include/generated/asm/syscalls_64.h:286
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 4432 Comm: syz.8.11649 Not tainted 6.15.0-rc5-syzkaller-00022-g01f95500a162 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
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
