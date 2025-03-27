Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0D9479
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045837; cv=none; b=T5Xnc+RqTTYgHOP2R0rfLNg5xyai43kEeBqllorm2PoyADSPnyVL8mztdewjGG/ZW0ErvKhou9LMnqTALlfxNc8QumNcC5lRKaFlyjRvamObXod99/+1QquJwfqjTe9AZG1FD3hbkNAWG2nhZkwqRj7C46J4OfRfCQJfTUbjBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045837; c=relaxed/simple;
	bh=RwEjkDL2fS+r4oZqYYE//W3MjrsqbkHSq0YLkJXBptE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KxMoF5HnVczOn2+iQaC3Bdcd4VnBSKFQVcFozUbM9/tXBl41+GR4/xBYLGrgvs9zCqrsa5CDgxc6vbs+dzBo6lkJZBT1w73HqeI/pU5fj/nnKyor0q/E+coPph8/afU4jN8o78Rn3X4e1eeN+q5n/V28RTAPwNs5BUZWLjMGmS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfBiy6+1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfBiy6+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F24EC4CEDD;
	Thu, 27 Mar 2025 03:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045837;
	bh=RwEjkDL2fS+r4oZqYYE//W3MjrsqbkHSq0YLkJXBptE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PfBiy6+1GmzF/BqmKCCWlR13h6NguFPkm3sM+7+FlleTXyuJxyoj3AFeUyOR7v/fj
	 v6OKmtuDErcHnw1224ySWVr3UdRU7yeDXqdRsKpSIB+tnN3JmOKrLBQz0yzWoFQMHG
	 tMEqWtHQb4uyuKtKcZQtgk5uk+ppjhv0y+qCtMrjw/vSIXU2igbHNKcJm7/JVYaJ8V
	 J9qoqHfP+/sYWiCOoHg4SLkxb10fSx6oTouP4NiLuOD+0lZ6xZ/FKE2aoOsXO6ZTfH
	 xmQJ6g+s6KdyK6uV6SJwx2JLw+WbvbDhqHm5jelp+XJ1Ws2OXlwWKNPw/dgsjO3uhO
	 A76zyL6AVPRlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2BA380AAFD;
	Thu, 27 Mar 2025 03:24:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: remove redundant CMDLINE_FORCE check
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304587325.1549280.12018226648442560841.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:33 +0000
References: <20250114-rebund-v1-1-5632b2d54d6c@gmail.com>
In-Reply-To: <20250114-rebund-v1-1-5632b2d54d6c@gmail.com>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 14 Jan 2025 00:30:20 +0800 you wrote:
> Drop redundant CMDLINE_FORCE check as it's already done in
> function early_init_dt_scan_chosen().
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
> ---
>  arch/riscv/kernel/setup.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> [...]

Here is the summary with links:
  - riscv: remove redundant CMDLINE_FORCE check
    https://git.kernel.org/riscv/c/eac5b138814a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


