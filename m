Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288A2571BF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902338; cv=none; b=VwhemMm0Z6h57Gr0vb3XozIdUCqjLNWQvWz+gBGtuGYLB0JbpTa1UXnYCXC9bL9efoF17D9H1V9U/+Ul77raCr1HS2oS0/4E9Fd2OZvXvNhxUH5KfzXg+Qs5aJrH5jtn4Oy5UV3oBuEtQMzR2FiW9x7OZopQ8H6j65Dyn60JwKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902338; c=relaxed/simple;
	bh=EAN1XwgJlvPo/BNWCc6cUUyZbeib7/bZo7uYUrfqrHI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kqh7nARnlrZxRlMu98ei2zjAh3qIUNSFlbf7+Xt1tYpfrDKW8VV2VyfQHGc+Gklj8iuRUPSPY296H1VYUMIvCflJZrFIECEfZNCtORW4Q0i2N0tlaSBo2GaIZ5Yzyqrsr9v17dXNCc5x5Ntl949cspmYhOrD5l+Pv0xWITMrcJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5NFzYfO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5NFzYfO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA5FC4CEF0;
	Mon,  2 Jun 2025 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902337;
	bh=EAN1XwgJlvPo/BNWCc6cUUyZbeib7/bZo7uYUrfqrHI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a5NFzYfOtX5wtRgJYyeb+GFL2x+QTHCi95m1hd2JaGBXA+fd3qmh6T+KNG/LP/QiN
	 Opxb17z0MzWtwdzQNpDBn875fS9TNAsBpsHHmKeNnDq9ec2q5Mq+94MY32936AS7KC
	 HPtazlwfUNxraRcMEP3M026isjVTSjWpOIsJ5i8DXwaxcfwuwGpGEqJ8FkzsBMpbtq
	 vSmUy+cM5ZDhjqy+p/aFQQg1TYNEzWWWnnHzuUB8c6KlxRbpB+hdOfq4+o6D/mSNWd
	 LoBcR/XwYQe9WIaq3fUYDufSyDZy7IC+3MUTgKkokAVJghZzFpR2cAzX2m3McBIMCn
	 dSBhzT80EYUbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6F3380AAD0;
	Mon,  2 Jun 2025 22:12:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174890237024.925497.18416911728600663313.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:50 +0000
References: <20250501130309.14803-1-mikisabate@gmail.com>
In-Reply-To: <20250501130309.14803-1-mikisabate@gmail.com>
To: =?utf-8?q?Miquel_Sabat=C3=A9_Sol=C3=A0_=3Cmikisabate=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Thu,  1 May 2025 15:03:09 +0200 you wrote:
> From: Miquel Sabaté Solà <mikisabate@gmail.com>
> 
> Fix a couple of spelling issues plus some minor details on the grammar.
> 
> Signed-off-by: Miquel Sabaté Solà <mikisabate@gmail.com>
> ---
>  arch/riscv/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
    https://git.kernel.org/riscv/c/0ee3002d66c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


