Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581CB2868B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745010884; cv=none; b=RVcua4AUEc2XckliRRgZoj/KF705Thrx8+1W/gR9b0JTogpboO0YvkiXV9a6HxotVUyNrpw/mdKlSD1HSjaPGwC5fQZv1CTxGKPt/GZwU16PMt27jn7Y8ntfk3+QrfPGvN0BO+6rNr9jye0j2m5hlGkLSOGYPRp9MjidPfh3sdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745010884; c=relaxed/simple;
	bh=p2l0NExqPK9c7a/1nybN7qZ/hCfxQqXexZD16bSp9zE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=H54zhYmPgGAqE+EuDHAMZNvrnFGRgHBKf9d/2VYMl4ZJJIvhve6oiwsRbSQFIgH1YNi0GyxPAWNNzpnZqwajsxs5Of31lb7srePum0Vv5lAMoW0fbBa7M9haxdcO09VuYnueXjGBhKa2CTE3My6xP59Kn9hlQjc4M2L6bBIBpJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wq27tqJg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq27tqJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3FEC4CEE2;
	Fri, 18 Apr 2025 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745010883;
	bh=p2l0NExqPK9c7a/1nybN7qZ/hCfxQqXexZD16bSp9zE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wq27tqJgFE73iKYfly049cPROT0s7/MhnFVh4F67sqDwV4WwesKiq6jelKNEPDSFl
	 PzpelcvYcifbaM/8k/Ib5SRF7vXTBpKcAaFC2UUwlt8ZHWsJJns4XwwIXryAB+VcYV
	 a99jQBl/5Es2i4oFaiImR5xqR1myNprybPF6n8yCq3ASH3rRIqgU7GV2nagk5vQfVO
	 BubWvP6YJuSXkIcvMKD5MwTiNr0FuMOCVr2cRomlm7lHSAbrLicHNUMoJ3hoYbMjiV
	 ySA3C/qUu+eaoxr47deiXDKMrc6OI3BszzwA1JeWJKPIUNYZKzb3v+i6Jv8meNSTBk
	 Htq7KdkjynxcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F0D3822E09;
	Fri, 18 Apr 2025 21:15:23 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAK1klVICYVVm8IJ@gmail.com>
References: <aAK1klVICYVVm8IJ@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAK1klVICYVVm8IJ@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-18
X-PR-Tracked-Commit-Id: 9b3ae50cb902322a2b5922b9fcf8132d9b4c2a24
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b0c3bc35a54939eaf4fc5efa3200994d82cab1e7
Message-Id: <174501092168.328197.9255503372670297926.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 21:15:21 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 22:26:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b0c3bc35a54939eaf4fc5efa3200994d82cab1e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
