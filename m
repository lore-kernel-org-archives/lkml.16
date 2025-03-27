Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F71EFF9E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045870; cv=none; b=UzCAGedLDHHVZ8i5bLrkmeelpOgwSptNe31XYvnvhGUuBm0JZzhqEBurQonSBppWeUAX2ADvjnxoCyH6j/iSW0xRrmt8vqBCNFNwWkIIvpdUn5irI+wt7GU+td7fZjJJ2AN4AlMwyD1/oDd5YAmdTxlj4bOooWY0cSOaq29Le08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045870; c=relaxed/simple;
	bh=hXiuac50AZWLBrwvx/7arCrBymRUVVFamfJ/mIqZ9xc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=feOIkiIehwJCbpmNMzQuNiDfwgyTsAz24lgJDIybkAUky5PaH0vykxJeSwW6jx9wwzb3kuF946R/d21cHP06XXA4rbJ8xvUBIXDQu/rrJ36jlPbKlVudncRSwk2Rou39nUwyTcejToXorOPLSX7ZGabuO4VBYRdXOK++m7740Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlIvJ/Yb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlIvJ/Yb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4D1C4CEDD;
	Thu, 27 Mar 2025 03:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045870;
	bh=hXiuac50AZWLBrwvx/7arCrBymRUVVFamfJ/mIqZ9xc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LlIvJ/YbFZ50LDGe8JlpoUnN8s9jUfyHw8ifySjv/APazheITxwvoKFDJvA7DY5n/
	 Kp7kARTfyqLSg04oOEA7sswL0YxU6KRK4PS245j/OAc9SW6dTyefLxqP0vDSIV8e8m
	 vm27y0RrHzxRPU8+MbCnfEc0Cs5HbPX8VkZt5vnb6AK6Sek8PRVpo9Knnaadzz39sV
	 cWmvDPp85kbz6Wlhd1nuCmwzvnpDFzkAgpXzRXAblBlPZqpYeBFMNSiMhmPKoE24Tm
	 lGzfVusTxSTW7u/onMh5YBxjj7fdwBaXq/bni1OEyXIsLnTw1OgYLpNtuhacrGikNd
	 rH13tbCDkqNzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AF2380AAFD;
	Thu, 27 Mar 2025 03:25:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: Remove duplicate CLINT_TIMER selections
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304590675.1549280.14334203508337500301.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:06 +0000
References: <ce55529a42fa232cacd580e38866c60701f91095.1738764474.git.geert+renesas@glider.be>
In-Reply-To: <ce55529a42fa232cacd580e38866c60701f91095.1738764474.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  5 Feb 2025 15:09:03 +0100 you wrote:
> Since commit f862bbf4cdca696e ("riscv: Allow NOMMU kernels to run in
> S-mode") in v6.10, CLINT_TIMER is selected by the main RISCV symbol when
> RISCV_M_MODE is enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Remove duplicate CLINT_TIMER selections
    https://git.kernel.org/riscv/c/72770690e02c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


