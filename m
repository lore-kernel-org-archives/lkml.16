Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0757A2441AF
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739053529; cv=none; b=g7sACor3tGGdoI3LEnm3JWqc4QGPaFPq8GnvY3+n69v1eDPKMmmwBiMyoakpVfE38L+penntpq9e2aMeBJAbyhDl4fPLaXF9DdSTxYbAEOSoRvEL/4rfwujQdxImgn/hCOTFsDYvPtoZAYznj1U0K1IC2hmLJk4bggQhXSU3ymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739053529; c=relaxed/simple;
	bh=vjPf7CYC+BzLBgFOFt8I3U+9FzGGUj/lrKKsgCnb/Ms=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TJuek+F0L+TpMCz6QjJBH/6vPdEQnCggYeLZqheAj+V82W2uKxuSCEmK5wm9za4k/2SfjZna55NBZ73pb2rQ+1qx3owFxRybdtK2WCJcqNVp04E6ft4AREM+Afqc/TZCOYa4IRV52YqPgZOp8RASEExWZ6dNUUDlMN9JRUkIfts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxMlgLcB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxMlgLcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8AAC4CED6;
	Sat,  8 Feb 2025 22:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739053528;
	bh=vjPf7CYC+BzLBgFOFt8I3U+9FzGGUj/lrKKsgCnb/Ms=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BxMlgLcBMPajDaW/g0r2s44p5lc0mxDpWtS1N7e45nYbwzuFIdzsR8RZc9LtfcljG
	 HUWlv/ARg7Q9bwOPiYLb+lPAgbfSigLGFicKvyrzlz3KysbfeFKkok6BWQGp0Tbm1p
	 OD2YSHsJ+wEFogcJ+Dw0z4R5ZNkI5os7kqfmrHzNdLZMqUWDQNWclmG7YCQLcNBpUt
	 Yce7S9Cyvew+kqA6NoY/1MUWBdfmHC7lXtYotqKklSrtsOoYZ7ZFkeTuFI0J8OFC8W
	 gqoIrZEUuUZTQwEQmd7tOgMmZl9yiUb7lAS8jdvwO+KbEYE5eDJIQykhKY0FvnMWmJ
	 lavOVpIfE6F5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC36380AAF5;
	Sat,  8 Feb 2025 22:25:57 +0000 (UTC)
Subject: Re: [GIT PULL] seccomp fix for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <202502081231.AC11AB4@keescook>
References: <202502081231.AC11AB4@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202502081231.AC11AB4@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v6.14-rc2
X-PR-Tracked-Commit-Id: c2debdb8544f415eaf9292a866d4073912eeb561
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4a45f14cf6902a96d9805ba51829054940ef3e7
Message-Id: <173905355662.2676587.11623375861490878458.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 22:25:56 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Eyal Birger <eyal.birger@gmail.com>, Kees Cook <kees@kernel.org>, Rafael Buchbinder <rafi@rbk.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 12:34:06 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/seccomp-v6.14-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4a45f14cf6902a96d9805ba51829054940ef3e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
