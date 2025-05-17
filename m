Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F2920C48C
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499218; cv=none; b=eIqncmvOQkPS7hTuO3+0n+m3ChwQZqwihFeGGxstUzjJfiq4S87IXT3DtmGSPoXwnDfw1/fzKP6lwNyGIQy89yjV9o08KlA6MWo2SDOC3KqCsRh/njN0HBKDF4QVETYSZBqCA3Md99sEERLPqmC8fhDSHDGXH9UmkiscAP0W7Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499218; c=relaxed/simple;
	bh=PHz57fv6AjCULX0weJ5nfzNbIH0Nv81A2Ca6yTjBBbE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=U34Z/NxpVxI6SaQJYnxenyTqOr9HZ03Y1gTX4m42OV3fBb8YHiXA/SaeYP18xanGf3l2SGNqP+PJAWIXVH1w+/ypUnTAOfIsAvlldTxF48KNDqJ6iPqsmk1y14CTFG5C+sSgciho7hpnBszac6ViFcmDNFUqfvxhYn2pI0kJMHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nq+V7Vz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nq+V7Vz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ADCC4CEE3;
	Sat, 17 May 2025 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747499218;
	bh=PHz57fv6AjCULX0weJ5nfzNbIH0Nv81A2Ca6yTjBBbE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nq+V7Vz+TwpMc5SJL993tby/hVcOagx5PJHQEWHAsLCWz4+sfd6JCyEJ6XybsXO9n
	 +BXHpf49MQQ7CsFBrYo421e15ah8ECsX7C6UsRj4KUEvMBaMaOuXWRL4BbYJ3m2vsE
	 jA/A1byvmdLU4pvGtFUNfFqCpy73+6z8ptZ7hcPAcRqKndc1Ih2u6g/H/mR4Zd0yO1
	 g7ESKKfqWH9aexGCLXHAK8EcSIMUezfNnIF1gX7ejCfs9kh6Se1AtLNTzYnndYtgb2
	 6ViLE7Fpk6HkWixs+AibHqbOLVmnaScpHQwnGHpxEnmZvRxPtt79MvvCovKOneoVr6
	 MHgbRyVpY3jaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF67380DBE1;
	Sat, 17 May 2025 16:27:35 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCiPyvlZPJFTRcle@gmail.com>
References: <aCiPyvlZPJFTRcle@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCiPyvlZPJFTRcle@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-17
X-PR-Tracked-Commit-Id: 03680913744de17fa49e62b1d8f71bab42b0b721
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56b2b1fc907d3ec3e9d5c56539758847c596f31f
Message-Id: <174749925457.101931.8276292346896943719.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 16:27:34 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 15:31:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56b2b1fc907d3ec3e9d5c56539758847c596f31f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
