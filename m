Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02661242900;
	Sat, 31 May 2025 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705425; cv=none; b=MBGcmmZ0sFrVCjRF85xXQuimiUPvzphvgpZ8VANXVOD+1hsZyquCOB9Kk0V/a5E2zLefsl4bTj25N/qgSrlRbpR8th12fg9yEVkeFSyqNFHvphTmi0F5jcUWcdrAdEw58JyKWRynivzIKr76nMf3e6+oHrupEQOw3RUJ2v6034M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705425; c=relaxed/simple;
	bh=iiL5VxW3Twj1IIHwwMPR65Wl/S/cUTQU/lOhciGZy9g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Qj7Mr5v6dZI1XmxzLmHXkYr/GfRbBs11QINzvlV4qGGCPoZaLSG4KI3GMg1GzL87VyZvwBJxMKbsLtWoccysrmMozgUWE52yc5ZD1WtjjFlVo6Mx6aO5YbP2d8EEZ0jFJRkhGv/y2eBvDr/LXRnFXwWruskCkqau3OMf68fItlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khq+2SyK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khq+2SyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB99C4CEE3;
	Sat, 31 May 2025 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705424;
	bh=iiL5VxW3Twj1IIHwwMPR65Wl/S/cUTQU/lOhciGZy9g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=khq+2SyKs9dPTLUaY0jJZzmH8OgkAySXMuGx6bADtwkTT42aUJ45lNIUMS8N/jgGC
	 sWHt0Hcel+D3jGA34xiAlh2jRJdZ3iiMai+5pSbkUKt/b4OQhligXaK+N0grYy0ZUm
	 5JNcMxZdnxE2HX5vAm1DMUytk73mdRtZo3ebmcmc36bqDUH3YVD+MChBiG+Ey930O+
	 xUmXq4frg1BsGB/jmM1nWNh22UvJL5SIh+R3kw/LRNGXIH49nJ5fhRItkIUgCsZYbW
	 8oG110uWvjIHjSl9DwzZqxXe9vejnYnIFrHfZXUPzKU75XpVtrXdmeDhyeyo0lnwBf
	 kmi9x5DQ3t5QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAAE5380AA70;
	Sat, 31 May 2025 15:30:58 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] soc: sophgo devicetree updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.16
X-PR-Tracked-Commit-Id: 9bba618694cc905b898661c18e3e40955573ef5e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31848987f177a6c0944fd0254a55ffd7c52a8c50
Message-Id: <174870545744.163157.4670024390186583728.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:57 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 31 May 2025 11:07:48 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31848987f177a6c0944fd0254a55ffd7c52a8c50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
