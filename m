Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C747019F416
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557354; cv=none; b=fK4XLu+UNrSTVxwiVUYsHF34LyQRXRbi72MP6Y6OrJRXJyCedaxIMfuV12qsEFetlbHNjU+jyfsYyh3ug9yx8i1dDAJy87bfzcgDbsp9IpVkWF4bJaDVtOgQ8hy6zh4Q8SbQgOXIFEP86mFVSKV4fPyRMbBvIsFtIO/OrtiDEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557354; c=relaxed/simple;
	bh=FdCTfe17XQOITfYdiJWf3ucNVq9KvBJO20rCJriCp5w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PHDbfDn+K4hxIlOPmOsGiCLmyL1qL7GBIjY4V0qEHrYL54ENaYuF9YSws28yYsk+1Hs2c11Q9+HJXt/AAq+aGneaWRwKz5gQNSx1VM8WHQ9qMPlEgf6kxyCaMj9C4Ekp++DeBEpVvlBxahesmEkl4eXm93QKTpKr2WBPTLssS1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIjh5Jr5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIjh5Jr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC45C4CEDD;
	Sun, 13 Apr 2025 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744557354;
	bh=FdCTfe17XQOITfYdiJWf3ucNVq9KvBJO20rCJriCp5w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nIjh5Jr5limv+2zx9oBwjTbjEBUexTH+29BTglJ0ytQKVAKOwFmiJ3on7+Ov+ycpq
	 KWm4wwWCSMokMhD2R6uhVyjihI8kYU41Gli/QDDkQ8fNKLHkJ2d7QTGWRAD0jUP02p
	 WJyWqmJmiH+APb6J/J+JBFPT8olvGXTOcSvaWYBFvb+fjcqubxr1NrNNbAVCm+rtzJ
	 jrdKAhwP7YeYW0xlwPkvEqYteBCOWrAEn07sCB2PxlVf5RTkbR25xsU83yirMEgdYU
	 pcxzGHGEZRvdGYnqdsKYpLgeENG4YLCFIXNc7Xq42tTNQrFTgWUSaK3UpzDm0u5pSC
	 eQrUy0fQkHNFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FB338111DD;
	Sun, 13 Apr 2025 15:16:33 +0000 (UTC)
Subject: Re: [GIT PULL] memblock: fix build of memblock test
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_uVv28hqoc03UMg@kernel.org>
References: <Z_uVv28hqoc03UMg@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <Z_uVv28hqoc03UMg@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock tags/fixes-2025-04-13
X-PR-Tracked-Commit-Id: ed471e1984939a500eea179bc16e1c2aadf00db5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 051ea726ee4518ac5279eecaa40a4421f1ac69b6
Message-Id: <174455739178.916719.4161892312086996816.pr-tracker-bot@kernel.org>
Date: Sun, 13 Apr 2025 15:16:31 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mike Rapoport <rppt@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Apr 2025 13:45:19 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock tags/fixes-2025-04-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/051ea726ee4518ac5279eecaa40a4421f1ac69b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
