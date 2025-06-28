Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB813481B1;
	Sat, 28 Jun 2025 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751071780; cv=none; b=mcJM1Hrm83WkZwEhpMxmHJKoXW9NxsKU7sQZTl29z3w4P7tqcW1fIHHj3KW/wtJDGuiHO3k4EaStrmnyNgsgbVPA7Xf7Ppx2IHiP2AsCVuJ6O5oghsXYuG0bAcw8JSWREHiCJbAEN9F2nbd7r478j4DkkpvE48e/GJUDmPzSOZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751071780; c=relaxed/simple;
	bh=xJhUhhsEVR+xzLTJNqWD36q8yi0KTuWoSn2HQf9RDfw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W0waOatTXXWho5GZBUtPYAOJ5zdTrafGmN10po5SRvNqU/4ep77NBQqAehWBsVgOcMzJgjYS8GXzoMq+cZanAQVKI3IUnalH0+hmpKWaNbP5eJQCnNIi+SbwYiy1ZVp95xct2zkrPV1hqcZN6TgUcSRvByVnIZmuWXGAflw97XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAm6mzuu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAm6mzuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDA4C4CEE3;
	Sat, 28 Jun 2025 00:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751071780;
	bh=xJhUhhsEVR+xzLTJNqWD36q8yi0KTuWoSn2HQf9RDfw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fAm6mzuuyo5uvNdepja6CFlC2ujZIaVOqjk+SP+FUFWK6CfTitY9VxN1EBrbRJ/+H
	 AeLbMBatVNm5Vq74LmQ10ximR8+bFK1XQ4MKyY19iCrT0TOpiaTc77fUJrMl+B/FVl
	 BslptaxdXnGaYZFS0GVI3GXI4AF2BrTdLoCCG3f4k6t3EXcxXFz7IshoCArGOdIrcQ
	 VAYkqAorC+u6zEeifT0/eF8/h/WIvIW7lEE9af8rkCF/8ROPioaZiN1C8CtQZTpg9d
	 RoEpttZqE6Pcq96hkongaheX8WbAl5gcwYpJp8IcjBlt8CTR+rClzWOPidqcuc8Gfh
	 b5WvqL9hFZuQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FFF38111CE;
	Sat, 28 Jun 2025 00:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] dpaa2-eth: fix xdp_rxq_info leak
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175107180626.2100647.4103218614037349368.git-patchwork-notify@kernel.org>
Date: Sat, 28 Jun 2025 00:50:06 +0000
References: <20250626133003.80136-1-wangfushuai@baidu.com>
In-Reply-To: <20250626133003.80136-1-wangfushuai@baidu.com>
To: Fushuai Wang <wangfushuai@baidu.com>
Cc: ioana.ciornei@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 26 Jun 2025 21:30:03 +0800 you wrote:
> The driver registered xdp_rxq_info structures via xdp_rxq_info_reg()
> but failed to properly unregister them in error paths and during
> removal.
> 
> Fixes: d678be1dc1ec ("dpaa2-eth: add XDP_REDIRECT support")
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> 
> [...]

Here is the summary with links:
  - [net,v2] dpaa2-eth: fix xdp_rxq_info leak
    https://git.kernel.org/netdev/net/c/2def09ead4ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


