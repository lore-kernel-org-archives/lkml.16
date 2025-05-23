Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE4625;
	Fri, 23 May 2025 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013649; cv=none; b=k6Q5K5iGXT9inoOzOSRRE4e32+SGvF18iPKcSUwH9s4GZyjjcqtrpmAbAL9cNlAxeVSWY4RdDvJJEEmCckVDCW062Oiup2lW/PGKN1gOqOlAAr/f2PgL4l0xsWCuf2ZEF3hgOIv7zbmdaDyEGsqWLGSaABd0MSLwKbn3ucYk4Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013649; c=relaxed/simple;
	bh=3Lpdxu2P1pQksYRfoU0u0T1LOQxcymB4tTW3NjdCxks=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FSmI0m6MVNJbYwv7U8cUxxmIvvoIvR3lI6tf8TeoqmdCuO9y0SaQHGjRgRaWq7zSZL9T1qO65QJIxST6LSGzrm6CAHVYUI+d+df3txkwMpsBlj4fwsU6N68+Mp73rd+ttvuUiN9Xac8ZL0yYADqNBOBAv75+N23krzg4AYxMH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOby1dcs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOby1dcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301EBC4CEE9;
	Fri, 23 May 2025 15:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748013649;
	bh=3Lpdxu2P1pQksYRfoU0u0T1LOQxcymB4tTW3NjdCxks=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tOby1dcs4I7pXdlHINc6jzHVW3wVS2qs+54bqx1bDzACGwqbW+cCFQO+XOHg8oH9I
	 itE9VM0xN+nVSXhNYAVrXQaFEF1/js3MSuQxqNa5PcdRK24jAhHZwmz716l4hlfbPz
	 QolH8YpiJbIXNkgMjiXffcMzhaLdl9kj1Ld4MWLMoNXVgyXao5pEM6uYIW2oUP+99p
	 XENDQl0I1hFRoCjuA7uptEiW/d3NCs6Dbip0kDnMsv5IswD4Ao3XfcKERHmB/JVln9
	 HN+W+SuUdJ7ULMIYlsMWZdrHKITC4KAyndQQ1TMbzgCc5S3FPr2LKcyl9GMZeKSlq/
	 Nr7yuNrMhQ5UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE43E3810902;
	Fri, 23 May 2025 15:21:25 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <de1a7a9e-7823-4f98-bf9e-99d8722c28b8@app.fastmail.com>
References: <de1a7a9e-7823-4f98-bf9e-99d8722c28b8@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <de1a7a9e-7823-4f98-bf9e-99d8722c28b8@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-3
X-PR-Tracked-Commit-Id: 070d04f002ddc308b053df4723e83cf43719fda0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d0ebc36b0b3e8486ceb6e08e8ae173aaa6d1221
Message-Id: <174801368435.3634038.13556567875278893073.pr-tracker-bot@kernel.org>
Date: Fri, 23 May 2025 15:21:24 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 May 2025 15:31:03 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d0ebc36b0b3e8486ceb6e08e8ae173aaa6d1221

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
