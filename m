Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD81F460A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208612; cv=none; b=s7RxsZ/lU5BUKXy7TbaRW6ZdxJ/ENwitv5lKi7EIYp1EM/H2wbdpcyAV3LB9k5z3yv3jinA0RTHgac5W0ec0a8LgXo+37CJUERqDoChu3ZmbK8FLSClkXJMdqCoMFzsMUqSmNjmTQcA3Vl0NpnABqq396Wl0vRNW6b7I0CtQUL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208612; c=relaxed/simple;
	bh=bPe9LIG/drrnqprJKulv02oVjfrWQtDlPp/JMf9iM/I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Khq0/UQzDC5tl25cinl5ZPn3ilMl0NPmPn4os2kzleVYs9YBWcRE9GaEAF7BBnXKzUo1IBbfi6PvjBZWgQiTat/Rj36ejfUn8oWyK+KVzBbdklrzYxo8uRIhf2b8ljU5441uY5JorxPPI0YUmHC06fmfcnLrSvf1YMc/XusQ0+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ubhqunpi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ubhqunpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379CDC4CED1;
	Mon, 10 Feb 2025 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208612;
	bh=bPe9LIG/drrnqprJKulv02oVjfrWQtDlPp/JMf9iM/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UbhqunpiUj4T0dAHLKpFT4aonN16xuIIlkoRlE4BJ5Q2UK5D8l5w8fVZJRZ20TqfF
	 ODmg7nFDnfJbUmXrZCL/DCiC/qAhzNbww7kaziTjbE8/yFgeiDEEzTO8p7+ppMsVVR
	 9JtQgBLvhDMqHAKe9m3XWLDqDbpuqGbZfKPoCQpV5v06JlDbi3HK8W0S8e3i8FuHYw
	 NhuauKMgm4XixzmGv8/XSn+C6ja46olg1UBe59uB9EjboAJoZ2+lXOAkJ/2V0OSweg
	 q8TMHjiIDa+lNvZkeRwgK7gjYgtIkUA/4ZbQz23fOpeR6ofl7Fkd+icxkzXCNwjsVC
	 HtLDXOTHkaVCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE27380AA66;
	Mon, 10 Feb 2025 17:30:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to return SHRINK_EMPTY if no objects
 to free
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <173920864074.3835961.7030694610964519057.git-patchwork-notify@kernel.org>
Date: Mon, 10 Feb 2025 17:30:40 +0000
References: <1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, ke.wang@unisoc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Hao_hao.Wang@unisoc.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 10 Feb 2025 09:24:09 +0800 you wrote:
> Quoted from include/linux/shrinker.h
> "count_objects should return the number of freeable items in the cache. If
>  there are no objects to free, it should return SHRINK_EMPTY, while 0 is
>  returned in cases of the number of freeable items cannot be determined
>  or shrinker should skip this cache for this time (e.g., their number
>  is below shrinkable limit)."
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to return SHRINK_EMPTY if no objects to free
    https://git.kernel.org/jaegeuk/f2fs/c/bd409934c061

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


