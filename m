Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E4264FA5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708797; cv=none; b=ljmGyYrSc68KXRudxvi6YkHBcccyGbCq/RgDDg5Kzf67S42faIqBMS+jAnqIl0uphVXXUuTrSekijZgrswUyqED5ksGE/UVe3pOQab8Cr/hhCdiiDPUTYjysUWnh7EWD0ZG6uwoU9gMevmosWpk9yK+CZrJkyPJdnKcq4oiy+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708797; c=relaxed/simple;
	bh=Z+NPFKyR/BWMNNcuzNft9Hlawsjf1oqc2930OXUKl8Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QunuLpzZF69sCkuSYTSIrIqu+Ea3Mafc5SBZFMTdMreYWvoo66dbwOxrKD+2+TmOfb+HVSYrUoAtQjESglj7OLapMk+PbOU3uYXHdOg57cPEFqcSV7nN7mpyoDhbXeZePaPqN6/VKZahLY7WkICX4Z//qIavsuAuf6Z2siAsV60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArkuhQYp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArkuhQYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A421C4CEE3;
	Thu,  3 Apr 2025 19:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743708797;
	bh=Z+NPFKyR/BWMNNcuzNft9Hlawsjf1oqc2930OXUKl8Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ArkuhQYpCO8im1IvYIzZ0Vlnk/Au5w3UoF8D5YeLh96VcXyWUu4geTHRY8Dlt98VI
	 YvrAy9Wi1/Evms802FGWgv/xxEHf5J0iam62nVjnQZsBC86troOS5ylrHPktdsOAKY
	 ISLaAJPGJduNYzoMzKLZBjeFk1VpK1pLgHmHpyMbo3GsLKK0Vtv07nXfCY+8fNlEoP
	 oPOEWEETcC/gNT81vzlNFkiIi0STItzlgIe1fLTez3g607g4sbtrCyi49DhL4PnPWz
	 gcF3a+2QbDVDTK4J59mU9rDmVeM/nXBCrGBVCndCMBCY7V41SnTqnhiMnl+WjpPDXF
	 tuxBaH1x7drOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BEE380664C;
	Thu,  3 Apr 2025 19:33:55 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-5c6hCqQb3s5GxI@arm.com>
References: <Z-5c6hCqQb3s5GxI@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <Z-5c6hCqQb3s5GxI@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: c28f31deeacda307acfee2f18c0ad904e5123aac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aa18761a447fac41287a5c3c41f26b9380bc72b7
Message-Id: <174370883384.2657822.3324006319698061766.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 19:33:53 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 3 Apr 2025 11:03:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aa18761a447fac41287a5c3c41f26b9380bc72b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
