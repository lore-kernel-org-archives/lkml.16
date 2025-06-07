Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5171843159
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749259091; cv=none; b=uSDJhNBGphjf0dAPbzUr6GY/L/UhgUpjH/+qZZzn9ZsLGacKscXCUs2X8uISHitBtJ91PJ+9OYyuNUEKy0MMPZzWJq6a5Vs2md9+ufM0R1klMn0mDNfSC7cE4wP5AF0bcYOduPU0aWip3HK4wRE94IiClWzWF1fj+mPtD78fYvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749259091; c=relaxed/simple;
	bh=3z7kxYlFsxRjQo08OwWtkrAf8oUShdyaJqTo6opLGL0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ahYBOfvBK/V8YT5s94RADzNkPDKA6VmXm4P5yoDkQ3dTWvvC6RSAqesoJAXCz+y6zfVObHFIF1O3ciyMLzgrDXNZ/eiRSB18W8dd8TgRqlRv0ctOQKHS8NiJg2kMQwHpMl8delmnyIE93ScyJ8k3TLuTJFVOtzir0rv2axf0dDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4XzOVMz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4XzOVMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33711C4CEEB;
	Sat,  7 Jun 2025 01:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749259091;
	bh=3z7kxYlFsxRjQo08OwWtkrAf8oUShdyaJqTo6opLGL0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L4XzOVMzIiOcLfjyqHEra0jDe7oZF5fAHg8VM1LvqPquaqfO77vqoFMnhZhQ9TIiZ
	 A2yXjctDcC/J2fXB7a9ImwDQ7iL7X4aOTDTfrx7A6fmk8ZYYbt+MlOI3cDym8MuuIB
	 Ly6TjYYk7hP5uvvmg66cA2G++WAUEGmxp2uBSD5xBb9tagY1xUjYhJIPzCQPBz1knN
	 XfFhex8m4bzzhJStea6XB6UMcMaGQoBTSVR/dQQQAH8Wz4ui3M7ENudH1hiiB2EY17
	 MEnm/+IULMjBYlJOVcpaWSvumotoSgZa0skC9tEx5nmBxcB6TG28tYpTSKOTka8nUD
	 TxAjlvua5fB0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE693822E05;
	Sat,  7 Jun 2025 01:18:43 +0000 (UTC)
Subject: Re: [GIT PULL] tomoyo update for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <5eb6db5b-a133-4084-9f67-cc971911ca01@I-love.SAKURA.ne.jp>
References: <5eb6db5b-a133-4084-9f67-cc971911ca01@I-love.SAKURA.ne.jp>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <5eb6db5b-a133-4084-9f67-cc971911ca01@I-love.SAKURA.ne.jp>
X-PR-Tracked-Remote: git://git.code.sf.net/p/tomoyo/tomoyo.git tags/tomoyo-pr-20250606
X-PR-Tracked-Commit-Id: e9ddb37834eb93b9840ac9aa93a36d70f27c3e32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27fb892d364bd18a66b61a04b63401b18aeee253
Message-Id: <174925912249.4051830.1189090626458149225.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jun 2025 01:18:42 +0000
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Jun 2025 19:58:21 +0900:

> git://git.code.sf.net/p/tomoyo/tomoyo.git tags/tomoyo-pr-20250606

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27fb892d364bd18a66b61a04b63401b18aeee253

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
