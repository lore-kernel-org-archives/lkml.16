Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B420012B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 19:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747511881; cv=none; b=Uk37wGreZfFZ1YucUwpGoEwxTUFiZUDmrcIdvyKu5kwCHspCMn+oGI72HMQJ1j4GhBK7ITvkr/B54jLhP+m2xvh78Bvf0pV0KbYwr9+L58YcasEuTDmlNFZi1egQXTewMEap25SM8itGghnC51pY4YsYiNacmqEncuMszm0fZUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747511881; c=relaxed/simple;
	bh=I6HXvyuOeoy7LX2MxiWA5f/OhKX1Mv15AufzlHT9Occ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=f6FIPoXhhOBjih/ax3Ls7zwPpVZ2l4BbPIMHscPKfzqtx4eiPr5dArA+vWL8m3/x9Y3lt8JMLKEPOJF2JJvxAbMbRdiFCNB0Xv+1IovIgocs79aqO9N+b6a4eiyB+OyJiOOEhold5qdQcGGQi6rOVjVcBSKpoXWBZ/DLb+ClerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrJQV3PV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrJQV3PV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21695C4CEE3;
	Sat, 17 May 2025 19:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747511881;
	bh=I6HXvyuOeoy7LX2MxiWA5f/OhKX1Mv15AufzlHT9Occ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BrJQV3PVhA0pCygblV+hdDBtFql62WsZ2+dig5J48VptH9Oq0TMCLCL2zs0qR0Chg
	 nm8Mj5cdl4y9n5+HbrqRZfeghtuCmy7t3wNBnGAxr9Di5WQ10iMYMv1EeMsy98KmmQ
	 mugfeZ1u1b8LMuFArxQVg5sXPFONqcWeEwRHoOf+CbCuEMVjfaQio4uYLdfl1QQUEY
	 PsKSD8Kr5Q4PhocU8kN8BbCQTp622ivPZfRoyKCSlo7eGqQffFZRQjv3LTjA0Rbg0/
	 UFxeioMAOjAqYOaOf0L9nQr9rtdvOUYlC3mTpDASUNbV48yKKDGqqH9xqsFE872Bbb
	 KCwya07JEHxzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD49380DBE1;
	Sat, 17 May 2025 19:58:38 +0000 (UTC)
Subject: Re: [GIT PULL]: dmaengine fixes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCi+BteelekIQK07@vaman>
References: <aCi+BteelekIQK07@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCi+BteelekIQK07@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-fix-6.15
X-PR-Tracked-Commit-Id: 811d6a923b40fc130f91abf49151f57cf9ac2a6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5723cc3450bccf7f98f227b9723b5c9f6b3af1c5
Message-Id: <174751191758.138654.18269930869818346090.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 19:58:37 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 17:49:10 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-fix-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5723cc3450bccf7f98f227b9723b5c9f6b3af1c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
