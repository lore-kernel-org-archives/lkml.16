Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72934221DAD
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470610; cv=none; b=oLd3tIR93d+RHBmEaNalAQ9vO2bT3y47nRtdZLRLO8vzuaJcipDn7slp1JzOD41kiOTYzvj5RIipz2ZkZTCiBp6iRuJjpVSs0W9MR+m1a+a2sXdG1hCl0HDKuPTJHzEfvH7+QLokdfw2Np9bawDuLHRDAndbIewiZFHmCfDU45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470610; c=relaxed/simple;
	bh=cPxSzTGZDQ2YU8mWoB8rHUajbc3tMY3oivujdfGm+p8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=N1ZlpnUM0Lrh679exC8e/NVxb89wORHNFOtNHPYas5FsF3qkDIALpCW4tEafOjsq3W/NCD6azl0lf7JA2oDil9Zd8+3RWlUseCIABXgsAktp3q7NFi+Jrozc4wVH3MJgM710X0prCgXT349lrd7ateDcHEYph+dnkIJ3yKPaIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkgkhMnC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkgkhMnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5525CC4CEE3;
	Wed, 28 May 2025 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748470610;
	bh=cPxSzTGZDQ2YU8mWoB8rHUajbc3tMY3oivujdfGm+p8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UkgkhMnCFwveMtsxWVM/e4G+qqySKgXyS8wvOtFlV/987OjuSqtsMZt0mmfObkh/G
	 KKmZEROfoy3PZuqqvEfR7r/z8XhnZRGsCCwXxw52vltBec4gPqvat12wTa65wlns8T
	 x1FiLsV68Jp74DwOiMJDSPU2i2IlsMrrmYmS5hUVidK92VXT7ptVWGqiBr5V0Fe6tr
	 XQZTL/F/JbVKJydOeMjP0UTdzVwBOBDuTXyuxFiCk5hUEIxkLExSWkvC0VBD7nFrM/
	 ubx1aE+WRXWr8y/rWQevQotlRqpQK3PrE44ddFiLleX+rrYrAjan3Ug3U6oarvpp5+
	 R5G1P/u75PzKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E8C3822D1A;
	Wed, 28 May 2025 22:17:25 +0000 (UTC)
Subject: Re: [GIT PULL] nios2: updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250528110024.19319-1-dinguyen@kernel.org>
References: <20250528110024.19319-1-dinguyen@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250528110024.19319-1-dinguyen@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git nios2_for_v6.16
X-PR-Tracked-Commit-Id: aa264d9511aa5befa28cf8d9f32fce78fcf1a773
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbff27b54e4271a42ea1dba93a76e51165f2dbaa
Message-Id: <174847064397.2608061.4286591093775936927.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 22:17:23 +0000
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: torvalds@linux-foundation.org, dinguyen@kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 May 2025 06:00:24 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git nios2_for_v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbff27b54e4271a42ea1dba93a76e51165f2dbaa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
