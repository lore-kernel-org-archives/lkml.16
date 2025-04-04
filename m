Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04121CC71;
	Fri,  4 Apr 2025 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786090; cv=none; b=SPC1lLd8pjJTMWDiEmgYkFH/gKC7aCbA1yB803Tx+J1FD1Igp2PYY3WmwXYZs77k52sn/7Uaxl6SRiIu96hseqLa/sKfnBo0RTWrTMnw5IgMs66IGNd+jCKAFdISyx6UqfE4CuQOeIP2f2X2xhc+v0rrgBk2RhgwZJ3bgiV4W/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786090; c=relaxed/simple;
	bh=yDEgfToI0azkjzwGKpdSnQNZWmiu/orvhvGPgjxnYpw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OB8aX7vrtwqIXOWry8O4hJYMe4AXd9dns7YuZBD0pXbxyXlKjZCSfMZtChaUVGdL95/QefXrfO+glRDSv5w5qX6xpcWQZpsJoox6+JG+2oYm4zQYwh72GuToiw1waN5Vi4sp3scAet9CF+2D1DNZ1M51KdhP4lBuCREu+fv17f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQnd8n6L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQnd8n6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE57FC4CEDD;
	Fri,  4 Apr 2025 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786089;
	bh=yDEgfToI0azkjzwGKpdSnQNZWmiu/orvhvGPgjxnYpw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RQnd8n6LAaL0kn1uoXFJvM7k7CR5uu+O0P5l4lL70V7tjoxXuTJSBCSJL5V7ynbtH
	 AudF5jSUCyVabF/yk3STXBZIqoyF6tX71vzywX/pg5CDJJ8AgYDJCtX7NktvJDOlLr
	 DWhe2ycXWhlc5qdFPBpDYYhrRj8A3E/9YtYB4G9a4j+afDgmkyAoWvyOyHrsQZuTnO
	 5ix1MbMHm66yp5pi3H3GUJKmB2NHhMYk8v1lgQqYsgKbB0wfsuImKL3+/3mrCk3kKy
	 gIJCYJY9eRdSM64EJP1NJ3XfD4FbdSpdWmpc1gLw0PUpOGjdOmBH7aZyJpZz7NGkSB
	 Fb9WRcXkjICrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DC43822D28;
	Fri,  4 Apr 2025 17:02:08 +0000 (UTC)
Subject: Re: [GIT PULL] Networking for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250404153457.2339036-1-kuba@kernel.org>
References: <20250404153457.2339036-1-kuba@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250404153457.2339036-1-kuba@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git tags/net-6.15-rc1
X-PR-Tracked-Commit-Id: 94f68c0f99a548d33a102672690100bf76a7c460
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61f96e684edd28ca40555ec49ea1555df31ba619
Message-Id: <174378612666.3331400.6497225289380252542.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:02:06 +0000
To: Jakub Kicinski <kuba@kernel.org>
Cc: torvalds@linux-foundation.org, kuba@kernel.org, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  4 Apr 2025 08:34:57 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git tags/net-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61f96e684edd28ca40555ec49ea1555df31ba619

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
