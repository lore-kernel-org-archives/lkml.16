Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1C204F73
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744741985; cv=none; b=U2GkeDdUXWO2+mPj10F7H11ixSi0H1qXbpmDRgtOqMJ3a/HE0RFCMkv/YHissMPGfKw+wFXNZt5XYMlzyLzGsuZayrD5h+LWX+7TJrOBqV2+FSvE2ilRMB8Q8GUkrm6CDZ3p1fITjmYt82TtbZtvj84jhGK+pb86ZbMtj1SJhaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744741985; c=relaxed/simple;
	bh=sJKqOZodm7+a2lM+O2RSlzzN0adYDmaFn1/I0OxDU5U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=or27zOHXyDJXsAvapZszXF2cLuCEIRWnR0D3wkxZPCRFeCVumr5KNVfMG32D4sX7UJFQxnTWJpU1NirvQFTVsiJelGYURFNHIYDSfsFV5YwasnSHjUFSg4AxAqP7vqne8xLmRtqigJil1v5VWYxgy3t6E8EsaDDfsPcdtpgcJOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d6e10f4b85so103165765ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744741983; x=1745346783;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTdQ3NucjGthMoMdRub+X09VGUAGu9XvIeRBUmp51A4=;
        b=Q2lCxZkmS8TzdMAmzHPthNaCC5RYDnFLKs7kmToQqVMYTyZbzDX4THEsy9Db4rqw0Z
         TzIqTJQz5FJuLR46wKMFb6A22jDTrTMfA7QcL/X2qLHpAvyfvfJ1UqxOT7Wu6AiyljbH
         XnsKeHZL19i+bZKABygCKYIH7ZgpocyeaiwiycJuTX2AJuIrGEKW1+WnidtNkhKRerHM
         lYPe308345sZ52BIQ5F9IqtQwc/zp/aZyrI49uI0nDyKuk526vpWZ5grWqSnvkGsP0o+
         k0e4c+bEq+3b/zWGPq/kLn158d1jpyjl1wP3DARnKc0m72/olaV1UbSCHfPJxOqg4CQa
         yCww==
X-Forwarded-Encrypted: i=1; AJvYcCUAx1V7RHi21sZGhpk+Vod/aFdJIA2CGq713z/8RWC0upFtqb2/nj3Tib8e7mK8hqqhAKzjSCCX7k11/Sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzycL6Xgm64vyTWTO9mVfpgFsbnU/cU1ZlREKxyQ6VBK49WbgTn
	wluxvLVJI06THHcEQ48hJdrP5JQFwGYFv9NMkf4af3JK1sqMaiewVhmjHWCsX4+nG0HN62UaReq
	63mmwcO+rqq+eBXs4zjtksHwvtn6kW15Y+6ndqmBdLho9HQoNaZxs458=
X-Google-Smtp-Source: AGHT+IGou4oflWYFQdjx+RLGT5CznwjT0apx/Xl+nviT3OW9mKOjUrhlSv7EOz3JrhSYCwvabRCGjgdczVYeqSvSCItTh5eClV7N
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2283:b0:3d4:2ea4:6b8a with SMTP id
 e9e14a558f8ab-3d8125862b1mr4115275ab.22.1744741983155; Tue, 15 Apr 2025
 11:33:03 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:33:03 -0700
In-Reply-To: <20250415154254.15330-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fea65f.050a0220.186b78.0007.GAE@google.com>
Subject: Re: [syzbot] [udf?] possible deadlock in udf_free_blocks
From: syzbot <syzbot+d472c32c5dd4cd2fb5c5@syzkaller.appspotmail.com>
To: aha310510@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING: bad unlock balance in udf_free_blocks

=====================================
WARNING: bad unlock balance detected!
6.15.0-rc2-syzkaller-00042-g1a1d569a75f3-dirty #0 Not tainted
-------------------------------------
syz.0.17/6157 is trying to release lock (&sbi->s_alloc_mutex) at:
[<ffffffff834e835e>] udf_free_blocks+0x25e/0x23b0 fs/udf/balloc.c:678
but there are no more locks to release!

other info that might help us debug this:
3 locks held by syz.0.17/6157:
 #0: ffff88806ddbc420 (sb_writers#12){.+.+}-{0:0}, at: direct_splice_actor+0x49/0x220 fs/splice.c:1157
 #1: ffff88805f0795c0 (&sb->s_type->i_mutex_key#21){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #1: ffff88805f0795c0 (&sb->s_type->i_mutex_key#21){+.+.}-{4:4}, at: udf_file_write_iter+0x6d/0x6c0 fs/udf/file.c:95
 #2: ffff88805f0793f0 (&ei->i_data_sem#2){++++}-{4:4}, at: udf_map_block+0x3b9/0x53f0 fs/udf/inode.c:439

stack backtrace:
CPU: 1 UID: 0 PID: 6157 Comm: syz.0.17 Not tainted 6.15.0-rc2-syzkaller-00042-g1a1d569a75f3-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0x185/0x1a0 kernel/locking/lockdep.c:5296
 __lock_release kernel/locking/lockdep.c:5535 [inline]
 lock_release+0x1ed/0x3e0 kernel/locking/lockdep.c:5887
 __mutex_unlock_slowpath+0xee/0x800 kernel/locking/mutex.c:907
 udf_free_blocks+0x25e/0x23b0 fs/udf/balloc.c:678
 udf_merge_extents fs/udf/inode.c:1143 [inline]
 inode_getblk fs/udf/inode.c:914 [inline]
 udf_map_block+0x3061/0x53f0 fs/udf/inode.c:447
 __udf_get_block+0x128/0x410 fs/udf/inode.c:461
 __block_write_begin_int+0x693/0x1930 fs/buffer.c:2116
 block_write_begin+0x8f/0x120 fs/buffer.c:2227
 udf_write_begin+0xfc/0x250 fs/udf/inode.c:256
 generic_perform_write+0x32b/0xa10 mm/filemap.c:4102
 udf_file_write_iter+0x2e7/0x6c0 fs/udf/file.c:111
 iter_file_splice_write+0xbe1/0x1530 fs/splice.c:738
 do_splice_from fs/splice.c:935 [inline]
 direct_splice_actor+0x11d/0x220 fs/splice.c:1158
 splice_direct_to_actor+0x597/0xc90 fs/splice.c:1102
 do_splice_direct_actor fs/splice.c:1201 [inline]
 do_splice_direct+0x281/0x3d0 fs/splice.c:1227
 do_sendfile+0x582/0x8c0 fs/read_write.c:1368
 __do_sys_sendfile64 fs/read_write.c:1429 [inline]
 __se_sys_sendfile64+0x17e/0x1e0 fs/read_write.c:1415
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fedc3385d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fedc41b4038 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fedc3576080 RCX: 00007fedc3385d29
RDX: 0000000000000000 RSI: 0000000000000006 RDI: 0000000000000005
RBP: 00007fedc3401aa8 R08: 0000000000000000 R09: 0000000000000000
R10: 0001000000201005 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fedc3576080 R15: 00007ffc4f30ca78
 </TASK>


Tested on:

commit:         1a1d569a Merge tag 'edac_urgent_for_v6.15_rc3' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f90b98580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5dd916f7ca732ed
dashboard link: https://syzkaller.appspot.com/bug?extid=d472c32c5dd4cd2fb5c5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17c60b98580000

