Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D01531D5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743129039; cv=none; b=Kv6xiuRdUWt/A9yrhJYqHY5QUBhHxpRp6ZemubZTZLKx3uyXt7pVv9MbPz4XbE2+atR6Gt4sdkdg5IUywfQphBfGUTpfSd70dWSoVcw2/P0QdutNUbBhurdKIPrAu56IANymk3VnymesBlE4ZLkutoTBmPDndIguMpT4IgOriKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743129039; c=relaxed/simple;
	bh=ovSUcLh1iue2GVTV25SAEU+2mBZkfnnVxmjD4RAUNTo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nFGQXbIqCdmu51c2Z+8SJPBxQmZ3OxI80dhOODhUrcaco0nKv1pNNET39PAtpYLKq1LBBEjZUBTnlbKt/ILQwRKw+5abQFNo5JAexSQaEiNENCc4W0Y/sugbdVSc72YCgP1TeCMnNe0UNQ4dbCC3ZUfK8RkaptTM8EMn/nsdahU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrbUK6Dc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrbUK6Dc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9132AC4CEDD;
	Fri, 28 Mar 2025 02:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743129038;
	bh=ovSUcLh1iue2GVTV25SAEU+2mBZkfnnVxmjD4RAUNTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nrbUK6DcNE6V7qpnmLDPvUiZlcBiodTH/gpvfaP4iDoeeemvC4+/fvGtJpjNL2Nkv
	 y6GLsb9V5JDvtyw0JU8Wj6rHmADQ+vCqV9AlQRR+0BqttKNcgo7laE8b+B9O+rdYot
	 A9PHC5hDkSVl9Lj3gRyV5HDiK3MtT/g36Z/h/rnclQuY7OH9t84str/lgs0f24+jaI
	 orKM7D+fKRnVwNvTeZ7Uec0/oHvYS80sZb7qYT1Z9ULfMqec0syPlpJCXRMR8RhFia
	 rZ3Gbv69Q/H2l0gB7NogMPQteDIy5suQ3GtuBgJTQQhpFZohW4JRI/KbDfpPFUv/5u
	 7p7SGrkkTcQsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E4A380AAEB;
	Fri, 28 Mar 2025 02:31:16 +0000 (UTC)
Subject: Re: [GIT PULL] printk for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-Uvf8YsA6q54hv4@pathway.suse.cz>
References: <Z-Uvf8YsA6q54hv4@pathway.suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-Uvf8YsA6q54hv4@pathway.suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-6.15
X-PR-Tracked-Commit-Id: f49040c7aaa5532a1f94355ef5073c49e6b32349
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96050814a3f667eb28dabb78e7b3a7b06e5243e9
Message-Id: <174312907480.2320867.3692780080428803756.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 02:31:14 +0000
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 11:59:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96050814a3f667eb28dabb78e7b3a7b06e5243e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
