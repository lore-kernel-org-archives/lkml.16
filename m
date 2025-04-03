Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46BA253F24
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708831; cv=none; b=WCWE3VNEYRJPK0BvDBpnvWRIRdwEI2oKuy3dN+2Mt9cT/c/0/mmfU/Nw1d3VGTaQ57gPJiuXEozQz8MF58pkpKmJ0U3SFZ7s7uRdxzX1isg2QQxH3wfjAQoGqslUaftBqsH7j/REhqvPfXyQpENJMbdefiQgYBTiAWUHt575Ocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708831; c=relaxed/simple;
	bh=ssTPAcwL3z+ZDRsKrO07n2yffAKaWSf5PGYWkDPgdPs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uxzgUmrTkg75UHL4J5DHATqGn4ES9imfjAfkkqxtY8Q+6SLuDitz8UJgXFHSwQLj+e70YxSZa+hSrzlBb0X+zxXq1wsdpltvNsl1jE2NTS6FGaZsmjFkbE6xwa+NHCSe+1XtqyjaIDn2CCQi2RdOPzVZLYGLIPAdYyxBDGbLNHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOMCW7hj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOMCW7hj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5BBC4CEE3;
	Thu,  3 Apr 2025 19:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743708830;
	bh=ssTPAcwL3z+ZDRsKrO07n2yffAKaWSf5PGYWkDPgdPs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eOMCW7hj9c5lQCp1SgZ0eHzut6dkUKq7AX50SdRhwLn+vUtsh7h7Avr+7mfqF3Ndc
	 QcUpjgzu8mMfR7iqQUbms3JVPhAUxu67+UyHvpQrLi4L9GMfNerdaxBsSW5Og11OL9
	 PdrrTj7pwwYvez/JeGZp3JnyfGImzSDiigESp/5WjP/X8IfBmhdWJQnSxjZ/3etaB/
	 NzfHd6kUs3Ad/56XFqCCFudJXgQ9A2c5Zwg/azq2YKHUE0J6ilMBiEzIdfz+N1ByFW
	 6aGduNb+HzaFXHxrt0vrDtCGe5fo9ROQZL1j4L2RrErgFle4K5uEOTB3fAJzXOElT0
	 Kp1fZBiwmtW3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB043380664C;
	Thu,  3 Apr 2025 19:34:28 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250402174449.08caae28@gandalf.local.home>
References: <20250402174449.08caae28@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250402174449.08caae28@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-2
X-PR-Tracked-Commit-Id: fc0585c7faa9fffa0ecdd6e2466e3293cd3239ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 41677970ad8e5729a6ea74b506cfc3f24f1babc4
Message-Id: <174370886751.2657822.16171132783342906111.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 19:34:27 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Gabriele Monaco <gmonaco@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>, zhoumin <teczm@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 17:44:49 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/41677970ad8e5729a6ea74b506cfc3f24f1babc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
