Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024B25771
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893382; cv=none; b=ee8tbwWyW3wtRbxMcYTaSvRvNhtGhgaGNgVMq+ILufJXgJYKNHK/fKIeQkhaEPIvqRi9jd4LbTkD2b3G+wF7h03gHIaftLrDQCK3Hcbjd0iQ6u5P7qOpJnYjiIdDOBE8XjODaTmnWBhaYrm4Qxn2axkDScxFVfMKRzOjgbm8FUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893382; c=relaxed/simple;
	bh=3yMB43Y7pNug+fgO8Nt6qPlcJPM+dBJhYXtjrXqWu3U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DI1Gtyp0CBddKTtMM3euf3SfF0/tQu16WqZCBigsoOH3VgMbIUUrJ/kA4/80aDumKUnPwP/zcMLgRiMRdVFrej583HqSr+j/t/iSf5mEeit9OnU8oryWwJOIeWvUPLmR4sDbuCYnI4y/4rRA7OSHCB8ZcKlMKgsXKwAog3ch6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ott8o31f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ott8o31f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F837C4CEE4;
	Sat,  5 Apr 2025 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743893382;
	bh=3yMB43Y7pNug+fgO8Nt6qPlcJPM+dBJhYXtjrXqWu3U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ott8o31fRHCuNI82KbRlOX+dDtTcVmTp3Dx99Qk/YurlsC2TH7o49sFvCTy/6QSp8
	 RBl4wIRLdhO+EM4Z0Mks1CxSIEPBjNIx7VdgaFzAIj57i21IX7MIIdk4dP2GRsixNQ
	 6Gsrn6bCZoTgNJCieoKBuqS9Sk6uvzYH1xKNxy7FBTmIPfWQAZhHhWDd3Y6ImrpbZ2
	 XVZjou5GUhtF83REf9QgXcfePeLj6+FWa0eMyrQBU1MxJ0ARGpJS08Jzd5gcZGMKNM
	 i6R1zqDyZAErtW6j4jZ6vq0DpoBdHrTJigkRb6uWfQlLl28WShIAfXne0QcckLwNU6
	 gHZIQmMZqMx/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3B3380CEE3;
	Sat,  5 Apr 2025 22:50:20 +0000 (UTC)
Subject: Re: Fwd: [git pull] drm fixes for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com> <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-04-05
X-PR-Tracked-Commit-Id: e2cb28ea3e01cb25095d1a341459901363dc39e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 758e4c86a159bdd67a8ef60ea118ddb8b2043714
Message-Id: <174389341915.3729461.8371380037090772284.pr-tracker-bot@kernel.org>
Date: Sat, 05 Apr 2025 22:50:19 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Apr 2025 07:51:03 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-04-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/758e4c86a159bdd67a8ef60ea118ddb8b2043714

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
