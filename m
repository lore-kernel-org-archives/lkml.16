Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D601527E1C3
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359951; cv=none; b=FnuZFUi1b3AIUOBugnRjIXv30oUMf6BWitDl+RbZhl2CweWw3ZCftOw5pD0iE/L8r8ZQJYweaIXLe3Qkig/hwwWXakPe3JmwLf07QbGn4yWko3zdETwUxu0unCrx/pNNhBfSOZ2mZIdmtDf418bxLS8hZ5zSG/k9vWcCLNFP74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359951; c=relaxed/simple;
	bh=8g9sBOcrHrnB0b+9EootGDAPB7SKfYA5LjMFXCUd4dE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SNnVnKVE5/qZ1YkxewniqNN1YJeshEPeZQ5QQEMgVkMBgt10QIexB27nedOJEeBIcaxwpPng8cYR/6jnHJRxUJMxdfW8dN2+9b9Wj4t5fKKcWIQL4Oe4sv4ITQQnB5WJY+jgjfLYvBtU9ocTGd9aqh1mf3SozUPoVkYjtY7vAnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEOTXWk2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEOTXWk2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6ED4C4CEE9;
	Tue, 27 May 2025 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748359951;
	bh=8g9sBOcrHrnB0b+9EootGDAPB7SKfYA5LjMFXCUd4dE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VEOTXWk2noZ4RLw/iYXh0NqrjSEyFAAVjmlHORg65sKNAN9p9u0DJzUJ7tUOrfMJX
	 +ffT4ac2uOCPEMDH0Lqtg7unP5y0Sp87vIj+Nlan8pPpI+RJJXJeVQaTxYPKOiMWC8
	 DQX4wgYGxYGvWZL/Fsa7F+w9anZrcFeJfn2mf4cre1zOkzCGM8OffmCJrDpQDw6y5A
	 isy4tM1Yl79/jnco77yQ6IZtGljr3cua7exPGv/k7Ogqqjt03WhDGiD9+fnlKlzZf+
	 E5/XXNhbi2a06DujDcDQHHlK9j1SR5eMaIvbJEvmbfe8cFcBxQ98IDh7dEeg9T/sGM
	 YjkVnOSPM+PyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BE0380AAE2;
	Tue, 27 May 2025 15:33:07 +0000 (UTC)
Subject: Re: [GIT pull] irq/core for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820637449.238682.15099827741796061971.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820637449.238682.15099827741796061971.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820637449.238682.15099827741796061971.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-core-2025-05-25
X-PR-Tracked-Commit-Id: a510bb87da72aa8d1504b0e4b343cfe013ee8a89
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 60c1d948f79dc6626bf2fe4f2d2fba51e18a1e04
Message-Id: <174835998588.1680652.687333161955235234.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 15:33:05 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:38 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-core-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/60c1d948f79dc6626bf2fe4f2d2fba51e18a1e04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
