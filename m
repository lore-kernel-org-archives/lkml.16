Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC73824337D;
	Mon, 26 May 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284526; cv=none; b=JjIRLum7hoU6nG7HnZylYx71yncF+saGJU6Bv1AWNB/2EtvenU34CpwvKdVWqbKtVsEouEnCzYWdnSslKjaTQUqC4v3QdEJf/s+D8uvP0yxhmIWEhRuOBFRKvFxgA7FNKu9aqVmgcw7KKQBmw+rkPxrWqfU3VQiZTqeUT5m5XhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284526; c=relaxed/simple;
	bh=DaWUTJG3bdbeMZ9bOVOrmttiViOYof8QjnOAShkAtx8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nYC3ZHs2No+zlnEgocVmzcz1VZ7/sNK1OI02L4pVBwTfXxnOGvTKqV6tLv1cReZQ/t3G+dDlJhHx7Y6JLW1QSytRsy0tcPFAXcNeknhX1PJEu+6eiZyffWNC2er30l8NnMXdZVaHJULg710nNV7ZmocPqjyh81s6f5hFu8Gtj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJtyZXLu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJtyZXLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1491C4AF0B;
	Mon, 26 May 2025 18:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748284526;
	bh=DaWUTJG3bdbeMZ9bOVOrmttiViOYof8QjnOAShkAtx8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iJtyZXLu0p9V/2UEcibsZacwQBw6qqrM7rZIdP9PoZUMOeN+9AaEJXH2rbwzfCLoB
	 pVXcpw/pex/uBP0wW3F4nnQVR7XVN2TqX686Q4QbqYOxVNhOrug4BUuinvNkqWxP+D
	 zT2uIfLksg5RH53Ey7bb/7ZuM08PnfMn+YfsLsfPwhzbUPK8viSoUTzu/7zzB0P7Ln
	 vcX0hLo7uJ83ltaB7dLibfxgwA/xzak1txLjmWic/1RiUnhe6EPDsyEnjCHnZFMNjl
	 AhrAXZcYbxaQ8lrVZP3FLEnJ0J1HiDVxD5rq+3nmk87JxM7Dj7oovICnwOyO8GtF4E
	 85baWVJGicAEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DFD3805D8E;
	Mon, 26 May 2025 18:36:02 +0000 (UTC)
Subject: Re: [GIT PULL for v6.16] vfs pidfs
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250523-vfs-pidfs-aa1d59a1e9b3@brauner>
References: <20250523-vfs-pidfs-aa1d59a1e9b3@brauner>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250523-vfs-pidfs-aa1d59a1e9b3@brauner>
X-PR-Tracked-Remote: git@gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs tags/vfs-6.16-rc1.pidfs
X-PR-Tracked-Commit-Id: db56723ceaec87aa5cf871e623f464934b266228
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d7a103d299eb5b95d67873c5ea7db419eaaebc0
Message-Id: <174828456110.1005018.5499249117355811155.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 18:36:01 +0000
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 May 2025 14:40:47 +0200:

> git@gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs tags/vfs-6.16-rc1.pidfs

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d7a103d299eb5b95d67873c5ea7db419eaaebc0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
