Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525431A314D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408780; cv=none; b=bIHWRZyKY4j7V76tBWaMZnBqGrogpLbqBCPSRuJaAy0RvXqsh8JgHEZ9Q7ZHw4M0JSoAbwl8G//W8oi0/tvkglYT8+1b3DuLcYjPLC8Wq8fJyYH9u5Jzny4QClSCPwUqcJMOT1yzrh9sjWjYyAD9VVBgH28u1ak0eNLIydkjqko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408780; c=relaxed/simple;
	bh=l6eedhZ2P8HDt3ZPWC2mg7yABxaUE7DLIJOWU6PMIpU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QZDmbKAB6+rMLgS9kAh2019nKpItDfFs0B8PFQPDUcOCTqpUBEeO9HDony60AtdD/5IIgwUvKJxW14QfLNCuLDwytHTyc1bbhsLw3EK/hWAkve+qthMEleKLgYj19ZcgSrPS3MWV8cYkhJ82qsAwsCCVgjtAJCTEYJSrNXYw+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufRgO8tQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufRgO8tQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE34C4CEEE;
	Sun,  8 Jun 2025 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749408780;
	bh=l6eedhZ2P8HDt3ZPWC2mg7yABxaUE7DLIJOWU6PMIpU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ufRgO8tQ/JWCogRtcFWXFvMsj1c/yDA3TFC8T81QF51rQJ5tqeoszu2NKd7z7oiA9
	 wxkj+ohEkzcs9ioJqxq8EzSFA4tYyfAgd9rdiEfIMH1Lj2hbtDJb3sVwoOg3VxxUtk
	 oxLUCCaLW4uCW0gsYgdNLKAyViWzF/cr0JleKQeyIz7gpF+eD/9Y64NLm6n+k5dxbV
	 X7LxKXzhcVKPP0dfnzczA6fYcA7yzdZ2T/M8xRhxccbFM6UrHjhDQRPAREl5qlh+0w
	 jlk/Y6nSEUncrhP6GQhGiKS7y9aLfkspi2DfDGWr+AG0hNHNYQxnmzWH3FhYaLxfp2
	 nxNy/KiUBvciw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71356380AAE2;
	Sun,  8 Jun 2025 18:53:32 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: More fixes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250607153604.3c67f93c@gandalf.local.home>
References: <20250607153604.3c67f93c@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250607153604.3c67f93c@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16-3
X-PR-Tracked-Commit-Id: 549e914c96ae67760f36b9714b424dc992a0a69b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 538c429a4b430ef70f428d2d1755ac51724d3245
Message-Id: <174940881109.385950.3178632720356991438.pr-tracker-bot@kernel.org>
Date: Sun, 08 Jun 2025 18:53:31 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dmitry Antipov <dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 7 Jun 2025 15:36:04 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/538c429a4b430ef70f428d2d1755ac51724d3245

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
