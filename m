Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4FE1E1041
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 21:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745098667; cv=none; b=H53vgcgu4AlFCk8Q9n8MnRGn33NWYGY7DVlKFlbNkbs2yNrtNKzoFkHr8TNABTFriEoC0HxR9TefJGseHiDHFMuq4reOlqxEOsUfGRWQXH69tmAfpFJ11ESBJMasvmOUbBGLJR8EYCEJZ43cKVoCwr+RJgo1pZcwA3dnMpAiA3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745098667; c=relaxed/simple;
	bh=TCROkFDaOKVnUG5lIITvu27uUFDIihAnr0JviipIIVQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=q6bdyNqvY+D/XQe0sn2cMJQ1dUUZ6BwuqUUqnOKHWMLdAw9+aRT17eOzvjxQLSsyVRpMFIE17PaHPvQ6jGl5oPxiGAbX11NB+omXdx0xMVAJs/WSbE8AoGfc3ZZQC2PcAKvNdsJR34jKk3f2f7jrpEcTFvplWRojJ/JEblJJhho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMefSHKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMefSHKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76073C4CEE7;
	Sat, 19 Apr 2025 21:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745098667;
	bh=TCROkFDaOKVnUG5lIITvu27uUFDIihAnr0JviipIIVQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PMefSHKDaeu7BMo6rinqcbmOaPBsbhwWbBAzUx0J1bW+D7ePmLgzNrRps+Li28YSx
	 ojilogGX5qikFj6aDSODW5OjEzNVZjKy16gml9XStCsTrKAJgZYqJCLo28pnJLYV58
	 SQY60pSPRvI0AA7Ie3nfiKPVUL4SdEc0Y6+lq87Jz6kKs/m4YeKLSiwjYoIF/w2Gd8
	 bJw5NjYZzdyHpRZrD1mqfBwkabhdsqMdNhIYoQEuSzQ3eH+N5H3VA+4CFx+FSHGoyI
	 IgYgiDL3E2Q0zWphJ+HtzeiFEZgmAZtMQaWsONmMuHi2RER4IQPIFbI/5CUUaccOG7
	 mN0B6JnyT5KbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADDA3806642;
	Sat, 19 Apr 2025 21:38:26 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250419142842.676b6bc6@gandalf.local.home>
References: <20250419142842.676b6bc6@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250419142842.676b6bc6@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc2
X-PR-Tracked-Commit-Id: d481ee35247d2a01764667a25f6f512c292ba42d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa6ad96dca040e169f4008637d8d77f22631b34d
Message-Id: <174509870553.540479.5713367320199459173.pr-tracker-bot@kernel.org>
Date: Sat, 19 Apr 2025 21:38:25 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Menglong Dong <menglong8.dong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Apr 2025 14:28:42 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa6ad96dca040e169f4008637d8d77f22631b34d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
