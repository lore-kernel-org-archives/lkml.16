Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BCB35963
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282777; cv=none; b=SAN8kPyeq7wFIG4HWe4LvjGGoWpPD8706cL5v1lX/xYBGhqKMdp+HIojgVkQA6kP/xPCoSd6PszxBneAVs87JuXcVOzfiwnA0Fr2N5/RHLHv/FMm4gwtZJBUc4urp3E+bi4+RuUxN88S5qnRAfOqPsNGWqgKYHEUWdlqFyr4Zjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282777; c=relaxed/simple;
	bh=HCAM12Fe5DXcRBQegk/n8DQ9rGaqr48kn3TlT7cARz0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d7n5TFu+IOmXC5vh4b7PUM8YQ3jUtaUBfdKeIpzhxg+c7vGJT2Q/ytrlGWZe8L/RaXGfNiWlKhCi0tVH0RQtVuaHbqFqfn8Al5SJrQaOvup4LgCiUZ3c6J4+ZbCM9rY80jNq4Uae59yvgNdggGyVWMzUzf+eTxrBkcIjU49rhHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pB6en+2c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pB6en+2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5FBC4CEE7;
	Wed, 18 Jun 2025 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750282776;
	bh=HCAM12Fe5DXcRBQegk/n8DQ9rGaqr48kn3TlT7cARz0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pB6en+2cjScKzWpspCIDSmEsXTjk9ujyDZwq5Jjzrtmh2naZttLu+CitYTR5ROG4V
	 0Nj30en/CTs6Esojp9Aajfz/nK9BfJT4ZVfsf+Y7ZqhYZmpraKRkEFgeEZT17PY20U
	 SOc1MIbnQNCsYLyK2gpBSZqzNVGMB8x+95ZfaqmDqrqIrzGEC+U40A6ILrfpJEH1Z1
	 ElBIELDwSLbj7nyPl3kDb1WdgTXeUHh6ckzWDwmGYMj+FDjADvQKj29MRxPB2NhgMY
	 Y5bzmxda77v04K4IJXPu8KMgxzgpPbzidMtdiA4W7TVciSj6w88Ios47KvK9mqHBaB
	 SHUC0aqLf2TYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE503806649;
	Wed, 18 Jun 2025 21:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to zero post-eof page
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175028280475.266369.5996296776480428957.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jun 2025 21:40:04 +0000
References: <20250605032633.2744434-1-chao@kernel.org>
In-Reply-To: <20250605032633.2744434-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu,  5 Jun 2025 11:26:33 +0800 you wrote:
> fstest reports a f2fs bug:
> 
> generic/363 42s ... [failed, exit status 1]- output mismatch (see /share/git/fstests/results//generic/363.out.bad)
>     --- tests/generic/363.out   2025-01-12 21:57:40.271440542 +0800
>     +++ /share/git/fstests/results//generic/363.out.bad 2025-05-19 19:55:58.000000000 +0800
>     @@ -1,2 +1,78 @@
>      QA output created by 363
>      fsx -q -S 0 -e 1 -N 100000
>     +READ BAD DATA: offset = 0xd6fb, size = 0xf044, fname = /mnt/f2fs/junk
>     +OFFSET      GOOD    BAD     RANGE
>     +0x1540d     0x0000  0x2a25  0x0
>     +operation# (mod 256) for the bad data may be 37
>     +0x1540e     0x0000  0x2527  0x1
>     ...
>     (Run 'diff -u /share/git/fstests/tests/generic/363.out /share/git/fstests/results//generic/363.out.bad'  to see the entire diff)
> Ran: generic/363
> Failures: generic/363
> Failed 1 of 1 tests
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to zero post-eof page
    https://git.kernel.org/jaegeuk/f2fs/c/ba8dac350faf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


