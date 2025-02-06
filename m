Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F40239563
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867214; cv=none; b=hIuXKG40uQWxysxbGSkjnN3gZ1Maut3+NhPqcMfN9YgItt0MS2iLIYQ0ufYAuTGk50LIta3qOZ7hkFcXM9yUztWmMs3kRMbg5IBakA7zoy/kEq3NXFc5qwOy7mwV5ZSQkGO3ls0mTNg+pPb5vbYC4wngy8lkVFSwKHrlTjbpboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867214; c=relaxed/simple;
	bh=5dNM/i1ayUO1sOFr062gfytBTm1MvjWJ12CSMKal6t4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LSHa4g0xjTvBQAnjhZ+KVRXV+P/+cJG/nx6lw6r9Xj1Gp2QyDaWWomiIOAvqa+OMjPx9yjy8ygMomEWYPdWJZo67Su986tYHLMuTdJGivbyUDxTl5paMTLegZiajCqX+jWTYyXYAFmEYKAmLGTO9Z9/WBGTQIkTEckcHzzykyak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXqKADfo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXqKADfo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871EEC4CEDF;
	Thu,  6 Feb 2025 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738867213;
	bh=5dNM/i1ayUO1sOFr062gfytBTm1MvjWJ12CSMKal6t4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eXqKADfoVs/244ewIszbcRJtNkvXHSqDoN1tiaFuoWJLPOl1y4UPp7CLHjwZs1bZA
	 f5e0losDUiqycFzcnx/sk+ZEdAGhE34HQAdlkA/xLj4JlEhVnB9Uw3lPs5GfSmYjO4
	 oruvCLfr2nKKw1LAHhLZ8yHq17Y/VU5XPlopCZMtJZ8sGWFXVv+ELZcvknw4e5cfaq
	 v0H5FfKD0W6BmbtlLy7jxMFx7FmykjIH0WljJNWLIq0qmm1mJoABxhrlHfQnII3sOT
	 ji411CW31FfRnFxUxrXH3fZPg01bxVEoVkochNPfV7st30KI1eZWpw4B1lqWlMLh2K
	 jO4sbWuphAWhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72771380AADE;
	Thu,  6 Feb 2025 18:40:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix to avoid warning in
 dquot_writeback_dquots()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <173886724100.1614734.4865548198435341327.git-patchwork-notify@kernel.org>
Date: Thu, 06 Feb 2025 18:40:41 +0000
References: <20250206064451.3088028-1-chao@kernel.org>
In-Reply-To: <20250206064451.3088028-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  6 Feb 2025 14:44:51 +0800 you wrote:
> F2FS-fs (dm-59): checkpoint=enable has some unwritten data.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 8013 at fs/quota/dquot.c:691 dquot_writeback_dquots+0x2fc/0x308
> pc : dquot_writeback_dquots+0x2fc/0x308
> lr : f2fs_quota_sync+0xcc/0x1c4
> Call trace:
> dquot_writeback_dquots+0x2fc/0x308
> f2fs_quota_sync+0xcc/0x1c4
> f2fs_write_checkpoint+0x3d4/0x9b0
> f2fs_issue_checkpoint+0x1bc/0x2c0
> f2fs_sync_fs+0x54/0x150
> f2fs_do_sync_file+0x2f8/0x814
> __f2fs_ioctl+0x1960/0x3244
> f2fs_ioctl+0x54/0xe0
> __arm64_sys_ioctl+0xa8/0xe4
> invoke_syscall+0x58/0x114
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
    https://git.kernel.org/jaegeuk/f2fs/c/2c8ee306ad3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


