Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D54111BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067738; cv=none; b=PgOnx224A7E7eUVaLhr5eCvfnoREdIyQaMOwpEh8zAUEkgeZPxB9zTWzbauy7enH2orRrOGse8qTKRea8OSRzkV1DVXM80E6Hi3xWojcyXyH2SSu7PbRlDZmC6KXd0OisCbIwZaCbi0NXaBP03ygpTqliZgwt6tBxpJJkk2zPxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067738; c=relaxed/simple;
	bh=1P2zUTWVy9giPznB6y/RpP2jJNxtH9IwdtfEkuGxqzM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=chiXmItmo6QbNz90XDquzcnbu+wibXP11M2/OtgQHobUxDLvD7BDqbyBnKm0CTz88YdGiAKI8lDLxfPd4h6AUn/9TVhVsWAqgS2oQbcmSiILVaHDltEw9Ofgddv73N1fznNl2MJxrvSmFMTVizEYaogqfO9dtE8ur/mxMtRwg9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSMsu6Mo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSMsu6Mo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5142FC4CEE4;
	Wed,  4 Jun 2025 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749067737;
	bh=1P2zUTWVy9giPznB6y/RpP2jJNxtH9IwdtfEkuGxqzM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DSMsu6MoaHy4iwKhIoBGvrybNvQUeQjFgq7eFWimBmtTWVC8+jPfAtt1dlxXhW3gK
	 OArnGlZnDp6FAURIeVuxMal8RTAOvNAA4lQ4Oj9W7Lszk6eLSu4pa8yk8AWa2CvURX
	 fXUFhuEeKJvZoqxMMWuDAHvBm2aAIqrDmS1kAnXcsQ5BsBiMciqI3Zn8e9BjkbZ4Ae
	 ZRd6EqojnMacssQWgMYxSytEzLOOPpuBhHSsAKm/cJ98THEa6gYJobRi9vZrUYiUbD
	 FNUinuYq1sXEmuPvHVp12CH4PXEF9gaQZjN0U+DfHqDfL1PcbpsWai8+2+WOAU2rWp
	 2HzKEFpsIOweA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE8838111E5;
	Wed,  4 Jun 2025 20:09:30 +0000 (UTC)
Subject: Re: [GIT PULL] sched_ext: Fixes for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aECWgEYwOhciTIuk@slm.duckdns.org>
References: <aECWgEYwOhciTIuk@slm.duckdns.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aECWgEYwOhciTIuk@slm.duckdns.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.16-rc1-fixes
X-PR-Tracked-Commit-Id: 9960be72a54cf0e4d47abdd4cacd1278835a3bb4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16b70698aa3ae7888826d0c84567c72241cf6713
Message-Id: <174906776941.2413472.3581224260480187766.pr-tracker-bot@kernel.org>
Date: Wed, 04 Jun 2025 20:09:29 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 4 Jun 2025 08:54:56 -1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.16-rc1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16b70698aa3ae7888826d0c84567c72241cf6713

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
