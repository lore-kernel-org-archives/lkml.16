Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A0227FD4C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364579; cv=none; b=ergNKoKmb27LoRLAg3ELTfmjP6g2M3xkbLLfR/ZamEaARx/ph+dVr5KBeaLFXa14e8JwK+G1nKIph1qTJFWcWgEh6OSqKKSFV6FQTUMDyhXv02EmhK4jTIs3ndZpp1PczfNBDwXHkMxRlxpRhn25mY4cDmVv+Rl2sgDOq3Z5owk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364579; c=relaxed/simple;
	bh=EYR6wXr0J9XyC0VKBus/SAT4e+GJ4jYmqIS4vEbg66k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BS6pdX2Wtd82FJ9bfZLnit6WQgfujAQy8aoiuGHngjegm9bF+hiYFns4Dv36n+Uc9pgM5SLeiFprZep99hcohIQQGlRqYtal0oI+UckWqO1M1GC949hB/Scr8hKrnrqzqdgqjQWIcjHYPo1wcFOLBQj7CNtGwyIqLFPxL/F+C4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gtw/RsoF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gtw/RsoF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E6CC4CEF2;
	Tue, 27 May 2025 16:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748364579;
	bh=EYR6wXr0J9XyC0VKBus/SAT4e+GJ4jYmqIS4vEbg66k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Gtw/RsoFWLysId9e6SAAlLARIP6BzxAypvfYIj0BGZDkYL/9Wy1tGCFBJ6J5mtxfk
	 CGYi9AyJFb+AUyF3ZfTQNt5buzt3Q1hDxmZq+toE2sMgg64MT7tBp1eJYpDAEFuNRR
	 t9JTDezXq0uOOhBUVaZsKgguuMcrabBdZoRXSwP0BSrKhp2QFBknO8+hCsy2SfWFWJ
	 fKCi/NewqE76SeRw2NHvOe+vOlR9Dzp+9gclD9J5tKyIUGdCRoseyMoY4Dj6BSM0nn
	 hdv9S+gjKqF00ydj3992w2RonCjONjVk8bqIcJPq9wYvifpSnmhbH6uxnKuTKE5qM1
	 nJFCHN7T8ro1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB10A380AAE2;
	Tue, 27 May 2025 16:50:14 +0000 (UTC)
Subject: Re: [GIT pull] timers/cleanups for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820638145.238682.8805997132124221883.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820638145.238682.8805997132124221883.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820638145.238682.8805997132124221883.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-2025-05-25
X-PR-Tracked-Commit-Id: aad823aa3a7d675a8d0de478a04307f63e3725db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e8bbb2caa4e679c8e3d4815ed8515d825af6fab
Message-Id: <174836461352.1706669.3614263235835640417.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 16:50:13 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:45 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e8bbb2caa4e679c8e3d4815ed8515d825af6fab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
