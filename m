Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA9E41C71;
	Wed, 11 Jun 2025 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749603605; cv=none; b=JVGlctVQEThS2ZQr3LwbDTdjuE75pP+J6qf85HLSJhy9tHd0JApbMWQ6W+G09kBfmq0bZC8mhb3jkI5UGrd/eitEtrANHKs4SDkGbaQ/Hz7qTWOcGYc/MAcaUZU4EzI3gC43ZWK80579+Fsax+bebLpdv2JHVQgsYLGrLQjxdGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749603605; c=relaxed/simple;
	bh=AYvIuwN4aqdoFufe+9dNFjvd3j5/txgkw/RcCDIiME4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hQDKXwJf1DG7v1/ntBINhef98faRLeIMS+WShWywOu3IgrqNNSTh5wvXoMBXSFcnSE/g4QQsikjCLv6rGfKtQtG6Jva2TESubK14E8l1errQOk6Elsbk/Ds92TdYYdh5kDc4omx+TgRbGeOOoi3d8ZQ3IFCzH4ErpqklS00S/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivBUfpWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivBUfpWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D161C4CEED;
	Wed, 11 Jun 2025 01:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749603605;
	bh=AYvIuwN4aqdoFufe+9dNFjvd3j5/txgkw/RcCDIiME4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ivBUfpWyHFgieLR3lUUpy7yH2XiKPsZEfUn7fCYI4unU65eM0m5RgeY51aZnCnGTI
	 DMLm9DAXr5O0AXHFFign06F3ToG3CLXKWAhc5n9Qm4y1uL7a3BmEOGB8Q89auoM90W
	 Cy6RmBJOlQYa0HHJyIb8KMYhGu49AxSDiK0xk5eQci3zGmcmW2CG/iTdDnuM2+Ddvy
	 xh2pNBcIt9RbR6p9Iebqm9Gc0Enx9Eu0n88C+nV42bjeI1bIyh2RgLKU+WqZt0PkI8
	 iBi3mm5QEHNDZoNTEwj+9onEB1JeEelpenv03Eih7cGwvu/CMRRxAGgRYGu5ghzoII
	 a8ILWNv2gfNxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B9E38111E3;
	Wed, 11 Jun 2025 01:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: dlink: enable RMON MMIO access on
 supported
 devices
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174960363599.2754897.17312304165286699785.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jun 2025 01:00:35 +0000
References: <20250610000130.49065-2-yyyynoom@gmail.com>
In-Reply-To: <20250610000130.49065-2-yyyynoom@gmail.com>
To: Moon Yeounsu <yyyynoom@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Jun 2025 09:01:30 +0900 you wrote:
> Enable memory-mapped I/O access to RMON statistics registers for devices
> known to work correctly. Currently, only the D-Link DGE-550T (`0x4000`)
> with PCI revision A3 (`0x0c`) is allowed.
> 
> To avoid issues on other hardware, a runtime check was added to restrict
> MMIO usage. The `MEM_MAPPING` macro was removed in favor of runtime
> detection.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: dlink: enable RMON MMIO access on supported devices
    https://git.kernel.org/netdev/net-next/c/7fc18f947625

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


