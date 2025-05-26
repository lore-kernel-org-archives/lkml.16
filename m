Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0903BA33
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748300309; cv=none; b=VD3TsubnHvLWDdv+TicXoCsvxSP3UyKGc+5fEyaq4RF/TrX221GvwfxqIEwzZaJ+gzRDdbrdExbwp6mHjSSVnbBDBX91ZVnDQc1kgTOMqWEddSw4AQrkPGGjyAPOx1j9mtalfiOqpxoNvhdm7PA2bQNewpozDjyFiSz4r7U+xTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748300309; c=relaxed/simple;
	bh=SjCCewDLprpoWTcNaHLhUE8iFkzPoefUNu/x40ODTQE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NwlYnVqZVk6KoLvchvyLrIO5DF9+f0lNxnhz5X2IumMH8oRAYFCejKE537Qa09R6TRIZ1LM4lzFSEjs/i4aUT/tUQp/zddZacTMXm7N3g8QNtmQaPUege9YSxAXP+eF3E49S5y/jG8Z7hBR/PtTksMCtwliXGcsQZFLMY5skr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz4T2jge; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz4T2jge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC42C4CEE7;
	Mon, 26 May 2025 22:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748300308;
	bh=SjCCewDLprpoWTcNaHLhUE8iFkzPoefUNu/x40ODTQE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Uz4T2jgerZTpZ6VphVKDY4Tr43I4Iu6O07K2fO+yBFs9+jzoUCk8TQ11tJuruyl+P
	 lN/879L9x4fkLPv+LTXLSsG+7LoERl+C1yiruiL0ixt15xSlGIajogG+VQgF+Pqi1F
	 42OjgNJz12GVKYRRwAp1v6nuqXvT02hkiCkO+y89f42zpWPpyzlJQLRV8WOSfams+L
	 Km5hltkHN1jli4ebpL0HsUGvmXDiENo0+lEyPsbtpqFxE5nrCN0U4gnLP/FEqKAx/l
	 +Hr1zc4podguhla/XsGP0EHWvgStHDtNi0dxuLaM0jF9/4y5+8ZRpfEvgSSFyFtksU
	 honhAslZmft9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C653805D8E;
	Mon, 26 May 2025 22:59:04 +0000 (UTC)
Subject: Re: [GIT PULL] locking changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDLdBucNJqaA4T4R@gmail.com>
References: <aDLdBucNJqaA4T4R@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDLdBucNJqaA4T4R@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-core-2025-05-25
X-PR-Tracked-Commit-Id: 94ec70880fd376dd5cc60ba2bd7ddf830b3d4f28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3570b00dc3062c5a5e8d9602b923618d679636a
Message-Id: <174830034306.1082063.6938384301871041616.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 22:59:03 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Borislav Petkov <bp@alien8.de>, Uros Bizjak <ubizjak@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 11:04:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-core-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3570b00dc3062c5a5e8d9602b923618d679636a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
