Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D24A1EBA09
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574868; cv=none; b=p2ZERQexIvyRjE43/ndOADKD/89jK4/+JXn9ITW44+8bUz0DsdprisQCzLAiBpRcI2JnLnaY1wZ9SLNdyCTt/IBHJK5ttdEeg/DvBCiqLuMRYeExqTGC1JG4sM0EOK1BiGl7R1raKweuPOdXYJiDCzZLH3GBLAHID/g/F+TMwsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574868; c=relaxed/simple;
	bh=VcwkG10DIbI6kkDkL+J3LXlxZ/SbAbKgJ57aHNYrxEI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ECu9OF2y2YEDLf92cawW65js8gnsrtgOjHTF3wvlS6bNJjpRDGHdD7qVAVW0XM6Wr3bHlc297CTEqzXCCeWJouN+Zsz0CPw5bMo6WbaRNCKeeOoVjHOoPEs1eB+FuLiCVqjJkihsU2i8WsypoP79aj8NPaA1ULWpvYM0/Zf5StY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wj98uEIE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wj98uEIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEB6C4CEED;
	Tue, 10 Jun 2025 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749574868;
	bh=VcwkG10DIbI6kkDkL+J3LXlxZ/SbAbKgJ57aHNYrxEI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wj98uEIEbv4r7fj1hdU9f4ppCFiONs294lGx0NdBHCTzIbtq+P6QkFVNLfh/2vKv0
	 GTmKjf/gs98QlApZANcIn/Xl+z+g02Zz2IHLQBkuE4CUHYSmGTxk6MOtdqH+7JWa9y
	 g1Rzso4jMrDwIqy0GRwF+JA5Tjb8UyHQEvrZfLHNBEsDRQa1z2X2AEUnMmFRJrPwlE
	 zYtSvEiX+QVDLcc8Rdcqbq4SQ5iBdg4U9BBErqdBV7OZrY+Q5ihgCZLsFxXdSIMwyk
	 dY9RVdxfneeg+mQycPeiLcGS7xt+XQaU3pK+NQVzM8Jz+553XjFZ3FC5U/ZNXi2RXP
	 XTGkD0y1iek7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD7E39D6540;
	Tue, 10 Jun 2025 17:01:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957489850.2454024.4281078458759806074.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 17:01:38 +0000
References: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
In-Reply-To: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 06 Jun 2025 11:10:37 -0700 (PDT) you wrote:
> The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:
> 
>   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
    https://git.kernel.org/riscv/c/119b1e61a769

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


