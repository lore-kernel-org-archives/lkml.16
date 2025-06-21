Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DA0221577
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750523737; cv=none; b=WIIPRkaZsXyor3jMh3dmdgKai9GQkzCjOzaByCaRU5MCRrPpu6D2tPOFRGt1Y+rMktMc9ZAujHOqA0ODrBZc7kPVaVEm9whiIxf/PI0bdOuvy1g2Q8hbid7VAY4KumOqbw8VC9RyypcYtwjWpB587nbRB31i7HMn+GwyJk1E934=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750523737; c=relaxed/simple;
	bh=zwX3PSozj6/GLOmVZwxvGwE85lFfWGoGDVeisaH3FCU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RzW4JcwQt4Nl+w2bSsekJPOzXexrVKMovdbS1ZAANo2tpPkiwp6Op+3U8otKbXEaXlyd3EUb2STpAJlRPE4jngheeXO1d7KCU5ysyuGSRvLuA90vBy7y2tsWkNqN4JSxyFKjNb8cqSkfP18/YFqKYELRuZqa67wu2u47Xa4iqcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+vZksUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+vZksUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D300DC4CEEE;
	Sat, 21 Jun 2025 16:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750523736;
	bh=zwX3PSozj6/GLOmVZwxvGwE85lFfWGoGDVeisaH3FCU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S+vZksUdSYMEQYajwEtzQw7Ldf9OfT37zlIwO3hUeMaUdl+vz+V4BWemxvjEMIvtc
	 jO/scsxNUtuikSmWaEbxICav3bv9IC82khKItem7sgkEDhD2tOQPiECmYgY9YR19Zd
	 MZ8GyG/qS49ejFsQpVrWF7yY69x60HbzmOpNH5jxRhrDWsJ+1/y3X4VColLoqMb51h
	 UIuqnS2NvhzpSQQrI2lXtScyYOLmyciXW1iAB5hDt/fA78vopE3gVLSbTQEVGMVsoi
	 klIdrARH4kmGCSavU+jDJl01Gh8oqwZCbmTreh5qb5GiE91ENub9TQ5f7Dk138k3n3
	 v2w+NoU7VLYxg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0238111DD;
	Sat, 21 Jun 2025 16:36:05 +0000 (UTC)
Subject: Re: [GIT PULL] erofs fixes for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aFbFC3q0SNO7ZkQi@debian>
References: <aFbFC3q0SNO7ZkQi@debian>
X-PR-Tracked-List-Id: <linux-erofs.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <aFbFC3q0SNO7ZkQi@debian>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.16-rc3-fixes
X-PR-Tracked-Commit-Id: 417b8af2e30d7f131682a893ad79c506fd39c624
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f9378d4a7dd862b28d83a062a2dcc6ef1a0daa7
Message-Id: <175052376417.1897727.2751233102628770913.pr-tracker-bot@kernel.org>
Date: Sat, 21 Jun 2025 16:36:04 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Tatsuyuki Ishi <ishitatsuyuki@google.com>, Hongbo Li <lihongbo22@huawei.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 21 Jun 2025 22:43:23 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.16-rc3-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f9378d4a7dd862b28d83a062a2dcc6ef1a0daa7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
