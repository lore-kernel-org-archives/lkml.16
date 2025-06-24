Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251FF18A6CF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725628; cv=none; b=Z9wOdSOl9VKYnlA2GG8aSEbnQ/nLK9GBlDCVsw/nIeDOYE5MCdp+juNIX93+F55eYQL9wWPSCPU2TApIdNEw2hu7d2HhLrGnh+6/0bQ66V4MpUr3NI97lkwu0Vfub8czOvV+3pojAN7bQnni4rT2+ip6A6XeIXDS4tUA8Bw+DHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725628; c=relaxed/simple;
	bh=Vw0rDlCFR3NyeAfHaqBbTRF/+72oWG6AmjXEOttkzGM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GRdEh/0mwgFEebq606HNoqxQjEuHUmlb0DRIEPs0+pQLYLW17o7rR9siqvIOioHCJEEBIjPmlS3blGnoDcE97685deEeTcvYjkWNJxGyA4jtSGBQqmO7Z9hKkemP+uicrneCHSZHhSlX0eTNYre3k5eTtWWR1RkXnrTv/DmlYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/0uIP0y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/0uIP0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5B9C4CEEF;
	Tue, 24 Jun 2025 00:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750725627;
	bh=Vw0rDlCFR3NyeAfHaqBbTRF/+72oWG6AmjXEOttkzGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E/0uIP0yOarNjmFAQLyY1UR2Uvo1y+PI1Lwbs1XXTqlNL90/SJTMllm8WfnwvSvPh
	 yoqt7HrPYmKUZ7isWKLlwl/KyMeMvIRXz21ddo9ioH8KqBjroPn52wWc4E709VKMQM
	 OGeRWSkRtaw7oRUzEP1RcRBEcWwec93Q+jeNmcVv5yfJTI71dGSb1PzsvmKEYz5FKS
	 zPx88dFJDHPOxUjZRPBoMxbZy9TxNC+iYtXM8Ploc5pQlN0zrwBbCHEYR2ElTfJWGE
	 Uy7SuQIAgZ1NujwMxsY2ja62UClq/v9azzzUZ8Kzz/nToIeQE8MSUvvLbjQ+MJaV5w
	 eagTtJRqLU75g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEB539FEB7D;
	Tue, 24 Jun 2025 00:40:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle nat.blkaddr corruption in
 f2fs_get_node_info()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175072565474.3346761.5612358001909141915.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:54 +0000
References: <20250609072712.792834-1-chao@kernel.org>
In-Reply-To: <20250609072712.792834-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  9 Jun 2025 15:27:12 +0800 you wrote:
> F2FS-fs (dm-55): access invalid blkaddr:972878540
> Call trace:
>  dump_backtrace+0xec/0x128
>  show_stack+0x18/0x28
>  dump_stack_lvl+0x40/0x88
>  dump_stack+0x18/0x24
>  __f2fs_is_valid_blkaddr+0x360/0x3b4
>  f2fs_is_valid_blkaddr+0x10/0x20
>  f2fs_get_node_info+0x21c/0x60c
>  __write_node_page+0x15c/0x734
>  f2fs_sync_node_pages+0x4f8/0x700
>  f2fs_write_checkpoint+0x4a8/0x99c
>  __checkpoint_and_complete_reqs+0x7c/0x20c
>  issue_checkpoint_thread+0x4c/0xd8
>  kthread+0x11c/0x1b0
>  ret_from_fork+0x10/0x20
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: handle nat.blkaddr corruption in f2fs_get_node_info()
    https://git.kernel.org/jaegeuk/f2fs/c/1773f63d108b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


