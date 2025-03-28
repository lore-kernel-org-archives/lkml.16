Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61FC20DF4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120568; cv=none; b=kvdmTTtPRwszCxYfPU8TFfmVYW2iSCvvF7v2AYeuPvWLUsIZGtjnlSWWxJTOREMKjTZYXs+yD1iGotMqHvF3T0w6YJd04QhONc7l1z5X1eIneEQYlb8bOfjG8p9mEJWlATOH7Eax+G4wYY0sLakrslzRiTRxE6n6QB8WxBWlLyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120568; c=relaxed/simple;
	bh=fub3/+0TZk1b9CYfKP+O7Ns4AHkhlO+o87kMjrsBYWA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fMHLvgzOS3tbi5ma5dH0y8RWAmSF2QhZbeEI4whjWP2ZpFmhBkiAjJtzR2cFN5TgdlxA/FUqrS1SPZPm5Z6ZkiSTV/86sjy6g9QFonVzxzLAZDiYpeqiV1uoJvuJTRdEWhIGmfFeB2Ohau+bK5WyS/XqppGnKAEw2k8etdSKK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2wfyXSd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2wfyXSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997B5C4CEDD;
	Fri, 28 Mar 2025 00:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743120568;
	bh=fub3/+0TZk1b9CYfKP+O7Ns4AHkhlO+o87kMjrsBYWA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D2wfyXSdjzL1NWWel/aR29xe8JoY5YCX31obCwgXwQynDupiX1BL+WNmHyKmjcymz
	 lsMRBuaLcvuVzJabwH97O5xhWkOINx2Mi0AG3uDY2qiToC3cX6dyWpFJVEPekkKsBI
	 IiFLCun/tVXv35BI5r4zgIEkBYdgaXHBrhwwh9I8+VA+QQsFhWmBfQuHMYaRhBsD2b
	 HpUf9FjX3NqMUffaPGreLlMp7Av0Zgld3LVP68XyO8VgU9EiiG7xF1Wylm2yyWXCnj
	 Y1jxbi7x9xrq3cKcK8nWsTzlWf7nsFwJf2nWzUaepgB0ceTv8jmemGCAh/fu7lNgGV
	 hCQ/xCZ/WU2CA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 341FB380AAFD;
	Fri, 28 Mar 2025 00:10:06 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250327123626.4ecb15ab@gandalf.local.home>
References: <20250327123626.4ecb15ab@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250327123626.4ecb15ab@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15
X-PR-Tracked-Commit-Id: e0344f9564f5847dc20e245fbea67a4b262ee659
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 744fab2d9ff9177a27647c3710e86d43f2efe68c
Message-Id: <174312060483.2290382.715200984495698411.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 00:10:04 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Douglas Raillard <douglas.raillard@arm.com>, Gabriele Paoloni <gpaoloni@redhat.com>, Hengqi Chen <hengqi.chen@gmail.com>, Huang Shijie <shijie@os.amperecomputing.com>, Petr Mladek <pmladek@suse.com>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, Siddarth G <siddarthsgml@gmail.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>, Zhouyi Zhou <zhouzhouyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 12:36:26 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/744fab2d9ff9177a27647c3710e86d43f2efe68c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
