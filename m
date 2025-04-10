Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57216214A6E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325492; cv=none; b=palzM1E+ejWE1WvqDFy4c03iTdZ+wGHZGRm0y+xHpBkOgXLyU/i3td4EEQReLrABV/7WZCsZtEcRZLNioFjHsx05ZVaoOjAXtxOMlaXwptjdwI1sE9GOny/eDfe4VM/Y7tnpiCVHmx0kLUUOw6ZrwC3js6sOJPELhGkOmhmJevk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325492; c=relaxed/simple;
	bh=JTcjEDnQNmYt5UFqWP/0T6d1uaNMkKxGwfHJo4UDWJ4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CeDE672lNiKjiYoX4AQUIM+EHbqO9hjYYfB1k4jp8M2B5Jk8wM+epItVt0DKAazpP+8nnveV40HTAvXpQaX5iY1MwgEft+9Fn4rwhHCb4uhUkGVGSrpWISSXhskz3GWy4TMGA3tOmNrJ7oL61rJj46Gf7oQivJWl9bnaN99eHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsQ1v/8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsQ1v/8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D58C4CEE7;
	Thu, 10 Apr 2025 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744325491;
	bh=JTcjEDnQNmYt5UFqWP/0T6d1uaNMkKxGwfHJo4UDWJ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DsQ1v/8Q52CEWPd72y3/EgPjDnERCcXGjZnRrbZYfL1blOCuiH8+qNUBOAPvBDL4c
	 5LC62DYRfyIPOcy5KwGavWPjDjSnyAfijaB5etttpXowSseLjHGJuIlBzuMfanROOw
	 UtEQUDnHyAey16CcnHvz2DRii71kQYQSqCZ77e3bONC451A2qUmj+KJyCcitqROKcV
	 0l0T+Ng+dXefvFN+H30qhm/PIR49Wb5+g+iaTRjGlBTaxBqLGX1D6BFYqArqY00baC
	 wvN8kR8lTWbg4wjwep99Jydiiyr7WvZRdlrOvzfVtQsxPPNKHSUWbwhOqV5a/0BnoX
	 +7JDABUHSsXkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71031380CEF4;
	Thu, 10 Apr 2025 22:52:10 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_g6bUBRCqegcA86@gmail.com>
References: <Z_g6bUBRCqegcA86@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_g6bUBRCqegcA86@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-10
X-PR-Tracked-Commit-Id: f35508b93a2fc127a8d185da2e5beade2f789977
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c7cae12f67c4c5fd232cffb27023deb409e1e20
Message-Id: <174432552913.3849546.4568051397320572364.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 22:52:09 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Apr 2025 23:38:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c7cae12f67c4c5fd232cffb27023deb409e1e20

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
