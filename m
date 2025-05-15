Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C300725C6F7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332873; cv=none; b=Z9geepWAW0pxpsOlihskTtQYtgQtjOaw9A5r+uTx0zqHUzbQqwO9DsYyHdz0fFKGenpgARJvsV6yTEaM5iDiLtyJOaplA/8P/Lz12ujS8rEMSb0U6s9DLzc/AzNs4v2RcZBfsx7cozrCS/VOuVzKuuc3Yw6x9/rFVbtdEmr6CPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332873; c=relaxed/simple;
	bh=VYeU6qPsYu6HjzI8Yk3UV6tP3FBzyeKXxEuAf7Ol7c4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TK5h3adBb+sbfvgkAtGfycyFau5GBktokyujmu09RyA3YV+Pdo0wgs6LuQY5/i407icVxxDeTwU0ouTzEtGGH+UwcgAU6tKT9cqQM3Vc8b0kq9mvdpmwCQFZQFemT1U6rXa5AWfrlRDZn1kEw3HqUbX5Kw9+Iwj3OsXuRslpxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKiZ+72p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKiZ+72p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1458C4CEE7;
	Thu, 15 May 2025 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747332873;
	bh=VYeU6qPsYu6HjzI8Yk3UV6tP3FBzyeKXxEuAf7Ol7c4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kKiZ+72p5q7+kxC27FnNBZrk6QOxOZ7u5V8kXPerA5tFgUFc7DtrKx/J0pDh/vCqi
	 z6VzC3342CUgJ3dzF89eE4f0mU4JkgZenaXOydOp4Y8O8nDkFgB6KekmfMQEaWM8F5
	 AXz6Wk+f34M3CrCWjpk/j6sqE97rohWXx2cCagDz/PrI9mUzzb/F3ARI/xR/ZIAu23
	 7sn6Bu0SIx35GouDtHq+IVNPGiGxCmM5W6aI65FapW9afUCIOgdqGl7o15PMlG8Ywg
	 J0z9RKygRUJPUZI240U998u2VeRg3GXr+0Mflsf7pf5JDmRRZrcSz/zcZLy1zZQ30e
	 86HYUXQj7nk7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADCF3806659;
	Thu, 15 May 2025 18:15:11 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <regsgbllbtki5tyqbk3evkergys42lnuvle4t4t3rtnnogi7ki@ezutqcj2p4bu>
References: <regsgbllbtki5tyqbk3evkergys42lnuvle4t4t3rtnnogi7ki@ezutqcj2p4bu>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <regsgbllbtki5tyqbk3evkergys42lnuvle4t4t3rtnnogi7ki@ezutqcj2p4bu>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025051501
X-PR-Tracked-Commit-Id: 578e1b96fad7402ff7e9c7648c8f1ad0225147c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe661d01ab40eb4d1e7c6a8ace699901e6aef77b
Message-Id: <174733291062.3202874.3482955857332801727.pr-tracker-bot@kernel.org>
Date: Thu, 15 May 2025 18:15:10 +0000
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 15 May 2025 18:15:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025051501

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe661d01ab40eb4d1e7c6a8ace699901e6aef77b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
