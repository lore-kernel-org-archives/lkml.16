Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C6A1E32B7
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738180812; cv=none; b=hYVxp2q457fOS80KQbBtSfo5/S+Y5/ytfJt04RF379qh4x3NM8CI9sqHV0IQS51Xnn2KRQbne9FrnTIepO1RYSkGXDNNXaXke0yMomJXlkrvjLE8TdZwGKiyiCrHjHzjyCcjbKU2qBf2HlyR/TuAGKeoNXn1cOfxuB74pHihlmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738180812; c=relaxed/simple;
	bh=f7H017g5CmG5xxjvMr0b51B8JgK7KDnNQJMNg30pEF4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fBqnzWDEyX5qjrue+AutUUOoeldWKxkdyv9AFAwpF0RNEbaiDLgyoqIO7o3M0JEO/bsPXfNix3+Cc4BFqKfvvYiVc396GWk2+b61hOVfmkWbL0BsEc7hFSbm6BKxUJXaHXZx8RhU5b8ABfGeRIQGidI2Z5P7wzjOhoxxlQvwwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAFs+fVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAFs+fVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A38C4CED1;
	Wed, 29 Jan 2025 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738180811;
	bh=f7H017g5CmG5xxjvMr0b51B8JgK7KDnNQJMNg30pEF4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mAFs+fVH6BI49ziLNOdZD3wLgLkCUss9tEXkYJ7kV+RoFE8R/IAHMCrG/l6o7mkNy
	 0sg6qFHAZpt2C2mZ2UGVzD6jgSk6x3XzaCbIbUOlI+ER8aaAIMbWhe+Tr3DgXMBVVk
	 xCWDJCJrnqvptKmDyvl69IiA5Lu3RKq9yLB1CyZlSrCf1s3Wvj5HBuatcvId0/0rCL
	 eWnef0Rdi7dm+uyAURFenC4JNt0MCq1gj6RW1uh3iY2mWi3I+Hy31CMbakabzObHEB
	 ACpZMsBYNCNXU8/gKmv99QZT/j8m3YtN3DqmNsk1qVF78/WrwJ+PxOY5AlLcphg18R
	 V8TxN8sHO1biA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 35153380AA67;
	Wed, 29 Jan 2025 20:00:39 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v6.14-merge-window
From: pr-tracker-bot@kernel.org
In-Reply-To: <09df24e539a2259c800a02d49557f34e.broonie@kernel.org>
References: <09df24e539a2259c800a02d49557f34e.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <09df24e539a2259c800a02d49557f34e.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.14-merge-window
X-PR-Tracked-Commit-Id: 155c569fa4c3b340fbf8571a0e42dd415c025377
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9
Message-Id: <173818083798.411204.16300483484594505309.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jan 2025 20:00:37 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 29 Jan 2025 13:23:27 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.14-merge-window

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
