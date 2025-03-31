Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5E202978
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440863; cv=none; b=AS0nlik1ohsuvvldbfj6nGbhldvxGF48d+G9ywQFIaDeJfSmrWtjVOtZ4sW4yCnSYiz9diOyMurcy+d+4UpbCdLvGjNeBYFR77bnMxrKDnJCCJDnkCUYjIZ+nT62Lk5ZPcUEfsVrQApLTe0dHtlJXjzU8A25rGMo3BGh9Z99kso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440863; c=relaxed/simple;
	bh=w7wK1P0SQ/Hrek0iTVemnHXl2LYfpN+h9+x2gyjOXIs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B2dCxCOUYquSfZ9NcjRjSnVRJxP2JA5A/mFvBLoytd8dExUSpmHPo272lwg6UwujwsnEG4KqTyygilIM/pH4bVx3BXLC0ZroIOJNYgcvL9iAAEAei8UQz1q7VXyNU7xa4CKujk/a1MhvLNdjV9q5nPcyNNZDXyIHH3Z+h3U6yLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mum90agY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mum90agY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5054C4CEE3;
	Mon, 31 Mar 2025 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743440862;
	bh=w7wK1P0SQ/Hrek0iTVemnHXl2LYfpN+h9+x2gyjOXIs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mum90agYPLukQ+6aMVJH5E6srf/DCCm043eDX6W9lklwrlX2w9HRlEtVcLg8/cKpV
	 xkh/wK0OPc0xx5+GFUC+baFYkQcYQLUlr/wDpYEHHm2yXS16Td+fAaSkE8GALOcyt9
	 sMecHa5z67vaZ7VSjD2qPTJ43nRfw/+b+d6iruOMKwAByviumDJ9WIFpVx0DxvYCGB
	 EOQ7Xg3KvPuN0pqJe5Moo80tpKt3HdVZ8G9FbkWIYD8r1SeIv018aclsdR6EUUcvPs
	 FOV3Cd4XI5V0Riiht2hRvyJJP7D4YbvV4+NRD11LhT4z9eFP6o5kkKjQafk5DjzhzE
	 dEXxuCXRO17jg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE13D380AA7A;
	Mon, 31 Mar 2025 17:08:20 +0000 (UTC)
Subject: Re: [GIT PULL v3] latency tracing: Documentation fix for previous pull
 request
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328172030.286d5a47@gandalf.local.home>
References: <20250328172030.286d5a47@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328172030.286d5a47@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-latency-v6.15-3
X-PR-Tracked-Commit-Id: 4bb5d82b66002b770f8917d68ab4fbefcb7f5f9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 609706855d90bcab6080ba2cd030b9af322a1f0c
Message-Id: <174344089929.63132.1626492609518506781.pr-tracker-bot@kernel.org>
Date: Mon, 31 Mar 2025 17:08:19 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 17:20:30 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-latency-v6.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/609706855d90bcab6080ba2cd030b9af322a1f0c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
