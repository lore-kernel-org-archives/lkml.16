Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22A2798EB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449195; cv=none; b=okikObF8jK0y5sQ1hKjeq6y3UFlM4hduawcpQE6ZbZjJatH97SYN6Z3aE0PtTpefPYCbwP/3sT6BKhuuYGiZ2ovC8NI2LIvJlA4rO72TSKuilwJjkpzvzOmzd8yfnHX3foqqsk8Re1OwyOCRrynCztNQzmyZglJCZq5BAmIYsOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449195; c=relaxed/simple;
	bh=GZp11ENuxv/DI5WxX8XBwc+eyfzg6i5/j+qBKoGlfA4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X1MYHueq63Y7Ki4fWjFOPEaFotOVN7WWWVRFvIZ+Riu1iAVDyPp1MApbmdadZVrtGPGJBubKTXkEUxGhovOOIVmPM8J1z4V28fVp6jCWwj2ZHBPyq0izV/wpnQMrleH/7e/Ydzmx4LO+2u+6vF/d5g/QsnqB0eMnC3IpDS3esls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BmVUbI0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmVUbI0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA02BC4CEE3;
	Wed, 28 May 2025 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748449194;
	bh=GZp11ENuxv/DI5WxX8XBwc+eyfzg6i5/j+qBKoGlfA4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BmVUbI0e98gn3BVLuJcu+H1BilpfvEaUGqHKrF8vpEQ5/ir5YWdZRi4q+91aLQby2
	 W8Nu7Byq5j8Dw58y31WYun9IoTXohJwoYwREDHnnn++QFlGMr22FZcet2R2KLute9L
	 Vn3QKq0X17CkciGvkcI4brYu59YVZlp5EjhmuNSIuP18eLt+Dy/9Tuz2NQCdMvu8We
	 8iEzJTt+rzGuZiqm+LDK65/fPqFMkpniN/EZSL3DilB5larSMMibj8LsCKwrS4IQAz
	 TNFs0WbJR8qxTq2JTqb5vuLwlnTv1y3kgUSxNsY0Dq1XqeO2OLXH6iOJ6zpFhE/Utt
	 Ulcp9bRMM9aRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE233822D1A;
	Wed, 28 May 2025 16:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use d_inode(dentry) cleanup
 dentry->d_inode
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174844922874.2455931.3646209198266412275.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 16:20:28 +0000
References: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1747212349-18425-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, ke.wang@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Hao_hao.Wang@unisoc.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 14 May 2025 16:45:48 +0800 you wrote:
> no logic changes.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/namei.c | 8 ++++----
>  fs/f2fs/super.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: use d_inode(dentry) cleanup dentry->d_inode
    https://git.kernel.org/jaegeuk/f2fs/c/a6c397a31f58
  - [f2fs-dev,2/2] f2fs: fix to correct check conditions in f2fs_cross_rename
    https://git.kernel.org/jaegeuk/f2fs/c/9883494c45a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


