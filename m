Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA3E1F4192
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616073; cv=none; b=IVQysoTMWcIHrbjoo1n0a5DwPxra4OG8KpoufbnU1un9OfGVd0JDMQB8jHHJlWElsDfaaLZAVMMrbn3wqY3DiCddx6ra1grLlZAwS2gYU6bi+tcNG8/v827gmknHCpz9eM7r38sIeJ0pazP05/eVJGPX0Jkr9KT8yxTwbbuSPiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616073; c=relaxed/simple;
	bh=VC6lRj/ky6J5JiVuX+2mb/DmNYOivvVobSwKp0qAoRM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tvYmaSEdPy8t1bq6csCtvaOuZL5LCJZhAlAj43wjQsqLuxHbtfm5oPUxpMwU/uN1r76/anDXvsV0F+y8bdkbyGU/0S5h5A+8S5B+dzc0yUYEwBU3tntbpgvzEJIeUbkY+hMr5eK0rfi6jAzBtag8aStLrCmlkotBuJQiAL80sU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwYjNnmd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwYjNnmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC85C4CEDD;
	Wed,  2 Apr 2025 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743616073;
	bh=VC6lRj/ky6J5JiVuX+2mb/DmNYOivvVobSwKp0qAoRM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nwYjNnmdt0mROTxS9uHa51MiDyMZlrxGGSJs7VJOUn/axmxT3gIE/7hHFGJglCj4A
	 ewAcYpEZ7qEjCMWAldvLVRO/jSFNxDJ+I6e2RGagvU+djZrrl0o9KHcI1uHCqqdXWT
	 D2/CF7jneA9MUfpMpbbXkrlxtIb0g2yx/noabT5SVBEf+P2m4aaa337zO48ynbJY4o
	 6j8mrWWA9OrFTrgSvkjevn8DPxCxp5By45xeRxvO6hjVONq7+Jsbu3fz/C7+FlCjhn
	 RXW6Ef4epgqj+Ehjwuh3tnya7MiRTzqVJ0p690e5pF2xmf9h/AXb28zMYR/cxt6mXb
	 3aoXv7LJNvk5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD04380DBDE;
	Wed,  2 Apr 2025 17:48:31 +0000 (UTC)
Subject: Re: [GIT PULL] kgdb changes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-qURoU3mrfusdBv@aspen.lan>
References: <Z-qURoU3mrfusdBv@aspen.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-qURoU3mrfusdBv@aspen.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git/ tags/kgdb-6.15-rc1
X-PR-Tracked-Commit-Id: afdbe49276accb87a0c7414e75864c78289ece2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 002dcfd05740801ab30f88350de47e47c916af1c
Message-Id: <174361611036.1617726.7196565882027861980.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 17:48:30 +0000
To: Daniel Thompson <danielt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Thorsten Blum <thorsten.blum@linux.dev>, Nir Lichtman <nir@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Mar 2025 14:10:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git/ tags/kgdb-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/002dcfd05740801ab30f88350de47e47c916af1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
