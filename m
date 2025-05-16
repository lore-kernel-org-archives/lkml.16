Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1F1DDC2A;
	Fri, 16 May 2025 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413828; cv=none; b=gGOwXHr07orBBNFVHiMiuovLTtwCRK0Fzf+MZwP8FE/AVU1c8jTzZ7nX6r2d0tPBzmH0El1T2PV3WQODgx28LxZb+tmu/uTpOt6DYv9fYZ/NL34JtV6SHgtUVL3FwtbSSYAks95reT7bsWfGWj+dJ4lcraWWnXsOy2etGrPXc4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413828; c=relaxed/simple;
	bh=F4EWxmWJgd3TADygUuLwxPWgEJG3ZUl08atV2Ul3o7M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=N1MTHGbjeVmRQf9c7LweeBiC05MIHmZQn9DsNHtwIUhxGmOz7NYw7hY0emi00yPU92yqaaCAXFEnmg7886TQINjazWa1yFbDBFo53uuNXGjntJhSky0rg+kEMV0T11MdhNLd/zz7XKdJUpNuovJuBgmlSsICBFS5On7Z6rcYXD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBkEpkfP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBkEpkfP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9594C4CEE4;
	Fri, 16 May 2025 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747413827;
	bh=F4EWxmWJgd3TADygUuLwxPWgEJG3ZUl08atV2Ul3o7M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UBkEpkfPwWstwFkMajYXh3plL96Jn/w8dP8Njuzzn7r5vKCokE1GqJf5AsYaBXGD9
	 sxdxXtXClYS7iLm+mUOHfS7xFt4Kh/mkqHrR757som24Ysp8MppBhDrT7JL4clisxO
	 fYo247AFBOFH+nQ/lQ4JzZcgVn8zJ6sYRku6g9ULQe/bkrtXKvU0nIEtPX3i12nJ77
	 dqN67LakPxK7qd7QGJBkatL+uTAN7+iyovU/Plsf7zLDnWRy7z9cIcWpqNyOrL/Kdr
	 gYKaph2a3YFjT4q7Kps8i/Y+PmZH6iOBq9831Ti7OZVjg+qC5yHsd9NnN3ALNrXMt9
	 adIwV0frhAnqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F10913806659;
	Fri, 16 May 2025 16:44:25 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <875xi1xalx.wl-tiwai@suse.de>
References: <875xi1xalx.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <875xi1xalx.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15-rc7
X-PR-Tracked-Commit-Id: 7b9938a14460e8ec7649ca2e80ac0aae9815bf02
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04811c3eb6d9c6eb2d140b614f9e3b03a4e0ecef
Message-Id: <174741386477.3992786.10327100127079403887.pr-tracker-bot@kernel.org>
Date: Fri, 16 May 2025 16:44:24 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 16 May 2025 09:45:14 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.15-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04811c3eb6d9c6eb2d140b614f9e3b03a4e0ecef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
