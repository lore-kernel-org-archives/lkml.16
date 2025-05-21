Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF4C224D6;
	Wed, 21 May 2025 01:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747790994; cv=none; b=r9ikW1pWsVJbQbQ8kxnFn6ZXv8sw9Q/Auy19oi0NaXGpLDsbMEVIfZ9BliyLJezUXNPsGz/YQ730LXgzBy1OAcP2n7qxAZIuOvAxsc1ikYrGLhVzZtne4ROoU/PbL60p9yQrr1npsdEOcv0hV0XgCVNFIqUkG1jh+0nBLap9ffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747790994; c=relaxed/simple;
	bh=N/Wdq2T3AedNt5GfnH7oDPosaBvtz1EcEcfUqgIn300=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uCycwY8mOClI9jTlhZGgptaCK4ytlxqG6dS2DnbyNCT3ImPtv2hqn3xBUux/0i9QLhVYzlacEU0qbvUzjKa37cwctsMS5SrzqYL12VFU3k7JplON1b12CanUIpZz+XPKro6vPUzC+Yy2uu/FB6kdT0t7NgTJOpozPMkFJS21jZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjjZrSQq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjjZrSQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4EAC4CEE9;
	Wed, 21 May 2025 01:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747790993;
	bh=N/Wdq2T3AedNt5GfnH7oDPosaBvtz1EcEcfUqgIn300=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pjjZrSQq7KoBjicNQSvfLbTYwrUJLHwrCzbF2w0uUvGWQjXot7SeDAYlpmQGIEZse
	 njCidJBaQJsqhOKd25JY4e8nb1o8yBkYFdZ1Sw6hYMawQ5fmzswUM/UDSbZIRk03BE
	 2+r8vDDpFhg4DSrTSoLjgj9yvWf1WMWLiEHTA6se3n3nlbfXWD3mOqeFsRzwQn2VbG
	 sglG6vYhG/svfAEy1fOnuaZgpiHjK7migc5RPgAo5AzfBHCM2UiRy5ZA09afoXuzYD
	 69qsmvxBknGhuPUc1+huZ0vgKQj5hes3nuuKe9pRGWGAdc4VYlybz82sHP+9MP8lZA
	 PfSkus0AhWk/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D5F380AAD0;
	Wed, 21 May 2025 01:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: ti: am65-cpsw: Lower random mac address error
 print to info
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174779102925.1529202.3576115819306160518.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 01:30:29 +0000
References: <20250516122655.442808-1-nm@ti.com>
In-Reply-To: <20250516122655.442808-1-nm@ti.com>
To: Nishanth Menon <nm@ti.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, s-vadapalli@ti.com, rogerq@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 16 May 2025 07:26:55 -0500 you wrote:
> Using random mac address is not an error since the driver continues to
> function, it should be informative that the system has not assigned
> a MAC address. This is inline with other drivers such as ax88796c,
> dm9051 etc. Drop the error level to info level.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> 
> [...]

Here is the summary with links:
  - net: ethernet: ti: am65-cpsw: Lower random mac address error print to info
    https://git.kernel.org/netdev/net/c/50980d8da71a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


