Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A0C27BF83
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149575; cv=none; b=l/G71n4v+Fptb9jdGpjDlXf3vyoKF7sTkTPmd6cd8yDV6U93XuUdsYSZ7R+k+4A0NZBQgw6I6MzCodomQr9uVg088YertY7Ubm3OPw90eCapHtOStFE7OHp87l74EucvOop/8sPS1C2cmdDsVGxdnzOkI24qFQVD57vWrwwHXHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149575; c=relaxed/simple;
	bh=iCyo66y7KzaBRsI5MU8/2D4b7hqOA8eptf3r1MPwYMg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X1HJbOZkPBmNORhLyE25klRntReg9188CFquJh924D3cWDTBjJo18PgYf6pDP3sLlHj/YMbdFdxo3TFpfAsM+cOWOwSJ4q/cX1dyL94wTK87cB47+//BwkeEN+rqo2HnfjWDFoXwJIjgx93S+P0srVZ3swR/Eqs6pFDAlY1iGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ir7Mk0hA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ir7Mk0hA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C926DC4CEF0;
	Thu,  5 Jun 2025 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149574;
	bh=iCyo66y7KzaBRsI5MU8/2D4b7hqOA8eptf3r1MPwYMg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ir7Mk0hAbanohXJ/1FGMbWVnuEac80Tn9ldesRHP9L7MNhzasovMnad2aiFvLIHkl
	 ndVzUivi+VFXiqrhOhzY0YKuc2oWZHnxMBJBckD+fQ29yE1KBhIAlIER9+37VsAokI
	 gw3GzGpuPMLy+trGYv9Y6MNZavk3Evg2y60hiZc5Ob3itoXyttcRPlHtpZMfnO113S
	 pVMLgSrs34pJWbUs5zTb732y3Yjt0p7bwvJPFWJ2N+MaY83h2JZ5/8rQdYyDVO/N5k
	 ZZAnA9O9KgudZrnkpDxVjKNEA40RWGWO8KWtPSKuz6kTzEWYbuUs6osSxOdHMQ4Jxx
	 x26Rr7W3UsJrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE6639D60B4;
	Thu,  5 Jun 2025 18:53:27 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250605134126.GA4845@willie-the-truck>
References: <20250605134126.GA4845@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250605134126.GA4845@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 10f885d63a0efd50b0d22bf27eb3cf727838e99e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9e668cd2756c1300f3bf84eba1d6711b886b531
Message-Id: <174914960662.3197273.5561686147742355044.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 18:53:26 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 5 Jun 2025 14:41:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9e668cd2756c1300f3bf84eba1d6711b886b531

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
