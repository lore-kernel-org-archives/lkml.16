Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E22BD01E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751828593; cv=none; b=XN57fqLoyhr7yNTyCUgA/5a3HAs1AM/m0AxAYZs1gMlu43kG3kfwfmB3ODSqy5x1HWTuA/Nbyh7owyKQPDYM0oc685LQjW7e3jM28Zn2BkUOs3gI5WTp/jmNRfc/nbtcpcJpXQbMlawwPCuklpTHxGrw0tfnax60yXMWTtIRNiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751828593; c=relaxed/simple;
	bh=xjPQhYpYe7HXmUmFVMz3p4PxUa1qFpEBS+Cpu8Zlieo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Oi/TPSYL8VB+b3xZojtbIrdTWFa7SMJATzMbrvZjpGOhJlNayZCV6ENty61I57oUQbVCv7F1IPZC75wbqnr9VVKNcpPS6O2GA6OaJIk2AVDrcBpSot6e7/83Lea9goyEAnnlPaNse2kxUUwuS3/ZoNGaduIksWM+cgL7g6+325Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DepgZJxh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DepgZJxh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08008C4CEED;
	Sun,  6 Jul 2025 19:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751828593;
	bh=xjPQhYpYe7HXmUmFVMz3p4PxUa1qFpEBS+Cpu8Zlieo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DepgZJxhJXYXZ9H1+W9lHRN0+ZeH+rMg4dDnmBgdBATZRGshp/uW/pY2p4y7n8zvb
	 nBYWMJ18pOB0yVoVFMwS/DipAVY+hzRhVui1FNl1qa3wpY0Lhc0+cvmIFYTNGwFPaT
	 /hXN1rW1P/n1KUmSBMLNI5lJVBfJWkczCL3qSkxU0EnoRx/lmZbM2lY22ZN13+ibIo
	 zrW2dpyQ+jjc3Vhl0Uk0p2hAJdt8Lvtpgq64pRD/2ksRaz6NvfgG8oB0Ur1GnTokLP
	 YWHU463hiXiOTV1mMFuUsSeX0Lv2BRff4VlynTH97ci2yWjO96Ra5g/gbX1f8M3IYL
	 OqfzW4bQ/uldw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC9338111DD;
	Sun,  6 Jul 2025 19:03:37 +0000 (UTC)
Subject: Re: [GIT PULL] objtool/urgent for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250706081531.GAaGowowWdZ55HmbWt@fat_crate.local>
References: <20250706081531.GAaGowowWdZ55HmbWt@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250706081531.GAaGowowWdZ55HmbWt@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/objtool_urgent_for_v6.16_rc5
X-PR-Tracked-Commit-Id: ccdd09e0fc0d5ce6dfc8360f0c88da9a5045b6ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95eb0d389b4a518a2630b18fbc5916a008f519f1
Message-Id: <175182861638.2712443.12427337517571289481.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jul 2025 19:03:36 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Jul 2025 10:15:31 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/objtool_urgent_for_v6.16_rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95eb0d389b4a518a2630b18fbc5916a008f519f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
