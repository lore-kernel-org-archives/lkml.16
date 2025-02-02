Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98451EEB1;
	Sun,  2 Feb 2025 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738458011; cv=none; b=lemNq7XxGi4v+EXOhXjZKdwVdpsPI8al1yIR+mPC17fYIKwn94rlz+wgfDSqRYPepsdIiIXI/+HXMAz5QEFlu+yzc7cuAb65ymPo9DJH4t9a/LhbhD+tVjYBW5JQn4Nkw6qqTqGoigftcL1QMu1J/1g0fFGBX/0SNgDRh/JKgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738458011; c=relaxed/simple;
	bh=3wkYN2oan9I4+MUMfqZSWhjIhiO57sDGHNLvdltSUZw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K/PAVuFTzdbk01T9eLa7sN63RA/1/M9Cza16hmy6wl3/JntxbFql0VHxi5FGJha6INb+x4LToog7yiSrlPwXgnSsjLmtR7u16TcZb4sJ28wWGHOfwrmuySUmIMLBytA73hI72lONpSCvMrYmqoIO7wEsLMoxD1A+RPA56HgxTU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQRaCNe+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQRaCNe+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD7FC4CED3;
	Sun,  2 Feb 2025 01:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738458009;
	bh=3wkYN2oan9I4+MUMfqZSWhjIhiO57sDGHNLvdltSUZw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kQRaCNe+oEedN/dpOzji9+TK05B7HuFpn658gtjAATFK5vnusFv/ryp1wFzElo/cm
	 UV1tqy+tCmUgYsTD2qEZbwxPAQxA0FCmVlHuIWppVrSb2R+fRTS/au4Ws2d1sCI2QJ
	 8UJkcKQayhhw7ikxuMJ3/NBguNvL36FUZZPVf1CnQwmjzqUv/kzeGU8kPrdY+GgHoJ
	 Kzsz++GQlMJn27hYrc34kb7H/RuASZBHUjCgqjJ9g4q2sykXeUVY0GNZvryPOEK4rL
	 bZ1GN6FAE3Xdq6HvKTTRJBu90e/agLyz4KIhmeykbBtm3R/xjKpsi/co6NNLZDNy44
	 k9Cx/VukrZneA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB6B9380AA68;
	Sun,  2 Feb 2025 01:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: bcmgenet: Correct overlaying of PHY and MAC
 Wake-on-LAN
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173845803574.2027595.4585624838343864384.git-patchwork-notify@kernel.org>
Date: Sun, 02 Feb 2025 01:00:35 +0000
References: <20250129231342.35013-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250129231342.35013-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 Jan 2025 15:13:42 -0800 you wrote:
> Some Wake-on-LAN modes such as WAKE_FILTER may only be supported by the MAC,
> while others might be only supported by the PHY. Make sure that the .get_wol()
> returns the union of both rather than only that of the PHY if the PHY supports
> Wake-on-LAN.
> 
> When disabling Wake-on-LAN, make sure that this is done at both the PHY
> and MAC level, rather than doing an early return from the PHY driver.
> 
> [...]

Here is the summary with links:
  - [net] net: bcmgenet: Correct overlaying of PHY and MAC Wake-on-LAN
    https://git.kernel.org/netdev/net/c/46ded7092323

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


