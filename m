Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0E281509
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370606; cv=none; b=j69xxtdOm7bADEAXjz0jh1R9QOcpZ7WhNvqDO2wy5AMk6IZoO3JC4OfgqR7zHiIGRdtf0EeJM4MpH9z1X5IIUE2rTpfPEYf8oj4s9KWJ0xoqJTJKhx3TfhQ4qzKA/Os/NnGsT0iSZFskFlzlF/IHkij/jOtBtGh0BrWcyHvPcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370606; c=relaxed/simple;
	bh=fLdue4n/gB5T9TcA9bA9GRmWQz5Dc3RqaaQE5L5HtZE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hwZM+XIi4DKkvS1A8CKrFtmE2fo0NXICVGAJs/Ans6C6Ekee/T/veBnRCl6yHbOj3WRi+F7CzoWGe+vV9ZaszFChwTmTvyBb3/1L4aIuChkjsyoFwMenZbKFR1hKaMDv3X3jVx+SkINs7jKDKui6//2ccT2mJ7Zq+OQKDFdhChQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMFM3dyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMFM3dyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393B9C4CEEB;
	Tue, 27 May 2025 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748370606;
	bh=fLdue4n/gB5T9TcA9bA9GRmWQz5Dc3RqaaQE5L5HtZE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WMFM3dywCfWYvFIhBdf482J2bzX10oPebCWuD+MkP6jJGBaybKWDOkv5yV1pcmFFS
	 h8uiADOjNj37Ed+nBe8SXvcjs5B/afGChyhi4L5UedXSeyK+O5Rfe03Miv1BwHgY+D
	 WB7Te1jgXoUtrnHrs6nC/D4Yr5P2q7ebiSCjo7AtFatYKCgQ6um0I6xxR6GkcDgAeX
	 cCLbtnCwZwqrob70ajU8Jx51oPsbXV9yWOEJbyPdImojHIwyoA4Rs+z4JcJPr+lQyD
	 BCv4p/l/SidgYgZ8Knq1Ur7YfVLEuwViTvEiN/k501RUT2yvuhPB0rbAgfawSoco/h
	 tGwDfg1d6zniQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB3B380AAE2;
	Tue, 27 May 2025 18:30:41 +0000 (UTC)
Subject: Re: [GIT PULL] Rate-limit changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <c4547cbd-d38b-4b50-92b1-0f3f717a7979@paulmck-laptop>
References: <c4547cbd-d38b-4b50-92b1-0f3f717a7979@paulmck-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <c4547cbd-d38b-4b50-92b1-0f3f717a7979@paulmck-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/ratelimit.2025.05.25a
X-PR-Tracked-Commit-Id: ba575cea29fd82a0e6836fefcd51db36f1ff8a92
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 97851c601636a0e40f8237b83a6b70fc5e231e0c
Message-Id: <174837064027.1737688.2822591145838437871.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 18:30:40 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, pmladek@suse.com, akpm@linux-foundation.org, john.ogness@linutronix.de
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 21:49:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/ratelimit.2025.05.25a

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/97851c601636a0e40f8237b83a6b70fc5e231e0c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
