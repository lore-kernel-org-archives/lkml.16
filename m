Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5BB2BDC0B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751828596; cv=none; b=pt1HupeTAg3IjzMf+S6yD49i2gHDjDiOHfkuEs8L5qlhbWuGVJzI9UQtlJMMFDihisKSaY17sSQBdBJ6OW8h/1nhqyZ/SbTftQRnuDTgkPIfAObzsAVeik0jqBmfNfurcIUVgAmpur0AY1HBn6vH6SfwLCj3/7hApGZhXfdu7EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751828596; c=relaxed/simple;
	bh=ezUvMxMnaT4pXiKGauI6fIgQff+GJ0hQa1fUa2gWsOg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Pwpdt2ymjA4bqrQFHCzn5FxULRbQ8fjFHTpdY1/4zfkUH0XSmEdxgLkMTIcQ+yTu3/PfIF3a/Zk02W+LGa11BZyLaos/MeYc0NDNbH6+lVUzrTk1QOjej/VDMYQPS5F1YucXN5a2NDJVQoNZgOrWYPBUEcFlxWvsmhalNIMbYqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmKn0E+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmKn0E+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE47C4CEED;
	Sun,  6 Jul 2025 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751828596;
	bh=ezUvMxMnaT4pXiKGauI6fIgQff+GJ0hQa1fUa2gWsOg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KmKn0E+lyJjTTK4WTwJ7jjQ0BX9OhWEf+cUlBVv8t0aM5R1B1eeTzL8+Az9dreoRZ
	 4sqdhde0vnaMClw38wWPUAozIZSq9PwEYF4jUr0sLofwEKsN8vbC2FE3/HWamz7OrN
	 Kpd5Csk+MHSkriiV8Fi5FzjS54GwqntoT6KXnCuyeiRQ9F3K7eiPBSODnxTo5U4yjE
	 HD3/+t4bEtaOVG5ynTn4Ji3PvfXuADvi0rC16HIS4admYKEwA/+gH0Wn/0Z+riqOhl
	 IqzK3SDSQ5qNhmb/J163XQmAtW5fB5mQgsZK6dh9ss8tFHNqDRFVuU6VEc/pKvRIV3
	 31xYTafA0PJYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACDD38111DD;
	Sun,  6 Jul 2025 19:03:40 +0000 (UTC)
Subject: Re: [GIT PULL] perf/urgent for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250706081941.GAaGoxndcnnCKQBCEq@fat_crate.local>
References: <20250706081941.GAaGoxndcnnCKQBCEq@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250706081941.GAaGoxndcnnCKQBCEq@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc5
X-PR-Tracked-Commit-Id: ba677dbe77af5ffe6204e0f3f547f3ba059c6302
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1639ce5e590300af45bebedfbacf8fabc1777ed
Message-Id: <175182861962.2712443.7337932537390124007.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jul 2025 19:03:39 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Jul 2025 10:19:41 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1639ce5e590300af45bebedfbacf8fabc1777ed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
