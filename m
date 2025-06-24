Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8220C004
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725633; cv=none; b=rxyaxkp2VxL+Ki0PiAWGznqN2vQ+2Hw95mmUyUoXoXZ630uNSjcHuTgg2uwLnH9a0li3bWqo439YZ0c8WVZfUM8MTJKBzPSr8LefO+wCZWRH3M6BFrwlcp/QvVfhmZh9rBOlqO9X3RtY+3dj82+GsXSWoEfPIZkdSR66g2VSjtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725633; c=relaxed/simple;
	bh=JOohz5CpylJwMb4/VsRDLhJkRFPmCKGfkJaLP7xenXI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MKjvVp+pS6Bi24i5NlloVBEkVvIwbHewLSYCMahDXeQ5h3duJEqT4SJN3DMMQ63Pla/DVgT0dS4e/ITsz1IHWvAZLsBDNkVOWAkBfLi2dAk410PgYpswBIKPB+RmBHCJcyxwjaMUK06iNPoqV0AaZR+2oCX9JhM6MaL4rJWK8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJ+CORPX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJ+CORPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D002C4CEED;
	Tue, 24 Jun 2025 00:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750725633;
	bh=JOohz5CpylJwMb4/VsRDLhJkRFPmCKGfkJaLP7xenXI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lJ+CORPX1P+4hVWu2i3ap2zVfOuP2N9D7HiQZcMuWW7LV31tGTO7cvUODjuONN0dz
	 WVQ9VLjoXSJq+F+ioTXpNtH8j/7PHamUhqrqAjA1UpjhAbfy89tErAJGRAjTOg5jAb
	 0nls2/PF0UmYj9DT+UUSpUAH1a/mkQWeZfbdgkPkLfQcTVDYJXgiJ+SpmrV3AIafjz
	 wL8hmPBPqP0WQXjZDhlPEiM8ZQzNkOk6cel2VMOqwA2DPzCMcHRTTPF/PN7IHijvqw
	 q865XCIYev6eJPNxlw2CER7niJAnXfWwCSJolzkoA2gW5pWp/LFIb2aDmwQYDuZ5kT
	 oQro+bWCrqfWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB339FEB7D;
	Tue, 24 Jun 2025 00:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid invalid wait context issue
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175072566023.3346761.5670110283778494132.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:41:00 +0000
References: <20250611084218.62774-1-chao@kernel.org>
In-Reply-To: <20250611084218.62774-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 11 Jun 2025 16:42:18 +0800 you wrote:
> =============================
> [ BUG: Invalid wait context ]
> 6.13.0-rc1 #84 Tainted: G           O
> -----------------------------
> cat/56160 is trying to lock:
> ffff888105c86648 (&cprc->stat_lock){+.+.}-{3:3}, at: update_general_status+0x32a/0x8c0 [f2fs]
> other info that might help us debug this:
> context-{5:5}
> 2 locks held by cat/56160:
>  #0: ffff88810a002a98 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0x56/0x4c0
>  #1: ffffffffa0462638 (f2fs_stat_lock){....}-{2:2}, at: stat_show+0x29/0x1020 [f2fs]
> stack backtrace:
> CPU: 0 UID: 0 PID: 56160 Comm: cat Tainted: G           O       6.13.0-rc1 #84
> Tainted: [O]=OOT_MODULE
> Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x88/0xd0
>  dump_stack+0x14/0x20
>  __lock_acquire+0x8d4/0xbb0
>  lock_acquire+0xd6/0x300
>  _raw_spin_lock+0x38/0x50
>  update_general_status+0x32a/0x8c0 [f2fs]
>  stat_show+0x50/0x1020 [f2fs]
>  seq_read_iter+0x116/0x4c0
>  seq_read+0xfa/0x130
>  full_proxy_read+0x66/0x90
>  vfs_read+0xc4/0x350
>  ksys_read+0x74/0xf0
>  __x64_sys_read+0x1d/0x20
>  x64_sys_call+0x17d9/0x1b80
>  do_syscall_64+0x68/0x130
>  entry_SYSCALL_64_after_hwframe+0x67/0x6f
> RIP: 0033:0x7f2ca53147e2
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid invalid wait context issue
    https://git.kernel.org/jaegeuk/f2fs/c/90d5c9ba3ed9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


