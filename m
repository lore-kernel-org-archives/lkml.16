Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381E212F9D;
	Mon,  3 Feb 2025 19:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610137; cv=none; b=YIjnZjmXwHWrX2GTxHbH2yjFzpFtvI4QDRpFyW4tgsij12qzTmxNDBY+gFJcXxoVC41tfSzBT6UWRlOHZwFRlaCoaVkT8dJeR1Orr/Z1+gE2JJUCkbQwQEXaLwNyEWVxuKG9LfJ1fozuOEHfrr2UShPU2146A0qSxIypjKsinl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610137; c=relaxed/simple;
	bh=bFHEjxAFUuenB9sN+HmVABGDf7gISIBleG3ZK2RKRRo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MVYpGLFMpBwUq0HgE7Q+UNRDkceaIL7SE+dKfyBD2kh46adqx1A9F+6YObo67uvdBVNEE1B0W/vTif5jgKUlaSXVNEG1CAcWZGD2cHpE4H6hhFievjjwAPIF2abucyIu2auL2602F+LmB8cjw/NiaR2E3RRWZsbrXFv3q7qHyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZwxreFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZwxreFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F09C4CED2;
	Mon,  3 Feb 2025 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610136;
	bh=bFHEjxAFUuenB9sN+HmVABGDf7gISIBleG3ZK2RKRRo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IZwxreFq/t+9hEYofNuBXmm8bjTzplV1TNx8BMEhL4N/snE+Rjq2uisLonSCUVifX
	 knFQs6si5mpZnPkXB/0mxHeoCiq7K05u99x4FAzBi3M5Ss9tBy81g9qQoQaayu8DLq
	 PmypNv9ZCd6WnSB7jGz7CaCB1GM0JYndV4sq1IQVaTGVjBqdCg1FOh/JuTin3m7PBh
	 wqPwy58Zp8rzaY1etPBShYN7/dk5u0upCTXlIsnZ3/ol+r6fdm3nYaHU3UO79UNJp+
	 6VTRAXUV2AGpqygKn/p4AXZKW7SX5WkzRP/HKyLobiAZWwdtxeFePh8GjT+uexVxAZ
	 SVIEMI7iwZUyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2EE54380AA67;
	Mon,  3 Feb 2025 19:16:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] clk: thead: Fix TH1520 emmc and shdci clock rate
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861016376.3409359.6278098615754721919.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:03 +0000
References: <20241210083029.92620-1-bigunclemax@gmail.com>
In-Reply-To: <20241210083029.92620-1-bigunclemax@gmail.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: linux-riscv@lists.infradead.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, mturquette@baylibre.com, sboyd@kernel.org,
 frank.li@vivo.com, jszhang@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Stephen Boyd <sboyd@kernel.org>:

On Tue, 10 Dec 2024 11:30:27 +0300 you wrote:
> From: Maksim Kiselev <bigunclemax@gmail.com>
> 
> In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
> is 198Mhz which is got through frequency division of source clock
> VIDEO PLL by 4 [1].
> 
> But now the AP_SUBSYS driver sets the CLK EMMC SDIO to the same
> frequency as the VIDEO PLL, equal to 792 MHz. This causes emmc/sdhci
> to work 4 times slower.
> 
> [...]

Here is the summary with links:
  - [v2] clk: thead: Fix TH1520 emmc and shdci clock rate
    https://git.kernel.org/riscv/c/f4bf0b909a6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


