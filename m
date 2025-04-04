Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668B221544
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799267; cv=none; b=toYHgbT1kdz2tHoazbTmQHQTHnQxC1HTFVX4JjA7vDqqS8D334n+4bvAZ5oLCtMlbWdIp+2k8ef5VstW38bllPC5yBsnxEnicjv1adQZET1lTHbgZUbMnVJ7r9AthpMLGCQTdPRzBObCF3xcT8WS825jqxDy1BwVjGt81YBvDKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799267; c=relaxed/simple;
	bh=AI0kAoZDIZzvjuVpxzrPvSOwNQfs9Bm97d8lEW05ktE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MrhoqJUnNhhn/QcYxWbnoAtCWbFm2M3iRd07panU0JmpE9U/Fk3DZoS7Buxxh2YR7YtJyeWiAZFzLD943GofsnQL/WZsbwshdGgSi91TfyqIMR7cm9mWivU5We9gSx4ht793ZRrl6qvSQsUWEwdTOw8qsSVJy0yADspvMmTqE/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+fxI2bO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+fxI2bO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34C0C4CEDD;
	Fri,  4 Apr 2025 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743799266;
	bh=AI0kAoZDIZzvjuVpxzrPvSOwNQfs9Bm97d8lEW05ktE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R+fxI2bONto3OBk7CYvIBWLBU4PUZxFB2+qiIxE8PHLgtRM5eSHP5Ti1AwZuAOn94
	 vPpUWqPj+4GqlH2UHsz5y5WmIt/0uvy1uujaS+pvOve720qsWJ9t6o8zZvY3yGJMYe
	 CyfZ0Hdibg075G21G4ltEvJFlL4IenOAUmLJlkmsu7s28N6OcNWr4wndneBK9bb/Mq
	 ZtFJIrSKY6SdXfv3pqsP15Bp24qcAzL8fAGZD+UCmb5QxcCfAc+f0ZHGNNIlY3mYfL
	 XXnL0/v3xpjJEDhpDUwFJSbPfsz7bf/FPCgZWC4TE1Zl4fBQYzGbZ6Z4Eh67cVGX13
	 X0dMG0+8A86xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F613822D19;
	Fri,  4 Apr 2025 20:41:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174379930375.3383526.18254951877447594108.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 20:41:43 +0000
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 04 Apr 2025 08:58:06 -0700 (PDT) you wrote:
> The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:
> 
>   Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.15 Merge Window, Part 1
    https://git.kernel.org/riscv/c/4a1d8ababde6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


