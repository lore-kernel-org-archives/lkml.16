Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A482B227E92
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902326; cv=none; b=RMD3rMMGPzKCkYjlG3mnu7M+zRXI/lmi3GbF1wFxT0FmIO1vSgV64/qZ+p+uHWQ2Nnn9tKUUZPlWoy8iO1o28EOtjM3CSSA5za9+4EndlOyNUESdiZJl3yNOtRlAn1Y/6STorQ/YpwW41Oeohl1mt+Tw65fhvwUVVEYJ+nTQ1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902326; c=relaxed/simple;
	bh=rsZx61t60Jc54DaNK6EBwyF5d20S6nRe5Uf1+PLgEfU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IYfDDgiw89T9tlUOOumdRNr9Deqi3LuLtTJaot1nbMtzbCGmd5HfauaNEIvJhQ5ovVCoHHD9JcqXWy5z5x2Cj2ybGDWDdvh/PbZ59H1Ttj4dbKZaeVbphrgMsczuF8AftWwVe4747NXWPLtweDNih152aF0Jp1f95BAkMDrLiI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoNFcWra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoNFcWra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287DBC4CEEE;
	Mon,  2 Jun 2025 22:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902326;
	bh=rsZx61t60Jc54DaNK6EBwyF5d20S6nRe5Uf1+PLgEfU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZoNFcWrac7Dpr5Il7/P0vOiPnRMCNXXlmlHQto8kbJ5Fa7koUu91+nR46VUmeNEz4
	 fbURMllcifXrxFyQQZkcS+V66PAmjR1zjHNuGCEL7WWn6Xptp8WoOo3N+hMTDLYxkI
	 5UIVp2HHD1goF/xvsNrB462+7BDTf1Wco3vefuEUcucixxl78i+2MwVyfG7av0ORDy
	 cuYJlX8oBovEewxmrlkbdFSQ8QvAMl+VPGcU7QjhCoLNDExplhqTjHIyWGYVaCtNJp
	 IjMYt4ii4/lmY8f2uP9kceTiRhBlrAzP6dOPk5aeiq2fyqQRkf6xbFC899r1oNEGs6
	 6KRTybvoKAplw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB038380AAD0;
	Mon,  2 Jun 2025 22:12:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] riscv: Add Zicbop & prefetchw support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174890235873.925497.2365799693882283939.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:38 +0000
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 21 Apr 2025 16:24:37 +0200 you wrote:
> I found this lost series developed by Guo so here is a respin with the
> comments on v2 applied.
> 
> This patch series adds Zicbop support and then enables the Linux
> prefetch features.
> 
> Changelog:
> V3:
>  - Fix typo (Drew)
>  - Split first patch (Drew)
>  - Ensure that the bits [0:4] of the prefetch insns are zeroed
>  - Move PREFETCHW_ASM out of ifdef (Guo)
>  - Remove CBO_ prefix for prefetching insn
>  - Add prefetch (Drew)
> 
> [...]

Here is the summary with links:
  - [v3,1/4] riscv: Introduce Zicbop instructions
    https://git.kernel.org/riscv/c/b81f148e583b
  - [v3,2/4] riscv: Add support for Zicbop
    https://git.kernel.org/riscv/c/120068a68961
  - [v3,3/4] riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
    https://git.kernel.org/riscv/c/46a47d7a42bb
  - [v3,4/4] riscv: xchg: Prefetch the destination word for sc.w
    https://git.kernel.org/riscv/c/993d2e054b05

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


