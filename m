Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C2F10E0;
	Thu, 17 Apr 2025 01:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744851601; cv=none; b=jb0qO1YRYSgodsFwMUY/1h6dn6L9QeMzqHF8TL26q9xEDFXnkAh5Z/pqZTSpS44iTL/xiTPtTzMnh5oXjJZz7EyktQFkTMnbPy+bnrulwyO++lSChcxQg0iP4PfJojpcoxtgDJERwrCBvMkeEFZz/JokeE8WoT2UqNhBsBtq5lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744851601; c=relaxed/simple;
	bh=tS2qplZqCop1EiM5QT2KawgIGrsWfZc1km6oEibW2kQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W2jLSOK/P6IJmgQaH/lkjw4WsGP30KqaS7pUKvC0AumqhKzscEQuPP4NXg09cxqJpHtyI7468CPCbsun/lC1yjqsCVN3/PyNNkmaEccqQcYlm5o5zFjFG/KdjV10yVEXfXGxBx+9iWM628OpTbhHXaMXuD7hc/cyAzH4pTub+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lthgoTjE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lthgoTjE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E992C4CEE2;
	Thu, 17 Apr 2025 01:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744851600;
	bh=tS2qplZqCop1EiM5QT2KawgIGrsWfZc1km6oEibW2kQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lthgoTjEBwB8881dE3eFrTexpNhdvY1aV3c5unp7jJYftTUJVrYC6IP13KTcl1ous
	 6t4r+zjm3d3IQebvtgjq0VyUEc/HBGBNZAru3UhVztJ7ievXqkI9uMhNECMm/mmJlL
	 i0CWisuJ2Vo3iSCytqcCVX45cQuR6q2PNW6pVakskh0XiJEU51oUkkTIFo/HSTJ+G8
	 p2khMTqlNfNla4wbu/v7hrUWfmz2nFdMXvbVlmaoVASZEbF6YWtmytCN4VonUQzIRa
	 /i0sZjR/tAsJ+aKplh0xL3Ebni6NKbUEKPyudBI2PH3vZ5LjVelv1veB5yLAKeXiZ8
	 8dzEBG1gr96xA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEFA3822D59;
	Thu, 17 Apr 2025 01:00:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: ethernet: ti: am65-cpsw: Fix MAC address
 fetching
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174485163824.3551658.12927278784001757348.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:00:38 +0000
References: <20250414084336.4017237-1-mwalle@kernel.org>
In-Reply-To: <20250414084336.4017237-1-mwalle@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: saravanak@google.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Apr 2025 10:43:34 +0200 you wrote:
> MAC addresses can be fetched from a NVMEM device. of_get_mac_address()
> will return EPROBE_DEFER if that device is not available yet. That
> isn't handled correctly by the driver and it will always fall back
> to either a random MAC address or it's own "fetch by fuse" method.
> 
> Also, if the ethernet (sub)node has a link to the nvmem device,
> it will fail to create a device link as the fwnode parameter isn't
> populated. That's fixed in the first patch.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: ethernet: ti: am65-cpsw: set fwnode for ports
    https://git.kernel.org/netdev/net-next/c/1a377f142e6e
  - [net-next,v2,2/2] net: ethernet: ti: am65-cpsw: handle -EPROBE_DEFER
    https://git.kernel.org/netdev/net-next/c/09737cb80b86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


