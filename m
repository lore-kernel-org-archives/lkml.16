Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C62284B2E;
	Tue, 10 Jun 2025 21:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749591609; cv=none; b=pPUMsA4c+ePsxdaTMN/ed6aIAN7yJdVCTxRr1BSVaxzn9Q5HOzUS5sMD95l8PYe2Q20xUoru0ruSYeyODzSJFf6rqPw39vz6+lxPxHFJr3tgd7rfnOQOtQpGre6rjxbnYn8b7BMJFrnk/VoYQWNsTaXSEaxWYhiXWoAKCJkxvTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749591609; c=relaxed/simple;
	bh=I3C23c35LbTCjt3P42E0c8wnjRpx2wGHYe3hD72e8gc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=T9Pzejk9xZKKtUMsClNfkP6hK+UIanbKO2FOGN9fHh0AFmXgjP7johmCcV7rrUAi2tnr4VkYzIowjMEfyxuThRFzNIGzqF9SMszHVCBLyuuonMdIG8Ajhf2QPs3tgTflApSGewMctT7B1N8K+EAFZnn3q37FY2TB769+dznratw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NL9DGDTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NL9DGDTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F691C4CEED;
	Tue, 10 Jun 2025 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749591609;
	bh=I3C23c35LbTCjt3P42E0c8wnjRpx2wGHYe3hD72e8gc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NL9DGDTlaARUaLJZZTn7ksNOX+zLB3+6FZ+AuN5PSd86X7zQ8On4907vZTWM9G0kD
	 A1hDfAPf+tfosN0GVSnu/Lw2fW8IJnwIY3bkiqZQ5S3A4yZHbSfvbjAbLsf6bqYQWz
	 hpr0bRl8lt0MaPgDefcXl4fNqCDL52addHhmcGgGDeTAzH9/s4cEqxgMTy/jYNpIPn
	 4jduecNRiW8ELZw7yN15z0soD2Xd064nZD+kWXwl323ASe/AICzANp/b8AqzfoURVx
	 LHwhyiEb8uw6+2YoY1GEiOWwWYl/KI9A7mV29dnZ8ir8jo6Rxt1qzQFeR/9NPbeZAt
	 mHpwnfzFniUlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEFC38111E3;
	Tue, 10 Jun 2025 21:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174959163949.2619474.5121888722070978371.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 21:40:39 +0000
References: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
In-Reply-To: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
To: Fangrui Song <i@maskray.me>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon, 02 Jun 2025 20:48:44 -0700 you wrote:
> .rodata is implicitly included in the PT_DYNAMIC segment due to
> inheriting the segment of the preceding .dynamic section (in both GNU ld
> and LLD).  When the .rodata section's size is not a multiple of 16
> bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
> is invalid" warning.  Note: in the presence of the .dynamic section, GNU
> readelf and llvm-readelf's -d option decodes the dynamic section using
> the section.
> 
> [...]

Here is the summary with links:
  - riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
    https://git.kernel.org/riscv/c/e0eb1b6b0cd2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


