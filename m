Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313A22475CE
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746383366; cv=none; b=A3QiiCuFwBNneo9Go2WBD38j1E+vQgWBACMCKjBE/WarOx48Z21EwR70/Vr1m4D+kLkM9yqnx0NAj6S7lC0n8A6sZ9W9DR3HDr+8oKCH9ioOi11pNiFLASwSIWrTRXKaL7ABf+unKi9YcOgasU42sQKnSIpf8p+03ifnviFRxvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746383366; c=relaxed/simple;
	bh=eG2XA1PhS3cZacFVIJ9Z4/C6lbHGKoQ2i8KBx8WrX+o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bSJ8yt9n9bTG4vEq6RK6D2hN/RZ+Ov9ss5X/ODr0KfIBfImdTFRzeLloOirw2nZyfTU2de8vDVuKapDcYFme/b0mv5una0P4TtpGJY9qM9F62GpUXFSMw/cJpEa8jOlohZyDbP92VubMe2QiFXTHkgWKBnOfRRuM6+ZgxYO3Vh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPI6kM3B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPI6kM3B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57C7C4CEE7;
	Sun,  4 May 2025 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746383365;
	bh=eG2XA1PhS3cZacFVIJ9Z4/C6lbHGKoQ2i8KBx8WrX+o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mPI6kM3B1UwuxNJesPr0buHIYJQGa5iDL0pW3q4BWp+IC0qwpvZ4PYnbFPCXnYvR6
	 AEOFcs6bCuTM/jb+U4294E9wTLO7Ia3owfpZzgAjsxco2Sy1JHJXsAp6YWMgfm8pdz
	 BGDYUVMKc77RqcxSvkQx+6GHPG0dSfWFAMP+dw8oh0/IdNjx65VMl2Nqaj/SexgA2l
	 8IubHUcmE07+A0qi0HSkcKhqOou9SAhnXQiCIPF5Sggwd0LZyQRDnAsj5f/061TvQz
	 h0xCbKfGawly/8EJEv95pdl67H84bu6nDqqJvdiTs9MqxpD+pdPM3+kiRBCLnsVKqq
	 +4nyJDU8ooxrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 358263805D8E;
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
Message-Id: <174638340519.4080696.16518199425665562964.pr-tracker-bot@kernel.org>
Date: Sun, 04 May 2025 18:30:05 +0000
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
