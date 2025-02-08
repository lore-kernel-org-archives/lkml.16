Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99831F30D7
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739045214; cv=none; b=Q4ndWMde0cXcFV9+83KyAH/lPMnKwE6gjmB7SKmQZIPtDEluhaDQl1EQqhOnK3F6hTNxF+5IPMkxw6fI01ZWfGASPYsvMvkLt9+aLA49tcN/li5hPLzungfZ7xrbPb2W1nuSwFeyWUpJGQ2zweOW2eKy6vJiK4UOo76QKEyhWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739045214; c=relaxed/simple;
	bh=MVIGJvxado+jTgpvqp8LvZ7ZMSMI3cDU3ddcsz/8ODM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aBhwTM3JgjX+Emd/4zGW3nT/p67j7UEDTw7vqOd5vC0eb2ivLX1EXfCdd5B7VWCclBMSCGhDu+1BqkYJQhveIDOvKFaGvuV4Sz3hNsL/3RBoKD6VRTGP9MNj4LfFco+4oMtJOHVXWmU9xAsjPzQbc251wXm/QtqUfI8o9U1gj0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR/Taweu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR/Taweu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4105C4CED6;
	Sat,  8 Feb 2025 20:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739045213;
	bh=MVIGJvxado+jTgpvqp8LvZ7ZMSMI3cDU3ddcsz/8ODM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gR/Taweu/KMXyGOskXmZ8SdLTxuRwyZ81baxHRJNn1FSs5N/5dTKPgK9zEYR7JIio
	 ngvwx/E1JkHH3qMAggdZE5CIyt5sdGn/PLAbFKaiF1lZoScF3XA9mxQnTsLFnuVZLR
	 8lcrPBbUw1vj+BPUnkRDhe5UYHBNdtiWDqrRLKLQ2/6sKzUrmPv+LAUvmfMMaoPRUC
	 AvdACmyrGYDBmNtyTzhOMh4OTI3zplCZDwYeI5lYObzYGC+KehF/jM6CCKc035ya+i
	 ROy7Cx9w/iZQaRKsWcp8i7jdp4VeB2yDbGtYmEXBuRpkt6iArnQ702YlbofsAF1Nfg
	 /4VawN5k7mtaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B01380AAF5;
	Sat,  8 Feb 2025 20:07:23 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z6cgFhA0239YtIvU@gmail.com>
References: <Z6cgFhA0239YtIvU@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z6cgFhA0239YtIvU@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-02-08
X-PR-Tracked-Commit-Id: 29a61a1f40637ae010b828745fb41f60301c3a3d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a8f5fe68fc063913a77ec2df90c57e897c9aa7ae
Message-Id: <173904524168.2649139.3257879673906642021.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 20:07:21 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 10:12:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a8f5fe68fc063913a77ec2df90c57e897c9aa7ae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
