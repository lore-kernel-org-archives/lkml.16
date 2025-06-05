Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665A2749FE
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139879; cv=none; b=Z7BL1xlHp1vaWxc2vASlk6V/eVVkvVBjs2358gO31J4GmnKgJoFYKERqgv6VZ8hSgBzbqxbUgALkZo0Xq0jdo82wKPTCjR6S5/DV35xJ2f4WI7im6bll/+XloMQRu4nBjNOZ6q5kbOSBe414etkhFaeEdcb875YLE2rj5ZzB80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139879; c=relaxed/simple;
	bh=+QLbUoR9sAm3J7RRogfsTkCDjY4TMoIDGSPj5reerA8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kNjZKBI/AxbAP9AiMYTVGAo9LgVsw1FKoqpUmruwbkr4IxwuIOy5eb+8GWdmf/CUNbmYJ82j3oBYUs5mnGWT690oLphx02LOvk0yYWEnz/rHhvDmF5vwAvj1DZNM3rI5CbyVlJ6QK0/hT9/MiVPwW9DzDCWZuzO8BaHfsCJgELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1o7wcuC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1o7wcuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C53C4CEE7;
	Thu,  5 Jun 2025 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749139879;
	bh=+QLbUoR9sAm3J7RRogfsTkCDjY4TMoIDGSPj5reerA8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=X1o7wcuCyFj4lPmAYDYzSF6Mk5OFLeOAUVTEZj3TkdMs06WPfg1qiQUlkN56/qcNd
	 ATQs4OVbkfv4zJIY6oqPkxU6eFk0kM6tZjm3EJzhuWI1MOL8Z4nxZmvhCusOCueBMi
	 46oy2rVIGgruWRjRGZtbyMefKZgdYmQhMzhW/nRmhaokcnSMKFPwi2/0veG76Q4le0
	 P9S57KkaLwxiz6vxW1IbNgr658cGxCDamW447g+dwpmDvI4f4IOBwgv6Uay+rDt4aQ
	 HCtD7kbC4LPAdeTtKT3dNB2+rYNzk69kyrl07jA5LuiUwXApVZfeSWn0FNUHqTF3+r
	 RP1yTYk2bd9Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE15638111D9;
	Thu,  5 Jun 2025 16:11:52 +0000 (UTC)
Subject: Re: [GIT PULL]: Soundwire updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEE9IwuPcjYyMSLu@vaman>
References: <aEE9IwuPcjYyMSLu@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEE9IwuPcjYyMSLu@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.16-rc1
X-PR-Tracked-Commit-Id: 62ada17a6217a50fbd1b23f10899890f56effc97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a479ebb269bc0c4d286f0413b92f92808e053b79
Message-Id: <174913991125.3131347.6218063667183932710.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 16:11:51 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 5 Jun 2025 12:15:55 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a479ebb269bc0c4d286f0413b92f92808e053b79

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
