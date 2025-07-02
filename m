Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F70264F87
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475986; cv=none; b=h9peZviV8e4DWgM0lLnK8odeyAQclBQ7aGypeIDxukf6zt+twA1SiCFvcD6crdi0+FsmkdgCZABeOeOgrpl72ApT+mfn6DKcLzfkiRFDui+UZEXUxq0PoDdBE99WwTjjqcXMLlju6ecpeT5ugjMBcogy5o4+g5iQxFjuuIA6gNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475986; c=relaxed/simple;
	bh=TE6yC0/TeGtczwxqtSzRd1vq1cumwLwU96EIw+yDtcs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QaXYiUVkGz537RggpYrkaVR3sm6Q/iPQ/xty8gB6UqNlyagyxYtK3tZiRbgtZdJPUlZtDd9OlohJ/8utjn9Hi1ACKORR5yWIF/xA0bAasVVWolilcDvlEn91weCTiz0mX/UMkgYcCxIBtiZ1mdGXsYgIkm+NP4M9RRiA5Tc9nzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSgc1yEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSgc1yEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B022CC4CEED;
	Wed,  2 Jul 2025 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751475986;
	bh=TE6yC0/TeGtczwxqtSzRd1vq1cumwLwU96EIw+yDtcs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BSgc1yEJjl47Cv28PUjVTuOJzCPihQeuK/FfHo7AGeR9cdrqRcTdrkoEs0//ZxX0W
	 rWtdzOxQmB7L1q/j/ZHwmcyddH0jrhDf9VO1uVxLxe+CY+bkRhN0TZyPtx3onTd1iw
	 UsDkXYrjPjOaDTDem1OMPVrRVXekpxMC8nULN/PEPJPsaGL4phDFZOdDDZ2ar/4Rtl
	 ugSXiYyIporDmEYjnZ/2ysuna/CgTqoZGNteV4D66HAaDWG2WSefJfkDLly2aoXEx3
	 Y6npx0/9hAlHslL553rSXXi4N+bJJ8TpTmQMRZRirZ1ra7efJfxWdEOrpOInAbb6JL
	 nqmfy1zIcgL5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D1C383B273;
	Wed,  2 Jul 2025 17:06:52 +0000 (UTC)
Subject: Re: [GIT PULL] MFD fixes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250701133928.GP10134@google.com>
References: <20250701133928.GP10134@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250701133928.GP10134@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-fixes-6.16
X-PR-Tracked-Commit-Id: d9d79e4f7dc935fea96dbf3de524404c08d08b03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65c1736c8e9d06bfa5cc734b156518ff65926918
Message-Id: <175147601116.796050.7495527574972998964.pr-tracker-bot@kernel.org>
Date: Wed, 02 Jul 2025 17:06:51 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 1 Jul 2025 14:39:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-fixes-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65c1736c8e9d06bfa5cc734b156518ff65926918

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
