Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCCD1C6FFE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537878; cv=none; b=bVwbaJqWIgmiY3ie0XaSPSj6mCteHrmz8pQqz8Qzp6fwWwmxhzPVTuapzyaYbqUiPSr8GnWVmZ1dFyI6+/mJ8+zR1noWKh+XDhEcswpdUPlL0QLj0XKP8YUYcVMkk2pAGgXEL+v2pxhgFiFVuGTuSghpS2Usp69wbdInEvkR91Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537878; c=relaxed/simple;
	bh=nmTQ/U+e1ualafmlTthk+Q5oH1ma24B7jO7hZrsGe/U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HRXSAGlUuFjfcsd9P1kVS33T5pxsK9Ao3mV5K3yNQZWE+Hw3CG5i9OIh9D9pYhiakYhgczX6JQP3kxtFdZFz5Nc6mZHGbB3Yia3/bU6HIwgoq+BNKtokOn1qY47DV+7zrlGAom0w6oLdv70qn01H3UYnIWceRv7dhX/G4kVU9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrLErfIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrLErfIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F142C4CEE4;
	Tue,  1 Apr 2025 20:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743537878;
	bh=nmTQ/U+e1ualafmlTthk+Q5oH1ma24B7jO7hZrsGe/U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jrLErfIfr4cUTwKBVE1tx/jBA3U18TwUjJlzzSAVr1tQVJ32tW4Yr78G9XJFvG4Mw
	 qrioYj8thvjFhQbavdZZbp723Enc67Q3iv3d6/e29HrfcReM1aioaVgHm+vbb1Hg+v
	 jQnsnG1CfmLZIxdciDSMEwrX4Mca7xOHDd/PBHlFuEe9HwTUzkaIoqurSj2HcdBz2K
	 Y55tZp38D+o9DpDSLGE53V5jiHTk9g1lMuKQ8VQ88+SjmPRaOSt4xGWN+RIJu/17A5
	 j71pKKm5AyS9IzUaCSqj1ixG2aZDsElNKnEODe1vP8AifbahKnILigQ5ogl+sITSPc
	 2Nep4QXY4BaRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3426F380AA66;
	Tue,  1 Apr 2025 20:05:16 +0000 (UTC)
Subject: Re: [GIT PULL]: soundwire subsystem updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z+pFD/OXH3Nnt6gS@vaman>
References: <Z+pFD/OXH3Nnt6gS@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z+pFD/OXH3Nnt6gS@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.15-rc1
X-PR-Tracked-Commit-Id: 08ae0d61c3d79bb5d52ae30ad4fc12442e966a23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d31167e844bac8be7587781c52af450b6451f01
Message-Id: <174353791472.898575.17819178994556240558.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 20:05:14 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Mar 2025 13:02:31 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d31167e844bac8be7587781c52af450b6451f01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
