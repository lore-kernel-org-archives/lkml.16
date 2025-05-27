Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5577D1FB3
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322177; cv=none; b=CpRItAe4XpaLrvKVF4+ZV27QbXtJGsjA40INn7cyUEXVnF2lPeS+I5HEELjWgVQtFbtEjnwssoFqLoHLTyKdFySspk6x/naX3IaQkm5gahTlQJGRCo5OtaXXQHH9IU6eYypS6x/A48mEqglLd5URsONo9F13U3GwEG1FxRqIaNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322177; c=relaxed/simple;
	bh=cL2eGJtkpBRWa3Gn6TxVx1dk2jXN044NPrk/oah/vR0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B8xtniWDHltKscEKFbTAshc2GncFFzFSIB99VtlCXcPP9zd4MRDqMBotI7ppG9G8XaqHHhqejoJyWx960bt6oUpxOY5lFi71Xrd+8WlzGp59AYFSjpH+lphcnRODnmkINXwl4tbN5nTV8JDPtVXTErJ7fv6h43C9s5cMqllyZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q82BYBF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q82BYBF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E32C4CEEB;
	Tue, 27 May 2025 05:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748322176;
	bh=cL2eGJtkpBRWa3Gn6TxVx1dk2jXN044NPrk/oah/vR0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q82BYBF8Z6Pd7xjAK8IV3s+mmgMxOC+pDwkCtCbeydX7ODDIKDe1jZB30VxkR0Zhr
	 pwyDsK0JA2B8RdZm7cHhxbLeZc2kRjZgKnfrKoS6MbguB9cY34cTjx0Do0xPCMX0gv
	 7oECFLJxtSqWF5d+jAAFOYt66K6sz4Ld6PPs8O+qB8tK3qsfOBd8zvjjWautfgcO0t
	 t94z3MDYdSBLfRJ7VuAxKyORGM+M8oMA6ppwBKfKE+pqLgrfKfZmepfF3p94OtwQWh
	 +19TZa/CNr0ROHKDGPFOFTRf05kayobT6wDEAoMJCkMMBD1CQvzjkFCVcdDZd5D8aD
	 tRnhs70MCdysw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FC5380AAE2;
	Tue, 27 May 2025 05:03:32 +0000 (UTC)
Subject: Re: [GIT PULL] x86/cleanups for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDL4ytA2gUlF2kaB@gmail.com>
References: <aDL4ytA2gUlF2kaB@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDL4ytA2gUlF2kaB@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-cleanups-2025-05-25
X-PR-Tracked-Commit-Id: f449bf98b7b63702e86155fe5fa3c853c3bf1fda
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 020fca04c689b0405899c8532e1d8748e49a2152
Message-Id: <174832221108.1158362.10341744625805128471.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 05:03:31 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 13:02:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-cleanups-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/020fca04c689b0405899c8532e1d8748e49a2152

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
