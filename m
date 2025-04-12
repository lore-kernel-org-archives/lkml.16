Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D81F03FE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744477827; cv=none; b=hXlGKXEyyD2q7Z9D4o6xdrg+xxbJVPl5Y3dQpA2uFlf3vbrgsE1+hdMSIJXyffuXP2jE6AhLLXHFgQDlD4mAuPeDeyt6Fbdv9fy1aaxjXWfJxtNKenOq3jtwWfxfE+lZunG0/63vtsnwRgelaFyqplRidwt7OuGepm4kX3u6B8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744477827; c=relaxed/simple;
	bh=qu1jYqemipsgVrkeM5Kv7xBfdBLk6/OQaJqZ6aUbcQg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LFgObGUjzCK5mOjwx5I1d9s3hbNp7Eft4oCTNvNQn4zA9UFHFd11FMW6okwZrMQufskb+3U6uWZesKRmJ9YKpzS5yfq5UuFOwqJdMoYgZYHIuMUYbTfeqq2lnbd/mENzSpYA52N0rkD9dPBjQZRbY7hwx0Uswe2q4lVB/TjY4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiIR8Qq2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiIR8Qq2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A40DC4CEE3;
	Sat, 12 Apr 2025 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744477827;
	bh=qu1jYqemipsgVrkeM5Kv7xBfdBLk6/OQaJqZ6aUbcQg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LiIR8Qq2Enl14WL2Qd0xLUiqDSgvDoqaw/OJR/S+w6rEnPggdDZU62dKHM9OjkeFI
	 +c+tiayjgrQ9BJgBSCICMsJOzk7RroN/w/3Ab9JHpf4UNhMv4FwmtVnhEXi+1SG9Eg
	 sAigrS3NvyhHTq8HyNL+drkS/aIPX68P7VTiUyQsSIZDzJCR4ww8+/aU/2Bltw07j3
	 WR7A/E7+3jJCSR1+Xr6HAjYhOeFcZs6/lt570A0AeIGZtT5Rjokt3vJdrS7Qpr3xRw
	 2ECGFfQ60A9zFkPhg+M1nGb/Bs3UTDt/JHXVmfH0CGMrDwPEiYsfhzDpXaBybi0R8n
	 VQWVv2e7r6OIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C20380CED9;
	Sat, 12 Apr 2025 17:11:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 sbi->total_valid_block_count
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174447786527.711489.2899173657997269764.git-patchwork-notify@kernel.org>
Date: Sat, 12 Apr 2025 17:11:05 +0000
References: <20250408122208.2297777-1-chao@kernel.org>
In-Reply-To: <20250408122208.2297777-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, syzbot+8b376a77b2f364097fbe@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  8 Apr 2025 20:22:08 +0800 you wrote:
> syzbot reported a f2fs bug as below:
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/f2fs.h:2521!
> RIP: 0010:dec_valid_block_count+0x3b2/0x3c0 fs/f2fs/f2fs.h:2521
> Call Trace:
>  f2fs_truncate_data_blocks_range+0xc8c/0x11a0 fs/f2fs/file.c:695
>  truncate_dnode+0x417/0x740 fs/f2fs/node.c:973
>  truncate_nodes+0x3ec/0xf50 fs/f2fs/node.c:1014
>  f2fs_truncate_inode_blocks+0x8e3/0x1370 fs/f2fs/node.c:1197
>  f2fs_do_truncate_blocks+0x840/0x12b0 fs/f2fs/file.c:810
>  f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:838
>  f2fs_truncate+0x417/0x720 fs/f2fs/file.c:888
>  f2fs_setattr+0xc4f/0x12f0 fs/f2fs/file.c:1112
>  notify_change+0xbca/0xe90 fs/attr.c:552
>  do_truncate+0x222/0x310 fs/open.c:65
>  handle_truncate fs/namei.c:3466 [inline]
>  do_open fs/namei.c:3849 [inline]
>  path_openat+0x2e4f/0x35d0 fs/namei.c:4004
>  do_filp_open+0x284/0x4e0 fs/namei.c:4031
>  do_sys_openat2+0x12b/0x1d0 fs/open.c:1429
>  do_sys_open fs/open.c:1444 [inline]
>  __do_sys_creat fs/open.c:1522 [inline]
>  __se_sys_creat fs/open.c:1516 [inline]
>  __x64_sys_creat+0x124/0x170 fs/open.c:1516
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to do sanity check on sbi->total_valid_block_count
    https://git.kernel.org/jaegeuk/f2fs/c/05872a167c2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


