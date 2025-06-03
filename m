Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE762EB1D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981354; cv=none; b=mZ6EGxGNN/2FhEYDzPOTiMgTHKsbEfAs1l9gRSL4f5Crmy2PxRBFrk4h8gmFISTEHrWzNoXKhxH4rduE56JylMt6GmBJYfaCGgDpnHBwWD/Z5KgaIYzbq1U8jU84ghPt8tIZ4iTvt2As4PAUyk8MOwVNxHxSXLRsY7pm5Kf2+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981354; c=relaxed/simple;
	bh=MCpU6lCW3HU0UcTcsWeL8xLhvCF395QpMLyGg4v12+U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lm229RsRgq8f64vGAZa8Y+MbcLeaFP2LMdfeXPnfFaSovn9skxlho1ieR4CuF3y5Saio4r1H91gqYsvq9zN7LCr7i7L4mpTIXQRH51gf23Ao9yWwrXeeYgYEXLZMYDxeXPhug+NPUKan09FSQ442anXv6XjPs1mUptiVmlJiwUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT1/Yrxq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT1/Yrxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4CCC4CEEF;
	Tue,  3 Jun 2025 20:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748981354;
	bh=MCpU6lCW3HU0UcTcsWeL8xLhvCF395QpMLyGg4v12+U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dT1/Yrxq5Gwgv2K+2jTlAolDD/StNTDv6lUZwAenNb+wBLwJrJONo6wnm6gYAUZES
	 +/xV8Jeo9YYzfxpU/pqA3yznn5MuUYvbPbSNtmjNaZYDjFPX1RtnYIJqOCc7gXCNA6
	 XesMmUYr+rKEu8c+LbtVjFiyxVo+IsdwzyYZZiwSXYCluGwzrVJktDyVaFW/eLsV3b
	 MNpiSrRjUSk7ggnbo2iwIn5LCL9HDFJk0cEmQOsz9mH7g4Qfe/ZKINHcCOZIZ0VNRX
	 +TqaQeJiRIPJj/JCKR/+XWrMJ2YCZ5pEAVjUkap9NT2HCPLbJk3fT9rswwaqhXgVEo
	 K05fVd6eakd0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E5E380DBEC;
	Tue,  3 Jun 2025 20:09:48 +0000 (UTC)
Subject: Re: [GIT PULL] MFD for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250603100015.GC7758@google.com>
References: <20250603100015.GC7758@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250603100015.GC7758@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git mfd-next-6.16
X-PR-Tracked-Commit-Id: ffb006aa433e8109ec79320c344fb69947997ba1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69352bd52b2667e5c6e8ebb14143528c28f5e37d
Message-Id: <174898138681.1645326.2582650759212280510.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 20:09:46 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 3 Jun 2025 11:00:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git mfd-next-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69352bd52b2667e5c6e8ebb14143528c28f5e37d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
