Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7FD51022
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536936; cv=none; b=s0sblWw9cS4qDvR5LNZlgyVIqzGT/htzCnvChqK2EF/8D53DAXXIX5vPXWyU3J8hU2Ya6aPtWIcOpFMn0THSbmf73RDCxr/ipIVyLZyVvo94cuTG/4KQ0+q82CdLRiFoBphagHlXUF5LKyZknnod7/kqPhIex2mvIfAFEas+jZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536936; c=relaxed/simple;
	bh=/EpuYkmjtskZ1SRYdM+QAsUuTra1in9Lp0mt8pCKePY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ao50m1N9aMyFLe/3unT/hBa3sRRX6QSGCZJOPXn7vxO6R+9yraQE5Sk2U80ZoYK7y6eKEYH0av9zrke7Nu5waRIk6aL0kCiCUKi2GOvz+t8H7D6n8f5fJAxyAt+dsJbZAP5jeBikEV6/yI+gXLP7GmwquRbtlyb7gnF51aXB/Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSUushRr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSUushRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED5DC4CEEF;
	Tue, 10 Jun 2025 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749536936;
	bh=/EpuYkmjtskZ1SRYdM+QAsUuTra1in9Lp0mt8pCKePY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WSUushRrk3/UCnITT9ryIjDExELTP2eeighKb0mw/g880fNjMg6u7U0l7dA0EB4Rv
	 w+MJ5IVHLN4u9ukf+jpJOSNybpnayqDggh0B2DzgGAakCC++KaKNIWixsOceeaHq+X
	 1eeWwLNDTssjXpocw9zWb6z64cWqlXNg0mHdQKzhOPL8FJj9NC2mmmKOjmivklCuah
	 hFnVo4c2xLjmIQXcodtzdmw3IyIqn52o1Tql9e2NST7laMyPbFkxDJfUe/qA7DHgQo
	 b4R6p3CGkwGhx/yLls21XsDKY8VkVI16qVolaJJHDc2rcaIdP79YsAIEJDBrLaadb6
	 i9a7GMy4v7Tkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CFA3822D49;
	Tue, 10 Jun 2025 06:29:28 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
References: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <be959fb5-0cab-4a7a-890a-0ef4e9fc4d2a@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-2
X-PR-Tracked-Commit-Id: 0d67f0dee6c9176bc09a5482dd7346e3a0f14d0b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f09079bd04a924c72d555cd97942d5f8d7eca98c
Message-Id: <174953696673.2106657.9320314101659577753.pr-tracker-bot@kernel.org>
Date: Tue, 10 Jun 2025 06:29:26 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, haren@linux.ibm.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, ritesh.list@gmail.com, =?UTF-8?B?15nXldeg16rXnyDXkteo15nXoNeY15w=?= <yonatan02greental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 10 Jun 2025 08:09:06 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f09079bd04a924c72d555cd97942d5f8d7eca98c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
