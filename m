Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D6F2B2CF
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743375823; cv=none; b=r9qrRovyRN/PbFlF5difE2jMuyJZGXeF9wT0Rf4NCDAdFi6FrQKUoGR1U2GcfpvD1nk/6e1j14XtrZxxYNx5DYLXc0CGyiwYsGJg2QhC2B7+S38Tp4nJou4fmGr/O7GTRbQS6JaBZFjoV927lzEIVy0klYk/ssr6WbEpgq2Rbw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743375823; c=relaxed/simple;
	bh=HXei9vWTUyZS4o3fkNGW6aVpeepVfMkB4i1TC9nXrBo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=P45bIXJW/deRmCMRe0mVr4eO1nIB1c65yMilbIuNRuLPX2J1Stwq6kOHffgHs0xtpznTasjHiannjwmtVkejuXZvsc4CAkgs74TDiflxEqPJPeMmCjiCJSWLd29pETVj9nrz4vA2NQMsn0QNeeZsdrf0qLnuz4ZK216Ntc0vBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NB9EERte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NB9EERte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A781C4CEEA;
	Sun, 30 Mar 2025 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743375823;
	bh=HXei9vWTUyZS4o3fkNGW6aVpeepVfMkB4i1TC9nXrBo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NB9EERte0b2BPLK9vvYc0ptRBLEwLRZI+1iyC0vamipBudXnPgjrx66B0HNC9rjpV
	 e+kotwKpB+schc6/sjc3mpSde9+SIQycPhzxg3MBbOgUL07NpV12wfLN4sth3kXv/O
	 tyHtTNjF65oj4x2PAARyFUrE0DtB6bjemcCxy99OBZeQoBSG9EiIk8b+YKkFKAbCvj
	 GkCz5CuOBRPlZnC0WvKk4rNjQ3b4f18o7LLkirrEmVqk51/+twZIBB9zkRTZ+XJy4m
	 9aHa42BFlr4KEFb2NGhZ96IBWaDOe5F6KhBUB3vFzI3TFLheamPtpMMAm6ymD9k4eP
	 I8vvX3B9DW3jA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB213380AA7B;
	Sun, 30 Mar 2025 23:04:20 +0000 (UTC)
Subject: Re: [GIT PULL] locking fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-cPCnVX5oBwlug1@gmail.com>
References: <Z-cPCnVX5oBwlug1@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-cPCnVX5oBwlug1@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2025-03-28
X-PR-Tracked-Commit-Id: 495f53d5cca0f939eaed9dca90b67e7e6fb0e30c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b4c5c57c2d8d00c982b3620f8c95d5cd468e16e9
Message-Id: <174337585950.3614380.2817547191522712112.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 23:04:19 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 22:05:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2025-03-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b4c5c57c2d8d00c982b3620f8c95d5cd468e16e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
