Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125763085D0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270067; cv=none; b=S5gi2WTfjpaNSKz7QJms6mIc/O7VY0zx+pjwBYh1Y1h/4ZqLJLhRTKiyjlJNiTq4K6C0D3n48lotx1Oy8Pp8/8LNZ+drJ8VTC8iRiJ5LiDOn8xfK++HDg0f5AOekCLtvAKIzl1Hg+lv62uN3gamN9bipbaoAmc/Zs2DS+BkEszQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270067; c=relaxed/simple;
	bh=3uorwZDip4t/+oDJA+GeskxkZ5/BLcq7ViqCkI1IOHM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lkmwLMYtZwvR3eMu1Qhu2cLJwBF18d4UpqMewP0ohEc+nBXPwS02+DwZ4eKuJ7W6Ia0utpYIqbKGPi3R7C+mlxrtdaxAKgVnJzQyZEKNUtTY72wR7VtX8MR/FfvdhaTDfIv2+Zirm7gxX/GFbBmkmB6DBjfo9qddo+BY02kJX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3zmBDSC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3zmBDSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE64FC4CEE7;
	Wed, 18 Jun 2025 18:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750270066;
	bh=3uorwZDip4t/+oDJA+GeskxkZ5/BLcq7ViqCkI1IOHM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b3zmBDSCRR2PFWoopKBMtNu3o1tuDu4qn/YEfJwFPomtT4q+S7roqEPJ5pBsB5fQY
	 1P2DSZsJMk0/K1IRLJ9QE5DO9fqLBJkl2aej9MAht+aJhxKBloCnZJiutnhYttn0up
	 KEc7yFMPTAYl0WSCWOOZzk5jWIzDHd8G1PusR9suxu71o2oEwL1EIVQ6VUnjJdIG3P
	 EKBFgq2ZXWSzDbRA1as+jzQOYfKQT4AGMeIvdnX0i7DRujJnRkcJwrF3MICoVYE7lp
	 iIL8kJ6CKpHfGQlnA+mR+WL0Uw64X3bHP5legKz7sbQczNCyxMJgft+gm7ktyGdgWS
	 wfEEVZfAJxxLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CD53806649;
	Wed, 18 Jun 2025 18:08:16 +0000 (UTC)
Subject: Re: [GIT PULL] ftrace: Fix accounting error in updating funcgraph-args
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250618114907.23b824df@gandalf.local.home>
References: <20250618114907.23b824df@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250618114907.23b824df@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.16-rc2
X-PR-Tracked-Commit-Id: 327e28664307d49ce3fa71ba30dcc0007c270974
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5da3ff1fd0fdce7b5d9508c62403c04a8c96a1e5
Message-Id: <175027009505.206233.5683599083078698779.pr-tracker-bot@kernel.org>
Date: Wed, 18 Jun 2025 18:08:15 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Changbin Du <changbin.du@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 18 Jun 2025 11:49:07 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git ftrace-v6.16-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5da3ff1fd0fdce7b5d9508c62403c04a8c96a1e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
