Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F477464
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108446; cv=none; b=cdicrmSnZRJ1kpiYbB1hbCFJTsc+OJqYBxNt2Z+dYAQUrPUFngzXU+em6Nlo1tMwu2Gc5SR7AWwPqraDKM/vuRuDr3t6SBpW3zWpqDjGjA8rM4aKlg1DS+bZCePD1WQv8zajbnxqF8tmLc+6w/oO0GUGpejkOUFsxGUZOJr3yOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108446; c=relaxed/simple;
	bh=1vJHvbLf7GnYjrNgYCdvuKjiT2OzP1MC3jAoQv4Sv4s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ih5jIdZDWZMCBTkY8QuvE4jbGcp30grvkCW2KRZmOG/cup5ye4xfW/fl1L1fUIt7+RF+Lc5K6unmTym5wli3kfYWCsladlZxzPGes03jZS93qO9ejcRGKlNvfbXT5Z2LUNxPEgitiEtcfXYEvxgzlrGRSjGMRCZwNzniAWMWkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLrGhjt0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLrGhjt0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD14AC4CEDD;
	Thu, 27 Mar 2025 20:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108445;
	bh=1vJHvbLf7GnYjrNgYCdvuKjiT2OzP1MC3jAoQv4Sv4s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bLrGhjt0vRm0tGfPosWYQ2Sr5aSLSw2cUr2vtEz5kNlyEBQgssv1ZqvxmZ2MxiDM7
	 /QXsI06o2DrymlQGyrbqhibsZOxrhN9awFAV//BID1d82uAJ8WtPt4Cijn1UC4bUXl
	 qrQmms6UTri9w/ubzbjHD2imrsqEUXWp3l1FUBTLqA26tWDRx/D1tmAZ+zHVpGQvA9
	 yjIYVX29Kwl3NyPDrtpCPjYH6PethUliI7eVYyGj6oIDmrjqlacGP3TpO8x76EerF0
	 5NBdS/C4GGNugvxpbmQtryXYVc2arTCJbpVjZ2urGQgtdGQi4dmyltE7OLoICa3e1g
	 NwOQ+ZnmEbZjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71192380AAFD;
	Thu, 27 Mar 2025 20:48:03 +0000 (UTC)
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-GPopTYCOl0hjp3@google.com>
References: <Z-GPopTYCOl0hjp3@google.com>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <Z-GPopTYCOl0hjp3@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.15-rc1
X-PR-Tracked-Commit-Id: 21263d035ff21fa0ccf79adba20bab9cd8cca0f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 81d8e5e2132215d21f2cddffcd2b16d08c0389fa
Message-Id: <174310848190.2212788.8676129059384367865.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 20:48:01 +0000
To: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Mar 2025 17:00:18 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/81d8e5e2132215d21f2cddffcd2b16d08c0389fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
