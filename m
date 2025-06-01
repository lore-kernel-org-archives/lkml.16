Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D74F9C1
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748806328; cv=none; b=rwx/eM3cOn0K/yHA7yfvXErmL8zQCVDzIWnjLWN4+cOFCgXarH5FhsbB27V7s6PJZbZ/9SPreNirkikna4gAKoJIW/mAzOidB4FA/hZUBFYDBiE6vLGfttUltCaREGsZowqz38/O4V+uZJ/KPVEJsYGFf8EDoyBGG+/zw0qQOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748806328; c=relaxed/simple;
	bh=gpvzqNklNb8nCNrLYT2pUjeONmaSUhjAguqAQr+N9k8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DlX1XFQkqLTqUjUZeHTHddf3JI3vU3OHmjd+rkEOsX6oV3bcoVbnjyfWaAbVH6UgYZMlTTne5SnQYmYGfclUaxRmhxPLXt1SOV9Z/jOyLf1QlULkAuejPI64Itqqwu34h2kmsyzfTQMBDWVsBFQ9mbI6hdeAt02lisZsSNGjNog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/V7yqIx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/V7yqIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D938BC4CEE7;
	Sun,  1 Jun 2025 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748806327;
	bh=gpvzqNklNb8nCNrLYT2pUjeONmaSUhjAguqAQr+N9k8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=M/V7yqIxyS4UPlSjGPwjpiz+tgGipEBaNK2czNFMnDjqE715ix0rpqPFq41mKYieh
	 1pGT3JybbQpkOw/eVu9ZdAN8I3os30pSoGRjhcaG6E3qko+zfTMDDtuCiC9Os2nj6R
	 OXG2S6LH0OP6vCk1KLZ9cR+m07g5mcgVmAvgSKpE7iYu3QzSnSt3cs9PFkP7Ejbwky
	 cZmADn6KBUb3+MBt58fZPPEVValcT/iRQKchvD0UfgzQR5xNKblxUpzllMvHwcfJhL
	 5jme3J8J1aI30VB2HZIA8wituSzBXbU5MicR/QKHL+dWpwZoMnuOLxG+CWwBvjxLCP
	 8PeqPmSM1gIJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2BA380AA7C;
	Sun,  1 Jun 2025 19:32:41 +0000 (UTC)
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1 (take 2)
From: pr-tracker-bot@kernel.org
In-Reply-To: <202506010901.522039FEAC@keescook>
References: <202506010901.522039FEAC@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202506010901.522039FEAC@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.16-rc1-fix1-take2
X-PR-Tracked-Commit-Id: f39f18f3c3531aa802b58a20d39d96e82eb96c14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd2e103d57e5615f9bb027d772f93b9efd567224
Message-Id: <174880636043.488739.8459408347229112041.pr-tracker-bot@kernel.org>
Date: Sun, 01 Jun 2025 19:32:40 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, Kees Cook <kees@kernel.org>, kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Jun 2025 09:34:02 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.16-rc1-fix1-take2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd2e103d57e5615f9bb027d772f93b9efd567224

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
