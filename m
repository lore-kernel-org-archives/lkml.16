Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B71233128
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008050; cv=none; b=dtg0Yr9ubJ6mpT8cQSVdZu658nA/79glSHv5s308tkc44uCIveoT9fdTy7xqTDrvGLxulwqdSIOB8MFQeyNIrezOOHUknnHhxPGd7OgT4A/wn2Q+tqiy0nEuw3lNWySKn+1uMJ/Q++lW5ZzrlPUIz/Zp2umXdFuYlDyyZs2cTYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008050; c=relaxed/simple;
	bh=UwICu4pD1DUPAL3W3TTTjj3fAPZ3z9yvP7OFHr44eJI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CBYsNl0ltdG+kWaolvzyVg4L3+pL2WFyiLIPfVK+RR+lAzW4bAp0vf3h9Jq9KnZxUwxTUkR2yNezwG0tOlJx4HWc+2z3/zu2TC1fGOO/Bw5ZhfXR+DK5GA3pHaHvNd4MKMaJnf4SmscbWrDAfJwUAbhts/BFfsekACKvmQoHKiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gl5RuDWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gl5RuDWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84255C4CEE2;
	Fri, 18 Apr 2025 20:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008050;
	bh=UwICu4pD1DUPAL3W3TTTjj3fAPZ3z9yvP7OFHr44eJI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gl5RuDWUojIKoLj5TdCYI2YaiMsJYMOJ8/R/QtwEt6SRCSe4gi4+uunSOmvd+yEiv
	 s9+NQgeJLPbSzYr4sJLt4H0BND5mK/FNZVFml4hFggjYQJho8pYXiscZMj5B4eEqaP
	 tH/a9HM2y+Ug1HOFOo3SqB2qjoRKkaV8TaPAL4uS7tAyoWSIj8vHYNjCC5us+zBuAm
	 S4yLAlBXdvhjXemhnbARJEYXQDn141gq2zlagV8lOs05gynHKyqO5rwXffMKvUD1Q6
	 SzLy7EoNtxAwd8K7AoiUJ711AcRh7ndxofhSxxbcCYb1yvb6qA6dAKLM4ODzcjV8DR
	 G4SraPxLc8m3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF843822E09;
	Fri, 18 Apr 2025 20:28:09 +0000 (UTC)
Subject: Re: [GIT PULL] core/urgent fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAKzo5Bmkp3BSqsO@gmail.com>
References: <aAKzo5Bmkp3BSqsO@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAKzo5Bmkp3BSqsO@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2025-04-18
X-PR-Tracked-Commit-Id: 1013f5636fd808569c1f4c40a58a4efc70713a28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 84aca3ca6a42dade09d05a541c8aaab5ea228087
Message-Id: <174500808846.316726.7937771514984300900.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 20:28:08 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 22:18:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-urgent-2025-04-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/84aca3ca6a42dade09d05a541c8aaab5ea228087

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
