Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174B3214
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120561; cv=none; b=enqraIs5ltelwd1v3RDdhTB7yvKHrJH3hrgrWVGauRywUVI2q8nfjs4fD+n4qPS4zq0wj/DonIu4Wrz0Qgm9fPGmTNzxrP+k8Uo6z+hn2DLbhNva9RZMTuaMlMvp8rGAUw4CieXiFcepeGNUNFyIjEEE3CYNJr4Qclrh52cPYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120561; c=relaxed/simple;
	bh=XGGTCiiWkazV/N/Yzj88NwF/AiZA7RQ2j02uvbAenfI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=psaSXvHq0c+Q4cN5KA3rjNwsVCsQ3GYk7J9SrqHJl6u3yXfWm9du1E5d61acpYmjj+6Kb91nvs8IQnGySM//15dRAqAcziXA0eJYGmokPWyTWr3z39psh40X7aiYS4bhTlZZPy9TvqlmCMBj80XRGp11TcOQ/+DRHs4W6nmLjdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSzGe8ok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSzGe8ok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4D4C4CEDD;
	Fri, 28 Mar 2025 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743120560;
	bh=XGGTCiiWkazV/N/Yzj88NwF/AiZA7RQ2j02uvbAenfI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bSzGe8okiP/WuC9yJrzHqd7zy6PT4SCz8dVySJS+MucSwL484WXP8kUzSQrKuOCIv
	 WFtJZ3jHSD69/x2zaZjS5Rk//Wrw/B6FDp9I4IBbyLaypo1zATLFQnQUy1IJMXttHM
	 yuwAZmVGfYZcFYwfN8LfYn4tbm6CTKOYdYkwr6SfRhz0PyTggpeI/StxT0R7NtjrxY
	 2S7rs4LpV+ghT71uwOlbqlMUEJO/WvgRUmjal+07S3ajyngSkhvcU2ZAOnAzkepn29
	 wK8bL0888CBcGHA11486EvmXQxJqGxMwuBsZRUK44JrtC/qh6+TT6Ol7PNrDg/5VF5
	 Ojis/QWoUOpqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D35380AAFD;
	Fri, 28 Mar 2025 00:09:58 +0000 (UTC)
Subject: Re: [GIT PULL] ftrace: Updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250325193935.66020aa3@gandalf.local.home>
References: <20250325193935.66020aa3@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250325193935.66020aa3@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.15
X-PR-Tracked-Commit-Id: 391dda1bd7c56de62b96126214f040fe8965561b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31eb415bf6f06c90fdd9b635caf3a6c5110a38b6
Message-Id: <174312059712.2290382.15769886213616422661.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 00:09:57 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Haiyue Wang <haiyuewa@163.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Sasha Levin <sashal@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, Tengda Wu <wutengda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Mar 2025 19:39:35 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31eb415bf6f06c90fdd9b635caf3a6c5110a38b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
