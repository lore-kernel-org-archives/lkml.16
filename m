Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0B1E1E0A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045866; cv=none; b=dffjX2bDEwiVANq52RtvocM57PP5s1xoqBMJR/LOmlKWNiAFfq+HpbZMsDto+4+fVQ05qI3TybaBL5CrHy7huKx6yyhSzeHkZFL9iFWvrBTawPbs+lGdqhx35agBCcMOqlclenGmDsRAVSJ/Z4+8SLI/fTChaJVUqitiU9iyRUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045866; c=relaxed/simple;
	bh=rRGPHntCI5ufL3M7BTsFQsuw1E2nMHQrK6+g6kmHRAk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Y7VyHx0eNJwQraAPt9kxScZXrjYe99Ds3JkYPg5D6nRwx+RSwnNzp78UzFixyqb3/n0YTtoPrZtQzV0F6dJ1Zfae17cT0y6gRpTRslGvrGlLyjEgZKVfzxcDIXfg3YlAaEEkDXxez+CAop75Z/V6MaLXTZYmJ+hfsxYPjBVQnTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os8dXTtg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os8dXTtg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2840AC4CEEA;
	Thu, 27 Mar 2025 03:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045866;
	bh=rRGPHntCI5ufL3M7BTsFQsuw1E2nMHQrK6+g6kmHRAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=os8dXTtgsvcqwphdWQLnPJ0nOTYsYaLGUaKhcwbDo6TcgWHMpAD+wtDsTbaKt+rql
	 BrTaaiCG73kRb4GAe0iQvoUMpKdC3NJ4v1tV6eBAHzLQmVwb+7WMAVdNCgtZQ1gG2I
	 coeLuGwlKd3CbcPwTc5tDX1upHt7xKtAlxnERDMb4cX36ux80SouTZHjJMea/9oCZP
	 UfxA/3XOLV9V98jBe7OycMErxG+FtlZDLtHchcOj7Lbxl23mLO5r+Dgi+QBTcY5VCC
	 YrgSld1g05BwWrCP4Q7OuLCqyMxBdpXmbHNTJeYHAD9VyLAO1OKoEvR4HTGNKSoPmD
	 7/GD3ernvoRRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE322380AAFD;
	Thu, 27 Mar 2025 03:25:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2]  RISC-V: clarify what some RISCV_ISA* config options
 do & redo Zbb toolchain dependency
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304590249.1549280.530219919332605945.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:02 +0000
References: <20241024-aspire-rectify-9982da6943e5@spud>
In-Reply-To: <20241024-aspire-rectify-9982da6943e5@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 xiao.w.wang@intel.com, ajones@ventanamicro.com, pulehui@huawei.com,
 charlie@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, samuel.holland@sifive.com,
 pulehui@huaweicloud.com, bjorn@kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Thu, 24 Oct 2024 11:19:39 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Since one depends on the other, albeit trivially, here's a v4 of the Zbb
> toolchain dep removal alongside the rewording of Kconfig options I'd
> sent out before the merge window. I think I like this implementation
> better than v1, but I couldn't think of a good name for a "public"
> version of __ALTERNATIVE(), so I used it here directly.
> Unfortunately "ALTERNATIVE_2_CFG" already exists and I couldn't think of
> a good way to name an alternative macro that allows for several config
> options that didn't make the distinction sufficiently clear.. Yell
> if you have better suggestions than I did.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] RISC-V: clarify what some RISCV_ISA* config options do
    https://git.kernel.org/riscv/c/6216182fb776
  - [v4,2/2] RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
    https://git.kernel.org/riscv/c/9343aaba1f25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


