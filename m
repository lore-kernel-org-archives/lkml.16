Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE018BC1D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988774; cv=none; b=ukEDVgysr+o7AQVlzVoCoBcv+wa8Q7eB8X+OqfPJgJEgLpTgDzoIqET854XPNhh8DUSmcf+0zQhxGZS1ChTSjFd6y47//f3u3eFesTPrR2SmyWgJCWSZ3Qpszeb7qKr1ufVc+J/91DiFykYWFmXxt+iTjTRiHAPPLIuRJm03VNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988774; c=relaxed/simple;
	bh=clk82C27k94QhXj7jb4awLx0s/Gn3ZqopMsY1g1CoUQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Fd9kZKAF56RCAl3jijvKbt5MyYK0MYYMXAT5Yp5pTV2PsnD1Qu9DNqLVf6Z5M4oPsVTV9IaZieHHbxZRiGUl7PJH86yckJqsrQb3vqo6nrMwnkRFmFQclpNQvTM9THBKaBWYhVuYVe9CPLZYpIFWQzg9AutBSL3FBCB6DpQyZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWTyotHO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWTyotHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CB5C4CEE4;
	Sun, 11 May 2025 18:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988774;
	bh=clk82C27k94QhXj7jb4awLx0s/Gn3ZqopMsY1g1CoUQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OWTyotHO/JIFVhstjN1/JItXLzMHQ/3+MdCuCqYkQuMCRmKSNL3bcDN+g6tHw6Y+J
	 l9pGr0Jf0N8mq/p4kMA+BZ97w4cZJsJSzPdwvk61Wy3Yd3l6fPRRWMdkCj8Wd7f3KI
	 gZgINJOLBQeAvIt07CNjpcBd2jix2pcNOhu63BpDRuRbIFn/q1SKfpiASfGjgXS10X
	 o1J2F7BqVDxJej3GVWciQauenVHOALatM0QM7utUh3RF1VG3INfPNizAfXxdGdOwt+
	 lpVwPr9ZtKoeP2uH+xUZQSTlFbl1qYZAw6IHW0j83xqUGloyVp0PdbsPhPYwwRbk0W
	 wKwjsEVMzobHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EB53805D89;
	Sun, 11 May 2025 18:40:13 +0000 (UTC)
Subject: Re: [GIT PULL] timer subsystem fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCBWcZpS1JNuEG4T@gmail.com>
References: <aCBWcZpS1JNuEG4T@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCBWcZpS1JNuEG4T@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-05-11
X-PR-Tracked-Commit-Id: 94cff94634e506a4a44684bee1875d2dbf782722
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac814cbbab21ad0a1ba1554312687e4abbfcfc96
Message-Id: <174698881186.20988.2807142295639899942.pr-tracker-bot@kernel.org>
Date: Sun, 11 May 2025 18:40:11 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 May 2025 09:49:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-05-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac814cbbab21ad0a1ba1554312687e4abbfcfc96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
