Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EA298275;
	Tue, 17 Jun 2025 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750201204; cv=none; b=Avr3kV4Rs7o51MRazZ37QkvyUA4tSKCLKMz0gCohhEvXTxWshoQBf5xMO5b211knZJKP3TPUmrJX0Qm3t79a442IqvxtCdX1+0HLbLTmYMhmN/TdkvHVnDW5L0KcTfFsH9Bm/lS8zJph5tpJ8bGhjXRUvUkdDlAy5BnusF6fkts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750201204; c=relaxed/simple;
	bh=HuFBBcDx/SSiJ1CaVdEQJoYVORBHZvXh4C+mUcAk3Ww=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nHFuol+226vXD/OHPy93TebCS+UYZ0OKbRkTy5Taglg0iGE30aLiDtZr6bg49SeCoO+pGIaJoKqQ6o1az/mfXeKGFNv/ObBmAZdVG+MUR+Sy3gLwqC5WsmLHFhVfP79v0ZQoV4aBnQx+bxF2rlkplYU8kHw/rii0vlVhUBGD3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYsLRobG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYsLRobG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3854EC4CEE3;
	Tue, 17 Jun 2025 23:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750201204;
	bh=HuFBBcDx/SSiJ1CaVdEQJoYVORBHZvXh4C+mUcAk3Ww=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dYsLRobGovWK8YlNN+8KEm4q+NEiFup2AJfdINStHkZP30RvUNH/EOCUAd2gCroCs
	 jHysuMYhD7KWuEZPchtsF5YhcxtssHA9PLJlblCw/Ij1Lqkr1k86Oz2SujS86EdEpi
	 Ok8ZSUCrbo/14vLR06waub6fNjKr/09NTGKUEa4ZJO5LaJZiV+QDZZh9su7H/fKx1P
	 bnItIeVDOu01E0sELihmEbBatR37wPS4sBISZLXIeUUMgQCfr6/bMaQ3PJuLnyrVVv
	 GC/1Ow2kVzmeORPZLNBWqF+J6bDSTyQrw3Facm077vkfPgPdodejEIn6YpnpTdhV4Y
	 Zmu9K8rHN8Z4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFDC38111DD;
	Tue, 17 Jun 2025 23:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1] net: netmem: fix skb_ensure_writable with
 unreadable
 skbs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175020123275.3727356.1557210847421675241.git-patchwork-notify@kernel.org>
Date: Tue, 17 Jun 2025 23:00:32 +0000
References: <20250615200733.520113-1-almasrymina@google.com>
In-Reply-To: <20250615200733.520113-1-almasrymina@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, sdf@fomichev.me, asml.silence@gmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Jun 2025 20:07:33 +0000 you wrote:
> skb_ensure_writable should succeed when it's trying to write to the
> header of the unreadable skbs, so it doesn't need an unconditional
> skb_frags_readable check. The preceding pskb_may_pull() call will
> succeed if write_len is within the head and fail if we're trying to
> write to the unreadable payload, so we don't need an additional check.
> 
> Removing this check restores DSCP functionality with unreadable skbs as
> it's called from dscp_tg.
> 
> [...]

Here is the summary with links:
  - [net,v1] net: netmem: fix skb_ensure_writable with unreadable skbs
    https://git.kernel.org/netdev/net/c/6f793a1d0537

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


