Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1644C29CB4B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742147; cv=none; b=BJZptcWAJYGl1bdSgYm5k7lHrlOta5cL32qAZahUXeLuLVViJA4OOfWyCNqRI+nLAy87Ddl++0d77j6ruqQSwYXQrb110kizGKBasMV4R6uRWyyu85nnBvYw3wsLWGm1QctT8vHgjwpWETWC0i+btperQKtHlD9UbbIqSRpAlzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742147; c=relaxed/simple;
	bh=UNLzRa776RJODcoF+CnT30n0SiCPeOwJoEpOzseHN/U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tYRp5T7CDU0nnTbwOVJSWm0AYcW8Hm+/Pk4dnNa93Y33EIO10x6gBlF3yZePvHp7EIJGINq3PATIiq8ZMx22oaQGESouMA5biH5ZlqYkT6oRZCbx+85S2V9cgOS7nYQCT+vrjUVyd/2FDBMmyTRPrXY537IVHc4RSGtSnR6i+Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr7zA6Tx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr7zA6Tx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934AAC4CEEA;
	Thu, 12 Jun 2025 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742146;
	bh=UNLzRa776RJODcoF+CnT30n0SiCPeOwJoEpOzseHN/U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nr7zA6TxyzxyVrbwdbFLgSuItqdSwV49d0mTEeB3/Mtk8ip7X7KF7uZu34+WoYCT+
	 Do13DqcSmuY6RxYuS/eU+DoO6FA/Ij+B+Gk56lIkcLq7TE0XB3COtAf3ptdDTCY0bY
	 g63jjkF4x/l1C1t6j60/ZyP1vhZYkvwBWe0dzDjtRU38su9quSYdm5DUo10QuEsnhP
	 BnTOxkQlgX7OsPLsVP4uT8FOjA2vQ/m1Wm0yn1xmQyKqyRuvRnSy5SXGqK6egBNaOz
	 7vIqQjNKfqBa2POEpI3nRhq9VgN94kzedmtCjciacK9eE8vo1KWCEDo8A2kB3EyxC2
	 t0Pcmej8S6EzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFA539EFFCF;
	Thu, 12 Jun 2025 15:29:37 +0000 (UTC)
Subject: Re: [GIT PULL] ARC updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1
X-PR-Tracked-Commit-Id: 179e949719fe81219a3e23f1e716ac2d02eea845
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d853391c441965d30cc94d00d59e8bb2dd0668c
Message-Id: <174974217638.4182490.1766621494814405934.pr-tracker-bot@kernel.org>
Date: Thu, 12 Jun 2025 15:29:36 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, arcml <linux-snps-arc@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 11 Jun 2025 20:29:45 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d853391c441965d30cc94d00d59e8bb2dd0668c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
