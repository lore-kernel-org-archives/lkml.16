Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE48F58;
	Sun,  4 May 2025 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375679; cv=none; b=nJR6tijYzLR9Xg35GamZoBlyjKIv68j7dLG9bCoRe4WuCiVskf7Sf2/nmSx5EPEiQ4ujokNTCEm7aI0pL1/1tkcTciWcYf7mDQ/I9ybXwYHAhJBwe8irAAQFfQBpUvlGJuJhC9cZhr11gEMSHpHvz6Np1rnZMK3U4iR49f6Q6gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375679; c=relaxed/simple;
	bh=6iQmuMD8IgCuIXKDPLDVpVIvNoYQMF4naoIpWfPxcy8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=go+CSLPrDIvimNxYdofhZzlRH/hg2Ew7iKAXYGjCMMQvixW5noJ7PKn6AZajK+dGyf22UCHp8GGUi662gh01e3VrxVG1TxCTVNfSUZw7wi3g5lF18Yygt50oEyUlNCzNlFWum6R3aN42AcQiG4HrrvYhqfz38BrToH3Egvp0mp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/VfbM3l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/VfbM3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FC8C4CEE7;
	Sun,  4 May 2025 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746375679;
	bh=6iQmuMD8IgCuIXKDPLDVpVIvNoYQMF4naoIpWfPxcy8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S/VfbM3lgwW0TKgFZyu8cvNXW5znIiMmyTitJ7Q9c65ZHrPTk3bQ7yTjtUeE+/TVP
	 /7xWBWUg+DsmKxYYQxLTdrVOyJoMg1ywlqi3P6Csl1hy8oaCO7BZGYoURlOWTIudMb
	 HndjbtBDv6yuP5hhXob8dq8iL0F7gG59MblQEfCOQUkJHVwsccHpyPIIgnNW+CvuG9
	 YS37e1H8GLueHN4CIg9For02fBwry0jRWg0ZRZLNuiCLBx6AqM2T87a5UROikane3E
	 FDqRSa00+5mjnZ2s1vTGOQbif5qdL3dBA/kgqhR4waSpf2e5scyDz+/3VzEN1yD1xW
	 zCTJunGoujr2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0833806659;
	Sun,  4 May 2025 16:21:59 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fix for v6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aBeLEPtn_fpuBgFz@p100>
References: <aBeLEPtn_fpuBgFz@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <aBeLEPtn_fpuBgFz@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.15-rc5
X-PR-Tracked-Commit-Id: de3629baf5a33af1919dec7136d643b0662e85ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 593bde4ca9b1991e81ccf98b0baf8499cab6cab9
Message-Id: <174637571859.4060424.13392126787771406996.pr-tracker-bot@kernel.org>
Date: Sun, 04 May 2025 16:21:58 +0000
To: Helge Deller <deller@gmx.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>, Camm Maguire <camm@maguirefamily.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 May 2025 17:43:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.15-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/593bde4ca9b1991e81ccf98b0baf8499cab6cab9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
