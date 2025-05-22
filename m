Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835EF17597;
	Thu, 22 May 2025 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931534; cv=none; b=J/41ukRUj82DZ+8w/hYSIi3NiuElqW+1rh+tNjW50L2UUeuNmW3eCW4cm/yCVLgPTPSD+3pT/rWyHR5BtUcGbBpvyCY68Xr0L/WdtU2VPb5rVDAzGENjDaI6GjS+amEd9HBJGH/zdhyZnCksIdPWSET1m0QsKSPFEkLV/YfjcTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931534; c=relaxed/simple;
	bh=K4w/aH8ChscytkB5rF5CB5GfDMFZXnnx0H9pqaCMw40=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BHuP7ceB1lSV5S3dVSxrKXi7/EC8VSRrjjOFVfp2u68mD14d5CJDowD6dFaqZNSO49JHLXluezE54GRoIT5cLnKKDgQos3FddGacq1/vyEFbyVZelYq6bFuWF/wPQeVWoKzO69jU67QEpTlwIzEXSsXc1DYAt0d/c6Ctba/nPuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iX6JNCsI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iX6JNCsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1362C4CEE4;
	Thu, 22 May 2025 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747931534;
	bh=K4w/aH8ChscytkB5rF5CB5GfDMFZXnnx0H9pqaCMw40=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iX6JNCsIIKelC6WJI9nqqGi5Zp0dsbmKqtVyYX8ZFsVRhKt/MJBUVaoiyb65Ub7E6
	 240Z0jZTdNJuhp/1pQ5csesMMCiu2uQiuz+HeWCmcZ8gDN03cGSTcnSDZQa4IiqSne
	 t5zXcu1wRazKRa8hBBNpsp3wtxXCSHoTj23g8tdTvkNfIooYl/6Z8oqdHP76AFMtZw
	 OeVNFCBXlADhVLNlxdB5S8PG+DRXUq/PH7/LWC4WHv177VJcAVK2Lh1hTwq80qwgPV
	 GIhED8ejM+bw5F+2DZjhbPQxWVH7NZhXfaV2gMTW/Hf+XXKKQCj/eSXNOD4DSWTG45
	 3+mfxjqZm3HfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEC303805D89;
	Thu, 22 May 2025 16:32:50 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <87r00h86cm.wl-tiwai@suse.de>
References: <87r00h86cm.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87r00h86cm.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15
X-PR-Tracked-Commit-Id: f709b78aecab519dbcefa9a6603b94ad18c553e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e9579507f258c6e63baa0d0d6c950e45f7b75e5
Message-Id: <174793156931.2940668.9795705534896728725.pr-tracker-bot@kernel.org>
Date: Thu, 22 May 2025 16:32:49 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 22 May 2025 09:14:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e9579507f258c6e63baa0d0d6c950e45f7b75e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
