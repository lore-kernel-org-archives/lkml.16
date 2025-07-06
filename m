Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE022BCF51
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751828591; cv=none; b=uIvy6Eras9QZ6yCR5Q0Vk4xhQpms3sEcNXAnC1DaYepw+b4+zt+FWhlbzg4t6rvdxPvDHSu1cWrpG6W92JZBhOK395ypz3k82+HUK3b4VEkxyifUGkLi9Jh4e5qSWyVMS36n1tR0iSSTXtYdMKPJr1f+PHSvEIOYTa+C3ngz6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751828591; c=relaxed/simple;
	bh=Aw5gA3p0QWILeWVt58DHrXF8Gdidojm3MKzhlqfy5lM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=c5HUtZrXMmM7b72F1gLVlvqByChWgF4sS22NMNS/AfcQmShdF/UBSZsi/iOWWcl8PWPn52ZUhosj1nExMM1gjlQWDdAA7cLzevG8Ddp/5+9zPAYX722xwW+jRI+Z6dEN79KO5AwhNgjwgwJtxdJ9pxaM2luF2UL95tl99TCYjQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvhI2nSn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvhI2nSn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FF8C4CEEE;
	Sun,  6 Jul 2025 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751828591;
	bh=Aw5gA3p0QWILeWVt58DHrXF8Gdidojm3MKzhlqfy5lM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BvhI2nSnXyzkpWmXxsM4lQU6wH8zUuIH+uKoDzLE1zZQ9F1Chf7ue1yMdme282a1T
	 mEsRXu80INIjfTCW/pFnn8M+ItOA7lLyg0IfLVGPVmB7ffSEq3/JxR0QwRwYD8JD/G
	 +IsGS+L7Wmc03IwMA2+7hsincWKX5Q4h4U6DOax6KwmReTYmwoyBWlzT4ecRLH1nlJ
	 UEeioVBF/3XvCM6b6tBKUvWTuyuqJ1wrQnV99uoGujDZ7kS+RacVjMkrkhApypPE71
	 TG3/YGsR5s09bW5RA/hHZRVMRvOp+hW9vXwsXJ6Xb7jNjJqkCQ7C92V96DQgje/EWf
	 jKACfVdro1BUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3451138111DD;
	Sun,  6 Jul 2025 19:03:36 +0000 (UTC)
Subject: Re: [GIT PULL] x86/urgent for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250706081406.GAaGowTkzWYi80KpDY@fat_crate.local>
References: <20250706081406.GAaGowTkzWYi80KpDY@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250706081406.GAaGowTkzWYi80KpDY@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc5
X-PR-Tracked-Commit-Id: 52e1a03e6cf61ae165f59f41c44394a653a0a788
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5fc2e891a5badbcb585850995c609be78bd73006
Message-Id: <175182861462.2712443.4959043371934951027.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jul 2025 19:03:34 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Jul 2025 10:14:06 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5fc2e891a5badbcb585850995c609be78bd73006

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
