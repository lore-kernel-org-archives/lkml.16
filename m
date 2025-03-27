Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39591B0411;
	Thu, 27 Mar 2025 03:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045857; cv=none; b=b3b2PcLjYFKHW1g2YJqWuEW3Un9hdC9mESdvMLNJsQGlLSadRnL9Rp7bl9ONdt9vgJAudnx8E2/SJ/gOU82N0HebRoiPm8Lp9H/uPJLEv7vbwnP8aa3e2p+rxDxvL0EWPknXugJp7Ng3IXPnd/iU8xqpC0qKm9+2nmwrZvsyqn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045857; c=relaxed/simple;
	bh=WzetoZhZ3xgmg7YT1JVI8VQIr1knizpmPZxAty/JhrQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KEm4RuIDvMeIv4anRTpvHk6/vVSGq1Zm33VTN9d8pUW+VIdjMGWnUy++P20WiQmt4awX+QW9CqKK3AQFJes3uCqEfjruwKH66d2m/YjlppAMm/JoNjhf34SjBOH2hJJFOm/YWLmu675WpD8M7c5Z05vPJanNWb6XJ+Xs98VTjfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFQvA/7I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFQvA/7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8449C4CEDD;
	Thu, 27 Mar 2025 03:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045857;
	bh=WzetoZhZ3xgmg7YT1JVI8VQIr1knizpmPZxAty/JhrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MFQvA/7IvgHjr9FBj2XUvLSoh5DCWxLOPIdNMV41tZ/ibMnHjH/QwD7XVC+hGviCs
	 XWOOYdRLNQZQbpZkGUw9d08ZdR6lnHDfbzukv/PqwO0goKTKTgJ5Af+XqwwNgARw0t
	 04CtsnK0aUiTDc9CK5Ow/b3DP3igVDsrXtlInymy9HwOSLsEsCGQbJaMunNlludfrZ
	 GT9gtGkQiA+9YiJ7rk8Xi5juD+/3Ry0xHtXjK0c64ZOyYmBbm71C5gnx8aQPqeSna1
	 pAvjR2JKQsfcuux/GBwwyMQEQgNNqBegey99IZIKBeoQjV7yhJucnkzsARAMuF6x7I
	 M8ZzOlSxRlcUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE8380AAFD;
	Thu, 27 Mar 2025 03:24:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: defconfig: Disable Renesas SoC support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304589376.1549280.13761384336382427228.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:53 +0000
References: <e8a2fb273c8c68bd6d526b924b4212f397195b28.1738764211.git.geert+renesas@glider.be>
In-Reply-To: <e8a2fb273c8c68bd6d526b924b4212f397195b28.1738764211.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  5 Feb 2025 15:07:17 +0100 you wrote:
> Follow-up to commit e36ddf3226864e09 ("riscv: defconfig: Disable RZ/Five
> peripheral support") in v6.12-rc1:
> 
>   - Disable ARCH_RENESAS, too, as currently RZ/Five is the sole Renesas
>     RISC-V SoC,
>   - Drop no longer needed explicit disable of USB_XHCI_RCAR, which
>     depends on ARCH_RENESAS.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: defconfig: Disable Renesas SoC support
    https://git.kernel.org/riscv/c/c2db83fe1033

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


