Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6417B50A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748392202; cv=none; b=qsVrzzd35GKJbStZhAnjdpPBjlU8FH+zXXVPF3t0RL5dbYknw7Crlx7U3H9QgTj+gC9vxWN30+6VCuI24rsD8FyeETe/sou9NYWL1FB71rttH1ha6U+nflEzORvqjc+IwZfGdIkRT0K8fYHOkeT6tTaHY+D1jXY0mQigN6scYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748392202; c=relaxed/simple;
	bh=IvcGAhjhityj059H/fy91SvEKaTqOQ+POEHivVkXffA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X5M2byp5drGT+2pQwa3jdCvfwM11zW17lVyKQoWNInj2KrP4rp4DPDEp+Lf12qgFGicEziCyWP1IaxjTwgGF3IPhLM16pwgGHHKbcChRj0DHOlfILHpSC561LlJqqMKNgPctZLfEpdc8nM7jH5lJSTmlYvSiElK3Ppm14OUoH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sVOE+ZNT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sVOE+ZNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDF3C4CEE9;
	Wed, 28 May 2025 00:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748392201;
	bh=IvcGAhjhityj059H/fy91SvEKaTqOQ+POEHivVkXffA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sVOE+ZNTZWYTI/4HQdprKFP1HYB7mfXgx5+AanNcGGOHdtIdGIYAACaioI8Nr+WrW
	 FnD/3vLfqLBr9P8gBuzPA4MwGrisR0nOK42joOyGDLsDt6m5iDdbMIsnvBKgxLLodQ
	 +ow7vmDHgvQ5JLaRCjD6uUnIZNtM5X264Jq2G+rI5LRyFI9pr0dTE0qpm84ZdanZRi
	 Cjbo1izoFQxmB0WoN6yRBA/xGwf3Kh814N6LKEOTwToKJrr1pvqRPPdoAVWF/aPEwq
	 7cv5bgE+NzGonXkUCuAvWX1DHap2E8DivE7yqna/Bb3coxCxZ3BiW6MS8rDsOO/UAx
	 7CML4PjHl/2pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEC7380AAE2;
	Wed, 28 May 2025 00:30:36 +0000 (UTC)
Subject: Re: [GIT PULL] regmap updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <4d6be2993d367094dcf8e574ee49b317.broonie@kernel.org>
References: <4d6be2993d367094dcf8e574ee49b317.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <4d6be2993d367094dcf8e574ee49b317.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.16
X-PR-Tracked-Commit-Id: 1c12fbdf40e17df2efc24bf2009a0c3bfa75bfa7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c971f11dbf1bff3d1226b92015302326c7c292c3
Message-Id: <174839223554.1837704.9892110148814959465.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 00:30:35 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 11:29:47 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c971f11dbf1bff3d1226b92015302326c7c292c3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
