Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE7220E33F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325486; cv=none; b=Zt9v/pV7yyD3fGcLILOG0GXVaHqERIAp5w2s+fU34qAYJNpHhVbt8ZDdkAnMZ+GXw/3M7MsJZESbQ0zXAAZrdOBLuflu+np/6fEV2ZCf8aJRMiG8nSXnO8WgR7vJmbkju7kj3s9KMtLDi663NmVAx5mQwIDXMIAV348K504JSKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325486; c=relaxed/simple;
	bh=oYboicT3s8cmv29Z+2QrQLcPksnY5F9hZL8qS0pfyvU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=J4ATK+KcygwC0ZrhjbAMI3D7BZ/c1WRYSQ3ICbdLgJ5wUwMUEaOogLFIiK44TJsGLna4qWsZ1JRnhlK1zTJ0Ufdjr1Pu4p2s71qSa6Bos69RbDHxYKnaM1nRj5FbR/5pAc235olSefgfSa7kfnFvMIrLCZnuNgryj0MdhC4UJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPiueJ6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPiueJ6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE3AC4CEDD;
	Thu, 10 Apr 2025 22:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744325486;
	bh=oYboicT3s8cmv29Z+2QrQLcPksnY5F9hZL8qS0pfyvU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TPiueJ6OVL1AsLIgdLstrgfHjcf8lQM9hnVWJAaJ+hEwbBMz8tEYRmEuFEiqk8NtU
	 /NPczX6tulJTc68Kqj2t881XCQKIJggw2ODf6wT3Y/jhJqZZ9cQ5h6OX5ftAh+Hom+
	 eiFH4TdssFbEKpk9+K9JSrIYFpfRBjpc+Nz8VK8bp5hVfJoybu6OXWReQ8fdQHgUUb
	 wEZejKE66qB0c8h8f/uH5AIqDTi8olpba2pxioZQtyHbNqocKRlNF649kVfZxDIIzb
	 P3sMXum6H7xBdHOm96rVoIYF6ZNtx1264G8LrjrIl/5MWmtbSRYpKGHYXKXdndojPO
	 HerfiZjLzjxzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E14380CEF4;
	Thu, 10 Apr 2025 22:52:05 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_gzw9spHIqTdVG0@gmail.com>
References: <Z_gzw9spHIqTdVG0@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_gzw9spHIqTdVG0@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-10
X-PR-Tracked-Commit-Id: 56799bc035658738f362acec3e7647bb84e68933
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac253a537da3b210fa4b65d522d5533fc68f9515
Message-Id: <174432552390.3849546.6273372598836441203.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 22:52:03 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kan Liang <kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Apr 2025 23:10:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac253a537da3b210fa4b65d522d5533fc68f9515

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
