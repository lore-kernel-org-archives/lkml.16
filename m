Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6012472605
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748966924; cv=none; b=IJxZ0Qd6oTF/izoc5Yt+DRzmTIqOUatcD+Yf0KwauBrOfgbatf1W82v1AcRziEhKlFQICWjyzfUkGMJp6E+XZB5blvVsZm2Ojl4EH6y3wfGYarA1rQPBTmqXjqO82y+VagQB78HzfUqu911JRZs9NeHExa79aDQJQrBZzq01lmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748966924; c=relaxed/simple;
	bh=bKM9fxpSEo5hQtboZ8+bfEi9fJlQDJgxQx0rYiFK+sI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=M6VLIP4iGQrvRzG6LoYS+UasSdNaCwqnVz4hGVBA1+smnOBDbb9xZe7AEPxGUB2AxPHYU2RiYcsdHCikWC4+Q0v964shXiZzcDWHyHi+ERxnPZRssI0GkV9ehbfv0i1MoYPz2HybRABN4rhvELEitMQgJ65Axf1yQB6cuj0o4Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txICshDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txICshDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F7EC4CEED;
	Tue,  3 Jun 2025 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748966924;
	bh=bKM9fxpSEo5hQtboZ8+bfEi9fJlQDJgxQx0rYiFK+sI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=txICshDCOR6MlXaiPoNK2YhQXsMnhEZrtvYicOKoSpSwI8X3mXH2WnkHzDk2KqWdg
	 5X+o8Nn+rFqlg7soE+BsWu2t14C6gscMHZ6C/5m4+Cq2nPOs0yOdkAEorGUsMhuTWR
	 FQR8+b1MAyY53VIpCZdcGxnGFmdodDhSRRELQaoB/k7sOvZ8IqVuTctt/tYKuQr4lP
	 UCk7rzn6DbLaPelLZtSnnIMOglb02PyDO/EWG9NKmZLSLHgvcaVKk9cAe+NaVHLlg5
	 a12VggDIQ0YjGHblbejj2cKdU9cQ52Q0gsiLX90u/eK7TISHVzPazK9S+f7n7NU9IU
	 NvL/Jah6+EAog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBD94380DBEC;
	Tue,  3 Jun 2025 16:09:17 +0000 (UTC)
Subject: Re: [GIT PULL] bitmap fixes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDYMkVGnByTn6HBQ@yury>
References: <aDYMkVGnByTn6HBQ@yury>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDYMkVGnByTn6HBQ@yury>
X-PR-Tracked-Remote: https://github.com/norov/linux.git tags/bitmap-for-6.16
X-PR-Tracked-Commit-Id: 895ee6a22e3195b7c1fee140c842bdeedb89ed33
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b2198f03776c5c25f0cafe0ba5c0c60807b554b
Message-Id: <174896695653.1571592.3399798773375300732.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 16:09:16 +0000
To: Yury Norov <yury.norov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Lucas De Marchi <lucas.demarchi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Luo Jie <quic_luoj@quicinc.com>, Andrea Righi <arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 15:03:45 -0400:

> https://github.com/norov/linux.git tags/bitmap-for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b2198f03776c5c25f0cafe0ba5c0c60807b554b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
