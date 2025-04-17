Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB62550DB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909567; cv=none; b=bFm0voidNd6X6YZiMC1iTXTtfQ9os59vKwc0dfx7V3T3MVSm0WkHisxBDCclpaxaQs8IE5ThXKGdInIlgbspdwUfFlu8hFEgNiBsycvi6nebZ29mCIeG2prpda07VKHjA6nrQdQHh69rFyAcfLYqAx4PVDMjYv+lZ6mJ6b8LKDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909567; c=relaxed/simple;
	bh=pVa0gexlwYIj+rHQSYrMhP9dapil/iXoUD0Z0GyV5dM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MOC/kUEH/jhu7/VobzuKZSrDA6fBhubAkLFK3yqyXhaD7jZkBeK9lIshGx539oCOXQFEwjBSYnWYwmnFtXDU+k9TU0x04b/r1Kbmn5A7MB+NdzhDme2YFaQ5J/cn88ODePdpz7GPXc2Ad7a2E1/oDfaTQOldnOcmTW3rgJdTySQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRWHOTTM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRWHOTTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A80C4CEEF;
	Thu, 17 Apr 2025 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744909566;
	bh=pVa0gexlwYIj+rHQSYrMhP9dapil/iXoUD0Z0GyV5dM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RRWHOTTM24SszokcHXiWx+FxC2P9Q1k1ofG8/48HaW5CS23LBZh4AWSetsrkhNCKZ
	 t/qWLkvwAoqxbjHcHUxMJ5lJ2swN2sfu7hkbrPHYMbABmMC1hSPCtUBIbt3/n4ChrF
	 n5s2WKLZdu7REDhIdK91zf73Urext61W5kreVhRnODJQxlfUth0JRKZZHcvlCLFmcr
	 QNHiM+g11CqhPeFomRoy5bgWQbwNCyP7nUP9u4BEWdkt1ndo/dAuOxjAfWAkyz95zp
	 EMNrO579ij09eIIJnTXyxrF/P456ETA1cEp09GGJcVxj0W+ZzcjgHzt4zB8XVWl/CF
	 LBFgDZfTxky8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C9C380664C;
	Thu, 17 Apr 2025 17:06:46 +0000 (UTC)
Subject: Re: [GIT PULL] slab fix for 6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <fd2359ed-f87e-4ba1-a6e5-b4114db7e2bb@suse.cz>
References: <fd2359ed-f87e-4ba1-a6e5-b4114db7e2bb@suse.cz>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <fd2359ed-f87e-4ba1-a6e5-b4114db7e2bb@suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.15-rc2
X-PR-Tracked-Commit-Id: d2f5819b6ed357c0c350c0616b6b9f38be59adf6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a54f4a97e306f3f4628a5503192e96ff4e3271d0
Message-Id: <174490960483.4147514.1289269651105087866.pr-tracker-bot@kernel.org>
Date: Thu, 17 Apr 2025 17:06:44 +0000
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, Suren Baghdasaryan <surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 17 Apr 2025 11:38:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.15-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a54f4a97e306f3f4628a5503192e96ff4e3271d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
