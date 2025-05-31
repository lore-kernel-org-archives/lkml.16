Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88809241696;
	Sat, 31 May 2025 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705422; cv=none; b=GIw4LoZxwCK8SN5fbmfcWDi+w52KQ5ENVFIJjGlav0xDUwfx5ptXXcjYYkTaYOGAJgjGGHpFpWRacS3ab25TN07yRSf+MS2u+eI51dfOFRhyLZcvxB9GgRCfkmSTMHiOWEzN3bx9ebMA6IpoZw7d0NR0349y2/+k/7SxhaLEFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705422; c=relaxed/simple;
	bh=8fXpeC8lBPDgsJUiXz7eqiDdYLAKyepb0wBS5l2htGs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ekUsPSxWXjjeE1tqLd8Adpjf+CoJs9Gplx4JWumUwC/qtfpZiYlGONNAusHzEX4v7FMNBMb5+nhDOS11GOknMJvDyq3sEw0Glle8nOoDP7iWNywKoQsUznrFWQAw8tCZE6tRPeT1nFITnHgD5yTOiFVLIIDOmzrzVTer3ynhzQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDAM3pyT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDAM3pyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4BBC4CEE3;
	Sat, 31 May 2025 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705422;
	bh=8fXpeC8lBPDgsJUiXz7eqiDdYLAKyepb0wBS5l2htGs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GDAM3pyToeNbnZXw6Gm/aEPL6IiipxARDy2GDnVoUv1rIoqqL3C6BRSx9EFR6IGCl
	 Ru1ijLBT3ogRIAixTyvP4KUvtTzQqmReCgoFZI7n1hzN3n/b4be43DLh1CWwcZ8eUG
	 1fMcYXqVD15Lj6tZBhxj/63nA82po8/qxN8CLfkOOtx9IQQ2RSpdNtC4XHuQfYzmbn
	 e+f/tKa83g4fGmmhOCVMuj/yCARHN2WBv6RSFsESvJcE4oH4uvVRlQoqWebnrn/u8W
	 wlgieJ+YN8tGiS1jFeQ2SaVKOPXjGD2PYQ/oRlJfxu6HhiROnctrVtjQCLOAMwg10S
	 Oz2LZ6FjWYwbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADED1380AA70;
	Sat, 31 May 2025 15:30:56 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] soc: devicetree updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.16
X-PR-Tracked-Commit-Id: 3f07353e2fd3e154921e539044b26e85ca910dbe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec71f661a572a770d7c861cd52a50cbbb0e1a8d1
Message-Id: <174870545544.163157.7191295860821501844.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:55 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 31 May 2025 11:06:47 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec71f661a572a770d7c861cd52a50cbbb0e1a8d1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
