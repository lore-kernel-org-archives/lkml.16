Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513E920F09C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748582689; cv=none; b=HiZJF1UltNieNoD7nS8fAOMm98C1ahMS14GOsbzoWgUG9zBLZwb2f07iHQOppgJJnFlmrLWeF3vmtv95X5qfkw3cxXt30CBfIOFFrcP+4wdGDi8AC3UsNF3nEYUtQ6LE/ZDZ4N4I73Uok80DvSnRptfAh11M2rNJ46vrugaQgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748582689; c=relaxed/simple;
	bh=11l8sxh1YOQyITc7px+U6p0p3ggoIqtQHhxHRqbFUr4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Dv2gYxOLoUqCg2BggMCpfkWEFGHhrjxT4sO013DMvHULLhhbnWytW2JBz6sVH/NX5F0xTDxD9WAQSLaSxvGQ/BXypmilhBVC6YeVWLVXo46J9IP0ND4IzWMjV1V2KZhL5/lhLoJ9gStnR/0QALcIXsZKjJ6F++PuPMfTVtVb57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGanX25W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGanX25W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE2DC4CEED;
	Fri, 30 May 2025 05:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748582689;
	bh=11l8sxh1YOQyITc7px+U6p0p3ggoIqtQHhxHRqbFUr4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cGanX25WZPXA/kYvmRy1WCtBdqL2JI2p9Tkad1B7lUvi27q9I7v0gnlfbEuBBCCgb
	 zFN8omESQiJoAhdm8lPTv6hNSBT7aCKMrftjuaVe65OvbZQ/EAvmvOthkaKpiE+CN7
	 w0cdUzmwCs1wsmiPLIsNGoJU5cOQaQnS6KyGpmyGCQkAhisKjxPi6zhi8dgkm6F6mg
	 U6MddfKP4HWN5P3rd2/4LupnJb1c8SKNE930DwBOhgzzHinVYNFkfuYrAwzYG17qz3
	 D1NKI6dIPctlcg0XjcmUEYoDN129NNLHtpYX5fFd8Bgd71wdkb75bErxSex01rRLG7
	 Z8KMRJR+SYaVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF7839F1DEE;
	Fri, 30 May 2025 05:25:23 +0000 (UTC)
Subject: Re: [GIT PULL] IPMI bug fixes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDi39ViU_FMFsgsb@mail.minyard.net>
References: <aDi39ViU_FMFsgsb@mail.minyard.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDi39ViU_FMFsgsb@mail.minyard.net>
X-PR-Tracked-Remote: https://github.com/cminyard/linux-ipmi.git tags/for-linus-6.16-1
X-PR-Tracked-Commit-Id: 08effa6b77f7dbb4727f811daef0f6085c0d63c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02897f5e56b22e78d376faff1533ad800991650e
Message-Id: <174858272251.3833287.17165495468702644310.pr-tracker-bot@kernel.org>
Date: Fri, 30 May 2025 05:25:22 +0000
To: Corey Minyard <corey@minyard.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, openipmi-developer@lists.sourceforge.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 29 May 2025 14:39:33 -0500:

> https://github.com/cminyard/linux-ipmi.git tags/for-linus-6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02897f5e56b22e78d376faff1533ad800991650e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
