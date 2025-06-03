Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00754757EA
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 00:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748911473; cv=none; b=DP6bxs5EuIQwfbXKDYyAA/9VgD9z9di68gJ+QQS7vhs7vvA0dKH/ytYWkylQyZK6aQcQT0jKFJ5HC/HlD0oMAMccqBHVdlhXCiTLFq+S2+H27nDAA2COWKOyC0h5hRoh8BG1mK+q0a8kRh6pQ7wpAwybj4y9L98TpmGA+WsRkes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748911473; c=relaxed/simple;
	bh=NFH+OJFdNF9rNl4VpLRwrszuA1IuuE7qq/GEhf7u5rk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SLzZrE/24esnb3jnZZ29Txsux0Pan+b7B41pCQHdqUyZKMjGpBPwlyUaosewbqCSBqn9qvFrFYkFMSX7noc11qsUrC9RzpMwDqK9//DJyHomoMSu2BtgDH4xyYTfKIaYGIJ3SLgZMrW3wLXf1DHdF9C5VdLhO1JJU5zoHjBPtUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiWTbuyK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiWTbuyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A88C4CEF0;
	Tue,  3 Jun 2025 00:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748911472;
	bh=NFH+OJFdNF9rNl4VpLRwrszuA1IuuE7qq/GEhf7u5rk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FiWTbuyK8hPTbU+s+AyNtNxmrlVe30wFUn/KD0V64x73CRYQPtRkXYLoGWt9hbOVd
	 JnSd5YwMoltY+INdVv1zVyi3MqbHrZBTaS28mDlGgmVlY+eyMsdY+YhidVRIHvtxWW
	 8WwdA01FqVB9JmOtuEMlQ2UvufpR1EkkOFkPqeM+kJmI3eKUDqhesfg5oc59azoNQE
	 4HQD5zYt18dETzn4cD3yr3a1lQvP6WLQ+1AFWC3nLg6pxlb9QhICgAR01jkzr3I57c
	 kjV1eG1GxiMLWR0FG3reBkpa1CK4biDoDV10sABC8OuFZGm5eEY1qK2B76ltDFV5cH
	 99Ag+Pkcr/qvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD6A380AAD0;
	Tue,  3 Jun 2025 00:45:06 +0000 (UTC)
Subject: Re: [GIT PULL] bootconfig: Update for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250603004607.91f48cc8ec27e09e24c993c7@kernel.org>
References: <20250603004607.91f48cc8ec27e09e24c993c7@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250603004607.91f48cc8ec27e09e24c993c7@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-v6.16
X-PR-Tracked-Commit-Id: d81bab116b485643a08f2147165cc257b3734188
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
Message-Id: <174891150529.965188.4874005126660714314.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 00:45:05 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Brian Masney <bmasney@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 3 Jun 2025 00:46:07 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git bootconfig-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
