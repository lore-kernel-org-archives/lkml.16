Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DC212F84;
	Mon,  3 Feb 2025 19:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610136; cv=none; b=M69dL2XQ1ApqBoce634ENvOzz944tsnqJI2B0/oOUyVab8CYL69/yPp7gjAqktjsw00fVRIcLdAhHL46QQgEOaso6R5mJHi/qwOYo5d9xs6nHoWeB2Oi6IhUCq5V1G+IeVb6fq6RsfCVTRYop2KGkibZQpOsw7lLrFwa3b2OeHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610136; c=relaxed/simple;
	bh=yIVYx2Injx0V5rbEcq4duBBRKtzAISqSSzu7G/z33hY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=US7zO1rhgGKMtrC7dN15mU1GmJ7PIj4LTo79LibLzaK/jEKkT9+cgxM5NQxmkiFv7LEzEDx+wx1a+/FZgy4tImi9jkrKZVjQwUypr+2i6QKkOrEI9Ox5UIChuW3+jpBeh8FlgeWtb08Ku1gBh158MQ22qvHiDIGQ2KqOWGw59to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HH0ZsWIH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HH0ZsWIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650CEC4CED2;
	Mon,  3 Feb 2025 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610135;
	bh=yIVYx2Injx0V5rbEcq4duBBRKtzAISqSSzu7G/z33hY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HH0ZsWIHJBGpXlVL3gXhPosWAg7/NDxPYAztafp1qE8nDjdyBmkgON17aHRZfsUyJ
	 VraQT5d7wYuNZWchQ6W0xe+QsJzpjoMS2f/b1uDStP1aAcykJ/EG6p2ClS6pSxdcaB
	 oCb/AaCssu2PPGAjUcvAhGjoRtcNlK+Ty8Wy9eq4HiALarnKhvORCLt5hX1IaaHXWs
	 sizCtCuuLS0e1a1+vAWQ+UeKFAhhLUNPZIIsYZA2Z4QDPYnvtzFRuiwAbMze3aYCEh
	 HmeHhfcuDdOXniZaFIKUhzM0MsJmkds9KIsWO6WEabchJE/5sbkpYMLvvJyO3QcMvs
	 UpJc9heOMbf9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEAC380AA67;
	Mon,  3 Feb 2025 19:16:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861016251.3409359.9684011048470573342.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:02 +0000
References: <20241228034802.1573554-1-dfustini@tenstorrent.com>
In-Reply-To: <20241228034802.1573554-1-dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, mturquette@baylibre.com, sboyd@kernel.org,
 frank.li@vivo.com, jszhang@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Stephen Boyd <sboyd@kernel.org>:

On Fri, 27 Dec 2024 19:48:04 -0800 you wrote:
> cpu2vp_clk is a gate but was mistakenly in th1520_div_clks[] instead
> of th1520_gate_clks[].
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
    https://git.kernel.org/riscv/c/3a43cd19f1b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


