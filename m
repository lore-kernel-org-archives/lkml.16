Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991E2036FA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759000; cv=none; b=YFhEVbu8UprUFaEEdg6A+/nrCGh3CYNENau8+7HG0wlq8GQMGz7eLarOkg3EWplQPWpL4o0K2aT1LdlDQvg4Sxuexn8gQqGZVeyPJBKLfxK73vlVqvnyg+zqHcamDvk+pghdW27+Cy6nDGwpAe7LUp+41Jnd1nQxxlAQVXJLD1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759000; c=relaxed/simple;
	bh=h3SWo4iyPnxhKBul5w4sXO771QR9wJ/uYDRUrkUV274=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LZWP0FZQuiCajD0z2rysY8LnsgwWbqaeASetg0JbfEhlQouCegzSs/HVVmbFc985Ps7hZFdMcfqnRcm9CvxcCErxLxMCI66N7hGm/mLTZL2StrwmjMYLVjMuHLhiqhrOXxuwRQE0f6PonCriui9ZECwhRd3QYkzzPeI2uYC4S4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkiG91Q+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkiG91Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8A1C4CEED;
	Thu, 12 Jun 2025 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749758999;
	bh=h3SWo4iyPnxhKBul5w4sXO771QR9wJ/uYDRUrkUV274=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TkiG91Q+sqJi4gKL4uXnOYBHaSYm762U8JZW43mv+NXfxHKO+UELAmA0P6mAbmIJ+
	 R3TNmLP3TS1CUvPIL+kMIl+MmWsp7Z2DMsteka02StNHR1PN08yl86GppCJpf42RYJ
	 5kFfAPKQ9rh4oK2FcUsmlUrJZ0H9VUlNM4CHVgv2ZSWTUkgkhAdVKJ17IPJeD9jSNl
	 FFgj9oGBDkR8R9cE8bDirPkM/lWfv6KGDK0A8pUbCWlETQTqvoJo/iMqzYLQNEfyM6
	 Y6uSaUGs6TgYXkdal/GuHYZNdEA3bVZDsjyX7LDUvRFgWs1GBzsAvssPgO8oudV0Ma
	 T7nicBnd9OyyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCEC3822D43;
	Thu, 12 Jun 2025 20:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174975902950.88969.8261130277132452105.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 20:10:29 +0000
References: 
 <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
In-Reply-To: 
 <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, jesse@rivosinc.com, andybnac@gmail.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 23 May 2025 01:27:01 +0800 you wrote:
> Fix [1] save/restore vector register error
> 
> Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  arch/riscv/include/asm/vector.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Here is the summary with links:
  - riscv: vector: fix xtheadvector save/restore
    https://git.kernel.org/riscv/c/4262bd0d9cc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


