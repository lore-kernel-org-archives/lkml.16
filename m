Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18B19007D;
	Wed, 19 Feb 2025 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739931615; cv=none; b=RwKYJWIrRwTjWu8J4SmjJPqFTGSRecsvfkJSFQZ/AEHnb68rftk1ut6ATRowMV+WYrSzTtUJeglT0vPKPW1jjJfvPcE0/ddWIDDBv5Qd3nO6/hsbK57LFWCr+3UZfYfNNKvHDT/wWP2BbpMZSb/nZ86U4DbqmY3Ic4/za7bpQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739931615; c=relaxed/simple;
	bh=DswjrUyYsDs3+IZvhRKtKvmN18DdCWY7JhrEcaJjCb8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Uy7SVteal7RzFCrHAHZKF6Dvrn1MbUIJ6krzWoWMcWvhMyotmTQTJkNA0kuI7F1dLnt09khCHQ646eqno5TCp61ZcnRVHKY7mSqDWeGJXHqnENFynx1U3DUa2AngvUFmvzVQ4TURuMKbVohE+uK4x5Qw1l93bpQ7gCTXTiAtlvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmOD3FEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmOD3FEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15DCC4CEE9;
	Wed, 19 Feb 2025 02:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739931614;
	bh=DswjrUyYsDs3+IZvhRKtKvmN18DdCWY7JhrEcaJjCb8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AmOD3FEZyF4CnPgWxvicEIk6Zt20e8cNsH7oM6uYr263aqvyFqC96juyH7aDHslcI
	 Z8peFyH+1Jyv3diFZlC8aMWBg2zYGpM5BGC7rLwgr5GELGVIv+ipZBbEWnMymRd8nP
	 k4We1fErCUA1E+FyIbtazhGvr2MVjYoLeuTrBugh1TkiNlIq/bAz8XYtX3N14UwCwb
	 7cmBhO/gTO4vDrl8QzQXre+EU5vUgVeHX46EsuJdeLb+7R18vxDzCnmwEq85jbohDp
	 TQr/5u7gDssMkmNfp4gXLUfxFD1cB/Ismiv35es1Ns57LhfvlgUxKMEjzJkJJhan9w
	 QSIWNN9tpu5gQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CDE380AAE9;
	Wed, 19 Feb 2025 02:20:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4] net: ethernet: mediatek: add EEE support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173993164504.106119.18028680299291793484.git-patchwork-notify@kernel.org>
Date: Wed, 19 Feb 2025 02:20:45 +0000
References: <20250217094022.1065436-1-dqfext@gmail.com>
In-Reply-To: <20250217094022.1065436-1-dqfext@gmail.com>
To: Qingfang Deng <dqfext@gmail.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 17 Feb 2025 17:40:21 +0800 you wrote:
> Add EEE support to MediaTek SoC Ethernet. The register fields are
> similar to the ones in MT7531, except that the LPI threshold is in
> milliseconds.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v4: fix build warning
> 
> [...]

Here is the summary with links:
  - [net-next,v4] net: ethernet: mediatek: add EEE support
    https://git.kernel.org/netdev/net-next/c/952d7325362f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


