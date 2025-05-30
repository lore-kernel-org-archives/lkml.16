Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC37F2367CD;
	Fri, 30 May 2025 17:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626130; cv=none; b=DtMArfwuzxbDTEOWl/1tmdkTtIcpQYU0gU/L4lohTGIKlchoKE9kuQ4jRFYRvUMQ3CkTEvNmoOD8BsxjnOeEPUPq/N083+U1kwMcWUbHwVEmfUBx9bZFjmuDfybCXPp/U2xsfn03bonrK90KD4IA4ZWNJiHt8a5p84Y4hNZssvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626130; c=relaxed/simple;
	bh=62LIjZRR8IINyHMONFQQjuIRkRwxOOYcCTaq3jBs5yg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YbNJOEVniaMZh+gZGX2EGcGfA8YOFkvIxJNRAw5kbJEzw/spC9NWEjDbriEJw5QWWs5/WU6onjcaB57WmVksZSyS/T7TUNTtuD/Qba8GlKV4wHSwblghJ/yo/vf3j9fh+uIQEh/42Wuh572mE7DLIk2oQokIaG3GAGU4Do8qA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CE4iDxAL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CE4iDxAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1980C4CEEB;
	Fri, 30 May 2025 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748626129;
	bh=62LIjZRR8IINyHMONFQQjuIRkRwxOOYcCTaq3jBs5yg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CE4iDxAL0ic9MB9btmmOJo5Z9WOpGOsCg5l92FUEMYdCkIXVjJjJBCkLxI4xGvUsB
	 GjbxUtJmxRyS6aof5Rc7OPL9Njq9HWrLaxa0BRfwOTY2TCBlH9idS6rKdUvmXS1/W/
	 /L6N5XOhl2AEANiMQ/F6TtI6xRi4gewjmGUg9N4Arp1JoFqGgE0WLRM1mS/io9Lmiz
	 FAKUk5ZwGzQwxMMJUZM+z2OwZ8rkwGH65+J5RsUyludpZsrK8KAfNoxCHZIaNyCbJz
	 fCv5uj9XHH0SmD56c2+oio1B4d4vUqESCGF7m1+g+2Z1yntT3DxDFOoqNn19ezOAac
	 1H+Ie9UakZ5iQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DD839F1DF2;
	Fri, 30 May 2025 17:29:24 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250530001457.205397-1-sboyd@kernel.org>
References: <20250530001457.205397-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250530001457.205397-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: 63bfd78aae9a90210b0d369bb2836cca90402a95
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f32a03e3e0d372c520d829dd4da6022fe88832a
Message-Id: <174862616303.4033976.12915982928469029323.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 17:29:23 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 29 May 2025 17:14:55 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f32a03e3e0d372c520d829dd4da6022fe88832a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
