Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5889218ACC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745604082; cv=none; b=MofCVW5h2DlzJ/hVa8Sp/NojoaEGWqvoyFygJP7U0aMtZ2FnSwY6ZwWnkER6dAz5f3tiCVxamZjndGZV9YzTO6oTyoheFOmOpoIpY1f/+fo8R51VRLpGko0ohVRNO3fraHOPnUAi48Dpd3x8+hlyfpj6c5gGsAYu4QGowpKFrGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745604082; c=relaxed/simple;
	bh=lnkynJGR1JZPtEqQLqnB+7Z/VE6Z2nALsfoqOOSe4iA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BQXmskr2X+dsVnzCHpLuh0AVUSWHdy2ZfjNdaoWPs/R1vLkHnxUQCmlCQZmsO1qr2izWXiUGRPXP5iULBqy12y59AaJccPVAcjvVvV77aJFbLHDZCgZM6hQMNsaznAy+AMgpc/eCTG28+sqFOcFPbnaILFxgwgIzm1jAjbKgAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWupkh+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWupkh+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4581CC4CEED;
	Fri, 25 Apr 2025 18:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745604079;
	bh=lnkynJGR1JZPtEqQLqnB+7Z/VE6Z2nALsfoqOOSe4iA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lWupkh+9UTU7lCzgGoiVzRbg/hT4h8CnN8hWolxi7vIQqwNtHOqK/WbvtvZPzP7wf
	 vbeYp4Z2MSVH90xvyKKsdKPsfM5J8UeH5mlfNOZuHGn+J6o5u7fst0aAdtuOupUkw7
	 dYKc50nYTGOZ6sZv4NCffM4DuHOE78d7J2BywL+uYm7WBFiaNu6SL5W7qWcTRBXmVS
	 FRwRq0oksrID69uheaKatP3mJA83mFwpFy/5bZGeYXIC+0G6wUHeuDCfmmVA7hyxFc
	 GRANxNuAhS8QMmFt0wYj+ozZobdiGZmK7o7dJ1LeiflXdOu8WLcaKG9aTg0kDi9Yf4
	 T2jgwZ+XwwFFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C4F380CFD7;
	Fri, 25 Apr 2025 18:01:59 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc driver fixes for 6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAuSqCDdwHmRt4QZ@kroah.com>
References: <aAuSqCDdwHmRt4QZ@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAuSqCDdwHmRt4QZ@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc4
X-PR-Tracked-Commit-Id: 4d239f447f96bd2cb646f89431e9db186c1ccfd4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5281c656d9742acd056d099cc14c482a99628456
Message-Id: <174560411780.3790119.13566301581800788408.pr-tracker-bot@kernel.org>
Date: Fri, 25 Apr 2025 18:01:57 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 25 Apr 2025 15:48:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5281c656d9742acd056d099cc14c482a99628456

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
