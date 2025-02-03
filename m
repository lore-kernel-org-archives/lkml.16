Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43B025A656
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611230; cv=none; b=GcXO0JEMhAdvkbNPROPmsFFGFNPUMWYREtm/7O/enJzUuqo5FxWW7yel6vVN3TgguimRbCHN9ZQiMVJZoCprS24rWDaHFpy3Zb/wBSoRhY+QNSr675oonKDMq8RFtt3zoxz9R1hTBr30XJKQXO42FFW9a7CrbgKsJ4PvktRZWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611230; c=relaxed/simple;
	bh=NQUkMOvDYQPNJU3MenIgeAJYgYVRljraAHPj3tLWhbI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UEbzyBoQv/u5S3mhQxFEdBgNihd5DEuQoqw23+93TCLEDDM7UOX1YDbYYQhLbwEC9GBPIZuz20IkTEfbi1XuEgvhrXI5Uu1uGNTfl/hCi3OKYOyuyp4x5da7Vo3QbBf7S0ZclwuTm3kC0OdLRFWVCGJXFZt9CKSnVm035xUA8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H31fWr7A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H31fWr7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFB2C4CED2;
	Mon,  3 Feb 2025 19:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738611230;
	bh=NQUkMOvDYQPNJU3MenIgeAJYgYVRljraAHPj3tLWhbI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H31fWr7AF+rT0mgHZMeU4eP8PFCSBwRzMXKdclcXlyEGMQo1/JSpAnvaSoHUnPGu4
	 7Rzkfi/dPtGlh9oFPdg5yPGJ486U+fIy7E44wB29atLrgW4eKzmwFHGWm6yneJf0n/
	 j+k9iTzaXYePMh3z/c/bhjAFyMpxGdi8znJ+2e9tdP6S59xr68fW5uuA7Ln83klOaA
	 QOUk18X9D3yEDy4WUXhIMYSI5Zl7cMBPpFB+H+r8V8ERk85MTkxnaF7GWK8kH9hkO0
	 uaKCbDe0+fPAlYVylKm51k7dfZy2RcrB5BDjcpgpCKs+9rBu3n2yQd3MAMRogGZRxk
	 VFt9tDjnJjj+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7197B380AA67;
	Mon,  3 Feb 2025 19:34:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861125728.3409359.18186944228561015512.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:34:17 +0000
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 31 Jan 2025 12:08:40 -0800 (PST) you wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
    https://git.kernel.org/riscv/c/1b5f3c51fbb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


