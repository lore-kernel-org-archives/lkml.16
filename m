Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531301BFE10
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967181; cv=none; b=ARIokJJTETmjnaIarEmZE6hoFq4JeAFg3S3RSEaoatxvAtQwToUh1UJ4s/MR9Bm0ItfXcnEIeEMkIipZ9wJjBQzJ+LNcKnc9tb8GGjns3cp8CcEiAfJzazp+xeCtMX50fn4kwL0J+psofasWqfeZw+NbmloDrhlw8xs0mJnN09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967181; c=relaxed/simple;
	bh=qCEL7vORsi3ZHCZde7hHjmWhRMeVyaauLNReBu6dAQA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JWQmF7mGEgHUxEnxmbnHUIeV2MgZMnJ8qsH6FNMMtLfKeIlfLDvBFs/fYgUs14oU3nD9A/AWKXFQwnBEJZv9DJpVVWGDQPPtG70xLF9VB2naiIQQ3bs3kaz8AsGaPB4h+FcQ1Xv66UJfiQgRz28U2K0WhGCyVdD5fBynYf44xR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwhMbOki; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwhMbOki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FEAC4CED1;
	Fri,  7 Feb 2025 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738967180;
	bh=qCEL7vORsi3ZHCZde7hHjmWhRMeVyaauLNReBu6dAQA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hwhMbOkijOPbPyjF8JZ58IzHtKTN27w5i4IecKySfzFoXADbCQCZ8QM5LPtcnW5ag
	 QGa/+EA0fHlFkfvS6hrXUYaM541CyZfEV1ZcM7s6zOOXi9DBExtp1Gi1lnKJjkHlLA
	 P3eKXVucSqzAicUxfXxNO8dOE3gy+h/FGQ/kJ3Ldd/Aegd80zT2J8i+vBiBMLHr2AN
	 oFJFrGZM3rk+6TOTOmjtZHHyhJeFnqBTTvSbv9SYRHbOqDyCk64vK4zXj1kY7zgh/B
	 QkvLSt5D4Ym9tUTTw/y/HJ8T10jO4E/BGx7PhZl/OsU+HtNZylGsUE4ltSh4UOjt3c
	 vuoLvzB+ezpnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB543380AAEB;
	Fri,  7 Feb 2025 22:26:49 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw9VgDGf5qioLH+qZWcbm0Vx7UhucXp2y5hTjjQSAUi-A@mail.gmail.com>
References: <CAPM=9tw9VgDGf5qioLH+qZWcbm0Vx7UhucXp2y5hTjjQSAUi-A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw9VgDGf5qioLH+qZWcbm0Vx7UhucXp2y5hTjjQSAUi-A@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-08
X-PR-Tracked-Commit-Id: 4f6993b3feab7bfb1869a8fa12eb8b375964c19f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ee983c850b40043ac4751836fbd9a2b4d0c5937
Message-Id: <173896720858.2405435.7831952148150567351.pr-tracker-bot@kernel.org>
Date: Fri, 07 Feb 2025 22:26:48 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 05:34:09 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ee983c850b40043ac4751836fbd9a2b4d0c5937

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
