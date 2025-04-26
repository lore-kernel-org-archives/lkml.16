Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C3C25CC62
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745687118; cv=none; b=BRsig1EYwXUIW0ET9VxzRFFkrNqSuWDN/mTb1+B8Dy0wwhosNsLC2fMRVY/4XrC9ErysijZ39Gh3G3ICN1+SeWCtWS8LDjcK1TqZPkNxZ//bi0PDV7DZSzV72XBBBpbxv3e9H8+D+qGvQpvlTd6pJV+H0cW4fb7BPbdrFZqL/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745687118; c=relaxed/simple;
	bh=0bNplQjzhaKq/OUO4Phpkhshrb623VnIwXh3I+csURI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bPHX5w7s5Wq6exISKoxiDQbsYAKbheqxcQKGujmTNCymGA0cog5gQPwOsY2V7xf1bT4D6dz0H7gIQeTu3jZ8Cl+Xhr7sv5IzwpokcWRyRPuht3gv18NeqssoR4hN04tnTEPpkybrkqS9Uu7nJ9l1FmvYAtzoDmNYfTnt71Tosmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oT9etCUV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oT9etCUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9503C4CEE2;
	Sat, 26 Apr 2025 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745687118;
	bh=0bNplQjzhaKq/OUO4Phpkhshrb623VnIwXh3I+csURI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oT9etCUV5/5TpaZyR82Dcu/E177afL2bVjpdPgAwUK446c1lDdbzL/6C5cQ4y/kDI
	 S3edOEAG/42G4l6tOouxCn+nBrmh8L1M/dJByCA7J4mGwAojTxspaetVgkQUEBnse2
	 EPts/oJbHQMKdBMz+tH1cP9yb2HdhfKu/Znqsa/DrpLd/vGx+nzaUcgNZdN2TvrMIs
	 feP3RPwix/luRAe7OdC8P0H7K8VmFWTC6MRGFLRozx1SqBmryjy3j1wLqlF71eo+uF
	 yjjcMEy+2SPFwfg0kvnkfbAGdLMMwHpt0rMw9zBIpohm+MmQA2ZQT2/cgyk+5kQ6eM
	 1IdCiGfe0qmJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDF638111CC;
	Sat, 26 Apr 2025 17:05:58 +0000 (UTC)
Subject: Re: [GIT PULL] move-lib-kunit fix for v6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <202504252302.665FB14F3@keescook>
References: <202504252302.665FB14F3@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202504252302.665FB14F3@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/move-lib-kunit-v6.15-rc4
X-PR-Tracked-Commit-Id: 4ea404fdbc39971814cd3eb36b43c11fb6f32e17
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a16ebe51a6a55fdeee12f60fa8b31a740c6af029
Message-Id: <174568715738.4031081.6645802990167064871.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:05:57 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 25 Apr 2025 23:03:54 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/move-lib-kunit-v6.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a16ebe51a6a55fdeee12f60fa8b31a740c6af029

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
