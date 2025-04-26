Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AAA25E44B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745687122; cv=none; b=KaHz9Z+SQjI326WLFmv3bMdQXI3hSWpTXEtNgdZIVEfYGsXEaqPweCut3K3JIYHGBaY9o/ovuG8GSDOHX6LcLHr17j2BrkQUTfI+kp4s1c/BuW4oOHCARPu6hKJVAhXoUVnR+16ZCVlqrzXp+zA2ALFECSop92UkSugZjRUsE7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745687122; c=relaxed/simple;
	bh=IxH5ewpd2tJqORDOr/eGv6NlB5pKI8YnUVmZSbZ10Tg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F6lsi9hhqCFvuDpM3Vg4TnOB9txh16KgqD+IuZoeQ+mjvjJbtNh8yJa/IXa9g1PTk26wSHeyTHVVof3nJV5ZNHH6O/hOoftzl6LWjviQna7rDMK6Q6UYM+tjTc0m/MQf90AM7pi4Sc3/4vebKX9tbvSJg6bpRWI+svKsbZQ/Pzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivr0FdgU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivr0FdgU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327E1C4CEEB;
	Sat, 26 Apr 2025 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745687122;
	bh=IxH5ewpd2tJqORDOr/eGv6NlB5pKI8YnUVmZSbZ10Tg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ivr0FdgUV5kSMbDydafqRE+ZNGkRJsr8UOij5E+HgmOk0N4oL+6lQIwZBcxdQD2VY
	 dYHWre3Yf5Om6lnZbUZIzEFheXzZxKyhhgtYD7ETEIghrm5XfC+KjSV8z1kcg5NDaq
	 MEBNXrqDT4vKUa6+0SaAZ9xrMAYHKdPWZX1yNlUYQ+dMpEqy6CjY0vUHH7UgMjTKX9
	 C735poLS1MBxOuretv5U6BYwT9ky/NJhvfDc6M0/sJV1jJVr51erdjWztsUx5tSIUu
	 9BOXaWQiomnEKOKcuYdWmVOWoliza28tDZIuoUhoBa3biJYxQ69bszpUwxR4Yzq3NB
	 8JJIMlRl+edGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D8338111CC;
	Sat, 26 Apr 2025 17:06:02 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAyaxzfTUuhDbFhH@gmail.com>
References: <aAyaxzfTUuhDbFhH@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAyaxzfTUuhDbFhH@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-26
X-PR-Tracked-Commit-Id: 1a97fea9db9e9b9c4839d4232dde9f505ff5b4cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86baa5499c468f306ca7cdfc1663398c99646ceb
Message-Id: <174568716069.4031081.15189289964121339222.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:06:00 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kan Liang <kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Apr 2025 10:35:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86baa5499c468f306ca7cdfc1663398c99646ceb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
