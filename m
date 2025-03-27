Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582721B199;
	Thu, 27 Mar 2025 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743101400; cv=none; b=TwP8HjRI9JwsUZF41jKT5jfBwwfFZEim34tK+xaFgDV174jEw3eBx8aQchBuDJTu0K9l5BhUDI+WHmIWPQ1tOzV4RcLJgT+/QahLrN9mpTAxJ7inu/8z+oOTYipDs7Je/An1lEcVMT1YDDF+ur9Btf5PCysG7Bjdi4yzk41yUts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743101400; c=relaxed/simple;
	bh=IG6oOqJqDXcFmfih0AvHQhvGZYx8gmu1iB3y7OXTB2k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FKQTaeIIuD2Rq8THsyruGdmx02h+3h5y+rNVPDnhpPrNofRXp1oMhYnE634QhnYYU5pgY4lANIHt+4FD9TIMiwRydkAFUyARWcOaRuy61twjzbznZN49EdF7Z4zGmwLG25ckm7ig77vSmnOIBiv2G+F/kRMQeOu6oKc17/Cqx7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUhcLZy+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUhcLZy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A82C4CEDD;
	Thu, 27 Mar 2025 18:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743101399;
	bh=IG6oOqJqDXcFmfih0AvHQhvGZYx8gmu1iB3y7OXTB2k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fUhcLZy+CdHRtHU+WqNJSuiA9DGAGWVjZ31PjNSdHMMH/gDykq91LUB/uie1ob9Ry
	 y7C6weHVpg4B3+R6Uxq1FOAGM54Vh2o8ZeiflaO8SJaeHcf/aWCyhv4SUhZgtFXB9u
	 friAZ3nHig+KO1/tQZV4iwozVydI04wzI6dLVkYEz+0Bquke+iL6e5XTSK8JE/sFhj
	 2jT4GOQNUv6v+1QzTBsA/AIjS/oHd1hIQmIhzO8QVjKSOeUwaKnROoE1gSWqGCBft9
	 DxshAGJmcdWIJpBqQBMvyeNlf1mPBDni8aGK2o19YGMMMvo+5bAJZEzsrhhrI+m1N1
	 16Hfbls0Nzwhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2CC380AAFD;
	Thu, 27 Mar 2025 18:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: move replay logic to tc_modify_qdisc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174310143550.2165614.306557250849673833.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 18:50:35 +0000
References: <20250325175427.3818808-1-sdf@fomichev.me>
In-Reply-To: <20250325175427.3818808-1-sdf@fomichev.me>
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us,
 horms@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 25 Mar 2025 10:54:27 -0700 you wrote:
> Eric reports that by the time we call netdev_lock_ops after
> rtnl_unlock/rtnl_lock, the dev might point to an invalid device.
> As suggested by Jakub in [0], move rtnl lock/unlock and request_module
> outside of qdisc_create. This removes extra complexity with relocking
> the netdev.
> 
> 0: https://lore.kernel.org/netdev/20250325032803.1542c15e@kernel.org/
> 
> [...]

Here is the summary with links:
  - [net-next] net: move replay logic to tc_modify_qdisc
    https://git.kernel.org/netdev/net/c/2eb6c6a34cb1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


