Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6FB1BEF9B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045875; cv=none; b=JLcTEuQiBzZao/dTgP2LrhzC5pUYnqllLTQhbHT3s6iAMCoyq+Q6miUUk0j7l2RU6wLmBD5X/+bV8iV7B3ncYKA2dw8xhKhkuT2weotBOGpxuGH2qoHWVy6fjRlXP/RORdscGP3lWneu1ZA5+hz4pQqJOlRursDRN8XQbgbwuB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045875; c=relaxed/simple;
	bh=/OJJeZ4hgbOUjdEsw1lc25y/Fsk9US9a7A9SZCDywMY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ter4FTfDZc5nWXprvbNIKza1v6OWxtUig24WSl4GpG0oISaH2qf6xsqjFvx3r5XhJtQ/hxNgMdpIouQ9059hJY7eT6C7zPBhWIQKjesMAsXx0hQ/BarxR8EnDCQJo/VAi2oT+EMunLcICqKGSvz6NJ1wk3coq8FdvixwoXPxamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz2J5gWk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz2J5gWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F1AC4CEDD;
	Thu, 27 Mar 2025 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045875;
	bh=/OJJeZ4hgbOUjdEsw1lc25y/Fsk9US9a7A9SZCDywMY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cz2J5gWk1QZ45eNADchRsDOIuUSbZhC/4o7YJvItkM3VpBoH4rILRLmMcW1n2Afk6
	 mMCY2q07Zy2W5aeY2mdt93ouQomYchzsU4bL6x/0f6xjswc68cA/u7wj4lH9LA48kq
	 Paq3tCFxH8PJxKD9Rfkm+AAjAOvG5vEhsp0sBnA6Ai4abcJmtVL0lu1gnSsxKXxPZv
	 sm3CP1nCVfM7TCLHLqhC9CQVSHYLzJ7x1FUcYa6qbEGQU92G8TDYpMgTpmrY2T3QA4
	 tlqWXUELUw2cVSLFoLVUHRo46gCn7LK3i76SCgn8EOwcPDPA8GyIfj//rSJR2IYhve
	 IphGHCWg4x3/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE33380AAFD;
	Thu, 27 Mar 2025 03:25:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] riscv: Implement smp_cond_load8/16() with Zawrs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304591124.1549280.8617793475801522686.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:11 +0000
References: <20241217013910.1039923-1-guoren@kernel.org>
In-Reply-To: <20241217013910.1039923-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, bjorn@rivosinc.com, conor@kernel.org, leobras@redhat.com,
 alexghiti@rivosinc.com, christoph.muellner@vrull.eu,
 linux-kernel@vger.kernel.org, parri.andrea@gmail.com,
 ajones@ventanamicro.com, ericchancf@google.com, guoren@linux.alibaba.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 16 Dec 2024 20:39:10 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> RISC-V code uses the queued spinlock implementation, which calls
> the macros smp_cond_load_acquire for one byte. So, complement the
> implementation of byte and halfword versions.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Andrew Jones <ajones@ventanamicro.com>
> 
> [...]

Here is the summary with links:
  - [V2] riscv: Implement smp_cond_load8/16() with Zawrs
    https://git.kernel.org/riscv/c/d9708b1931fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


