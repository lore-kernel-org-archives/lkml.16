Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE283D76
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748039656; cv=none; b=H93O/fE4z42CM3Vqoo7ZKPNz3Vn4meVX29n3tH89E5xG83JrPcjJBtRm802NIuv8a2GMsoYChjv+N+4kUcb/dOb2DOJyFUawAVKpp4tY0brZtTJXhy93+xMhCAiXLU7GO1BXRuxEi8yMO3/W6izWmZcO7RVko/0qX10K3/dy6s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748039656; c=relaxed/simple;
	bh=4r3UIicXzL93rez55y7jxvtvvH1snU3EFIPqLhkQ+4U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fYkcpwB/locqqYBxMT5+fC3uGCBgunkvsN1QgG3dU76JchLMIL8Z0RIALyVzUXbDUDansZws6S2DDkIR6R4TGu8wTQVHCt/Dz2gmpVtou2aUqJt9oIFzleWMG64tGfRWJbUnTdPIhRLEGR146WWtn7waVIiDJLuOs6c00x/dc78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfE5OUlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfE5OUlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C605AC4CEE9;
	Fri, 23 May 2025 22:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748039655;
	bh=4r3UIicXzL93rez55y7jxvtvvH1snU3EFIPqLhkQ+4U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CfE5OUlotypMdC7aZQESHIdfJoi09woAYw1GD/o36/g2FBvcBcj9iECmqCSaPk4Ki
	 D7DlyMVqvi4hAHK9bRBaGiEDQrjIWQnllCQ6+76QsevdSFWcRlK2/whzBJL4UgiFsn
	 dkmFVen+Dr5QznR9vthM3X9pcKV/yoBKAx0lLVWY3WLwrWrA42bmmJO0W5duKiXWqm
	 /gIKwk1U3MkgyXEKBA809PO+leXZUuMDz2HKLndPwlgnT6cP7QcLzdNWPNqM1Ey2aw
	 YEe7IMhzpH2bQ3zzKGoa2Do42gty2cE+OB0AgSROGERemjjAAk2/lvh8W81s8LrfqZ
	 JW1+PBcy/P6cA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3416D380DBEB;
	Fri, 23 May 2025 22:34:52 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc8/final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
References: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-24
X-PR-Tracked-Commit-Id: fe1e5a1f2d1c2d4385a414dacca0e5275c0af281
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4856ebd997159f198e3177e515bda01143727463
Message-Id: <174803969072.3749917.5235088097409453205.pr-tracker-bot@kernel.org>
Date: Fri, 23 May 2025 22:34:50 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 24 May 2025 08:15:22 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4856ebd997159f198e3177e515bda01143727463

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
