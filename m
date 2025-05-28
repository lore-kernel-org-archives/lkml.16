Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFE24466B;
	Wed, 28 May 2025 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748414997; cv=none; b=Lwdre8ygIZYFn/HaqNJrX27NslKY7vg+BC3p51Q/RvX8qcxxAqbYrpwWYOBb6WTisAH8XCVKi21nLl19IB91/KONxBgH/DEMgZdRxVnFNV9s9+V9BVzfzn+Lq0aeiIwjQgWyv0z1p3dgOLfGygzRHcHk9JvP4mb3Conb3D+CSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748414997; c=relaxed/simple;
	bh=1qv8/nAFOzhLJx0Lh/zk3N6qs2nkzuVZgjnptV/DZYo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KegYS41LVU1QXAm7qat1SFFuAy0Lp4yt0Z+E3IDkEYwRhTeHrTvJ/7FFhcz6ksgsxL7WU7wbY5y1N+FTKjgHBUQ3bc7BgB8Qzw4OOpvWjxmfo8Yfr1hubU074ev43JzYIJyJ/uRWWhIA4E0oXgyivAZszfABIJ/UDK5GimkUExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0pfvun4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0pfvun4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2186FC4CEE7;
	Wed, 28 May 2025 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748414997;
	bh=1qv8/nAFOzhLJx0Lh/zk3N6qs2nkzuVZgjnptV/DZYo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q0pfvun40rOf8yornXWbnghxzT6pOsyIsoTld73aL/I/btmzSUQr5PZ1qwAkecbHI
	 bwWtFl41sWwUmIHW/mLgeJhHIObLEPU5wsElrWSQjOtxKZp7XKVnQ2c73g2AQ+qVGM
	 peo1622AEhYL7YQaQ3SSZZ24yRasmfGUNRJm3w09Zu3mVh3Qjtw3vkUPSYcMl3MQVR
	 ayIukEBCiSVl/Ug0hhH2SwHP8bEoQdoJiUSIFCr4zacxh1TLS7V5dgedFNtSYPzSTH
	 7joyeIACP4Vv3f5gi3RlRtNhNtKlz5PI2mAkVnl9Q+n78ZhtqlQDuZ/m40iztf/ck8
	 8S3EAhrNpET6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B8439F1DE4;
	Wed, 28 May 2025 06:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net Patch v2] octeontx2-pf: QOS: Perform cache sync on send queue
 teardown
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174841503099.1929742.13347759043693935062.git-patchwork-notify@kernel.org>
Date: Wed, 28 May 2025 06:50:30 +0000
References: <20250522094742.1498295-1-hkelam@marvell.com>
In-Reply-To: <20250522094742.1498295-1-hkelam@marvell.com>
To: Hariprasad Kelam <hkelam@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
 bbhushan2@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jacob.e.keller@intel.com, horms@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 22 May 2025 15:17:41 +0530 you wrote:
> QOS is designed to create a new send queue whenever  a class
> is created, ensuring proper shaping and scheduling. However,
> when multiple send queues are created and deleted in a loop,
> SMMU errors are observed.
> 
> This patch addresses the issue by performing an data cache sync
> during the teardown of QOS send queues.
> 
> [...]

Here is the summary with links:
  - [net,v2] octeontx2-pf: QOS: Perform cache sync on send queue teardown
    https://git.kernel.org/netdev/net/c/479c58016099

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


