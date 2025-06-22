Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DFE1FCCEB
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750622125; cv=none; b=l/BlCV4woPsmRmv2mCNrIfvNbteeCv68GJpTfkd5tJDfY80GInb+PRBg6WbeaNBOmWHAfEw8yw0q8lho354FeoEbHL2P/zsGTayu67EcQmDhFs0IPq8J+8Wq3yoRiOXLOe1MgBo7GrPSj8coyXr0iI+EHMioMd2VcEihjLLPDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750622125; c=relaxed/simple;
	bh=89+g8Zr7swYsQ2tvsNbWzBNJoTlBUqw3lxOfVRlZMww=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rZlfiNNoa/k5AlFL/xcPt2N5SQsr/uEJOXHaLZQjN7nU6vBhDFNm0r/zQpsVY+CSzN88SSFqybKCc7HLduoM8SXiBnIUhaMr6Z1lBYPai3dosd8qgN1kJ2SJ1EWEQSvIsI0ppkxL7cw5U7lr8oOWhRCJu8xt2+v8XcME8AaC2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1xV+D/D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1xV+D/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EC9C4CEE3;
	Sun, 22 Jun 2025 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750622125;
	bh=89+g8Zr7swYsQ2tvsNbWzBNJoTlBUqw3lxOfVRlZMww=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=g1xV+D/DLgnjZNyWa2hLeAhPYWByx/tZWv8IbB3MUf+x6aPqSMNIwCSNXoXGyY33B
	 WT2v5+qsyWjmWBUvgSASHp+s0PVRPdTXE7ThNf15Qjjj2LPv1W8DyuPQbjLjhfhaxe
	 ScN21pIa6pCpbbMjU6ZMDB55S4LuP3z3iUVRmV26C7faHZX8rIjaI0IwYiSFu2MudR
	 fnSVeVbkcdEy6WSKRunWVBquXOuPnKnocaoZNY7GzdhQJ+4H0L2RpXq+gza9QGl6AV
	 P7KQXmugrASzu0Gh5BYL9Ym+2MvxLtzyVQLlaCaJvBIbsiLwqpwXzHop5PKwO6pRZe
	 U8Y3abJMf1iqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 339EC39FEB77;
	Sun, 22 Jun 2025 19:55:54 +0000 (UTC)
Subject: Re: [GIT PULL] locking/urgent for v6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250622080828.GAaFe5_CIOuHFwuUCF@fat_crate.local>
References: <20250622080828.GAaFe5_CIOuHFwuUCF@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250622080828.GAaFe5_CIOuHFwuUCF@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc3
X-PR-Tracked-Commit-Id: 69a14d146f3b87819f3fb73ed5d1de3e1fa680c1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aff2a7e23f23738ca3cd62e4ce5be2d62a3d52ad
Message-Id: <175062215283.2132065.17055286839683306347.pr-tracker-bot@kernel.org>
Date: Sun, 22 Jun 2025 19:55:52 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 22 Jun 2025 10:08:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aff2a7e23f23738ca3cd62e4ce5be2d62a3d52ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
