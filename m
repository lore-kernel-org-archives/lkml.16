Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A751B87E9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355218; cv=none; b=PaVplcBybV9hR7KwvKHBpE06uv9nU5hFHkq+KyYykOmpfYYuPCYTTEO+5Gg1Dj24XOR8g59EHQpk4S5VQ0YhK+XIxx39dQdVTyUWZJOuu4qssxhHXxoMv8qzsILNDSvyJODIyJ63ncZS7HUx1+LB0OFVP3iCbBLiZ+D77UdNJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355218; c=relaxed/simple;
	bh=OXi6CDSL4k9tuz8AGFIJwyuzqbUKxncpDPoHLeD7PFg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=s06WX2QxKEYIR4kSRQ9+6MvUxpn9Dyfgzeecrwz69nD+rVbNLA3IX8arpkt90MDs8qRNr0MsvFP2zDdE3zyqfwW2Zops5LDJPmGFSVpoSU0V6xZjnK9oGJprAwMjwkueF7/3O+UvRFGc1v1zUWKOwrI0AZHitwPaSvmY+rU3Vak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVChiThf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVChiThf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34653C4CED1;
	Fri, 31 Jan 2025 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738355218;
	bh=OXi6CDSL4k9tuz8AGFIJwyuzqbUKxncpDPoHLeD7PFg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MVChiThfRdFWa7vzlcYomltODBTXzxgEUSqfYpVgGXtUc8SSdubihtdcDpWKxAmXQ
	 oHOJLw9ib2PyTqS6tlXlxWCygYKM6O+5epWQlj1JNVyL5DbcAk1Ug1S4bWB6O/k5IO
	 cri6v7DAinZ4IQdCZoT4G9U1GxSKkXSIwPmJjj8ZSevFyhWG4Oajftx8R3CLx7S6U0
	 DSJYdGGC7PeYLBoCtfCjaHX+FUJ5EZh5kqK2CqZ1xL30SEMe/+TCswcgnPtR/Mdf+j
	 jnDSDqmA9jLd5v1sI5VFE0G0PbKmgtBuqCuJ+LnPxcjyiQW1goYBlXAQug+hqFfW3y
	 wOTDGvHf/C8Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADDE380AA7D;
	Fri, 31 Jan 2025 20:27:25 +0000 (UTC)
Subject: Re: [GIT PULL] x86/mm changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5yWJyDkAjuuJT5p@gmail.com>
References: <Z5yWJyDkAjuuJT5p@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5yWJyDkAjuuJT5p@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-mm-2025-01-31
X-PR-Tracked-Commit-Id: aa135d1d0902c49ed45bec98c61c1b4022652b7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c545cd3276cd611a5d53ac5e18e98a37f013694c
Message-Id: <173835524452.1719808.14688066876509263105.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 20:27:24 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@surriel.com>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jan 2025 10:21:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-mm-2025-01-31

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c545cd3276cd611a5d53ac5e18e98a37f013694c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
