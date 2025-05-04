Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B33B1D2F42
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746372146; cv=none; b=u1exK0rKFePrHk/nrrV658RjAimAtrS2ftwVck7zWYfE5/uerGA1i2L/z2bVFSBWc9AEAgudA8+zJvn88JHjnluBloxD2vv4pnG3lpzFqfMnKuDtV5XWG+WpcXTETyti0cQn+VIslCsE/Lj4ZssRRNLsqsRoIFY9eYbWl8rqGtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746372146; c=relaxed/simple;
	bh=Pef8bCuNaqtR6BmwtB7naFm+oENHg6duf9+NE2H0u2o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dVYunMahdetIbiAo5CqyLD9R4MiQxstcCEoJe3B+W8jTSEos4tyt1K53GeQSwat1BQFrkl4yHcB5Y+8Iq5CsKxMWge3umAmNY2jbWf+wntvmvrrRk+qa2LiCX70r1VOMX1JuoMNMwot2PlPPFiH0xZ9doRLE/5N4hQ1Mv1LuooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCRz3Lpt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCRz3Lpt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713B9C4CEE7;
	Sun,  4 May 2025 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746372145;
	bh=Pef8bCuNaqtR6BmwtB7naFm+oENHg6duf9+NE2H0u2o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nCRz3LptJf1lkjQScKvU8eNtnAUGHbHZtd9LIcJ4w3xJgad4EpmQb63BkxrND6A+n
	 vDvu+uZqBc/fDySHT64LSo7NqjnuPNBnS46aXJJ2nl/aQj4MWRLXcQs9aUoMbfoza6
	 nfJWpYJcilrdTEdIAf1S8YU9E2DXC7/rDcUlmwbk7gViFryYrQESBxIaTeUC9Gm0iA
	 TcvqKzK9m+K4JMMO5hJSmjpMiK9HJ1CxhvyS14L6fFZkGE3B4kLgu6EVtGybfys9BU
	 EnXFRDdcdPtAGEM1ZasgbdPYpoWQ/o0XsR7jFQ9ZeLDm74N5H7pRrlZ1MD5L6zshsO
	 YD6Cpu9juL2fw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0753806659;
	Sun,  4 May 2025 15:23:05 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aBcSbcZPNZjW89mn@gmail.com>
References: <aBcSbcZPNZjW89mn@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aBcSbcZPNZjW89mn@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-05-04
X-PR-Tracked-Commit-Id: 38a05c0b87833f5b188ae43b428b1f792df2b384
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5aac99c6b51cf38ef339b89600add9e508e7e2f9
Message-Id: <174637218461.4049463.15148797092520416653.pr-tracker-bot@kernel.org>
Date: Sun, 04 May 2025 15:23:04 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 May 2025 09:08:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-05-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5aac99c6b51cf38ef339b89600add9e508e7e2f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
