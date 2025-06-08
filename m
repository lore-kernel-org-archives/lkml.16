Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DB91E7C16
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408789; cv=none; b=sAkiCX0hhAL4TJE/rRFdZ9v/zSfo+avfEjIWas/oeZAJGX6XxyDL0wH2NqcZ8TLPRshog3ZLGO4fhF+qDum/rI9s9hVQTaXPh6sxM36sfaq/KxLPSiX5UjCHPbuTW3Grg0p4S06Z0QKUxrnCkhmf4qofPLlKwdsYwdE8NEH+Z8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408789; c=relaxed/simple;
	bh=zq8lig5ccW0xtxtM/mrSbZCoyIYwAcnij9bmaTIJF4s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=L/32HnkOHsI+PKGx9qkka8eiH0NAdrUEENWfmc9Ff6kJWMNaPk+0mw0n8AkWtF8bSrHQxs9haFyvJVkhNbvSQTQhwbfQdXjRSdqMcT4qHaL32vhvvT9nVvL4+vC0iQ3EsV6JHVvrVu43MZWO20GuW4voAEctkHTHNxQSJovGU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyrsJSex; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyrsJSex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9B7C4AF0B;
	Sun,  8 Jun 2025 18:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749408789;
	bh=zq8lig5ccW0xtxtM/mrSbZCoyIYwAcnij9bmaTIJF4s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MyrsJSexQb7XuOOwYTgvpJ3ohxxNFZFXoC+4L5gOXI8x4lmAtRX20eW5VVswsFJCh
	 +fEu2Br+y+zTY2QQ2uX30i10lJOr3tbdToqaTFJ9k/MA2enAw1l1RM5CBBVQxWJKmQ
	 sYnvq6bZzHjXgdOmjiGkbuSHF2vq0+m3Kr6I8p+rmrDiEoWjKDCau0w+xK2/iPa9km
	 HMZ0jNaPHnyK4yquD0IqQEEV25GT1tzs7YtHv1vAp6U0DvmC2V4WRtO93evWVML5Kc
	 bcPjm+pnCmxS3L3+sU2hFuLGiPfglHt7L2erz/e1XPK+OSzkoC3999wjeOf/gU5TVz
	 H5vJ+En8bTptQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C81380AAE2;
	Sun,  8 Jun 2025 18:53:41 +0000 (UTC)
Subject: Re: [GIT pull] timers/cleanups for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174936765117.749406.13346468046512826474.tglx@xen13>
References: <174936764731.749406.17114868218275391074.tglx@xen13> <174936765117.749406.13346468046512826474.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174936765117.749406.13346468046512826474.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-2025-06-08
X-PR-Tracked-Commit-Id: 41cb08555c4164996d67c78b3bf1c658075b75f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be54f8c558027a218423134dd9b8c7c46d92204a
Message-Id: <174940882003.385950.892989699399951784.pr-tracker-bot@kernel.org>
Date: Sun, 08 Jun 2025 18:53:40 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  8 Jun 2025 09:28:11 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-2025-06-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be54f8c558027a218423134dd9b8c7c46d92204a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
