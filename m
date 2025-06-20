Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D872E8E17;
	Fri, 20 Jun 2025 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440563; cv=none; b=lkUpHIkxaUguoO11ZAKcVSEDDd08Wdxjj64yS05hHpaq9XWNDwQPddKiNKyRRAOO2TIxk41nj97FZ2gXL9qQTKUNEP6Ztu/KWVSPJqPe9A//RrTC+0exMBkvFKt8dHeAQHxIfUHpIVm7BZGbi6Vc3PV/UKrQSaiKJ1ywGFzg40Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440563; c=relaxed/simple;
	bh=nheFR1/5CshCcQvlT8lp2j5NZecOPxHnfuyX38UhI+M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=C5gnN3IHDNBltJYI2A/nkg7CQ4HGUu8w+mAopWUjhUAuvEQQ2FpLMzM6vXqCsv3v+FwEi+h1ZEQ/O4AKnoDlmQiEmrLVm9aokS8LZhfmv5YXrc8xIgmMStv4dohzo31QrfaOPKmcDkhjHbWs/omg/IBmcL+AzX87ZcNjK1DXMw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVvzxlf+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVvzxlf+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D061CC4CEE3;
	Fri, 20 Jun 2025 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750440562;
	bh=nheFR1/5CshCcQvlT8lp2j5NZecOPxHnfuyX38UhI+M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CVvzxlf+RkqN1sHKSpIQqhTpmrx2rXZrpYYF548XGxP/xL88dqh7J1oHtcC/uGs2t
	 PIQXcC5WoxOIxEFc0r8wlLG4TVHVMVMuXB2T9hlMjq+ZxjICxZr8ezdjQBAEPkzcBH
	 nPYcLhrnntMHjGW+G9FSYMWi6Z7IuUPLNAbHnYGXm39DEp8GF7G9k/rl+/zaCuFN3z
	 CEUu5RTY1Qi9mI6GX/mcIv4Dk9aM1jF2MjiHhZmhLIvSB4nWJk5wJUXp7snxMSdA9g
	 YHHPlEQpYIP0VLCZWNdZn0w2H/tGzp3Kw6LZCqYmchAXXQrfBU0NWkI/P7+4hhp/OC
	 sZDLj3BHTxtLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E5F1739FEB78;
	Fri, 20 Jun 2025 17:29:51 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <877c16wqhj.wl-tiwai@suse.de>
References: <877c16wqhj.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <877c16wqhj.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc3
X-PR-Tracked-Commit-Id: 33bdee12822d240caaa01aeac231eac42182fd64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 299f489f5bad3554531f67335d1762225448ff39
Message-Id: <175044059062.1649825.16492217056832871701.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 17:29:50 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Jun 2025 14:24:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/299f489f5bad3554531f67335d1762225448ff39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
