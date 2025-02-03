Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BEA2AF10;
	Mon,  3 Feb 2025 19:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610120; cv=none; b=kultlgGIM5qtuRUojn/L12MUwlo/CjimqYDniT5h8LTEm5L+cZaINBeQgkXkMvlCNxV+c/9BU0SZCIrfT+Cu4FrwJcpabOSC31crN9NIGWPUwuirsemUqPeeXQ6hzSvd/0kj5UeVSTqbxd7HiBi5i8rAMN6CR9NpoICEvFmMirY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610120; c=relaxed/simple;
	bh=sJAddZDtrl7Dn/grqJ5XfBYKamzCFxh20mlHE9ocpd0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=h1e+W3IEHeXBI5Lk+ywgGJF6dM+ep28OL+Gav1XASQTm+zCQlk8G/wJBELeL5mTUrxPFw8itunSXNtRgfOPdwx0BEmS2BF9JV0Y/X30FfGFIq6aUbpEyYpew54AAWbUNXDId2LLLWp/PAkOstDkyLYRNTMp88RFnDkXa61+gfR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEBXHW/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEBXHW/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C699C4CEEF;
	Mon,  3 Feb 2025 19:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610119;
	bh=sJAddZDtrl7Dn/grqJ5XfBYKamzCFxh20mlHE9ocpd0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TEBXHW/YrzoSQA6bNyPK5hvPskWayDl9mYhOA5SpoP+yMMUbP1RdYKp9INyLXAwN3
	 /WWxT25sNqNmxq8dmYmhzlCuRARNhHIHnyfAuQ2uZH6R9Z8O3jMd52hYc4KeiveJdL
	 xt5I3E1gXsmn05Fc+JBE43I71cCg/SnfiADoZty7bKLTLOd3kYRTDu/mbqH5/6pDW+
	 wzbckyo1jnicDNXrf1cFe/0FMcrfb3O7U8i7unoac4XlAEhSR3qzi5GnPnIhpZU+Zk
	 EdncoU0qlb4+pFR4NxItaOYbs7MPlG8UEq/YOBDFFW8gidmMwsRSjpvcoVdDUwq62D
	 9puU0JnrrGUsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71BD9380AA67;
	Mon,  3 Feb 2025 19:15:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND 0/2] clk: thead: Fix TH1520 boot dependency on
 clk_ignore_unused
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861014596.3409359.5224078103636343294.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:45 +0000
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, mturquette@baylibre.com, sboyd@kernel.org,
 jszhang@kernel.org, frank.li@vivo.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Stephen Boyd <sboyd@kernel.org>:

On Mon, 13 Jan 2025 12:31:23 -0800 you wrote:
> Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
> perisys_apb2_hclk and perisys_apb3_hclk. Without this flag, the boot
> hangs after "clk: Disabling unused clocks" unless clk_ignore_unused
> is in the kernel cmdline.
> 
> In order to allow individual clk gates to specify their own flags,
> the call to devm_clk_hw_register_gate_parent_data() is changeed to
> actually pass the clk flags instead of just 0.
> 
> [...]

Here is the summary with links:
  - [RESEND,1/2] clk: thead: Fix clk gate registration to pass flags
    https://git.kernel.org/riscv/c/a826e53fd78c
  - [RESEND,2/2] clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
    https://git.kernel.org/riscv/c/037705e94bf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


