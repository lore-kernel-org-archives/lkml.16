Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DDB2417F2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745010888; cv=none; b=azIrlwUrsqtQuR2KdVNTlnDZV3M0zcRQtEOB1O7MHBEBVHExJqA2ZdHX8dgrmWolZMP1v7QqH2JY0FOS2r3Sw38Ufyu/V4VhcICIhMqV6FYlZ1GjFC2Nsy7USHmrg9ckQroodIpIl5PZF4iMwrwxckv70DjLIJjZZSJDSaMAO1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745010888; c=relaxed/simple;
	bh=s7kS5hacGFR2JBkS2598dPu3C6KfPyb04kfVJSey5B4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YNe+1eA3gw60rH+jZ4GFeLub2+ram8PwXOArZ/XRbDJGFv6J3Rm8PMBCCT+cwJ2UQrpFsnDP9ENjnDW703V2dfMvGRvMabARWSwFxfyNwUSEmV36eXypg0hEgOLpx1HMw+XO1WhlHxCMKh4o3j+IAaEZbxuJADlz+Gkia4Lt0zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5DzGh63; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5DzGh63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DF9C4CEE7;
	Fri, 18 Apr 2025 21:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745010887;
	bh=s7kS5hacGFR2JBkS2598dPu3C6KfPyb04kfVJSey5B4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q5DzGh63LI3u14mWUlG0TTqGvQjlIx+V1i7KQ2Hg4X9rvlx1w5Opl3M9sKfFPyXr7
	 Zq+cnMP6WzLhkrp2H2VrQdYS9czVKG6QVO4UvS4hw15YzizwMS+Vt+0c8OfOrHOK4B
	 qI32jZ2qwZAXNdPGKUqxCIMC3cdUZLghvSbBYlQhqJOdOgb3COKQJGB22Nzt+ZWh9y
	 Z/ANre/ibZsXq/eH5rkJkps26yNkfwFUDQq3BO1VO/qXT3ToQyDNcfQXbVCPf/anGv
	 BYr1ssHwS59F329ZCmkscGwlunQynMP1s2loDXD/Y7Wiv5hR3vJjvaeC3rbF9Ga9i+
	 unCZYGJ/zMk+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7943822E09;
	Fri, 18 Apr 2025 21:15:26 +0000 (UTC)
Subject: Re: [GIT PULL] timer fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAK3beIzvEj_u4k1@gmail.com>
References: <aAK3beIzvEj_u4k1@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAK3beIzvEj_u4k1@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-18
X-PR-Tracked-Commit-Id: 3940f5349b476197fb079c5aa19c9a988de64efb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ac85740edf05751bf8730df5b898c92ed9b538b7
Message-Id: <174501092555.328197.11979926950459975901.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 21:15:25 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 22:34:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ac85740edf05751bf8730df5b898c92ed9b538b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
