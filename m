Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80228F7D
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746383365; cv=none; b=tZXT4GHyGKPWn8adOaCakboBUs3Y//4SyB+OvuqiPMu7P9iF23dBoxrn26x1kPrQhTTNyvcJWTWPq2z7ZIHfn1/IgT+v1RMgxBHZD+6iQ7tsg/Ye7zbosby8ea/IBJgYVHE30XBrSebhlDvJh6eORTQ76z03COF9t3unfi9Fzdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746383365; c=relaxed/simple;
	bh=eG2XA1PhS3cZacFVIJ9Z4/C6lbHGKoQ2i8KBx8WrX+o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eWa5xZHrN2q9NfJ2esnubXO26fotO3UqVabJqjSAYhLo3hi71FLOEeRmvFJuzjdsEVspyiWC0p9jvDMPIC9+85ueE/aJnjVwtFtxW0AMJ4N6bnyXvIGBCALO7Hn6ilq1Fzxt67ZjpXQHOGUaq5s5kxYYdUsKtA6rUX19IWaroSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvSgsrum; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvSgsrum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57FBC4CEE9;
	Sun,  4 May 2025 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746383365;
	bh=eG2XA1PhS3cZacFVIJ9Z4/C6lbHGKoQ2i8KBx8WrX+o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GvSgsrumH9i3Y7pBGV47WjJNwuN5CyTrY2v7C9IF9zPgkpJJ1wMK5ia6qlFpWpzBp
	 njaFiXEq6bhlBqm4Y9eL50CkfpS+rNbKV7bX9/Lh5WhK2Gx2O5uFRBkPrw7ISLOMvy
	 jTffhnQnuTBQ11pag4URd1UV/mklYVl3mj0HzPWu/VZ/8G6CyRKCQh/QEiC4pwXDSH
	 5wIdtq1ObD5k1ACZq9jawksRI7lpFun5Evh2wsxkNOJGQCwmTpr3I4kafB4F2e0LqV
	 L54EsVIhGS0fTOVZ7cHfL+KPqzSGPARpqkL0fxF7A2EDtDhDMfeMMwojwxwPx+sLez
	 WpuDGb5lshQpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E5A3806659;
	Sun,  4 May 2025 18:30:06 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250504123921.641e2865@batman.local.home>
References: <20250504123921.641e2865@batman.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250504123921.641e2865@batman.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc4
X-PR-Tracked-Commit-Id: 0a8f11f8569e7ed16cbcedeb28c4350f6378fea6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59c9ab3e8cc7f56cd65608f6e938b5ae96eb9cd2
Message-Id: <174638340473.4080479.446477391197854356.pr-tracker-bot@kernel.org>
Date: Sun, 04 May 2025 18:30:04 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Colin Ian King <colin.i.king@gmail.com>, Jeongjun Park <aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 May 2025 12:39:21 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.15-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59c9ab3e8cc7f56cd65608f6e938b5ae96eb9cd2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
