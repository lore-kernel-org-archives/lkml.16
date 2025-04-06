Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48491EEE6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743961970; cv=none; b=SBabxuSvtyabkMpVsXIB4HdiKUAC0Qq7N20G/pIfbkTXQBGzkU2U///3U1ix22vGuiYcfxOyy2BHnzGbMaFEAlo/QeFDHWPV6X/n5/7s7cL8+XSAH3qObJAwWrV7XF4P1nhKMC2/xSL6FR0+FN/NKAvPYve/L3aPy1P5HJ98RaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743961970; c=relaxed/simple;
	bh=sOcA1ovFYXYXSYCUalfmRSnbcv4wtgXOGcfLMBETtvE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KJ4tVz6crolX2J8/xEAW9trGfHwvV600hQ7Yo+/PI3Rzup0st3op58jV7prszri8MAF289qZehe21PKBiMuIHIG/9ZLZcXUXsTQ7qX3tko7RSjP0pBQqwhzkyRhKHp9CEC0GSYBu0N4gjswY9kSVF6EH7B8vZawzf2zZu7Bm0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDRnryPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDRnryPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808E5C4CEE3;
	Sun,  6 Apr 2025 17:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743961970;
	bh=sOcA1ovFYXYXSYCUalfmRSnbcv4wtgXOGcfLMBETtvE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uDRnryPi5C+8khTifxaPWKNHQFDezhgEZLxEm4Q8+j/3jzDlOzOvZWSJAockpNJj5
	 GWsviEdpzd1/yVPgzv3q+6rtFuCxpH+A1Jy/BtlinCj0qxlCFhU4CdLvNMQrOrHP07
	 NhrDtWAWrv/cpSs1ej5IsTc5cika//h/OaTJ0ChemUvOurhKTSdLxVjv+BJ7fmwtsg
	 lGNn2PhygiFHIQOSRMDDK5s+J/V0IwD/VFAH6s+EEviOY0rAQ5faS327xaPI2p/RLR
	 IC/81BLdOBaX1bsFvrUwmvFv86Lq3W4ye9MVFZYRWTtzxeyoNkJ1mPW3J7ggZN6neW
	 KzY2cf+g/fcjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7AD380AAF5;
	Sun,  6 Apr 2025 17:53:28 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_Kx5hEaGkrLgyLf@gmail.com>
References: <Z_Kx5hEaGkrLgyLf@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_Kx5hEaGkrLgyLf@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-04-06
X-PR-Tracked-Commit-Id: 169eae7711ea4b745e2d33d53e7b88689b10e1a0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 302deb109d6c1674073d8dd4156ca0f36889a7b7
Message-Id: <174396200758.3925571.15637851119070222598.pr-tracker-bot@kernel.org>
Date: Sun, 06 Apr 2025 17:53:27 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Apr 2025 18:55:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-04-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/302deb109d6c1674073d8dd4156ca0f36889a7b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
