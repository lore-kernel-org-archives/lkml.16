Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741621A45C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746821183; cv=none; b=mWGqMuqIu7EWMeJBCuROuEVURZ87eOAwwkRNucp27eW1RIau59GtcpbdKdXli+1LAd6dcRAHYxw6pvS7f3jqE4xfDvcaBFr4qcgJCULeO/ztnwp2VzaW3tvRj2qtF3LBOpG1zbR0iebATk3/EZ0x8y29G6fV1wF5gyxA2s0z0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746821183; c=relaxed/simple;
	bh=fvDbPvxwlUnXxCffuytLI9BM/io6jdDkaxMzcMkIi7Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=e4nxoxStoKYffLGbZK4g9J+NLssgRsFQg7ppe+bw/r8gmM3BHxnJYQ+Tb9WQTfQ6xKRAQtm7GehAf3r5QWDflnUSHin1zysp1+yOnbc+hi1QP0wZYFwyf1DMmXRxUUXz+8EQQf2rCPJfw/dbUY63QeJXQd5dIa9XHCj/vJqJN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKkkVgdT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKkkVgdT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CB5C4CEE4;
	Fri,  9 May 2025 20:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746821183;
	bh=fvDbPvxwlUnXxCffuytLI9BM/io6jdDkaxMzcMkIi7Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BKkkVgdTrujKIZ1Cb1tm9mBZ/r0A4A3efnkZ+fFp9hGOK15u1e823yKs6g7qnD4yD
	 vJkyDsedfe0qCNZH6aZo3/+8H7+gW0z4wGfA9JRHEom+6B3lzCqW5CWlrgxNShav16
	 zT4z7vtr5PEaPulET3yXUPosihRYW+fcTVcL2fyhg7EjFuZFhs0Qr9gVYfHhc7QHcX
	 mP84YrPEkIKEGNSjnK6C/xgaICP2aTkf+9EZEJZAB0BR//dtU0j03V41cxYokkGB2k
	 ItLpnAsJ3H3dVuf7u1HOEa4TM66HZHggvFJw5Hx71cp9ZoZCkLXZrrLZNjHqLqzWtF
	 WQA/LwD0I5aFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF6F39D61FF;
	Fri,  9 May 2025 20:07:02 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
References: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-10
X-PR-Tracked-Commit-Id: c2c64ed09c7b44a893d22c8b8ddb3ba7265494f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea34704d6ad7225421cc3543906deacae35a6ea2
Message-Id: <174682122125.3766575.18016924550297481918.pr-tracker-bot@kernel.org>
Date: Fri, 09 May 2025 20:07:01 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 05:19:27 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea34704d6ad7225421cc3543906deacae35a6ea2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
