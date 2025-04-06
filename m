Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A41A5BAA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969110; cv=none; b=m+B+3TwL+VHAR3FEcAlt3ArncZPhmk/lZdFjprUOOr88buRo5eE68qyo9dTjPqWj8wT6EV2J3AZwq6aEPNqD2vV90vmN9YvbU1UHd/LHdwUh87WNOfZW9qWohRVE8AHA+us4nF1886ix1wktIRrCF+iZjNquHeN5ha5+Vtv0oKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969110; c=relaxed/simple;
	bh=KQw+KCtkiA3uRw4bHWOEQjr7WJYvUYv2ZJE04DwyOHo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=azr/NQOk6LRMqKnQLcwV19+g3MhC3N6FHw2N5pfvvX9bfcO7dDk6cHzddW1DUy0K29HBhiWJDpCA8Urj+wtYZ/H6Pe4k1Fe+OMvw1RBLiCb953lG3FcWhrmZJ3d1riZtV1ZLHk73HIz7GMQxevKfba6UVja8077BYD6QKTZsf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TC7NYkV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TC7NYkV0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECC6C4CEE3;
	Sun,  6 Apr 2025 19:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743969110;
	bh=KQw+KCtkiA3uRw4bHWOEQjr7WJYvUYv2ZJE04DwyOHo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TC7NYkV0vHjBeZIWCp4ooSsD8ACvY86mXAl/CLsqBJmt3ePSh9c5sEdVWhWS/Em/G
	 8872sTVXqEoYmKI/cOZ7iCeLBc75UNs2Tqcitz22+BdOPKsc3gC9EkMKNt9/DYbzOL
	 O2gYEOOGmHZchcACOWjx1baq6oRqTtBgDcF9aYmex9r3KcHkzOyzv4w6EFvFeEa9KF
	 thPkAJIXohOKGj4Ah1LPe8N6YjZqNs0TBhSvBjhWE4x1gwR4faG63K5kDI2ebPk5NF
	 7A8zq0hdps29h7irtdQoKTTzjGGOCCw/tjiho38X2qcwJiRe7OHpzovjNssLOROcKf
	 FzDRkml4CL5uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34317380AAF5;
	Sun,  6 Apr 2025 19:52:29 +0000 (UTC)
Subject: Re: [GIT PULL]: SoundWire fixes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z/LMMl6/SMB8Mm9q@vaman>
References: <Z/LMMl6/SMB8Mm9q@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z/LMMl6/SMB8Mm9q@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.15-rc1-fixes
X-PR-Tracked-Commit-Id: fcc0f16923621e670d5ccf486160e4a1b960b17f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59f392fa7cf83b02d5b40ddf3cde3b25b18445e7
Message-Id: <174396914777.3949691.2019734777500854135.pr-tracker-bot@kernel.org>
Date: Sun, 06 Apr 2025 19:52:27 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 7 Apr 2025 00:17:14 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.15-rc1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59f392fa7cf83b02d5b40ddf3cde3b25b18445e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
