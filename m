Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658731DD9AB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 23:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743722226; cv=none; b=YHsiKoZylIwjPb36lcqtm12yQ5h0OwwOrTKps6aaPvSgWXIp8cN4D19YmnhTbIXynDvuJOVE65hQaj40E9ac9GuXp6WV/fZXOecfWZpiHMlqTxf7nYkr898Xw18X89Zws2+Uv+VrgnwSIMbsUI6KLaAtYeON0+lb1dYLI2TA+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743722226; c=relaxed/simple;
	bh=98ZkWjc1GFp3AdT5drHDlDX8CLiz9J0bBm5R8H6wPC8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tDeUkx+5b3P/WvFZHjgF9ijmobfVDjbWG+kfUdmT+1DXFQBVUYeNw30fod6RXXckd4lOUjMnyBJV1G7x9lit7KhzSnQx8ffxpFFDTw7dqmwtIo+JxuiOQxRY+kBjnswSNxr4ea6WJItaMm4keS9GSV/6u0UkAFOd/6awN9HituQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pParzxYf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pParzxYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A44C4CEE3;
	Thu,  3 Apr 2025 23:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743722226;
	bh=98ZkWjc1GFp3AdT5drHDlDX8CLiz9J0bBm5R8H6wPC8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pParzxYfyZs59r5cY93lCXRDWUxgKkK7PZFLxnxJWyuNO1ZxrX9+1SfIX7iZo8Wan
	 y9YLbfbI5fTT7HFS481Vokh13NrzK3OMzatgxLd4E2ZYLejhB6LBpAAbZU9yOXdmjI
	 +oXpGHz/tnhROWuU5SkaoCpYi330eBfdKbl4mynnOSoC6NXiPwHPKDFynmFGL/L8/9
	 xOhiW7cfevD8xMAuAxbNJubZZz6TUFuOqxtCA/V2x6OUCFBQr1qNdzTPpa8ZNzEWJw
	 t+lhLDNHA6W0YF8rDy4pnMEIU211Xs2HLIG0Zw7GlcNFnY37TGs/kJ/Wt4gYZw6pWm
	 cO7NCVJvhZeLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 73262380664C;
	Thu,  3 Apr 2025 23:17:44 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Cleanup and simplify the persistent ring buffer
 for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250403113116.5760d1d8@gandalf.local.home>
References: <20250403113116.5760d1d8@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250403113116.5760d1d8@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v6.15-3
X-PR-Tracked-Commit-Id: e4d4b8670c44cdd22212cab3c576e2d317efa67c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6cb0bd94c08e37236f7ba2ff474c1e70c8318484
Message-Id: <174372226318.2716716.14575893965335500062.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 23:17:43 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, Jann Horn <jannh@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 3 Apr 2025 11:31:16 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v6.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6cb0bd94c08e37236f7ba2ff474c1e70c8318484

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
