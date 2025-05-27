Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DB41EA91
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364577; cv=none; b=i6rMjV2f6HOZsmlpgQEZ1GuEODvf7VfWNj9XXQevpU4ClM31GT6HQyiPPFphZJBESQg+EkpggU3lmVl1KnGG5NZV6eVuD3CKDYoGQAoEL9cwlBt1AK2M61fAatDmOiUQHIX/f3K6QQe9EKGfP2VYlHLEuwCCp6smSe9Rgjh/ByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364577; c=relaxed/simple;
	bh=FlyPYDtEeLZgRPzynSruJlfG774q08IDOlxwqGp7AtA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WQeagGgKAUZ2ERKtu3aQHvcxX/nnX6u6eCCkVpEe5Zx3bpMD5JNpjNFO3hnIQIZLul+cl7SDWNkSxIvJyHXw5golHjVn9CEmemjPR32uBSD/QXtWtwNiEQuxihbF6FgQn2IXv5C2wnCEMPdVhdy9LSFKWeNtzM1FBC80jwuc8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXw5GKmM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXw5GKmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DEBC4CEE9;
	Tue, 27 May 2025 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748364577;
	bh=FlyPYDtEeLZgRPzynSruJlfG774q08IDOlxwqGp7AtA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JXw5GKmMV3T0rQdf3hT6TM2dlS7vsNKLLtfi+XejXHa+lUSViGdbJxgDROILWTzif
	 i4RPAnJBTE1HuL6twr1pkhpAUCx5uNth0+tm/keK9zmeQpJdwI3Myy3r98dkfixg5F
	 mSJdX2EA5rKK2W8LHrFdYtt2HXIsIuCXOtkAA9s3bjCzRHZ2t2PLoN7ZY2+h3k7Spv
	 7KNtYTh09FGRgmxr6oTTiSbGxGhiNo3vQrY8TJL6t3+yi/kZUEVPT6i1x46oclWShW
	 ToACg0T2cbTGlDyqAtAQDM9c+55K0udt4MlA+ZTaV64Fx1oNhUO3TkDXdgNIlP4DZE
	 F/2wlNZwFCB/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342D1380AAE2;
	Tue, 27 May 2025 16:50:13 +0000 (UTC)
Subject: Re: [GIT pull] timers/core for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820638487.238682.10229943723869983974.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820638487.238682.10229943723869983974.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820638487.238682.10229943723869983974.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-core-2025-05-25
X-PR-Tracked-Commit-Id: 6c58d2791d6046727d87db50a5e46644f195dcf9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1456f6dc167f7f101746e495bede2bac3d0e19f
Message-Id: <174836461185.1706669.16597143923882188005.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 16:50:11 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:49 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-core-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1456f6dc167f7f101746e495bede2bac3d0e19f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
