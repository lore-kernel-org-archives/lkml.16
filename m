Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0E41A3176
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288689; cv=none; b=CN83XrTLHBOwS7XwW/2UUaBUjVwifok85kmITonCiNna1V5x+kMm5lC9STF9gvZGqd8zZjDCAUjAyfCXFj/gnDjDHEF1bjV/xBF2JgmosIR4RRSqLmO9Pjjxyhc9Qq/KtUXsCXl65uSjGWlMfPz/8rE8YAviiKVOY6VRBpItptE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288689; c=relaxed/simple;
	bh=bFpUR1Sgqh1yF9p53ReMpQ2d0cLckMbw5v/o2KQzd6k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MyYKSvkat64GH2hS2q08ljB7Rvzj64Fa0FppahL6T3CAGuCi+k5ulUh5YYkW0J8jqTkMluIB/gJsfCljo4vQr4SwTWxKYn/5XIHYkkFSqfBC9m5rojicSxMTCbwSgSN25+6/NEpu2Uo5WcszBrMevRdjYX1H7HxfMZm8rjYnUzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caEOkvCJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caEOkvCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9B6C4CEEF;
	Tue, 22 Apr 2025 02:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288688;
	bh=bFpUR1Sgqh1yF9p53ReMpQ2d0cLckMbw5v/o2KQzd6k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=caEOkvCJriHFaIBDe2wxSF255zXh44jcMChTY0dhGe/elIwb4DRdd+zkak0EK1jfq
	 QtkIvfV2Fn8Xdk/tWG+F/p/oGpglbZk3G+Aa2CQaJDbYgj9G4tmeVAUwqbjX/3p0HC
	 Pacsp8yGOF1R8e0XFQWX8kEcYPMBRfqK+Pd0SHO9g1igFOJo5xBxIUmYoaj3JpPuBk
	 61yC7MX0WQN7UOKl8YMmgAhQ5OI24AcvmzvmoNY4YqwhUcNvqQM8yqcX5lcO8Gcewm
	 h6jLCWUQV4cYJfIaYYvVDq4+buK8qUl71IEZo5TC4YslFezFF+43JMikbwpxFtPX29
	 BXcyAZvChivEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAECC39D60B4;
	Tue, 22 Apr 2025 02:25:27 +0000 (UTC)
Subject: Re: [GIT PULL] sched_ext: Fixes for v6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAaea_h3ORZGmkxp@slm.duckdns.org>
References: <aAaea_h3ORZGmkxp@slm.duckdns.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAaea_h3ORZGmkxp@slm.duckdns.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc3-fixes
X-PR-Tracked-Commit-Id: bc08b15b54b8aadbc8a8f413271c07a3f4bead87
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a33b5a08cbbdd7aadff95f40cbb45ab86841679e
Message-Id: <174528872663.1361490.9779596779126363871.pr-tracker-bot@kernel.org>
Date: Tue, 22 Apr 2025 02:25:26 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 21 Apr 2025 09:37:15 -1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a33b5a08cbbdd7aadff95f40cbb45ab86841679e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
