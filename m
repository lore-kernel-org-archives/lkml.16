Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8F19D8A3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 19:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751828588; cv=none; b=GS5uSNpnM14RtUhwFeSpEcnk1+S1fpoKdsuJV8lRQ3SlVOdobrBmCcMmEPhGg9H9lJGhgKwF2QkxWsk74l1hwUiQKOSSZvSSPA26Hu2RYehqB0bed/fvEUKo08J+ETVo7shYJlT3awu2SEg3AvkHAiI9mSpEoCaLcjj2VgnGuEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751828588; c=relaxed/simple;
	bh=NvolIn+H8fnKC+nwU5sbVg4WtX7DdioSex8c75p82iw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Djs+lsdvFizybootyHhqbPajxHfpQFBEIuVisy4Mz+hW6CEpU7xlMk+Bkez9Ze2Xfx/OJmSIWcbBBq5x1RugI8zSpbc5fpb+dNe36Rx02dRoawV4aGOVyT7gnCTANVnBCyzu5l3Z4k5IB8RKOoOC4FJ8ERxDy3v/ilMsotPs+c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TL8+024G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TL8+024G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5914EC4CEED;
	Sun,  6 Jul 2025 19:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751828588;
	bh=NvolIn+H8fnKC+nwU5sbVg4WtX7DdioSex8c75p82iw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TL8+024GThW8Rjlzh5ny7C3kcJyGIUezmN8sqmq1t1NKdcJSAZvGTbesDTVqekQOn
	 8fJxFcb9q0s6XOBxTGEIf6DU6qARyr39rzut1O40QOahKWK6O6nxv4NSg0BamD6pwH
	 GF9VENtcmU1hEL1EycmeCS79iPw7M6hB10T9o2RVV9CHFB5qmzjewNsK1eY1W1DrvY
	 dG7JLmdElmUtNGGXl4BSHitt0DMfoPhFbQfsZueD5oqZQhjLNAKSErYLuZRGxwV2PE
	 G7+TEMCmjUtzaUynMKFVq7YhAJf9A2F4RZZb5ZuZRuKU9/Cb3EnxQ7zgb6V1e8lXUI
	 8gCCFNwRcfvwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB08738111DD;
	Sun,  6 Jul 2025 19:03:32 +0000 (UTC)
Subject: Re: [GIT PULL] ras/urgent for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250706080809.GAaGou6V4B7ke5415r@fat_crate.local>
References: <20250706080809.GAaGou6V4B7ke5415r@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250706080809.GAaGou6V4B7ke5415r@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/ras_urgent_for_v6.16_rc5
X-PR-Tracked-Commit-Id: 30ad231a5029bfa16e46ce868497b1a5cdd3c24d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdde3141ceb992f494e9a949c89f99983a1d6604
Message-Id: <175182861161.2712443.9996166753623167166.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jul 2025 19:03:31 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Jul 2025 10:08:09 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/ras_urgent_for_v6.16_rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdde3141ceb992f494e9a949c89f99983a1d6604

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
