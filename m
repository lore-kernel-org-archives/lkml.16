Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C87211A1E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325488; cv=none; b=aWkqt/sdK/TzWHCppIKMbJfUXMlP4GOX5IabX7fF13bSFEvJYrXeHsBW1SapSkcI0C96mjz3nxEu1Ya3FYzxJ1weAQhMj1q5kPI0oTuZmn7wdPq6Y/VwbXcCfqyQFJkcTiYLeX2bPcqa99WrBi+Uqve5qxn4HVrXznDI7HbQ2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325488; c=relaxed/simple;
	bh=weh+v5Yq41JymIciqI1/Z4Lx0x+pAVCpzJ35su9qK8U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SJa0roTIKxlfzH+pXjaQOovnoh+zdDhT6LkqTu2XFG9zb1LtL2B5qKYN1hhtd8dNjxzC4In9v8nCbwXoGuWdmo3VamzlgRxEhR5mvf64sK/m12ExNx4EgsfyCBUC14kE29pVyNvtfJUvRdo5RK3mcm5BRZGrnzPZVCrKeN0gVVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfgXodLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfgXodLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287D9C4CEDD;
	Thu, 10 Apr 2025 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744325488;
	bh=weh+v5Yq41JymIciqI1/Z4Lx0x+pAVCpzJ35su9qK8U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cfgXodLbAiM6yIeH/KNp/WVCigSzHvxx+e9144ucas7FXfVUFhGW60SMeQnbPYGIZ
	 73utruLf9s5v6W4C/HSDbSkY0K7odjOP/dlcdI9f0OmECvI6ugS8RR5+3+u/3gvF6p
	 upSvaKsQGgqVQNddjgkM9AogBXKABFYIv26Tb10ugWWGccWrdRbyH+3taT1ax8RxyV
	 a/x256z/JD2CRtYI8Jy7BGTrrYFmaJYyumrYQ44sruqXSnFyRz7ifhIizaq17+5fgZ
	 I2ResC04VgkRW4sJh0/bPVDxr/ONEEkFIMITIuU1Qv3DRcnOxth91FHpXFM9fbVnTL
	 GQe/GS9wom9fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE38380CEF4;
	Thu, 10 Apr 2025 22:52:06 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_g3X7JyBQ1HdZTa@gmail.com>
References: <Z_g3X7JyBQ1HdZTa@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_g3X7JyBQ1HdZTa@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-10
X-PR-Tracked-Commit-Id: 1fac13956e9877483ece9d090a62239cdfe9deb7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c9de67dd37029cca1d0f391ff565b3809b40a1f
Message-Id: <174432552559.3849546.16233666512823024159.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 22:52:05 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Apr 2025 23:25:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c9de67dd37029cca1d0f391ff565b3809b40a1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
