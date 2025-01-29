Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7D481CD
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190520; cv=none; b=asvl86zzATGSnDeU87UW7od1B8dNVn8NKRN8RxWtofO5CfwiHUi6ArwlIXJdb7MAxOQAXY3S+V1PnwvsIPVztOnPro1SQBUBcVRnSZtL6Rt63pX3MTzcixAKobeTgvkQOxYACwNVnH/O7lYzBwG5Q+d/YbMLI60mWLDuGJxF1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190520; c=relaxed/simple;
	bh=yKPeQ3YVjraRlY7HmfTTEnYs1WSHn2WyBx3bliR3mmQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oOtdSYkp33FmumMSNzTdDYOW+dazrt7XA92hqdykqHVU3WXuoLgIUilGWWN10VHaTmn+jNf4LvOqPa0oe5dVKnjyPHBdBdW0yyBDL9QYUKHbCgAjPflKQexKO9xJVLrrqbYI27+p7dWkogl43g5ocklLl+mBo1p+9peblGpGHVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4eBGRdF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4eBGRdF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A492C4CED1;
	Wed, 29 Jan 2025 22:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738190520;
	bh=yKPeQ3YVjraRlY7HmfTTEnYs1WSHn2WyBx3bliR3mmQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=E4eBGRdFF8n1SnK6rsz3TF/nrXfghQ2+LwWaLPgb8AebqAtSqxS+0eVzwXS5hlqgy
	 QWlWncQg6ucu9XapL+aObB/0jVKKIxqCFPuPEXWEQwAQ5znxKzgLg9iEotPNy4R94x
	 IOoLuvUk5fAfxOJN4lLBGM5kZAoggL6zKuF8HU11flUGe9CsO7FRW+MnzAT5FxZSZD
	 yM9q1B1TtyKhwOAS97RC5Ji34DQvTw8O2p0y2QMnMSgIZ48tXrCyTDJlXvdKNTmmwi
	 huhEq9UigC7DVZCn119iS+FaYZPVLf0CDXYYHumQFQEn8ppGZVOvUKWjdpzvutTAmx
	 0L6TCa4Ieh85Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7181F380AA66;
	Wed, 29 Jan 2025 22:42:27 +0000 (UTC)
Subject: Re: [GIT PULL]: dmaengine updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5p1FA7ISZy7+pli@vaman>
References: <Z5p1FA7ISZy7+pli@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5p1FA7ISZy7+pli@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-6.14-rc1
X-PR-Tracked-Commit-Id: 98d187a989036096feaa2fef1ec3b2240ecdeacf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c775c6056d07eb777f37c7ac1340115b27dc9f8
Message-Id: <173819054607.449381.5835948628319803386.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jan 2025 22:42:26 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 00:06:04 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dmaengine-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c775c6056d07eb777f37c7ac1340115b27dc9f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
