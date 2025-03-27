Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7301B87FD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045838; cv=none; b=I6NJczTQZeSXvUoRB9erqfdVU0yF5+MdSKvTAvgK5U5fZZ5Xp8/PXeS0slO7z3JROUkTiZh0fdTgtS33MLPd282mrHirFgMOtXPF0Aa3oZwFIZRKJ7mFIgKF96toZ1FCCRZt0l5a3zr4a/w+PkgjSAiAeHJUCdHY5uaX7W3Xu0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045838; c=relaxed/simple;
	bh=rDzVJYFPmMuRVaHSz+QupgM1qeXPy7Nb+/Tbc2Rhldg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=F7E+DPmSJfmDTzVexrXwcjstfbSkloyaDld6r3d4E56X8fQlhfGOaju6AslPqPzOTGD5a5VvLmPP2Z3hKTxo/xaqN/n0qLtK5Eb2Whd7FZQnFc4/Z7k4y0nOm/gpUPKIyCJgeDK1cH9XALJ5l55ODhJw67cul3bhKxk3+HIzQIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkLUdOa1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkLUdOa1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2F5C4CEDD;
	Thu, 27 Mar 2025 03:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045838;
	bh=rDzVJYFPmMuRVaHSz+QupgM1qeXPy7Nb+/Tbc2Rhldg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QkLUdOa1ATbh3FtnKXk+Lo473eMBx6fasoENc7R8LNZ7TPkSlPbJTy5Pk6xGYIX3j
	 ZRKtj477s8Irm7LzBWMaD5eVyD+plYfOA+XmbEe6p5AVuu978szhMGD0udzFl+bBg+
	 ahGi0C+ywgvBmdr2gyTK2GfZJ+fSGTVDqhX01dwc2KV/U+8SShc+ZqIcFbHuNbMXwC
	 hvhujyT/byymMdv9pe8/cP0PEUxo2bmfTvr+qVp9KHrtze7euvXLOL7GeCjEl+S7c3
	 BIUDMMhwTFiaEnF07ZF5Qu58h4IDSiLwDh5lh4/cBL6PZbRZXd/uowHDXmDtfKjcqU
	 ZuItJ0l5e+v8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D98380AAFD;
	Thu, 27 Mar 2025 03:24:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: mm: Don't use %pK through printk
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304587475.1549280.18045684973860315790.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:34 +0000
References: <20250217-restricted-pointers-riscv-v1-1-72a078076a76@linutronix.de>
In-Reply-To: <20250217-restricted-pointers-riscv-v1-1-72a078076a76@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 17 Feb 2025 08:37:58 +0100 you wrote:
> Restricted pointers ("%pK") are not meant to be used through printk().
> It can unintentionally expose security sensitive, raw pointer values.
> 
> Use regular pointer formatting instead.
> 
> Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> [...]

Here is the summary with links:
  - riscv: mm: Don't use %pK through printk
    https://git.kernel.org/riscv/c/eb8db421ce83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


