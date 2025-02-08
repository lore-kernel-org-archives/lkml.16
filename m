Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BFF2475F9
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739053531; cv=none; b=MdvKXoETmYwyf6C8EF8JGbJkNk79I7qSn2r5kTBvfUb/WJN9qxbscZsHwyyOMJB6LBXu+LPodYkMOSzyYxmkCmQhpw/5zIwCiRNfnHRM2zv4nXAvzZ1+ja1GW6bEiZxMMqDZDYcAClPedrhvBVUPFrqtW8RLP+ZKCnGSYPuKbdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739053531; c=relaxed/simple;
	bh=vMpCyrME/VbT+7NttsERU/y03VyOHk1LLgYs/f3xJ7M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=k6X4sgBnBIWmfFmYmb7+ytH45ZF/e0srP+UILsLpEmXDMCcjUsrZ2D29VUdu2MxHMSt+ssIjA4Kkxgr/dKURdRA0Zk+xHiD3WAANSSvSXgiW6p4IyCEpFUSVAPxcHnHK8dppleLKMKoFiaMEySyp28kexl4FAfwWmUc94J+NL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shZ5JNhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shZ5JNhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5F4C4CEE6;
	Sat,  8 Feb 2025 22:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739053530;
	bh=vMpCyrME/VbT+7NttsERU/y03VyOHk1LLgYs/f3xJ7M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=shZ5JNhkbr4ZhdJgdKYHeEcl0H8RPWpTaAOY9sojZ2gp7VikYzWlVDQ7aYDp9x+qK
	 VUx3GFEm6nQDi5IPELW94Q4t4/6Qv6mCUtxGOwlM/EqfvB8xCX4bB8Mu0Qf9BogCPg
	 lt5kzPMVRlxqfYPfvCNntgYMfCh/ID3FLgwrmT1n8SDfpI+u1a+5SuxlVWDYLi3jzP
	 wU62os8vxKEjdeYcfFwR4pYar7vI08ktv1J9AvMWb1vJlmsfy3iHhVOyyUvt27+nRr
	 TN+SbOruNeQTY0wbtd2aDde23k2vnYh1ntXcAOfSzTwSY7QPeUPNjsJoFNAVUItexq
	 eM5ovt9iGxCTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34057380AAF5;
	Sat,  8 Feb 2025 22:26:00 +0000 (UTC)
Subject: Re: [GIT PULL] hardening fixes for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <202502081241.8997DC3@keescook>
References: <202502081241.8997DC3@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202502081241.8997DC3@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.14-rc2
X-PR-Tracked-Commit-Id: 6270f4deba3fbd77d1717fb8634f1fc612ff69e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9946eaf552b194bb352c2945b54ff98c8193b3f1
Message-Id: <173905355869.2676587.13518722246809188664.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 22:25:58 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 12:43:42 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.14-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9946eaf552b194bb352c2945b54ff98c8193b3f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
