Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B832144B4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325490; cv=none; b=FTf+tdU6wTfPk8f4uA4zORBz+71Tiw6k6PdH5adF3sJUJyDphkaeVrRihGvwaNlE8FqK0Gl6BZW1OD4bLGxRGMeljosQtNOV2QRYMXv3wnkdsDs/DLFvxDQdvSSkU/PPOgOgF2MxPZwzhkgT0SQ451aU2ke5uuRN7p7dec9Mark=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325490; c=relaxed/simple;
	bh=MBdu+cQSE785Ve8LKg8RCan/TNwA1L07OodXFJ/qMSc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lFsY/wimvoCJBQGLADJZgYiYIODYJ7V/xGiUNPdmcrI7EUgnpMSnimB5dgXo9NS0Iw7WcYUVsBe5fhnmn88sTcvSLrHbj/OCMrXZglpMy4wMtLNmWtd/zJMMgl2BmOxjOn6xAm5Bk6v91gVZLx5SquW7LL5ZTU9SveZ2tTLrPlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAJEHyL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAJEHyL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A24C4CEDD;
	Thu, 10 Apr 2025 22:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744325490;
	bh=MBdu+cQSE785Ve8LKg8RCan/TNwA1L07OodXFJ/qMSc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lAJEHyL3VY43bOpuZhjkzYMRcvjzOKEOlMNJKnmzxBTDu0dQl+fIjcJ/9ZLqrYnci
	 3JRtnnxBLu17Le/KG579UeXnnQMLwIFHxPqLTNWWNblffnCQc05JVwvB2mRS8DHVu+
	 Ovju7pkypUfmr/lrJLrsVWooZNoTCuY9yQKnw2oYsdFplSwr4FOPMkq/O8E1yigK/q
	 iBuHXsrJwC7vKQSQL8x9Y5DfXfySCDTed+mwQwHFAxUVE19gDd5cs5YPNcMij+wbrI
	 NstS7aVpGeDZ5Y2Jzd2dqSRYie+Kv8kgqlf2uVZ9WL93IslWAbfhnS0Ao81FiKLPsI
	 KzKpdy2OhD7rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD05380CEF4;
	Thu, 10 Apr 2025 22:52:08 +0000 (UTC)
Subject: Re: [GIT PULL] timer fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_g5ToUpEw-GPsuY@gmail.com>
References: <Z_g5ToUpEw-GPsuY@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_g5ToUpEw-GPsuY@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-10
X-PR-Tracked-Commit-Id: acea9943271b62905033f2f8ca571cdd52d6ea7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 34833819d2270ef96fa98fe3c1d3d297b5dec986
Message-Id: <174432552735.3849546.15383572671923947606.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 22:52:07 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Apr 2025 23:34:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/34833819d2270ef96fa98fe3c1d3d297b5dec986

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
