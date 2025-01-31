Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E11A1EBA02;
	Fri, 31 Jan 2025 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345518; cv=none; b=QH8BGZ3l/mdb+B2UT2Man6X9dXLNnflTspM3woBvHejy9X0OJcRZiFSTSkMU3wp0Nn6RIihhmTlSeLbgg/nTBoQaImjN/rCWkW2hsP0HGh7Gig9UCovcRE6tz4R6V/W1vTJq30gSzK0eqWsaXPHNTgOfWPNsKdJy/whyfszmdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345518; c=relaxed/simple;
	bh=y+E7ayTBQV7BeUoM9RjoFzuBus7v9Gz6APiJU48DXKM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=grT7YZxZAWzUrxnHgqXYGhJ9QeVG7XqYZnVCmzRutdMVkhyPul4QxvYXA0WmPd+4b+SyJ8z4RxxBpIU3xA2XM7/vnfkZtczjxskmz8cM/xD9fLMFbceeNxNdhqVbQbWi5GJOqIMM15pqWrNQnmKv1ysHju1ucG308RY5dUmmhds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maN1MqwQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maN1MqwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46892C4CED1;
	Fri, 31 Jan 2025 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345518;
	bh=y+E7ayTBQV7BeUoM9RjoFzuBus7v9Gz6APiJU48DXKM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=maN1MqwQJVNVDch++5H/uLAEyiH9a2x8GKSFrSl4GeykGzijVaXjs5cfIv5a7/B7G
	 GJkHLZ4MzeUBRe9EJRt3uwbtnngfvJbGoq97ph15RnhdUoOVp6xXPlxn4xHnYjkjeh
	 sbPBdO9INXO5ZTccYbkMVSqqm7ZQA18RnyrAkVjyFRih3AnTC8hs2MLoJXnRMV6/TW
	 i50tIc6LjZZExtATuyrLH5ZertUNYRTjQixk0Ho2dvo4EJp2FWNaCW6PCPdXCTeBQu
	 Xg3Rv9U4XFhPC4HXp+IEOkC56zjMC7LHgVMhcGV0qyyWWdHncGZl/3bKD2exvSb7Iw
	 38dWsbUJEFWxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEF9380AA7D;
	Fri, 31 Jan 2025 17:45:45 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87r04j4de2.wl-tiwai@suse.de>
References: <87r04j4de2.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87r04j4de2.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.14-rc1
X-PR-Tracked-Commit-Id: 8c2fa44132e8cd1b05c77a705adb8d1f5a5daf3f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8f08ed05b31c6cfb5acd2eb7340368560f17cdd3
Message-Id: <173834554446.1678494.949441595251047964.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 17:45:44 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jan 2025 09:05:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8f08ed05b31c6cfb5acd2eb7340368560f17cdd3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
