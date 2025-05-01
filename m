Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E01D95B3;
	Thu,  1 May 2025 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109800; cv=none; b=DTCIybeJrMAYPZH8GEheVEgheMx7r6kCvJWaZK3kScb1BSkpWOzq0DOYOzb5bK5Bc0d52xjLi1r2DLAGb845mW2sdqkHGP2aLg2Uq/pM0GBsAVBMTzsge5pdcBN7WMas+SA/c2ooFadcmtYPtnpUfo0JBesYNYnHKxVzCaYNYBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109800; c=relaxed/simple;
	bh=iWZntxMdLUW17/ltDYdvyArEEN8eRI/Cwkn4D0OJZfQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DkS7b1+RtrWu0IDjQhpqv0KHHU8hTKsL7PQwbDdBgZvQjHRlRS8o7epBsNJkPaQbYj6lr8jToV5jBX2Kg/52YPX+HD6uqlT2UaeW87lR45qtEljKvn4WFdoR3gZeE+fjSxVvFOIL1s/G7QuxJ/arOy2q68KsnIZBHyloVR0VE8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=am6DO0h4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="am6DO0h4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE9DC4CEE3;
	Thu,  1 May 2025 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746109799;
	bh=iWZntxMdLUW17/ltDYdvyArEEN8eRI/Cwkn4D0OJZfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=am6DO0h4Q4LNRx4pJohZVj9tKYjIi0mZLkCfKDSPflcIFyHqRHklvWipIMkkjggbC
	 rjzb8gY+EjliEiSO1UGdDf0kvr3Gaw4bolMiRSZH0BwWMCfOyw0JYHzLxqlOreoSop
	 AX6SPAQX50jL/L9bCkDL3OOFJ7d26C0MiBJyQHQ6EW7fUFbCSyxMO7gcTErlz9RYky
	 6vl3+uCh4PsRaQ1cEWGOM212PSHZpcqN1oKe8gYdUMVZIBOxQCiP0lH6ZnCXYfLCKM
	 yYQelOlG1SmxFNP1D1HYIpZ+Pu5a9ercBHR4fo85u3ZE68IPaYSUZiNhFK0dRyBHn1
	 QZZGANII1oOBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE9F3822D59;
	Thu,  1 May 2025 14:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/4] There are some bugfix for the HNS3 ethernet driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174610983875.2996110.11381498032317925334.git-patchwork-notify@kernel.org>
Date: Thu, 01 May 2025 14:30:38 +0000
References: <20250430093052.2400464-1-shaojijie@huawei.com>
In-Reply-To: <20250430093052.2400464-1-shaojijie@huawei.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shenjian15@huawei.com, wangpeiyang1@huawei.com, liuyonglong@huawei.com,
 chenhao418@huawei.com, jonathan.cameron@huawei.com,
 shameerali.kolothum.thodi@huawei.com, salil.mehta@huawei.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Apr 2025 17:30:48 +0800 you wrote:
> There is a pathset that contains three patches, but two of them
> need to be removed:
>  https://lore.kernel.org/all/20250402121001.663431-1-shaojijie@huawei.com/
> The last patch and other patches form this patchset:
>  net: hns3: store rx VLAN tag offload state for VF
> 
> Hao Lan (1):
>   net: hns3: fixed debugfs tm_qset size
> 
> [...]

Here is the summary with links:
  - [net,1/4] net: hns3: store rx VLAN tag offload state for VF
    https://git.kernel.org/netdev/net/c/ef2383d078ed
  - [net,2/4] net: hns3: fix an interrupt residual problem
    https://git.kernel.org/netdev/net/c/8e6b9c6ea5a5
  - [net,3/4] net: hns3: fixed debugfs tm_qset size
    https://git.kernel.org/netdev/net/c/e317aebeefcb
  - [net,4/4] net: hns3: defer calling ptp_clock_register()
    https://git.kernel.org/netdev/net/c/4971394d9d62

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


