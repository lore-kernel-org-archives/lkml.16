Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476951F03D4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748582685; cv=none; b=KQHm62N2wn+36BIL9txndElzCzm28SyHKcOVABsSUn5RmLviYoaiRW3CZu/bLRjT6fq0XLuMvMcC57tkCBmTyUULXMHiEReqVrCNGGfxPwvAzIZO7AsmuVdgZ7jNbQemKVNoQL3mjvx+NMLqR0r2lF4BQKOVwiji3Z9FdrJyndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748582685; c=relaxed/simple;
	bh=CdRvDSrsMzsrncY8yflvrNcoXiEnseAywgUh2CYHWec=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CHugvn2gryoA9WTA+6Ihr4lQ/TolG4ysLhndlgPEQKBw6rBlJ09BnhlqnEBQCgxz5mxHw7+VlKeaPZEHpYR1EiR3pFKeCG2Pn2zYIK+7Tc+/oe388BnBb3UMqM9WBi1o1sf2fAvcggs1BE75L+CrXMoctaJM7YLhNnZa2EDJaqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUBuRF4D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUBuRF4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F75CC4CEE9;
	Fri, 30 May 2025 05:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748582685;
	bh=CdRvDSrsMzsrncY8yflvrNcoXiEnseAywgUh2CYHWec=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jUBuRF4DxReuGhax9LMVWhYilY+lZ7SRzmiDiIy/ru11pPlchdGZx8MvqA+bVjR65
	 MEwa0dKy/WsLy+GHzkZ3EF/7LD1GkXMaNypjZ2SYpCmv+d4FdyCRVuxsgAAmcuJaDQ
	 VPFvgIYjLhh7NHT6KBP26PQE0kA0Zve/F9rnNPPYRKLVCkIcHxDAAfzGirdO8AgZug
	 i1IWljWr31i4zvDMi5vu7eX6ACwOMLh1OBY6Bmyk3v9yp7cn8ZMihn+Jt0QD/f+LrN
	 Z/ZiG9ErNNUoAcu74gyZOQL2ZaTurSRavySN27GwaxkDb3VCzwqpAMeWXrwpuRjsgO
	 m+3XxVLU83dNg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB15D39F1DEE;
	Fri, 30 May 2025 05:25:19 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250529094122.245fb887@gandalf.local.home>
References: <20250529094122.245fb887@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250529094122.245fb887@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16
X-PR-Tracked-Commit-Id: 2fbdb6d8e03b70668c0876e635506540ae92ab05
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b78f1293f90642ff9809935aa9df7b964e0f17ba
Message-Id: <174858271853.3833287.9028588856423434311.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 05:25:18 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Devaansh Kumar <devaanshk840@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Miaoqian Lin <linmq006@gmail.com>, Pan Taixi <pantaixi@huaweicloud.com>, Tomas Glozar <tglozar@redhat.com>, Yury Norov <yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 29 May 2025 09:41:22 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b78f1293f90642ff9809935aa9df7b964e0f17ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
