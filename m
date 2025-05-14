Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A118C011
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240710; cv=none; b=N3ABNihQSqI5EQBiW1LF1EuMG7tAxipwrZV/0UWWhee+TjAZwhvVegDGiykluDQqHjMrLwQ48fV2g5XWMTMbbRXXReAq+HotSzKano+uFjS2RPUM1GCs6c7HxYOAmmvfS0niPwPcoiBA5xKryWW7WWnfdZkFgiim46Bj2hiXaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240710; c=relaxed/simple;
	bh=bzbDzI4Ez8wa1Uh1GkwX2f0BYckJ+tBjU0J9J8XVnqo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MutA2vL58LlWesQxqEGtAZ7956dLyGdMs/9ZcIHz4Dk4eqiykshtT3NCrpeRYbdxeXJkSqSwXeq/cbBRgTRwR3I9zVthaqDduciWCK1fCgfyX0YSnBSn2wtFNI08XVTvR+PinmHdaR/sG7HPpBj2jw2fzB2K3QV81ZPzUaXJQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7cZzGoa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7cZzGoa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDBDC4CEE3;
	Wed, 14 May 2025 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240710;
	bh=bzbDzI4Ez8wa1Uh1GkwX2f0BYckJ+tBjU0J9J8XVnqo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h7cZzGoaqjPpJdyg15oYzhuZ2x8bT9ukTM3eWexgL59cNwzjAn/koIZduJL8epF++
	 E5mJ1q6Qa+Y3i0C/KJU2yrKwPcrisjqyhyLMK/TPjRDPg1FlBvsdeCimSr8xpObAJL
	 PUTrtBmWE39sdId4lL/Y8SzPdgDVH3Yk5MmOAI7aeOhDgW+6kouq5JHDFmSo2C2rwK
	 0lnxnpU3gPz3dTnjrfHnnh0cT8r1Ms8KxlrRrp5VklSCiBW0c+UxnchHrNICb577HK
	 NYSqzesr+IjG33WLNqfb7cM8DAOfSgqe1mlf8iWyAV90ND8wnnoAtp8PKMj/DIBBu4
	 hR39vEmvfCz3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 39AB7380AA66;
	Wed, 14 May 2025 16:39:09 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.15, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
References: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-2
X-PR-Tracked-Commit-Id: 15eaaa71e8ef142b122942b35653d513cfb90050
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 00f281fd9d8ddc1a83d3b188c087edac2116a089
Message-Id: <174724074813.2432206.562898073472288541.pr-tracker-bot@kernel.org>
Date: Wed, 14 May 2025 16:39:08 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 14 May 2025 10:07:54 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/00f281fd9d8ddc1a83d3b188c087edac2116a089

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
