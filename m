Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E113CA9C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800533; cv=none; b=RHKUvB3YCpXSjGzO52s10pR69vjgF9utTyq/m/sLPx6dCmG918vu4DK8X0+Tuy2pADiDB5Ej++Pz7sJgmK8Q6xxEW1UApRozkzu4di87AdDGFVHNxk/IIt8/gz0UA/JfZ6CgjW/KUKLjRwD0Vy0cod9CHVrR3PX/5YyhEI0tJlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800533; c=relaxed/simple;
	bh=HkI0tKqftWEPpSzZIvp4k9Zi41oCVbenMG+H41i5Gdc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WWJzZZKybzzdNKHwfDNwEJWRaZg3ZxRq/murXD2zzoTjNWTD8lEcxCh/4OQL+n0jOAfX1XS0D0slQxnk1/9pVKG5HaEtoIi1nCEC012HPM1QfoIoQaoszjb8Lhocp7MkZDHJF7BOZHKD06zwG0RAaV0Z2spnZjNTjaCynRqbnrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRQOgfos; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRQOgfos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1220BC4CEDD;
	Fri,  4 Apr 2025 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743800533;
	bh=HkI0tKqftWEPpSzZIvp4k9Zi41oCVbenMG+H41i5Gdc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BRQOgfos0teQ2hjjb3/BO9dBrpC/0pLkQhaTAXCazJGqtVKDSM0v6DPVzmLnDX0Ip
	 oDpVQG+wNgS89Z7fMR4WTektBEcMZH7IPjxtcARf+qFqWcpzMCtj//OiA1lbiH+SvR
	 c0cMuKIzQoGT85B4JeAraHm9gG6nLOWBfVxuwa0Iwrpjre46Fh8jFdr2XGwb8DNfF3
	 ez+P5HWHNmWZZEYwEoQrgGGfJW4p1pmGemSxoxUooyAaDioFZQapZ783YCf+mTgS4w
	 td2o2mw6xPXzigZdkkco3InYw7Mq0h7lnVE8C9xLOWn865rHuJBprx0My7OXsgUmcL
	 5Gess9uLgTw1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5AD033822D19;
	Fri,  4 Apr 2025 21:02:51 +0000 (UTC)
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
 <174380056995.3383526.5100779460663452844.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 21:02:49 +0000
References: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
In-Reply-To: <mhng-e4523e07-f5ae-4f8b-9eec-8422b05700f4@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
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


