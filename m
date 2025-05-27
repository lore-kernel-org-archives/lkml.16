Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D011F03D6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322182; cv=none; b=DS5J9eiNgyTG59h5Dm12Yf6ybFu01ADRm1644q01r2mD0/mpWxIcFmJkluiUcD4OoE9R9DMBt/6dnxsTF5lUKaV0pR/nFza5xpZqTvusRndc8p+ijgFj2SL3vzhQ/ZzIELi19fc4PdKKXFrApYO3LsgPwwKqQ4OaMw5+ud3T21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322182; c=relaxed/simple;
	bh=+I9yc5pHojOSglwP6U2xDa5XNNYF+T9TcVUcCy99XQI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iU77tCEQ7OwSB1fFl08E+8yV8cCao61B7N+ZFfiO04t9Nual3Q3abdb+8fEO2WJr89WRKO3Mou57IIJQ4VBl609A7PwN0Xyojm8sAN9CNRZuwjyZCfXa1J7o8KcNzIbCnocRqoPP3V6xfaOmgKaOuf0KLgD6AY1et1NuMTvF27o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SV2OXEPG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SV2OXEPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26277C4CEEA;
	Tue, 27 May 2025 05:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748322182;
	bh=+I9yc5pHojOSglwP6U2xDa5XNNYF+T9TcVUcCy99XQI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SV2OXEPGoRTDY0IlVReQryrW9k7q33ZDscNbxry/TPSUnSk+sa75cfBO9P3+SHBct
	 Tnsu3QieC7MESHeixSrBqnCazZeC9FYDYk8uDqLNaGSflFNRKQgKBMeKLRRJqEQ7pk
	 TkW5GoXsCEAcCvXNKBPte0/fCiODqZNWEijAIp4Zj+O5RIk212MeD8V8yeJYghc5BT
	 4yVWScXbUWY1wE3YdieQ3H/EfJlYPQ3Uzr/rCGVR4OLv32IlEfRzlAwFaD5UYxc0NV
	 OO+3U03jAN61+UeAwPcfGPlnlFIwrNOjQeJeOjBuYSD/xPN0K0B8bECM3bTGcRYn6O
	 +VS4HRK/ydE9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF46D380AAE2;
	Tue, 27 May 2025 05:03:37 +0000 (UTC)
Subject: Re: [GIT PULL] x86/build changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDL66Kw0auSQQrs-@gmail.com>
References: <aDL66Kw0auSQQrs-@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDL66Kw0auSQQrs-@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-build-2025-05-25
X-PR-Tracked-Commit-Id: ad9b861824ac55d81431815fffaaff5e981badc1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 914873bc7df913db988284876c16257e6ab772c6
Message-Id: <174832221626.1158362.16445899744080918480.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 05:03:36 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 13:11:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-build-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/914873bc7df913db988284876c16257e6ab772c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
