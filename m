Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4F02C9A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254187; cv=none; b=hDTdbOZeIAmmGvwctJgsrpHtsBReVcvgsDkRkEhRrALW+IQsJfS/Slv8enGCFM0JZH+D99OydGJNAgvFVTLnCWp88iHiFg37IEVBAplm8xpfpM+sr4rkyG7LKdeSMtMUsdv3hRI7HxDayoEpUj29eyn2WiuZ+Efg/6Wdk3vv1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254187; c=relaxed/simple;
	bh=ecMp9NzXgAfPDtti/3umyr6JhdSqbCGAQwtPeBNYQPs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pB+yzxoEYM2Zu0tLA3lK+NCdHWecFfBa4FbRBoZn1750XLk7HCsFt00AMvEQoNZOaLj7F8Ioeikb/dB3dkPYQddIS+8ZyR3tw3mtjTb5PcoFYxsllES5nnIqdZ0mhMW39rb0XGrDf6VFWBa1tGojAGGg8rrN5Wjex68EBOXG/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TR1XciYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR1XciYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60CBC4CEDD;
	Tue, 11 Feb 2025 06:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739254186;
	bh=ecMp9NzXgAfPDtti/3umyr6JhdSqbCGAQwtPeBNYQPs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TR1XciYLPT9/8V4qrVzVjhJNrG+j4DcRZAlZMoLhYr6+R02N3koDFMPCTQERhLMND
	 74GkgskAg7BD/JVRh4rkvby1ZlhFc5ZKUe9OS+YFA+MJnSPetyFu+hJpSwC3DrAWUH
	 kq+7wRASzpLOf40DnLsTcaHAq1XCl2fSQhM/sPGaN+AmZjCT+kQ0u+SuRo73tUpKC8
	 SgquD2rF3GVyksah8ROV789UXgV/Urtx1ZLHy04/XnFjLDSjD/nVlnTZKnjNzSk3cK
	 x6xMQOGs79KxKF3kkpYcrUupycqGpW71Jd1+ixDXsX1j0B7FHTyIufsFqKSMLVEoYe
	 FErCFxoBDM6/Q==
Message-ID: <c6764fc9-9ced-4a55-a91d-ae29e3db2433@kernel.org>
Date: Tue, 11 Feb 2025 14:09:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [syzbot] [f2fs?] kernel BUG in new_curseg (2)
To: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67aa72bf.050a0220.110943.0035.GAE@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <67aa72bf.050a0220.110943.0035.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot

On 2/11/25 05:42, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    a64dcfb451e2 Linux 6.14-rc2
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17297b18580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7f246b548ed0635a
> dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103943f8580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da1bdf980000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-a64dcfb4.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6a816640d31b/vmlinux-a64dcfb4.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b5cb42ffa4f6/bzImage-a64dcfb4.xz
> mounted in repro #1: https://storage.googleapis.com/syzbot-assets/caba9b9b8f24/mount_0.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=14da1bdf980000)
> mounted in repro #2: https://storage.googleapis.com/syzbot-assets/270c3c4c1558/mount_6.gz
>   fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=121672a4580000)
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Found nat_bits in checkpoint
> F2FS-fs (loop0): Start checkpoint disabled!
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e6
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:2809!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
> CPU: 0 UID: 0 PID: 5304 Comm: syz-executor274 Not tainted 6.14.0-rc2-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
> RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
> Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
> RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
> RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
> RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
> RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
> R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
> R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
> FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3273
>  f2fs_allocate_new_section fs/f2fs/segment.c:3287 [inline]
>  f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3301
>  f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1849
>  f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1959
>  vfs_fallocate+0x623/0x7a0 fs/open.c:338
>  do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7ffbafdefd99
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffecbc98b98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000400000000080 RCX: 00007ffbafdefd99
> RDX: 00004000000000c0 RSI: 0000000040305828 RDI: 0000000000000005
> RBP: 0030656c69662f2e R08: 000055556f0154c0 R09: 000055556f0154c0
> R10: 0000000000000000 R11: 0000000000000246 R12: 00004000000000c0
> R13: 00004000000000e0 R14: 00004000000000c2 R15: 00007ffbafe3903b
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
> RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
> Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
> RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
> RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
> RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
> RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
> R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
> R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
> FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.

