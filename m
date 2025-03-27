Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C8B1C5D44;
	Thu, 27 Mar 2025 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102610; cv=none; b=meE9HamHWcHnXUVzcQNbMhIOK/yv55O0oWwvdhG9LDIkYgxnUrx7iLQQfQikN9UmBQx1F6gcut5yUwZubinsvXh7nHy12O11Ix92rWygf4DW3AhyslFszNDzFdybRBi4hwcP6qrj900DLsP1Qsy+WFy5aFsfnktMw5yeLudvEJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102610; c=relaxed/simple;
	bh=5QAP23KIhAdrZlLT5kpDiYvNaQ0YvaYdzgGKZ5c0ewo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rlIPHw8EWkRFnDknO1X+OHYvkYiz8U7I7VCfhahYea0POm01fO9uqRH813IygYp/AiK4kEWMWgxW9oje6K7tr1hw5zOl/VyAPjEIDqn7gI7P36ppoEppDA+yq7R1i+klCsbVAcYXaI3dDlNL8usVDvYFBXgwkX5D2FXXBt/iWXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6FHkvN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6FHkvN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B45DC4CEDD;
	Thu, 27 Mar 2025 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102610;
	bh=5QAP23KIhAdrZlLT5kpDiYvNaQ0YvaYdzgGKZ5c0ewo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o6FHkvN55ipVbXfy0np2HmertY7OG+YnfuZDf3JDU1jrzM80z+gyPAWuD090WWMKj
	 r0DCM0IcjYf6OwyivrdmY5YNBTDZnYtBzhB8i/zt3Zd9VhvKOie1hHFWm2x0zcDhZ/
	 n2k4uAN8y6TKACG7ATglZgGH9CtklT/h+DuhbAFdvtxnv2ZoeVDyuNTsU3XjPILkOo
	 nSim+CFF7ItimMsz+S3CzBEsuenPWhG0hYddcaxfxT0NJSMvysP5Y9xr9i7uoQoTuM
	 d1y5WHgIMXbBlfFMZpcGLqNOsclBeEEFtTgTl35hAHV4Vv9Icu9PgsWRJBj96e9Ob0
	 CTyLLR8GiB4PQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11569380AAFD;
	Thu, 27 Mar 2025 19:10:48 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: driver updates for 6.15, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ab627300-24c0-46fb-a236-f94751afffc1@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <ab627300-24c0-46fb-a236-f94751afffc1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ab627300-24c0-46fb-a236-f94751afffc1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-1
X-PR-Tracked-Commit-Id: 2124055fb5c6554cab0fdd7a09235526cacaac23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9fc2304972b1db28b88af8203dffef23e1e92ba
Message-Id: <174310264664.2176831.12176170026565000904.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:46 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 19:00:31 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9fc2304972b1db28b88af8203dffef23e1e92ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
