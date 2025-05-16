Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A09327FD7B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747438845; cv=none; b=jyloOJaKr2+8Li5hqiHGCgoDf5z96KHn8Sd/GD18Mhqp5uaAEPWsZXaFtRwxRSladu4ERXiSkaUuirccNrd3W9bZ0oLdDgG+p3K55rg2Q69jzCF9GdkA44PDzoc5Ghz0mMUidhqcdYGtQMjNiWml53N/xEsJ4cG9KC85DnjGHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747438845; c=relaxed/simple;
	bh=xrXiwvcDvwTciw4SLVynORnx+1TUmtqOisuAk39oEmI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uq2TPhc5QX5iuJLNv8dHYjCLXwCSkPQgU1sflwy9fKUWZG3LaP6gDqGWYLZUTp+2+7IEWJTwM9Ca2opIZsnteYNUT6oSyntnaX0zcD57VnKCw1SPAp1EVMLHghxjoH+69Mm85bKLzwMJtkl5m09KIUwPPr30xVqe099ckIu/yZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qA1d7TXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qA1d7TXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D610C4CEE4;
	Fri, 16 May 2025 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747438845;
	bh=xrXiwvcDvwTciw4SLVynORnx+1TUmtqOisuAk39oEmI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qA1d7TXQHqUMkHFl1bYMJQy5ormuVuG+ROWvpa2Z5A8WVk8FNGHAHjD/MT6WRGGdL
	 HID+yJO4xNWQmB8G+R8eUUnUEOSgRdo54yHZ6Q47zeaw2HfT+Cv5zEJqfFW5aTBHKn
	 awm6WznAQKvz9SZqf+fLre9zsy/z4fRXYRZbA2jiMPvMtFny8GG3rZlT9MfZfp5BDN
	 l2ngSJteDegYIdvPJRMlmwbXhCj+jNmnrhYZ6wqiotEDtX3yE1mLu0ikPWoFk2Q7rq
	 Ue2EfHnGZOjv4omu/2TB2oHZzkibY5hoL2hNPnL1sI8Gj1AIgsXfU6Dis1JOfXmkwV
	 kmC9c+83h6ExA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D913806659;
	Fri, 16 May 2025 23:41:23 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
References: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-17
X-PR-Tracked-Commit-Id: c81dbc490bcdfd0dd6199c5c382dc923cea0029b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12b6c62c038e85354154aee4eb2cf7a2168b3ecc
Message-Id: <174743888206.4096732.638912975486071931.pr-tracker-bot@kernel.org>
Date: Fri, 16 May 2025 23:41:22 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 06:44:48 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12b6c62c038e85354154aee4eb2cf7a2168b3ecc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
