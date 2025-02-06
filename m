Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BDC23908D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738883539; cv=none; b=tyYvVGmkFXKA9yp4irbh9i/ZU+hgWxjxJdAk/l8YC4anaiTHRGQo4dLrQ/Rzefpjbyv7+/TCZQ1bmIJYep+yaZE4PDMiHGLxsbEI9Wf+/I/cDoQ+qZONbw1Y+y3m6MrnkCyP8owP3Yr7WzgzgfuRjgslznjAtBS12XV/yEv4G/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738883539; c=relaxed/simple;
	bh=2RwiUHbhguiFlpdaLW9cOgE7JnkOtpdy/sWd5BeWztM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=myrokC1XBZ1tWdyyRQN//yfnBLBWqywVsnoz1A3hnqWMY3UMZwYBQaRJ8chh+r0yqRIA50qnZAFbL2cQDgbSbSf3UOP2X3K36gGLv2Q2IPnw5sAvULcmcsm6OmdeuDE034yfWChZi9ZQ/FKvkGcnXdFC7M/brgAK9/Oa54Tlvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMtxl4nz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMtxl4nz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED54C4CEDD;
	Thu,  6 Feb 2025 23:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738883539;
	bh=2RwiUHbhguiFlpdaLW9cOgE7JnkOtpdy/sWd5BeWztM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kMtxl4nzX93/Og9N/duoz99OvHcqs0b3J3g0SPnbmBNpUgbT3/BvvnefpFKgSZ0pu
	 ZeRfD/XGPhrggS/nDRU2j0mRoAttHK/bq778eiGTuDcB+BCzxsMBEm0tdQQE00yaKI
	 aCwN0GcNxD25AdFMQHqif9iDOA00jmNpTlqIwodsRbv077p8LVx21osHTCpiB0ExOt
	 tt9WH9vVIToxmxVcAbCPnprHAwCzZldvUeCRiUvllxHqBW3m/DQ2mIUVbuooItYFFH
	 Zy4vWYozU18LjHjqhyxKfUOwrCTfk4wu0ZZp9ShPBRRmmH5Yn/C6tjYsbME9Mj3a5B
	 UqwmAQTf7ahFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0A6380AADE;
	Thu,  6 Feb 2025 23:12:47 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250206163052.5240-1-jgross@suse.com>
References: <20250206163052.5240-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250206163052.5240-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc2-tag
X-PR-Tracked-Commit-Id: aaf5eefd374b6e006e1c224a2b37bac9d3737aa2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b734b49de8e195a9c9693d0d256ed1ca9fe6c9b
Message-Id: <173888356650.1693200.7122796100405476728.pr-tracker-bot@kernel.org>
Date: Thu, 06 Feb 2025 23:12:46 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu,  6 Feb 2025 17:30:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b734b49de8e195a9c9693d0d256ed1ca9fe6c9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
