Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE54263C89;
	Tue, 18 Feb 2025 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883002; cv=none; b=KZWMCB98x5YgR6U6SOREqHdTmvYyP+cGvOr8Vxk7W+LWGffFKfhMxDy9fyxkYNKq7k45ZCJiuFkUE+hlhroCzUQgBsnU19iscCQJRD1f54qawvaqEe/+J4rzpD3rpwMc4oM/ZVN8jQuitFvn+NS1PwenMxqT1s/ofACEO+k36mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883002; c=relaxed/simple;
	bh=RPMvbmPyXBC6HshForiJ9DHWjlLIkfM/nS4w3wwPblI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Vf1YdVnIIWZXg2zJUmv95x8XqTG2t1a0SZFheDI0sx+niPSVHRNsF7PRO4RG7VyLHhKOHT1BT4BU5AgHw0lipnlTu4/VjOyCOzBsZSlb4gSEmImJlhIxOM8bzEWxT2jIs1mIkcWwMe0cQXUy8b12IAkHr/U6IrUHC6y/Wm3S+dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIwko36p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIwko36p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033CBC4CEE8;
	Tue, 18 Feb 2025 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739883002;
	bh=RPMvbmPyXBC6HshForiJ9DHWjlLIkfM/nS4w3wwPblI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FIwko36poR7YOQo4z+MPtNpZ8jQp2ffjSBbzHoeNs+8pmLe5jpIIPKJ027VKLFxIh
	 gYVTJFeZej9m7EQYsS2DXtIRDTwA7YD43d59HGGpwibaxI3quVoBZC5xSxGv5vi5id
	 2I8gsiN684XoitcTnOksRQV3vVZ66eaJ18xiXvdq/fc3NhVFwldKUFzWhZPtmJTisd
	 YhuaXYxUn3tPjihv1VDQT34WIiiUyaNN597EAdLBdmLY0NH4obCBvdAhZSxPTzwPBY
	 Jc/BLwlIG3Tb9IPa8MnhyB0MxVo/HiMlIKH9hTW+BIA8F33MQCN44qH+98JoqW3p1e
	 WScdbZpuy3h5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710A3380AA7E;
	Tue, 18 Feb 2025 12:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: phy: marvell-88q2xxx: cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173988303226.4073703.8557496610593822205.git-patchwork-notify@kernel.org>
Date: Tue, 18 Feb 2025 12:50:32 +0000
References: <20250214-marvell-88q2xxx-cleanup-v1-0-71d67c20f308@gmail.com>
In-Reply-To: <20250214-marvell-88q2xxx-cleanup-v1-0-71d67c20f308@gmail.com>
To: Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 niklas.soderlund+renesas@ragnatech.se, gregor.herburger@ew.tq-group.com,
 eichest@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 14 Feb 2025 17:32:02 +0100 you wrote:
> - align defines
> - order includes alphabetically
> - enable temperature sensor in mv88q2xxx_config_init
> 
> Signed-off-by: Dimitri Fedrau <dima.fedrau@gmail.com>
> ---
> Dimitri Fedrau (3):
>       net: phy: marvell-88q2xxx: align defines
>       net: phy: marvell-88q2xxx: order includes alphabetically
>       net: phy: marvell-88q2xxx: enable temperature sensor in mv88q2xxx_config_init
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: phy: marvell-88q2xxx: align defines
    https://git.kernel.org/netdev/net-next/c/8dcaed624f6a
  - [net-next,2/3] net: phy: marvell-88q2xxx: order includes alphabetically
    https://git.kernel.org/netdev/net-next/c/cbe0449e8f9f
  - [net-next,3/3] net: phy: marvell-88q2xxx: enable temperature sensor in mv88q2xxx_config_init
    https://git.kernel.org/netdev/net-next/c/6c806720bafe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


