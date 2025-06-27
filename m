Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0C2E1C7A;
	Fri, 27 Jun 2025 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041729; cv=none; b=jcVjTevYTw+kBlqL+M1oxl39qpsEsLISBpQyRwhxOjkojGVkOajX3OSVKsd7bj5WIMZhaJgwS4ZAOhB6nsb4+PXgApQUhvI0gRhZBx1zT6vJInE5ANwptj+HJTxxqDDU3UAvX6naVQTa5ZdP6+uTy3Q12SQk0pC1fKydEEHTL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041729; c=relaxed/simple;
	bh=Y+sHuP3TZ25eLYB9wuz2sLFvBrGLnOYqqeGeIc01tOo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bmQ3uhvG6Hl6bKN067TPZNt9eVpOdC4Bv0WZ57LECEl3dBzN240BjGSfPR+v48gfxoXUMHAdWk+8VshTwPSvcXM5yYy0qVyTGCaBk8NUdrCNR3sLAc/JutQLAtj9wb2x3VPiZZx5DhE9P7yJKwiBD+MntN+LmclgzwtfiODF5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wo7arsMf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wo7arsMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F226C4CEE3;
	Fri, 27 Jun 2025 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751041729;
	bh=Y+sHuP3TZ25eLYB9wuz2sLFvBrGLnOYqqeGeIc01tOo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wo7arsMfiF03nJF10I2rtxqlgPx8/A0uzIjrXOiJ822kzVov08ivG7mXa6xnsnt+x
	 iizVPJ6QUUDWlNi4hcttGwzfPsHWqskMF/15MORgVGYkf8ktQWnZDAY6EVf4h/phh3
	 7WXCGhKRwF25sq/lX7AJoiz4e/9JJ55z1H/sY0YgNN+X3lRQBkkloFCEAOA3tagMbG
	 pcwtXpBB7FiTSYIeIm47ul/N1ndX/rpL3VfT5xG1cm4S0p7x28Re8BhD1sKcz8NyWo
	 35mZDHYVyVgeX3mjijT9eat9tPgXoS3j/+x/J0bUqPhozZpbGnYm4k8+flBjTNBmgW
	 SgBF1WffY230g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F48380DBEE;
	Fri, 27 Jun 2025 16:29:16 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <87tt41hajp.wl-tiwai@suse.de>
References: <87tt41hajp.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87tt41hajp.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc4
X-PR-Tracked-Commit-Id: 7ab6847a03229e73bb7c58ca397630f699e79b53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c2f970518c900821acdac47bbd681b99a325e3d
Message-Id: <175104175496.1986529.11010617079882674684.pr-tracker-bot@kernel.org>
Date: Fri, 27 Jun 2025 16:29:14 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 27 Jun 2025 10:07:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c2f970518c900821acdac47bbd681b99a325e3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
