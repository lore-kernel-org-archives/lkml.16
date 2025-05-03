Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD425D552;
	Sat,  3 May 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746291145; cv=none; b=uyOsRK//XxNJrbCbU1dO4IYoD4ZIoElhZt7f/tuwUThg8HNsQNs2xtpUwqD3rXGibNOPcA+j74a1XcEig3ttyqVLCGM2/UQdrrEXJWjYe5IImrm8pYaof88j26Ui3rK9izxBmwJ8V4C0Q6lrJxY8DQZnuKgQyQPmRHlodlNxrZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746291145; c=relaxed/simple;
	bh=tpc4GH54iwdCG1kX6W9PJFln72dxIlr1ZVzhWIyloKM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Dkw4b9det7uMf5nCQKuceM1G3cfsm73LTJcwGn23iS3ntjoaUeyvY1lFYqQUI0ekLJUm2HMuMwWQE7HPxSpRp9Nibd6PkJNQ5YdOgM1ay1GrqwbbqEYy+p8WJPTAh/gWiK8pUzvGQc4mdiutryo3Dm9y9f8tj+9cOmTtugHK5u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2hP/7qJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2hP/7qJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5DCC4CEE3;
	Sat,  3 May 2025 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746291145;
	bh=tpc4GH54iwdCG1kX6W9PJFln72dxIlr1ZVzhWIyloKM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=c2hP/7qJcK1Tcf9V2YUw0PfvoucBG3+sGMn67QREh5AKtR2n3U0yObZEwSIQrt3Q7
	 u/5qNVc4y4H+Rl2quHwx7m347rIBqX7yhMkxPqlJF9iuipZemJKKoJm1y2hT8Vp6/Y
	 alTK3ghQb3XhF1hILoNfgp51QO9XGRpTZ469z9V2ytIPV6aWscFVpivfVqX3/0epGS
	 V23MK1lzrw4kfLzztbUk0Jge2g1et2Qdvt1M7FQ7kjTDbJeotMnMVM8cijNtf/0zIR
	 Tzgz552fDOw887qylkXlClMGP0Of1hGKiwKdK0Lp2hZblfIgn9E1yy81GaTX/HpT1E
	 nGD8L5oAAy2VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB304380DBE9;
	Sat,  3 May 2025 16:53:05 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bjs9ait1.wl-tiwai@suse.de>
References: <87bjs9ait1.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87bjs9ait1.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15-rc5
X-PR-Tracked-Commit-Id: 6e5bea1c93062a43bc0435ae6cd589448094edaa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a239ffbebb59fb5b3e95725dd1d99634180494f
Message-Id: <174629118450.3894060.7314073265391240744.pr-tracker-bot@kernel.org>
Date: Sat, 03 May 2025 16:53:04 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 03 May 2025 16:08:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a239ffbebb59fb5b3e95725dd1d99634180494f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
