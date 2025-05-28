Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F8B1EB9FA
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748405924; cv=none; b=c3eBRpneIBd65v8TLGvMT0G0eaaVtJIoTGPi+3kFG6EJUHcYsWSoax8z3sIOtIzlMN8bF/sjM+AUzFKaP5yuG0uYC60Ii3dh8x6hv1EpZZHMYcO5+/aHRmnyGTk2zkBZciuTT4FTO9n1CTPAi9dSYQ0pTNDOoH8JWOls3FbcHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748405924; c=relaxed/simple;
	bh=tAWlwB6ykqQxS1QLPFAsLHiuVFSX900WKZppAKmrneg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bVxPRWLz2RuTcE2AYVIQ5qfMIx+mLKKQjyJDmafKrGhFTZVEmDmrwtlObaUKpG8hirG4wPBgEVFCoiH/FAVuZmax7cOfO7Dk8dND9USwCXyR0r6Y1SVRVIjF8DQ8qN+7THRIo06MtsCTTU2RSNX/s4YwW+KkLsq8kxBLEalT6hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAQnFy55; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAQnFy55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1853CC4CEEE;
	Wed, 28 May 2025 04:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748405924;
	bh=tAWlwB6ykqQxS1QLPFAsLHiuVFSX900WKZppAKmrneg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QAQnFy55AckNf1DnJNOe/iehBt5q5cuCO2xYG8uiGAmvGukk6IK59vp9oGB70Bp0H
	 4ULDIqMRcUX2jXk4uQd0E+hF5CtEVVEN7SyqY/OUfp6SCqdzuiesA32qDJ1oo80qZC
	 fZzZXiOGb85gcI+2ASsjF8vjwo7DGvRgqvyjtenoSl8UtMcem/DdEjTnNuc+L3p2rr
	 1vpNSpmqWFoI5eLzaJKCP8lQETCZASINb2HJJ4zWofq11EhaJsZrJR2H42ik+uOQtY
	 RtKo/RYWesGfYnFwsti7iz2sUpQAklpnXI4jTSMUMZ/0wPpVxkI7iyFb9aB5RtCdIR
	 ngRpI18lwl6Ow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C423822D1A;
	Wed, 28 May 2025 04:19:19 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250526063307.10920-1-jgross@suse.com>
References: <20250526063307.10920-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526063307.10920-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.16-rc1-tag
X-PR-Tracked-Commit-Id: 7f9bbc1140ff8796230bc2634055763e271fd692
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5cf5240991bcea3c0f38e36e65e1742d6db7912c
Message-Id: <174840595796.1893196.3827206882663532833.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 04:19:17 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 08:33:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.16-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5cf5240991bcea3c0f38e36e65e1742d6db7912c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
