Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A91C4A10
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045840; cv=none; b=stLMhlSXXwMg9+ZLCkuF/lHtnLx1D57FBvCJEoqbWl8cdZ+DZYXRLB8gyBJdqpxMmX5B/DOqgPvQ8sFTrogdm0AxRdOgYhhd5+MiYz7AemFWtwcceK53Nq2or2pTgmwG58XWYx6gSiKNmJ0ZbyEwqPlQjW4Z2WGBwXTXPyjJWZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045840; c=relaxed/simple;
	bh=jrul/zfoaRb2jAszBqreuW/8Vk1muV+ExaZ73kAeld4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SYXoScnGipOlaIgjTXgtlYXVFMPo4fceuvL7c4qnR2tq167KQU36Sf8CBx0BEYdowBESh8S8sYYgWwqVNGf8elQNJJu9S5aeFJYfOQz2W8Y355+mbPdX7FdKFT991bbRHrE4TUXZEb2NLsEuezzz2oG4TtBq3w5FTeosEnWJdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9vD7TI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9vD7TI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF71C4CEDD;
	Thu, 27 Mar 2025 03:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045840;
	bh=jrul/zfoaRb2jAszBqreuW/8Vk1muV+ExaZ73kAeld4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r9vD7TI51f0yo6lrT2GZXj2imJaYm/ctmNYRLlUY6ls0GYzGYCYzX8PhWFYSFYLwZ
	 TlJtf9dMJ+gwxH68kFCX1v8X4HHz/9o3PbJGBYnMXShnhVdA95lrK5+2/xWDj4VAqq
	 YLtzKmul08yYKlx/znerxolsj2d+X4HAhrEG4yCrhWU+dHbtkHgrcNzLFArNlUPNsM
	 4dYr0LnMoniGdVGDVeILxBzbdBBVY168V3mmlHozy9VlVJEfDjg7PDVZODBtZruyPX
	 XBwIxmNsEGUNeSPtY+/o2xzc8pSmTlOc537RmT8lrLlRaiUvGacEEh9NfnRRjS3vom
	 mZ3FUe3ezyv9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD25380AAFD;
	Thu, 27 Mar 2025 03:24:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Support huge pfnmaps
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304587625.1549280.10388900723759268076.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:36 +0000
References: <20250108135700.2614848-1-abrestic@rivosinc.com>
In-Reply-To: <20250108135700.2614848-1-abrestic@rivosinc.com>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, alexghiti@rivosinc.com, peterx@redhat.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  8 Jan 2025 05:57:00 -0800 you wrote:
> Use RSW0 as the special bit for pmds and puds, just like for ptes.
> Also define the {pte,pmd,pud}_pgprot helpers which were previously
> missing and are needed for the follow_pfnmap APIs.
> 
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/pgtable.h | 49 ++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)

Here is the summary with links:
  - riscv: Support huge pfnmaps
    https://git.kernel.org/riscv/c/03dc00a2b678

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


