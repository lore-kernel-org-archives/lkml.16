Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E41A23A9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100385; cv=none; b=M53HsSqK5wzd//3DVMKlk8NoNr3wrsl/gu3p20Uu0YAhb3jEbMVlPOqjWFEUVf4/5stlUk5UdV5C74/EscJOCCigfIAb7ssxWPWRQhZEP1cyp54/poMiBQQ98I7tND9tW+afXDGcW34Q5ZFdl/muNDq3eubDicXu2Se+hPqkIis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100385; c=relaxed/simple;
	bh=yNrBm2fta7AO0Fisvc6eZPNZpVjr2CO4G8S+6V2RTdQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Xh/NDOVgWLL3qYwPL/p5tttX5S81ohTxowmwEHNpWrCxjJAyBXkblyvy1WMMy/Nt+w66TdQRTRlbOrxigPR0X/Hnsw1Wt6q20Y9FTW9g4U1Nj5jbPISV/NIKdjF8qveztvdkJx7GasKfEObejQPU9VrWsq4StuJ9+9FJHUekTYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maKk+FEf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maKk+FEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2167AC4CEEA;
	Mon, 16 Jun 2025 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750100385;
	bh=yNrBm2fta7AO0Fisvc6eZPNZpVjr2CO4G8S+6V2RTdQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=maKk+FEf7xvlXPUwACjpRZCBVf/Tsw8qQp25yr8yzZayxJBd/lOLnPBkCYxxNKMyo
	 jWYK1rxfXmyLp7xvWLWs6uZqDVjk5dllpq1P1rwHsQzNFUEYr7WwXVgks0nyEPxcDF
	 IcrpIeaGIfQqXuGMUxzOaV8JZ9h3euOymkVqbbrFTvMsk+oczj7DUsjyljSs0009/B
	 zLX3gaZiAoGEbA5LhA8Oyk0ebC08H8N6xRu6dI6IYjIcEYxktYtaTD/F1q0y96blvD
	 hI+6vrhpc2RtVPwdX7UzmzHmEkNZ7K0AT6H2zoP2q8XENSvc0mJCilxE91f5RiM/N7
	 khURq7f7F4lew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342E238111D8;
	Mon, 16 Jun 2025 19:00:15 +0000 (UTC)
Subject: Re: [GIT PULL] x86/urgent for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250616175528.1973014-1-dave.hansen@linux.intel.com>
References: <20250616175528.1973014-1-dave.hansen@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250616175528.1973014-1-dave.hansen@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_6.16-rc3
X-PR-Tracked-Commit-Id: 7cd9a11dd0c3d1dd225795ed1b5b53132888e7b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9afe652958c3ee88f24df1e4a97f298afce89407
Message-Id: <175010041373.2475676.10864627603886961230.pr-tracker-bot@kernel.org>
Date: Mon, 16 Jun 2025 19:00:13 +0000
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Jun 2025 10:55:28 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_urgent_for_6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9afe652958c3ee88f24df1e4a97f298afce89407

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
