Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B663E23E331
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705413; cv=none; b=pzVIPWt9VNrJEhgja2Sj4KfCWdPT5xQAP9fAJ9BHl3QulkweZRbSB6Ng5h9Wp9RMcF1AQzAjzlqPI7ZGmXx5YV60d5AaG/qHuIssOtszQoJPdKBg0L7R/AfLjzcftBckPulgXa0bfvxiPjbdbySUr1X+wxJDyTMRzQ2xtmbWHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705413; c=relaxed/simple;
	bh=f3w/QKfVhdsdgVV46mtMyXteNTwc3yYGGi0cwy8wT20=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QfxgkBzjtuFR9yqkPkCVvsdM9msJiJYLL8Pfdr5FaJAg9VZNX4RgYqvTib3Ex/9tfyIlkr4XA9G0dFyCbiC7VO5R8O/Sd8fbN9yu3AcKMziGk+NVOao4tFNrdek0vGNOy3dLYm/CvKXjA2HT5xL2FjDINGNniBunfjeOAVYMsJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCCzJvuy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCCzJvuy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B693C4CEEE;
	Sat, 31 May 2025 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705413;
	bh=f3w/QKfVhdsdgVV46mtMyXteNTwc3yYGGi0cwy8wT20=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bCCzJvuyQN4euZR1QohjTvRJ3ZHnEEcDgFWi2ktMAKD+JE/wRUdi/1crkNcIYj/bc
	 l/kaJSnt2Er8z1tVI/Bccy9CpxvKhkdN0ib29zLC67EFIvbi6ss7p8k/OPogEB26vO
	 qTtSMfOOvjPiWB6JGdsOhRy4E6ZdrxlIT/cW5fqfyyzgmTHQGa8/6LSNPEZ+9aeyNf
	 aimj0dXlW6p13sitm5ujTlpNUP2/SPBk+aS0yosoQeI+1eDEDPNzX37v4PoD7abMPj
	 tedh1KD+z5M4Ywz2dkVXxV7hW0yoN0Y9YD0Fkt9WL3edWRRIjW5GGe9kkrbXkyUNI+
	 fbLYgKTaAKCbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB035380AA70;
	Sat, 31 May 2025 15:30:47 +0000 (UTC)
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250530095958.494ad94e@gandalf.local.home>
References: <20250530095958.494ad94e@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250530095958.494ad94e@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v6.16
X-PR-Tracked-Commit-Id: 99d232804405e35d7a9af1536a057578a1442e81
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8bf722c684b31368a6f1fba7abcffb0da99722ed
Message-Id: <174870544645.163157.10514516245822097116.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:46 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 May 2025 09:59:58 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8bf722c684b31368a6f1fba7abcffb0da99722ed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
