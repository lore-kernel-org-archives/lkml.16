Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B841E0E0A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743285115; cv=none; b=lpW+CGee3Yi/60d0LCv0jPeA1YIPLe6uFNHriDqQGcC+EFTHPwEvn30u1dZVLG3sCyGlzsIHhqJvCjgDrfSkcZ0Dy/SvGEq+e/NDpOQIiOot7LPwskn/E37vbk9CzuzHE2yjuJodVJ0ZvFP/fl/EaelHew9V4iMD/AkATwXk7Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743285115; c=relaxed/simple;
	bh=BppG+13qzWVEERAM4Nr+QJ4JVNbU6q/bJq77YzhVbiw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZZeIcLLSnL0g8LOtFlKB5AG11/0RJBGqmnv9eW1WR3+UX/dzl9oKVShp86id9oXQgYZMumoaKXBl+8hOEcQagN12ggBntdYdjDm4YtqYmxRNVvfHulDrIWXKVEsNpEQe1hE+xm9cwwhKcSq9x1rnlBOj8A/8hgqmI61fPTX43fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muNuQ5aM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muNuQ5aM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF9CC4CEE2;
	Sat, 29 Mar 2025 21:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743285115;
	bh=BppG+13qzWVEERAM4Nr+QJ4JVNbU6q/bJq77YzhVbiw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=muNuQ5aMHAT8+CozovPxF3pctfCJEspgyyVvP9CzdAJGPzA91lxk1Q++V4aTT11vM
	 rM1dwvQbnevd22F3ggZNM6FGQvE089Hxls28W1kY+eberStg5G9O3+hmado5vuBxGP
	 zbpnb+2uKGcNemsDuqzoWmgsvek/HdCy5WuLIk4Hznbf0aA+J8HghmMMq6NSyDzkBT
	 z+/3EvmUPfZGh5nk0mKgfT8KEWqUDpXTmsIPUQe7cGffNlddShv9SncVGEqnYLWPYT
	 DrPClyfNt9KL0/BGKdreZQ3GNqmY+rO9XjYBrIczBGrtumx+mkBgXxcpPnn++mr63f
	 lFLue8EEP30AA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3440D380AAFA;
	Sat, 29 Mar 2025 21:52:33 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328141050.GB7190@google.com>
References: <20250328141050.GB7190@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328141050.GB7190@google.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/leds-next-6.15
X-PR-Tracked-Commit-Id: 161e3bea8fa5ba34b2291e5cfeb3e533cf991613
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb9b4c34031f8271cf6d6eedd2606e3c4b5e91ad
Message-Id: <174328515186.3286170.14041862929128124362.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 21:52:31 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 14:10:50 +0000:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/leds-next-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb9b4c34031f8271cf6d6eedd2606e3c4b5e91ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
