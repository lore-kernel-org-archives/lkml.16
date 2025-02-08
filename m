Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03443241CA1
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739045218; cv=none; b=crVzs0Dnz2yVShKzk2efESSPsJ5YgqlADyc5XS7F7X1YAK6Ugrr2giKVnH2tL2574rCrVPngn6AtSxwA8FBRQViqN9ggsaq6KtNNpAIapaqSbzITszHIpbrTgPoH3E6ZraRZnzPw4N6nwzJ6trzDmlLfAPrPIFEvHnWs+DoIC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739045218; c=relaxed/simple;
	bh=BqqhdHlp6vQ5UQ2LsOmLOkKeJg55dVg5Y4JIAVKP+9g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=R2q/cO7mawqXTjFlwxYxQYy91Atppk0YQJdJZliso7w3fxZQcUtQoOS98jiHqKFlBu0EPFvl9ZM7SvTeNJlpy4zRepUv9K1VVyvG46ZTKiwDlNUzstBsEt0xjzdvnWOa3uwetvu+GG5pz9bc9EbHj1hX84a0rY3yFmWZqADpmJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dri+wl7S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dri+wl7S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97F5C4CEDF;
	Sat,  8 Feb 2025 20:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739045217;
	bh=BqqhdHlp6vQ5UQ2LsOmLOkKeJg55dVg5Y4JIAVKP+9g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dri+wl7SzHBzK1mH6afvlpNA6aKO3+LUMPjXGdN65mWV65dcyikNuQg+swS689Z2+
	 z44y8CKOKkd8PbuYZE+rAOgVBNhH0Zgat6uwQUILPH/Jo5WVpkFmaPsYoxEH8S+Veh
	 8u4OoA49GjjrSSqJpZnJiAy/YizE7deAGgsjj6nanCw0sdKfWajB69BOqVGTnp+sQ9
	 3W90kAIJxGxXLaH66APY5DWbOUXj9iiUm/yB5XceoUkEE8dIzpJvR9TU/v0oSmMFmA
	 GO4z/WXRftGrjGXzBnoBU5TzRr1jm9xVRj+q/sA8MvM37fZUuiZffH9ojQNgIu2ihP
	 Is/M0+Ai7/u3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AC6380AAF5;
	Sat,  8 Feb 2025 20:07:27 +0000 (UTC)
Subject: Re: [GIT PULL] timer fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z6cjnBOBUxOq__Ni@gmail.com>
References: <Z6cjnBOBUxOq__Ni@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z6cjnBOBUxOq__Ni@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-02-08
X-PR-Tracked-Commit-Id: 868c9037df626b3c245ee26a290a03ae1f9f58d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a0562d733b19d5f10ebf7643dab0ab1a4fd8cf7
Message-Id: <173904524582.2649139.11958657049058145928.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 20:07:25 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 10:27:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a0562d733b19d5f10ebf7643dab0ab1a4fd8cf7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
