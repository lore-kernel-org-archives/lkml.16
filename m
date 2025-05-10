Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98356189F3B
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746894498; cv=none; b=vECUvFySwox7F5AId6HzFUvd1TBUbTRmekZoJlkn5xAaGcciXEZvRBBnKYKb5R+HoI+NM87d75JEEq4sC9uA8en1KsUTfG11S2mR+i+IzvoCf1ke4yZ8rn+SN0gv6Oe54e3eItOQsnq4u26LZYC+ZJ9+KhuS+mrWHUjQE/WaKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746894498; c=relaxed/simple;
	bh=R4+pyvED4JPWaKKZNPWCeKPn1xFDJDCAuUXhwp+6kZ0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aD1FdzduaqWMnT99q2apVDuIKCxZzkR6ZkP61P1lH1amCsZamD1ZdEX/MjRNUjqsh2kc9MiV0i6csmynlGZ9kt5tTafTDO8xR6eDDUWfTXror2prQ/jD+QZYjgIl9tLIIOja3Z96eAwRKMxh114EpSHB7XcyqlaLMruEAbqGq/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfDUI3vy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfDUI3vy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7923AC4CEE2;
	Sat, 10 May 2025 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746894498;
	bh=R4+pyvED4JPWaKKZNPWCeKPn1xFDJDCAuUXhwp+6kZ0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VfDUI3vyfbRoiK68I7/X7BAioQ7uZpKBJ0OOJ2Tn73eNCkLK36TteA6MhyPNGks1K
	 GDpK9UhlojkAlZzYmGnOKKrs5g84GxcJSu9S2NTjOX9U++WRHDdN5kcAoUVSSGpuJB
	 INeMT2ThmfnXRdKr1J3DIXiEylmG8pHCtrlcntS/Y1FpyavxQ2zj6DYE64l+m1VLnm
	 X9dwji2PchlpWwlGnFODccK9PrXPu/KMkglmlob+qSWZJyEr3ceBZxldQ7Pf2qfzxX
	 p5qLavK/LfDByJfzPLCFehtQhKKVfvaA+4rWi0oh9oHQ9bMcM6etzs0PF6m8rtFmvp
	 y4rqs4TRvSXjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE8C3822D42;
	Sat, 10 May 2025 16:28:57 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250510060239.18894-1-jgross@suse.com>
References: <20250510060239.18894-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20250510060239.18894-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc6-tag
X-PR-Tracked-Commit-Id: 1f0304dfd9d217c2f8b04a9ef4b3258a66eedd27
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86c019597cd4e0fc90dfa9ebba9282b2d122c187
Message-Id: <174689453659.4001425.18085781507262219952.pr-tracker-bot@kernel.org>
Date: Sat, 10 May 2025 16:28:56 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 08:02:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86c019597cd4e0fc90dfa9ebba9282b2d122c187

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
