Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE71F0E25
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625794; cv=none; b=NA95zUKPVKFP83tZ06KG7bGCHT1S+DA5gNa8ES3FyWIFZg6EMtBxSPpccqhK0YTob9tAf5D5h40R8KEmr4sBbaOPh56mzGrtif5XwecCO1Ez4HaySfCrS5CatoDxAx9BrgEIw9HGXUvSgH0PZLsvvAugTpFKCSdKmXk7os8xfOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625794; c=relaxed/simple;
	bh=th8O4e0urOjYGapJM61mCpGL06tmA5caSdHWtqiRNCs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tHrYG1afm1YS2B0AwuDbbvBORexOfZRkeeEmS6rjpyiBWI32RRNTnV1hvCL79eoTZ11nCyTKL8L1ez9E0IXopwLHsIUbp6fv4YbyunKWSECSUuWTpCggUM6ypNbUBblfC0/Eo8six8RJmIjMAcFEg8lLTc+bIJ+cEr79ZIp9g8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljkecdzG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljkecdzG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5369CC4CEDD;
	Wed,  2 Apr 2025 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743625794;
	bh=th8O4e0urOjYGapJM61mCpGL06tmA5caSdHWtqiRNCs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ljkecdzGlKGc7LUkvXuVUynDBJv4iok6jbR07+9it+lHxujujqyuy+lbbmNNEa/cR
	 J5L4JJcyBEcGBV32v3I2GbSXcxZkLr/FC5rjpRK3bel5j3nfcanGjLdylapkuMwxn2
	 20IK2K6a8mfJMyrX/P/kppbhoLQlmFRoGqPK5VggPIh0/Fp/bGP2PlN81FY3pFzM/S
	 mheyAbQUIqIcrbBOjqkT8i6aJQB5LdgOSs5UdkjmHP8QMg4o+a4RCmpvwTRegrqIuC
	 G4OHcz16JHmbBhf8hFJMDFL01j4NKpMgE+tYSF9tR3pMNsCD9S8RPgqLO0lc+tX32n
	 MyBo54ExM575Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E1D380665A;
	Wed,  2 Apr 2025 20:30:32 +0000 (UTC)
Subject: Re: [GIT PULL] x86/tdx for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250401224312.3264346-1-dave.hansen@linux.intel.com>
References: <20250401224312.3264346-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250401224312.3264346-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_tdx_for_6.15-rc1
X-PR-Tracked-Commit-Id: e8f45927ee5d99fa52f14205a2c7ac3820c64457
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6cb094583aef6533d0fd47ae7d134718da3399da
Message-Id: <174362583105.1664588.18125512390847233333.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 20:30:31 +0000
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue,  1 Apr 2025 15:43:12 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_tdx_for_6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6cb094583aef6533d0fd47ae7d134718da3399da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
