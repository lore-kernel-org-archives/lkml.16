Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B762194A45;
	Tue, 27 May 2025 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366734; cv=none; b=KTZSajSLBJMN+hP1vw3qMCjhvsqdKixx84vxXaKDvz9xiAfz1k5yIcnvYDBA1XsTSuDzR4B2WJbxxiLMIMuLgGcLzFsuQ8OU66slcIYLiibLiqYQJxJL2IvpqEQFK6F6FXOHrRrjSaXXy82603kq4ezY/XuM7/g3CIzhArbIJYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366734; c=relaxed/simple;
	bh=WZ/piAzxvKWrt9UMwl10bjtG/mGr4Hp11iVOTQaEUrg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=P3EHPavigHYvqLSaVV8aDkrl6SZF1Py2sKRmg6nlH/uNbfkTojPprkBQbPNIBtQ4mJyasO5Oo+ztm3WP1OL/WnjqErBa7Qbjf2wDjWszq7RV8Ivn3beNWD1TdTK0gUrjgWIa3DC4OMX1pkVN6NZkV8X9TEv3MsSwVCcJJPhedPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctqBo6Im; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctqBo6Im"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB22C4CEE9;
	Tue, 27 May 2025 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366734;
	bh=WZ/piAzxvKWrt9UMwl10bjtG/mGr4Hp11iVOTQaEUrg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ctqBo6ImTgepsUu2Ht/pwv2+o5MQsm6HAmQ0y7++GtycD0fiRpFaumZ67GHZshH92
	 tck0O+K5iWTZPEdEtwvUu/xWmmRa0pGWVLPHb9ydfGmdBcGhmVPlQdr9Fb+l/IwLlM
	 2e3nNgSPd8vE2lowY2xnwOHQ3rjNb8JREBd72uC2XE2hCbjEbC1qumL0OVih8U7dl7
	 yIcjJvDHtjZsopYVNefIz4jbEGBagaGPShgVmT5iZVem9WJAoHCfmPTtjbIYlP+CPf
	 cz7HfkUBegGij40Q0pstBNiV1C/iVQHrvi6cX6oPUTlBZQCZzS6NSDqz4KRg4Vhmsq
	 7hfvKlddmyW5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE77B380AAE2;
	Tue, 27 May 2025 17:26:09 +0000 (UTC)
Subject: Re: [GIT PULL] EDAC updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250525211618.GAaDOIolEntC03ernr@fat_crate.local>
References: <20250525211618.GAaDOIolEntC03ernr@fat_crate.local>
X-PR-Tracked-List-Id: <linux-edac.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250525211618.GAaDOIolEntC03ernr@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v6.16
X-PR-Tracked-Commit-Id: ea3b0b7f541b9511abe2b89547c95458804f38e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ada1b0436b5a290923b072b2eb0368a7869bf680
Message-Id: <174836676815.1718433.12041593528813667127.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 17:26:08 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-edac <linux-edac@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 23:16:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git tags/edac_updates_for_v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ada1b0436b5a290923b072b2eb0368a7869bf680

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
