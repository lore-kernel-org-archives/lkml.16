Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD7D1E3DE5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370611; cv=none; b=jV7NRZPv3msfq2RXTxohMcowbFDh3KIARiE+gsEE2ypPPCbYLBSY7QWvXV2GOLBcapAOXtQFouKjFKWEayUHb2uj6QJk2OcImhlAg508hYwfuMZq9UoYElGA8DtXHbY6tX0RXbOr0Baiw8GLIDmjCx5osv7jqzP/UDPR4vQuXxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370611; c=relaxed/simple;
	bh=5iqorZV75Dc5YrGLOzIJtILxwweVSqwL3SGlw+u3bLE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=S44Ut73BsKJ9qMEuVB635NQezw26gxdSqc7mUVhWpIZ4bDXzZzkvM8veskeIf8AHXk/a1MLwI4Xz7U8B7Jyo0ifIRB72jqI65VHr1+nJSXHDdPYNmy76hGjve4SOrcwqc1/x0jIn/qdJIkirIrhWznIh45tvJqL21ICVZNtWJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAlJbYgP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAlJbYgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD0DC4CEE9;
	Tue, 27 May 2025 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748370611;
	bh=5iqorZV75Dc5YrGLOzIJtILxwweVSqwL3SGlw+u3bLE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uAlJbYgP8aYjWG6v6bErX6T5K5/Wh2WnskmfXjNziVaqcC/jSHzWuYzt18/PFiGEi
	 4D9ulKcgohbw+WzsTxMG1tnDpSpB7pCCwFI2ENadUwbhKIrsbO/xvsJbEjeN5TB7Rv
	 NNEODrOg9nDaHs+m4hVMAGpJxCePzBt8+KUpu736wEdOZnwd3shs3YZUoN4a0JCJkw
	 S1czV7feVhql08ne74TbduZP//Z6XRF1rSYk4sID0ssNbNw7j9Axi9+ChCyIhkKU7c
	 3NurGwzj8yuOgJWvFmBpUuE3LjvhxQJzrMPAHj0wZ7ulMknlLEC4Y9tMsrsztY5QYT
	 1mtf2LGReIeKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0D1380AAE2;
	Tue, 27 May 2025 18:30:46 +0000 (UTC)
Subject: Re: [GIT PULL] nolibc updates for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <3d0f7e83-7d64-41cb-9909-9d84406d8f2e@t-8ch.de>
References: <3d0f7e83-7d64-41cb-9909-9d84406d8f2e@t-8ch.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <3d0f7e83-7d64-41cb-9909-9d84406d8f2e@t-8ch.de>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/ tags/nolibc-20250526-for-6.16-1
X-PR-Tracked-Commit-Id: 869c788909b93a78ead1ca28c42b95eeb0779215
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 015a99fa76650e7d6efa3e36f20c0f5b346fe9ce
Message-Id: <174837064536.1737688.9270729395294357411.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 18:30:45 +0000
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 16:58:14 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/ tags/nolibc-20250526-for-6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/015a99fa76650e7d6efa3e36f20c0f5b346fe9ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
