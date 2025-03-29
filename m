Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7011DFDA5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 21:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743285114; cv=none; b=Bpo7gh/cgEAqHwa4ZDOcnEJhnTeRwiPZxVrUEQegEdHxNUDI9cQLgvQXN1Rykf7smNJFi/XQPOky00ooIJdhfBeI1f3mCc0h93yILm+qKQbOYSr6ODEN15nU0PbJdbqHdvu3iZOqRC9rvKnNWkYGBgz+El+QWcjMDwk3ZmR8vIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743285114; c=relaxed/simple;
	bh=+UlLuiFGIH6/K+eYpX9Mvanx1wCLHmWfhBJn+JMGbCo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=r7LxP2vCOpdAIccrHMZeuKLvR384FTEbsEqLHsSx/9UKFxODuPu5jgKON0kHwJiVjcr3QBSq3gVa/7mQoKkXo5zGMoau1G9PxcQ0NTC/hkIVvd+hd2RLaiQR65JsquwT7c38G4SRhJqRkKnaNrvVbLjVQNv7kIRZBgVZZqLru+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVNJzNQc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVNJzNQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4904C4CEE2;
	Sat, 29 Mar 2025 21:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743285113;
	bh=+UlLuiFGIH6/K+eYpX9Mvanx1wCLHmWfhBJn+JMGbCo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LVNJzNQc7yo62Q/vZkjHJ6Bwqvf1HlA/EDzBz58vRRNpF5Arh1EP/P1ZbgHR4kuLH
	 lFElZ3VLP1DTNx5O1HtjGXfPareacduJHQNOo8hsF+p8MGqCZBqLq7tkK5uVy1j0KF
	 jqTzRtdCi8qEFk8bV2w7kpW6gEY2IrA3GjkXjTeI7aeQzR5t528YUDcE2V6kpP6wGW
	 ueJ3xLU2WbLDcviPhiyYC3LZSD/0KxwEF75fLp/UwuSgm5ed8ZHnC7RZ5NVoX0msOQ
	 5aYo8J931Rhs5CsPzoJuv39mEkL7VAs/bjROlq/4RNQ3Yhi4VaQTvlMedqAtKK5hoD
	 Y2iKqO5BmHFfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF79380AAFA;
	Sat, 29 Mar 2025 21:52:31 +0000 (UTC)
Subject: Re: [GIT PULL] MFD for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328140937.GA7190@google.com>
References: <20250328140937.GA7190@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328140937.GA7190@google.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-next-6.15
X-PR-Tracked-Commit-Id: a8d1376568619d5b7fb867929b01eeaa59bb9097
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dcab75a3c8a3b136781a6d8d088afdca974291ae
Message-Id: <174328515034.3286170.2522418816676509325.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 21:52:30 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 14:09:37 +0000:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-next-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dcab75a3c8a3b136781a6d8d088afdca974291ae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
