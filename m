Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC6201100;
	Fri,  4 Apr 2025 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786082; cv=none; b=IgZZy21QWoxZemkfxfBGF8hxZtD1+TlfU/y8UFsXvppKdb/PLQXfLrBb5n3G+9zV0gNCAzvWEN8F6OkCqn52015s26CgP+rFavmuEJ34VFcVBIanOaxdjKscDN5gVlcvxqPWTekmXA9y084EdVHTM7xUtTHH4TCEG+pVQ/EeoZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786082; c=relaxed/simple;
	bh=bsgI1Bpo0IKrwa6SAkinGyGSd0rjzUaELpIVYbrI7wc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PSUj+cYJEsI4GgN2aj1704FZqyKU20/FN71hROhTqNVE9524Le0OD0hVMeKeLfN5DAFp9BqUCromaUbdaGYofkhaGS0FzxyvE6Kms2jPvNeb8qQDSWBxFZE7xOFmdXrgOUIv16oPGZqt2zBjYZDit545osHaW2xY/8+SM/btywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=beTJlYfc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="beTJlYfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6562CC4CEDD;
	Fri,  4 Apr 2025 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786082;
	bh=bsgI1Bpo0IKrwa6SAkinGyGSd0rjzUaELpIVYbrI7wc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=beTJlYfc+a9hBLlYm1FeucnTznmpIPFzvuNzrQ0YoaUVIzdxCPcqN3Hi4AQxHZe1y
	 pCwhBloBB+xQSB5QS7vnhh7ihF7TjWDZSTW/+5rPtul/hlmYfYtJAcNqJWtyd6PhXo
	 4jUiyRgWhZgcHdNvOMJRW50QaEOvdxNYGdCtgCTClhunisxU+bbbvTMCAo6hWKmXhB
	 LaiH3CAGuEp1B4mYoMyOdWQoIxFRaqyvJek+lznH7tenG18MDy4wjUrdHsmOyWFkfH
	 LPKjyie2NeM8mXEXoshqfShGd3uqqe0/T6qX7dXYovk97SY+VZf1XnfGC4o9b01l0q
	 KLVR1NQQAi1ew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A82933822D28;
	Fri,  4 Apr 2025 17:02:00 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <874iz447r2.wl-tiwai@suse.de>
References: <874iz447r2.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <874iz447r2.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.15-rc1
X-PR-Tracked-Commit-Id: 02dc9b9617e4d2b93676f0ea1de797e1da8e7c37
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3551e679c3eefb7756fc220acf951ad7591ae99c
Message-Id: <174378611919.3331400.7571361052162483406.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:01:59 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Apr 2025 11:05:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3551e679c3eefb7756fc220acf951ad7591ae99c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
