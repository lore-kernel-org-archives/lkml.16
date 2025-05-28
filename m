Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D9228D8D3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449197; cv=none; b=FrKfFaB8EwnpBbK5MXq5geVRt30QaUrub42wrS+5YF9AoYA9T8qYOr3THsj6tf8w8jACw2gtsKZqzZ9zA/1S8AbDsl8+XIHY/3biLu3UzhTXegTZ0fozMqdWmuUcA/F04//DRFBX9+53F1FDI/bwPz4ONGGgmABIyoO4/G3WmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449197; c=relaxed/simple;
	bh=was6HKWg8q3bCy8wjBqt1mSU3XXZMmZRo8cHl90Nx4s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HYM0j0jesetCynFiWc92a0wzVJCUjKtjzXjx29cZKocj5gxvEHweYQGc2ItkxS45fxZh6h/4euJ2CwShThTns2szdKitsxp7orIx9d+0WLLF/b+oewzIgjA8QRnn6qLzucAL9MxfMWHzvH3hkFVLRlyUdY+sfD3N/Uz0Ak8Fvy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raZEqM78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raZEqM78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB3BC4AF0B;
	Wed, 28 May 2025 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748449196;
	bh=was6HKWg8q3bCy8wjBqt1mSU3XXZMmZRo8cHl90Nx4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=raZEqM78y6G5f+VeQ+ip3ezKW5gxf9742s7boQMiPJygBDc58q9/g9ySexHD9l8U0
	 o5Kfu/WJMW3sclf8+J31S+AsBe6m9o5kxAss49PiD1E8LZXU31JX0jVxJVHKD72iVU
	 DgaaiPbH8Asg/Pe7X6cuiRU7d6eJMg2LxnG9iPD4GrYYTNYhmCJUN1BCTjU99iKvil
	 YueBvvhXBfH52zN03PPES/B69HaHwNWcAR0fHnV8WB68pP/IPnoOCmYdE2T7knZ+BS
	 NUS/zkelFKqnMMlxY/ng99Pt3LSlHR6hbuLd4i8oAv90KDv5MmgdvHqV9cRMNfKBQ5
	 AbyUuAN5J4fgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB0A3822D1A;
	Wed, 28 May 2025 16:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174844923023.2455931.17793935058942024770.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 16:20:30 +0000
References: <20250523032545.1392641-1-chao@kernel.org>
In-Reply-To: <20250523032545.1392641-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com,
 hanqi@vivo.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 23 May 2025 11:25:45 +0800 you wrote:
> Syzbot reports a f2fs bug as below:
> 
> INFO: task syz-executor328:5856 blocked for more than 144 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:24392 pid:5856  tgid:5832  ppid:5826   task_flags:0x400040 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  io_schedule+0x81/0xe0 kernel/sched/core.c:7742
>  f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
>  f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
>  f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
>  f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
>  vfs_fallocate+0x6a0/0x830 fs/open.c:338
>  ioctl_preallocate fs/ioctl.c:290 [inline]
>  file_ioctl fs/ioctl.c:-1 [inline]
>  do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to skip f2fs_balance_fs() if checkpoint is disabled
    https://git.kernel.org/jaegeuk/f2fs/c/c836d3b8d94e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


