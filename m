Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13C1CAA67;
	Thu, 17 Apr 2025 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744854021; cv=none; b=Ys9XtPtxJc2+2Fe4ODk410WZ5enQ0HmB8pHbLJqyMDcrj7bWiAd5MiQQ0uqlY7vKXgkEPkEhdoGjtSf5z21/L9PnyPd7V5q1vjHRuHStYyzWGp7VN73bcGAJXcwN8YJi7a8NVdqHx6F95bQcKSJqsVLZMvYx/0G26ZTvPsBFgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744854021; c=relaxed/simple;
	bh=ET/4I+nNRcyKeeXS5wbO1KsqaFhtwKBA1fxuw2rYgrA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YPaVh9eump5DNIpaGpo3npfDKIZx8PDWTkAnfy7gH/+svyBVaiXRt6gW3rUJoJYhUDkUeGGTMtIP0xh6hWVxEIb8EUXcEXsitM/ZDSlmW8h8WAS5tm7z3hCzOhA0PFVLDXAjIqjqb5A7udWCqSHob9DBcfUtw/6iQvBGQ/u8Gu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj0GBV6P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj0GBV6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2F6C4CEE2;
	Thu, 17 Apr 2025 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744854020;
	bh=ET/4I+nNRcyKeeXS5wbO1KsqaFhtwKBA1fxuw2rYgrA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Mj0GBV6PCqcsXOwQcMHMyGdH76LRzaN2qg5riNQaNW7zhJHiVQJ7wMlYLtzMuZlHS
	 dTmjkMRUZ4Yia463BvC1gUAD6vdhLH8nG6lfvfYP5nfkdbphmNtUrpz0hosD5RNPlk
	 l11S+qiR4dOz/zgaKLvKEa3UJf/V7BpYvj2D51Pmc1WCy0KgQoMQvXhy0LBz8qXe9Z
	 GtlJ6S2rDLW110r7gbjMFaDACDNg/gwXrynXlKKVtGVtXT9d8bPKgG+H+csy3JpU7H
	 S06Nep9enp6PlznQJfsdrG6JJBWxt91S43GLFyznRX+mpRqhAGs7InAalH4FTLqalL
	 K9JSebfprPWZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD2C3822D5A;
	Thu, 17 Apr 2025 01:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH] net: phy: mediatek: init val in
 .phy_led_polarity_set for AN7581
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174485405850.3559972.15890998079426748195.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:40:58 +0000
References: <20250415105313.3409-1-ansuelsmth@gmail.com>
In-Reply-To: <20250415105313.3409-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 horms@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Apr 2025 12:53:05 +0200 you wrote:
> Fix smatch warning for uninitialised val in .phy_led_polarity_set for
> AN7581 driver.
> 
> Correctly init to 0 to set polarity high by default.
> 
> Reported-by: Simon Horman <horms@kernel.org>
> Fixes: 6a325aed130b ("net: phy: mediatek: add Airoha PHY ID to SoC driver")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: mediatek: init val in .phy_led_polarity_set for AN7581
    https://git.kernel.org/netdev/net-next/c/00868d034818

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


