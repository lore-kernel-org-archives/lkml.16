Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D321DF74E;
	Sat, 29 Mar 2025 19:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743278152; cv=none; b=hobzAQBYr3gRlI0HyDzonGApT+zwoDeEjRAzH+CUDWZ6zdJIf/f96vjW5DJHWEvivSc3VAhaWMLrhzAcaZlwiyLugBiXXZ5lr+OZKsBPOU9LxW1WKl25TEdtbHwcLg/GzQZQ5aQlkGg40ZSTI4mwK5Rff957tq5kfN338F++Jcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743278152; c=relaxed/simple;
	bh=puwSdO3LvqTx9sRg/DAaMWirKTOUK60gDzsiku6jIj4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FrSg9p5bg2T6QrfiwTCNCAmYgdQL93UmzFK/A9fJcfkhrn0fwNky2+6rSeEOClq+D6duE43lR+Uz7KH2tbxz36JisW65OaItB9KAOsdkoL+q1D8rSzORAgc5i377OVPEodwXG+N9R1QLVBkbfsSYeExC1prEEOIZrDODqUiUg/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiC6dugj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiC6dugj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C41C4CEE2;
	Sat, 29 Mar 2025 19:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743278152;
	bh=puwSdO3LvqTx9sRg/DAaMWirKTOUK60gDzsiku6jIj4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tiC6dugj6OI5oupxc9exU759SUy/sIgnDr/sX4nvuNLFWx0bDi+nEdf944w013P42
	 u6Xw2u5Lb1ir1FN4H0BMam+O62O8/bvNsKd/Dvl6gqytz+sIfqzuZdGaKX+skBABlz
	 kJRFBP77nRjPli9Yo/EtJYhV9NaLPnYKY18lyKeu1IgV3aSiyRwZ1Gm2d1feW1o6EU
	 T1VwTfyrR0tXWj5yWctY60kWsgow5dVfcpAViP/aJT7F8c2SDCoRYNWWZwmSsGuoYc
	 q1vBUK6Vs2lzVtDYNXQ0XjAUiuez54iLlRQ7ldfJsC8Rgwo+MTASlpmu3QGEaUPBsn
	 HHvfIMuFMXnzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34922380AAFA;
	Sat, 29 Mar 2025 19:56:30 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-fcI2QOldcZOi4f@p100>
References: <Z-fcI2QOldcZOi4f@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-fcI2QOldcZOi4f@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.15-rc1
X-PR-Tracked-Commit-Id: e822b8f01b40eb193cf7ebb059ac7c560a562d6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 883ab4e47c2b514696922243e1d84b7ac36f9d3c
Message-Id: <174327818888.3264055.3986632374977575867.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 19:56:28 +0000
To: Helge Deller <deller@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Mar 2025 12:40:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/883ab4e47c2b514696922243e1d84b7ac36f9d3c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
