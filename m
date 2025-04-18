Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093F2417D4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745010887; cv=none; b=MKIK6JDd5Sv8Z0GUR0sJC6B5nNboyU9Hu2a9v+6YSPjSgf49NG+p+sjvJGVcJoy1MUwl8MFBsqk7K1TGvfI32meJXKbnx95itE0mRew9Fod/CTl7ZzVBemTQLlU5BZNjRzdWvrfxGNq2NuJd4KknSrHaT7ueCxqfHkNiouseOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745010887; c=relaxed/simple;
	bh=sW1oyp4b1JtqgRBJzDnMVE0gti/5RZRR+V0WXAcAAjg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IrYtFcOhU/LaFm55MnMvMU44rof68vex+FFN+WHyiwhZjk9nBZVa0VimQuP9xCTA8piI5VvLBbu3L/dOQp8sXmKyPXz2Xh2brzuogAg7ymnmgO3vksKZAlVpmF7iscxNe6uKn2b8T9G/zDoA8rh0BNwwqHyDy4FPUcJD1Aiyo30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNoDzOoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNoDzOoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F94C4CEE2;
	Fri, 18 Apr 2025 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745010885;
	bh=sW1oyp4b1JtqgRBJzDnMVE0gti/5RZRR+V0WXAcAAjg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bNoDzOoJ1b3HbSHnVhajzeDq2oGORu3caPXyXT1qgjshAykZbJzNIFqaJk8mJco9q
	 t0FoULOrzXDMC1erdK1Pz0vaHpFkEWxDDeWb2rbC0XymvBx8AMH1wY1ND+KqBS9gWf
	 VwtGNLlGquz3ijOwNSSY2xv7z+g3Z5GIkfxWgnOyl5LHMfQFBVmzh/Z4EVaEtpwcoT
	 2KUNXoVHvQtqMT44vYZjIS+nSFz709Be2QztpgNHoGZEqp8yK6Gg8TRhoPIoeo44Uw
	 JRvf1A0z7Ys6W6o55O3RRlwbnM6liXa08xa9+NdpjaQDY1ucWUop1YHX7JoHsdBTTj
	 Ai6qtmJQ0AVaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BDA3822E09;
	Fri, 18 Apr 2025 21:15:25 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAK22APMK-OSzROm@gmail.com>
References: <aAK22APMK-OSzROm@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAK22APMK-OSzROm@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-18
X-PR-Tracked-Commit-Id: 7950de14ff5fd8da355d872b887ee8b7b5a1f327
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b372359fbc4af755965a1792c1f513583aa20c43
Message-Id: <174501092366.328197.15825458575693220183.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 21:15:23 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kan Liang <kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 22:32:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b372359fbc4af755965a1792c1f513583aa20c43

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
