Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E810E28DD0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120571; cv=none; b=PStMx/ugS+aOaD+OBgPiBs55xh8m0/TOdtJ1ZC/gHJsdcrup523/RQDakT6APDwaz0J1H1R5JGFLtA+0L6Rvertrigirji496L5Q8HjWzjj7KVtpm0cof2qFda0EELXoEUQFBNjRWFwDGJpQ1Kqh5hWWndeI77RtgXW7s+ltay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120571; c=relaxed/simple;
	bh=ZwoWhtCtIqaGD8dbNNQyyqwFF0MsY1Yg240nRLO3SiM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WuwES3JPH4yia1PQHRsayyawC8uemc4ErV7Bso58VUNd358gg57kg4570I17JnP+gkzl+2ahICvCN+BddA98F/DgmTtHkMXTAhYdEu90Z0B9Hpqh/5JaUduLSjO1OhKy8pgwQNI13ytV99OVr1BzhBwTSoSSqkF2YtQTNiBj8R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlI1cUH4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlI1cUH4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C9AC4CEDD;
	Fri, 28 Mar 2025 00:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743120570;
	bh=ZwoWhtCtIqaGD8dbNNQyyqwFF0MsY1Yg240nRLO3SiM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PlI1cUH4N9el8MAjFFqvVHhf67HBaKObBdb0yitk+y9wpkkT0GydV9rbhuFAmfGop
	 2ZFTrgUhD94dbBnifmQcJB83q+0IQwUZC2HUG7852+xCYE9IifOwWQ0icRNnLj6opU
	 FXXPsI/ZxpiKSgajrGPAJPKxXPA0DUFHaAAGSG9GaeILKLcPPLIG+oaK3Gjl+q97al
	 YWCSZz8tv5HR0Ag8Jlb9Xo0m2YHZJudfQe5eS9zmGbV+EVGAQkWkLxEcBhxDDetZy1
	 OAQFTNAQwhTcSe/PuUgoJINNBHNq0ryXKikHB5IwWf/fSJ3cxwpbYccKMreuwUIwOA
	 2PTw2wudthNTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F5B380AAFD;
	Fri, 28 Mar 2025 00:10:08 +0000 (UTC)
Subject: Re: [GIT PULL] tracing/tools: Updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250327125054.76093170@gandalf.local.home>
References: <20250327125054.76093170@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250327125054.76093170@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-tools-v6.15
X-PR-Tracked-Commit-Id: 732032692f6ae311bc35159b18e5b7c5e64010fc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4fa118e5b79fcc537dcb1a860ed319a6106935eb
Message-Id: <174312060700.2290382.9838682255286759799.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 00:10:07 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Costa Shulyupin <costa.shul@redhat.com>, John Kacur <jkacur@redhat.com>, Tomas Glozar <tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 12:50:54 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-tools-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4fa118e5b79fcc537dcb1a860ed319a6106935eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
