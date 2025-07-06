Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D95264FBD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751828590; cv=none; b=qY/kF36VnfNDPbASEITSeYYXwWaGmsa6RuvP/K812GwMmfSvY9u2TU9A/VIRnCogFSnzr8TGbkbDCViVJgtNohH4J6c5GXI/L6/+HApco/1euPwLHrB+qZXK7I9xiEIs6huqJEC4HcJWX1JTRlHr6SPzWtxl/aF+uDgFKHB7C5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751828590; c=relaxed/simple;
	bh=e7ZGJsfLOiuqNa+Ja80floNBceFd33gLQjKJwgcWyt0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GSKzNIu2LhZHU36aKoi6QAZKFucwlpt9yZyuACxKxS4iLlNBUjleaiax5nMapdM6OVLr+luXnnYZTCq9g2YMwCCzvcDNaoQR81fniYOW0AH9Iz7xtgflFW9gcsJN70aBFQCI1tgP096trwCfMUAHf0+s/r3CaxOjYOXvJ6p6gT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvcLli9A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvcLli9A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDA7C4CEED;
	Sun,  6 Jul 2025 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751828589;
	bh=e7ZGJsfLOiuqNa+Ja80floNBceFd33gLQjKJwgcWyt0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JvcLli9AcukQBzeYj4zUSlC2z5ucLZx8vadONxI863h9EltyoeI1Lp1DFVYaKKtIg
	 iJxs3MqxcHOSjUk6/gi4/pHvGXpBr8bVZbFxqSDGi1Cy3xbUVJ6g5UvrhE6qwswbAl
	 cKAEzt02jOS3B8foYnBNTEkFDFQnSjqaUDjRHKwZJXVm5/0AG3o8Zc5m0R4X2pKFNO
	 IIKRA1915HL8vgnKI/gybMKZrUhctqhHMGQc3IjOY30ayxQJKSJV1sC75et24OxMN5
	 uP7dWcRZnfupCPXhBDtCwh69N3Q+vQo1uLdQQdkjhh6iBHdcmKYRlBmXeVnOfKFNBL
	 AEWUWQEFNJ7/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C1838111DD;
	Sun,  6 Jul 2025 19:03:34 +0000 (UTC)
Subject: Re: [GIT PULL] irq/urgent for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250706081121.GAaGovqQfWt7K3CIL4@fat_crate.local>
References: <20250706081121.GAaGovqQfWt7K3CIL4@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250706081121.GAaGovqQfWt7K3CIL4@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/irq_urgent_for_v6.16_rc5
X-PR-Tracked-Commit-Id: eb2c93e7028b4c9fe4761734d65ee40712d1c242
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45a3f1254638523869fc2ba067713f4d467e5145
Message-Id: <175182861312.2712443.1625493562274417810.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jul 2025 19:03:33 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Jul 2025 10:11:21 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/irq_urgent_for_v6.16_rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45a3f1254638523869fc2ba067713f4d467e5145

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
