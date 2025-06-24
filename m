Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9601535948
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725626; cv=none; b=toJxXapA/2RdMUKS2NnP8lpxM2fhoFU6YBqDWMx3dXlCxYS0yxfRFx+unil/XTBFqHOmJl5aiEjlUl+2cm6cd1s++GsDHldotYr7t7iZ4TYmZj/a7MAVEa5HGlLL4l4JwfsL6JPlslJ9MDXQX+xovwwmflrVw97irqMYg4nXQa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725626; c=relaxed/simple;
	bh=e3rVs/o0fMu7m5NY/hFfYGBx06zdfmD7O3z/hZ4Omog=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kLRHRdEzSE3M/nwgz4NI5zrDA3GG2Nnvb4Ak2BKsLm+RkuFLjeLGr1d8e3RuGTsEcGrq/pMUQjxk28WsxyWRypDz8+6AaSHCZaRv8A6e+x17F0DSkTzWPd2bMg/emyvukGWxLf0+jU8Z48ow2ZwRPWvZ/sGHcuFWqWkf0W8daUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOw47j8l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOw47j8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA3AC4CEED;
	Tue, 24 Jun 2025 00:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750725626;
	bh=e3rVs/o0fMu7m5NY/hFfYGBx06zdfmD7O3z/hZ4Omog=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jOw47j8lkcUMJED6Asq+ovL4LDrLyngn3SYYSXIvRmYdeEnPUdnxQwV8hhzUo5j7D
	 AbFyhqdMVn3qsmBqunASStoZi0pRRNN+skzS3wIJSynALZc+Fwj/0j1VUK+a7iS1Cj
	 xKpto5GUHhJ2k6Xirs/nFF7TgpBL2l4Cl8VBGw8TdYqsoaWVqK/wI4qdL2AOsybke6
	 Yqa3rB8+zSBmRFubhAkP0jsvC6lPoiebEHnAP95Y7ZQCZtduquXSx8xGH0vdJD7X38
	 3hIXgmTGav10EpQhU2MoCnmZRC9bneCn0mVwMOuVQOpQj0TeKzPY5IibxG2yAePj6w
	 FtqFivvcnb8dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDD439FEB7D;
	Tue, 24 Jun 2025 00:40:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: turn off one_time when forcibly set
 to
 foreground GC
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175072565349.3346761.16728721043040341618.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:53 +0000
References: <20250606184904.224811-1-daeho43@gmail.com>
In-Reply-To: <20250606184904.224811-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri,  6 Jun 2025 11:49:04 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> one_time mode is only for background GC. So, we need to set it back to
> false when foreground GC is enforced.
> 
> Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: turn off one_time when forcibly set to foreground GC
    https://git.kernel.org/jaegeuk/f2fs/c/8142daf8a538

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


