Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65507214A81
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880021; cv=none; b=j25ceHYVWWGbUklgPQSzun01xEri4uEuPenBL0mvFrss3WqdREaEGRNNPHKmFF7Z4prUU1wIIMoDiTWW2wZaiRdGJ6kvv9ccthcXyM9qPFDkrCfSisVbircirH8yn8eK6qvdRQbfY/fcQmo2hzRjtE9Ow32oje6KOMWRDeEnZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880021; c=relaxed/simple;
	bh=wHUyCaPqsLAIqZ+Di8Jk8P2mpZYVmeP+9/4ZjPsMVG0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Jq59rVfqmi/R021ctJODwZttG/GSVgF3X+UVxRRCNVwUPXKTl6Pog41rwCC5ZuayHnrho3OovOreauE0N37w2/zMdI3dhQIicxn6GjlKfxzM2HcagQJ7XZ3Qk7lcyPZnFII5Swh06/YC1eGhLjfGAtcDT7zt1wkf/zeOFusMmgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bprNgRS3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bprNgRS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85DFC4CEED;
	Mon, 28 Apr 2025 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880020;
	bh=wHUyCaPqsLAIqZ+Di8Jk8P2mpZYVmeP+9/4ZjPsMVG0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bprNgRS3Rh3chgh2Xg8e2YutiRFCBUFZ0nDIyzRlUcjXcQWnc+XlYnT5fH8ybjN/b
	 Kt/OjRCtpGXmjC6b2kF5DrfDNyC+vAJc/YHNNzdsyRwAu6NACNr25mvJKWis2pUmSQ
	 tjwxwq/7oZoDkhy7YvZLMaN4HBwKjbEdlxNDzXEylM+zd7OBgEdxuWdlwR70XPwv27
	 y88GUIgKpmpi6h8jnHBaqSt4MFRTa9peoIpxtXOuT7c+Eom481tzqDtacYXCzNdmRN
	 F4fDdW34JpaJGzPrYg1NQ5DIg/eeSBE/IX6dEgtrnDX8xWwA1DNnz7NX+/NjZdd4cd
	 VEWkFXXU5jJhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EABE83822D43;
	Mon, 28 Apr 2025 22:41:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to bail out in get_new_segment()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174588005948.1067750.7393632112050436477.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:59 +0000
References: <20250422115638.123455-1-chao@kernel.org>
In-Reply-To: <20250422115638.123455-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 22 Apr 2025 19:56:38 +0800 you wrote:
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 579 at fs/f2fs/segment.c:2832 new_curseg+0x5e8/0x6dc
> pc : new_curseg+0x5e8/0x6dc
> Call trace:
>  new_curseg+0x5e8/0x6dc
>  f2fs_allocate_data_block+0xa54/0xe28
>  do_write_page+0x6c/0x194
>  f2fs_do_write_node_page+0x38/0x78
>  __write_node_page+0x248/0x6d4
>  f2fs_sync_node_pages+0x524/0x72c
>  f2fs_write_checkpoint+0x4bc/0x9b0
>  __checkpoint_and_complete_reqs+0x80/0x244
>  issue_checkpoint_thread+0x8c/0xec
>  kthread+0x114/0x1bc
>  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to bail out in get_new_segment()
    https://git.kernel.org/jaegeuk/f2fs/c/9cada264501c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


