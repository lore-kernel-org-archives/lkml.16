Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33220127F;
	Thu,  1 May 2025 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109195; cv=none; b=pI4qoBhrEE63lTLhVhDhSGtLhw55IQHlKyIO4liNxgkRU6uz6tao7kt22sTGONWwlRhZi4oYFnrNRuaBEzdBhyTMUpzXSnqMulIiihLIxpssdjt1oFLfE1loy7jbI67+x3GJ1CX+vVzFWWc+4tO453JqdiBml/KCdzBYaaXraE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109195; c=relaxed/simple;
	bh=DZzv1vOq5mYAtL2pPeRgIa/stpLyReKbcRB0R8mKOh4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Mpva6Pyf1yzJSJRLDbyTt8ZPf1ov3G4flC2nTO4O+0sQ+WJfUJvbC9dA8Fm7l+HCzDPOzEFlZCafJOCxdAfRdw8gqjBpNiqhtF2i/VnYYCORm18sJfDyoQ3aWuTdw665yS4PQqIFpRtbZ2BqlxNgUu1O8wN+wMVw7lAWqIFMUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbKDBFr8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbKDBFr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64903C4CEEE;
	Thu,  1 May 2025 14:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746109195;
	bh=DZzv1vOq5mYAtL2pPeRgIa/stpLyReKbcRB0R8mKOh4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TbKDBFr8Mm3/s7P4VtfKBPOHUjSZZj0eCt7POq+4qZD8HRsX32pOM/i/9onrFn3Ho
	 62aJVkUz6kwAR5Q2ddyZq/Vl7FIAmc3PmA+ssgGWsHdZ6Uwdr/3lUnh54jOJ/7vwwL
	 qFvjjydbANLhBKcoR4Iv2gey/MXZdIhp1bgS95B5h5BuZOlwtF0JwwKzvNNP28mwed
	 kS2ed8eIaN3CiME6g4mlsKKqtmLvoD+lVToNxRX+9046A42vJmzZ6SrrNKstNOpPkw
	 07UOEqeUIwk5YcFBGA32tXdZyEpAA6rZeJRGJEynn9yPSz8plmluJexExylG69r38k
	 XVauSKL951rCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE40C3822D59;
	Thu,  1 May 2025 14:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net] net: lan743x: Fix memleak issue when GSO enabled
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174610923449.2992896.1884330785665850794.git-patchwork-notify@kernel.org>
Date: Thu, 01 May 2025 14:20:34 +0000
References: <20250429052527.10031-1-thangaraj.s@microchip.com>
In-Reply-To: <20250429052527.10031-1-thangaraj.s@microchip.com>
To: Thangaraj Samynathan <thangaraj.s@microchip.com>
Cc: netdev@vger.kernel.org, bryan.whitehead@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Apr 2025 10:55:27 +0530 you wrote:
> Always map the `skb` to the LS descriptor. Previously skb was
> mapped to EXT descriptor when the number of fragments is zero with
> GSO enabled. Mapping the skb to EXT descriptor prevents it from
> being freed, leading to a memory leak
> 
> Fixes: 23f0703c125b ("lan743x: Add main source files for new lan743x driver")
> Signed-off-by: Thangaraj Samynathan <thangaraj.s@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v2,net] net: lan743x: Fix memleak issue when GSO enabled
    https://git.kernel.org/netdev/net/c/2d52e2e38b85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


