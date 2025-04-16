Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A022224AFA;
	Wed, 16 Apr 2025 18:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828916; cv=none; b=DGpDKI2oq899dwojTzA+8gHBLHBgyyrxAk6W+vrRhAjbPcvjXffCQw/9DWS8KFU3I39vYdY+pOV8jei3SyUTXnJT6FY1RXOvwajQSp7zYcWuwjAu74tcXj2WN0UFN3JMD9an14VMjEhcVu7mPDAqFQ6yACH9MDnRpfShca5qJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828916; c=relaxed/simple;
	bh=ME49ZF4t0jmo7uSiWyuhCwsk8DjPh8JuS9vPdzAOw2U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m/3DxYyVJoOUBYDJB4wWWUojOARlSKp/S9i5eyM+eku6jarv9FsM6MNJ+u+7JAcGFYTx7tNSrrW0VlBZfKVOKMjbGkvwXt/JQI/Ym2UPmExviuudi7p3xe5wI1GgXPRoJ4WWWGxkeRoXrGwu95gl3hOGwcjfw/Fz9r+B8AY7Jhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QspY0plg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QspY0plg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3495C4CEE2;
	Wed, 16 Apr 2025 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828915;
	bh=ME49ZF4t0jmo7uSiWyuhCwsk8DjPh8JuS9vPdzAOw2U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QspY0plgC0EsxNYFniyQyWi0YMBGfIo+bd3SiQsmoTj91jehPUBYocMddP1yL0m3/
	 lvijYIQ4Scbj+M3BZvCAUvAn4QFmScOstM1uncU9xTDkdq3yEIgsm0Yr77iQh8b7nL
	 aeQzaR9DJYn+w5aG0cbyo5nWDzVOz9uYc94BaRG8636OSc0qt4t1eKwkM/T12uWgq7
	 FOPES/LKOOAFeFLBb8dFPiRnM9Dthe++jBNzM8QfoBc2klcnxtH43IcU/wugGBSdAQ
	 BFun8QQE0IViVTgUjZYxHSU7p0bNeJ0lIiQobm751GPzCELja8ftO2656BOFg2pUzB
	 ZxVxwbM+w8sQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB83822D59;
	Wed, 16 Apr 2025 18:42:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Provide all alternative macros all the time
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174482895352.3460781.1754432437296144659.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:33 +0000
References: <20250414120947.135173-2-ajones@ventanamicro.com>
In-Reply-To: <20250414120947.135173-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
 conor.dooley@microchip.com, oe-kbuild-all@lists.linux.dev,
 charlie@rivosinc.com, samuel.holland@sifive.com, lkp@intel.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 14 Apr 2025 14:09:48 +0200 you wrote:
> We need to provide all six forms of the alternative macros
> (ALTERNATIVE, ALTERNATIVE_2, _ALTERNATIVE_CFG, _ALTERNATIVE_CFG_2,
> __ALTERNATIVE_CFG, __ALTERNATIVE_CFG_2) for all four cases derived
> from the two ifdefs (RISCV_ALTERNATIVE, __ASSEMBLY__) in order to
> ensure all configs can compile. Define this missing ones and ensure
> all are defined to consume all parameters passed.
> 
> [...]

Here is the summary with links:
  - riscv: Provide all alternative macros all the time
    https://git.kernel.org/riscv/c/fb53a9aa5f5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


