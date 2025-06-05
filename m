Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF69F2750E9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139884; cv=none; b=fELd5HS8D5V8vWDu9Xy1dnt5oE0hsekzjrhXfffta0mskKE/EIiwE6R/4mkJUCRmawpTSluK+ewI62QU2fBeW/r2O8S9UZipD3DQX5yLLBjwePA1Od9TgQU1rH2kzE+lOFPUUbCH1Wga83yvPhcrot+SYso/GnS9P16WjmBn6Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139884; c=relaxed/simple;
	bh=VlfhNu/hltTmKvUkYsnmA7mgnrjV1endx2l59yUhb7Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BnlJ0Pw7QFQyCQDIVGu0U+1e9jX4+mFv/Qhzbr6M+sWl0QC8wz1vD/7mfhma83FqoZXFToZRYAi5SKh1bpkK9hV0ZGCPC6R73VYi9S4Snjf/wEGzPkv21Qnm6pd9bDyBHPLEMtO95OLbZZ77fWMlJMZZarQ5ViAvafeTrH7Ud0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rwEZfPxD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rwEZfPxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE30FC4CEE7;
	Thu,  5 Jun 2025 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749139883;
	bh=VlfhNu/hltTmKvUkYsnmA7mgnrjV1endx2l59yUhb7Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rwEZfPxD0uVZVVHndVyTQKm0Os7yzQcqGITn/Y/jlUL7XLolgVLmMHMl7vngniYmd
	 qdBoNA/jAvldT9ExxoFn7Tb0TqBlV9Hdwyt0jKn0e1k2OkzPzrk2R4SN2FjwEzcztO
	 4XUN/DC4OZjsyL2r7oZgTYyRbBPG/X17+bhNry6Ar6fq5qDf5Lfjtpt4pLe5CpgFvu
	 iVWkdpQe0RBnMoZftK38TfHJa7baguYsM0azRZ3VaDCe5fMO23ArLera0j3SGcLH5k
	 hK2WfiyV2q+4qtfEySD9gdR/kDhoS9x6dssLZvtNuKhUu+CsN8/6gvWg4xB29yW3es
	 AbOoCXUaIqy9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0C38111D9;
	Thu,  5 Jun 2025 16:11:56 +0000 (UTC)
Subject: Re: [GIT PULL]: dmaengine updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEE+za1ox/mlTs1D@vaman>
References: <aEE+za1ox/mlTs1D@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEE+za1ox/mlTs1D@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-6.16-rc1
X-PR-Tracked-Commit-Id: 3c018bf5a0ee3abe8d579d6a0dda616c3858d7b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bfdf35c5dc6267f70f76abddfacface4dd3b9ac0
Message-Id: <174913991541.3131347.10016375536745630134.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 16:11:55 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 5 Jun 2025 12:23:01 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bfdf35c5dc6267f70f76abddfacface4dd3b9ac0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
