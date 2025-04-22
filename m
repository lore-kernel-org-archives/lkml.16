Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D8202978;
	Tue, 22 Apr 2025 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330996; cv=none; b=bGQGNdVS4Oc33NAbJdnm+1K9pZrFPKfykTtmUanlyLt9FuzMIk91ktboplGUzuLhRrmOcoBJUEUPxoEz/nMAWxKtB/p2My8vJst/v5pVziSsWq0btr6whRRBUrZnTiA2u7rkcJdHGNdPPtxsW0xaugtISV1oUVKIHA2Cp1XjhX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330996; c=relaxed/simple;
	bh=mSUwu/opZKdtS524d8kRypNOEeM1L10Ayvr3oCTxx24=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NY6rf6oFNTnshFfQcXEsPbVTPHcvSx+5onF0dffMoUbQ1KfRGJFu6EYC+Jwwk1Bfws1quLbdA0rwnRd2WaWPkIs0HaLNvnQxEVaH2IdJ4SjQqMQ9JhWqEFOCggpZFicl63qN52k8/x9uGfF3uCgYc/suQAVXxHtr5Q7RmV8t+uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeRGexPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeRGexPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7CCC4CEEA;
	Tue, 22 Apr 2025 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745330995;
	bh=mSUwu/opZKdtS524d8kRypNOEeM1L10Ayvr3oCTxx24=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KeRGexPZeR50PhfqjDCYsZkK0QbOi0rGF/B4ilzsuVWoqfV3hpsp2kmp0GKCQrfaK
	 +CBBRIAgavNaPALMcW5yDCCGUZR3gxQXGOukcRM5gbwQhv/F3tjnGEcPBSK35flAy1
	 W7tQxE+cLqToCTP+5hNcn5wwn9fc01gzTxN9vJ1KP2xO/s97aWx13gxUsWG4BRnCl2
	 CsS9L3CYu6nGYO1U7ka0ve7GmIU3nt2Iofui5gItyNDBcpBEsFWJG9BVQ8qBm9ONy0
	 ioaeNJLaA1qmHLhhuZxhYXovTn4QVSFneTWdmlBVP+BYVExxDxZw55AhjsQWH1vEGj
	 BrSYcZMf9jqIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD12380CEF4;
	Tue, 22 Apr 2025 14:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: 802: Remove unused p8022 code
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174533103377.1921425.11325924081527949742.git-patchwork-notify@kernel.org>
Date: Tue, 22 Apr 2025 14:10:33 +0000
References: <20250418011519.145320-1-linux@treblig.org>
In-Reply-To: <20250418011519.145320-1-linux@treblig.org>
To: Dr. David Alan Gilbert <linux@treblig.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Apr 2025 02:15:19 +0100 you wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> p8022.c defines two external functions, register_8022_client()
> and unregister_8022_client(), the last use of which was removed in
> 2018 by
> commit 7a2e838d28cf ("staging: ipx: delete it from the tree")
> 
> [...]

Here is the summary with links:
  - [net-next] net: 802: Remove unused p8022 code
    https://git.kernel.org/netdev/net-next/c/45bd443bfd86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


