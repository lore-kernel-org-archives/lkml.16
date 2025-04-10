Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808121F0E3C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258200; cv=none; b=pxqcsU0E5zcI9P0JBQZPGHtT00dzLIYlpf7Wo8yA9QqAQQ/IdwvnV9zMgATJ3tM3OJlsTPg2vYFRdswcbldDtKHP9OuebS7WCQX0j60XlbXu053TkjwMvX3gRcGowLNVNYGR2gar6PR2aIK6peV+yHCnhg9WcDY505yamu1DA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258200; c=relaxed/simple;
	bh=T+U+qmU+ht71n/z0NiUcLMkLIvyNxHhppQD+pF/QSVo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BLwM4QpfSZqn4J4SirlTfHT9o8IqDn13YQ1kTH1JlZn/9cgY9F5wbDXPrvbuDzatgIfyUmnRgZ60JGqxGLHSuzHS+Yp0/pJZSQcSd8jWHfX4KuJeggOYDJbrklQOEKwJHY+iG13uxTseJWdEk+nzTJnhbwZVeD2gCn7s0w0jjeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/BG67wm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/BG67wm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0375BC4AF0B;
	Thu, 10 Apr 2025 04:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744258200;
	bh=T+U+qmU+ht71n/z0NiUcLMkLIvyNxHhppQD+pF/QSVo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k/BG67wmdggqTbf4xJ4EiTiDWcTqjazHgrXRmqPzf/U1ct1DrCUiUYJwVgygxB9S9
	 xxSLG7SJKOzTWm6UkZEWQSkG7jnJY5VzhpJd5k+H00fRbGG7I+ySzjzm4wcYDDIC8C
	 KztsSZA9LmhTkzO0EOqDKL0D2Wa2qC5tA3KsqNGw61efdeOcG26RqC+wEa3DIWgHlM
	 23Kjum0TBm66gkfu7qSLcRkqqu9gBQsjuZIpEDSBZSVraGbIPIpt+b3hyg95NXmhck
	 CI1b5o9iou7Jbagwptc7eF/sLVZmLa3ITG+JIJP9eTNLN4F10kQOVLY9Ag94P2pBjU
	 AuzWnxoS0WzjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0A380CEF9;
	Thu, 10 Apr 2025 04:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add a fast path in
 finish_preallocate_blocks()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174425823723.3146257.13694783010566710853.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 04:10:37 +0000
References: <20250325081321.3296714-1-chao@kernel.org>
In-Reply-To: <20250325081321.3296714-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 25 Mar 2025 16:13:21 +0800 you wrote:
> This patch uses i_sem to protect access/update on f2fs_inode_info.flag
> in finish_preallocate_blocks(), it avoids grabbing inode_lock() in
> each open().
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - get rid of read lock during querying FI_OPENED_FILE once we held
> inode lock.
>  fs/f2fs/file.c | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: add a fast path in finish_preallocate_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/ecf68ffee7be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


