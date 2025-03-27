Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB01EB5D2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045867; cv=none; b=GrmKtdSfSSUYa/S+X+1iLfSiHSH1JfdklyMl1b/SjEv87lm5CdILPEzwkU9VC1EOCJ+y83ar9wnYtQEtTTypnPXFaUgT1kSfBdyJKmUJxgLQLwOzLyEGR8LqgDNRzHd2c9tknpNY6aeACtT8ZJG4xUBXkkh5Rp/xgqC5I/dPEW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045867; c=relaxed/simple;
	bh=uxV0gpTWcSn/NPTb8m4uz1rrxBfq6DQTERk40jtB/p4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W88x5XvEMGU9CnyCjzgxP7ne8tGuYm/LvfeEBP8L77xqqJFuyIv+ec6rLP8wvhd2dXFpcdkRPyDcOTOW029YVOKwZOwc5qTGJo/gsDanOiU/OirwyXQQOvpzFtBWFhZptlqLKLi4kenGCjbvhQTd073+fQdHn9ahQWSZJbnSGnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nf9acJWm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nf9acJWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F226C4CEEA;
	Thu, 27 Mar 2025 03:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045867;
	bh=uxV0gpTWcSn/NPTb8m4uz1rrxBfq6DQTERk40jtB/p4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Nf9acJWmZP5ty2PjHMZ67Gu2M2ST8OBykmYZX1gv5snUXmarrn40dG8tnK16WN0c+
	 q8IydbPK8p/3XR5fZDmPgq7Yvw+5Adsbjaz/33kTbOpzRYCdFWU6BGNaxcb5yf1S95
	 AqSnBnu5GpOv5399S1mH09X0M8t292Cdz78fdt/9++y1N8C3iW0HAecklbnKfZYsOl
	 yZtlPO90ajTZ+xrMzwMAZm+qMkP/LxvqE1CHUFWsqg3IHn+pEQIOC8ev/K0rocJ7++
	 t54badeh8w+5bFJl43qIhWQv2jq6B72FCPBwGm1A54eRHgC9AuFg8c8X8vhlRfndnO
	 o4QsbIkrKptdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C3A380AAFD;
	Thu, 27 Mar 2025 03:25:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Remove unused TASK_TI_FLAGS
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304590376.1549280.1858924823997003300.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:03 +0000
References: <20241109014605.2801492-1-ruanjinjie@huawei.com>
In-Reply-To: <20241109014605.2801492-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 puranjay@kernel.org, zhangchunyan@iscas.ac.cn, cuiyunhui@bytedance.com,
 guoren@kernel.org, bjorn@rivosinc.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Sat, 9 Nov 2024 09:46:05 +0800 you wrote:
> Since commit f0bddf50586d ("riscv: entry: Convert to generic
> entry"), TASK_TI_FLAGS is not used any more, so remove it.
> 
> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/kernel/asm-offsets.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - riscv: Remove unused TASK_TI_FLAGS
    https://git.kernel.org/riscv/c/a4a58f510bd8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


