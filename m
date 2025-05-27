Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA9280012
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364581; cv=none; b=ePw7SuHWVhU5f3d06kOFqgsVH1x4A16gjmZTv70uVReyxUSvsBTWQwp0lRnpR7Su+1HPgt5LZX87qk9mdmyQCAQE44rtCRZdOApou7GYKq4XpKpOHtHzI7IjvcRiyHqz3RGHOv+mDChc38Ox2aozw17n2fKPeQAJq1g7iczEBg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364581; c=relaxed/simple;
	bh=bgjPKbaO2eqTOUC+VYP4g/UfuQiUrr3JHElDaH1m3xo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oicAmCnHNTGf1sTVv5swPAYOF8gCviu2HYX1k1TmQvpFK07kOzFjPaU23pj1J5n6scR0iYxpZmq4EWOoEAn5zjrOz62TWGcLfK0QYgg6+UC8cgphX+hmxWTQN/mjUjj9eWBKsLIVpc6Eec+zPbyeEZ5I+EO8RfpyHdJ5f5/bR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5KC5Y+E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5KC5Y+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317D3C4CEEB;
	Tue, 27 May 2025 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748364581;
	bh=bgjPKbaO2eqTOUC+VYP4g/UfuQiUrr3JHElDaH1m3xo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f5KC5Y+EpcRJAv3oR0PMC1m5goWh/b4s1m33fgSv69vmTeQDhsJ8O98G6rmrVd832
	 FXDQDzqYf8AR/mp0pmYX2/5vCy04Hvy4ygPJUNV+ZqKJuV3SMaTowIelQ6ToY2/LmH
	 L+89pjDbiBgDxkvs+RKatthRsBP8ZBtHft1GCebgSj24vooUCVwv9zNuiscCdHrqn6
	 vAgKosid6F3wJtHSg8ygAMHS5LfGg429ga9PuycGUOz8hDt/PQ1sGPL4oV27uQIyn7
	 qEQU09I0HeKrwoDZfX7lygx0Gek4+yItxd9Z9bMoMZx9KbvzlYSOe/CtMcWkWXc9I2
	 SP4kayxcZCOLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE5C0380AAE2;
	Tue, 27 May 2025 16:50:16 +0000 (UTC)
Subject: Re: [GIT pull] timers/clocksource for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820638317.238682.3878315364921093216.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820638317.238682.3878315364921093216.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820638317.238682.3878315364921093216.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksource-2025-05-25
X-PR-Tracked-Commit-Id: 29857e6f4e30b475e0713fc7a65a962745c429ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6376c0770656f3bdf7f411faf068371b6932aeca
Message-Id: <174836461538.1706669.6719815260770088670.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 16:50:15 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:47 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksource-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6376c0770656f3bdf7f411faf068371b6932aeca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
