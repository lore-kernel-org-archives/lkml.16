Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8108E21638D;
	Tue, 27 May 2025 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386049; cv=none; b=d3vNNrb9aTwtpFCur8mk2+VnVkQQa6EnHVX2u8b1LHp2CAlli26wb0dhvhA88uyxfh39GVgZ+Mg53EU6HDL50kOymz51qYgrWVb0H/0eY3Np/W3ejNMa0DzfPDp42JX1xlm+lEbk0cexZ74L2jjFkZmEbQqZfvpZlFd3ZZLKMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386049; c=relaxed/simple;
	bh=874TDc62WfGGS2Sa1D8A3jbYlGHrpCSRGJXk1KuThJQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Z01dtZCxYoD41tt5yBK4eRiWrWQfFlO98qMerioaFeikCl3vW8Av2bXyf5qrdq5zxnQqJPFsFYsC/YEhYK9/eDRqFJkh4imtLcQBKPzM8fOgK2prX+G0SAuTuCyrdNd9Y+YPtAjxwfzmBVoddGSpmcY1o4C/TV/H9QG5qw2DUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lkjfuaz8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lkjfuaz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC60C4CEEB;
	Tue, 27 May 2025 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748386048;
	bh=874TDc62WfGGS2Sa1D8A3jbYlGHrpCSRGJXk1KuThJQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Lkjfuaz8E1CdGdJNZHrfh4jNlNJ9CZqVOenAxJW3B7muo/4nttp6tYZWWNdcpTaOR
	 TIfSJAnT7fshotUXK29LEtdtGC+lmOz7G1nMLJdJ9zDG1HYQ2mXxUGtPAZ0fpagl/6
	 wWIieEf1YgiWPxFX6TiJziuW3gNrfaKRTf4/atfqGb8d/iFQD3ZxlnLL1qkct6cDFs
	 NXEQG8T9lzaDRRCw8vMMfDGOdbwqYwtBqWsZxyAddp5vt1ko/0NvFlT8tSfhDAIZ/w
	 aXD+EhV8RiYlzT7yRfJIox2uhp1ST9/pW0bVYV210PriiyEZMg8IXgZNXIaLNqaOsJ
	 tEqvNCPKEao9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BB3380AAE2;
	Tue, 27 May 2025 22:48:04 +0000 (UTC)
Subject: Re: [GIT PULL] chrome-platform updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDPgbocE_8nImDG4@google.com>
References: <aDPgbocE_8nImDG4@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDPgbocE_8nImDG4@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.16
X-PR-Tracked-Commit-Id: 3e552ccf405c0dea6339988202a564357249c437
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d48d8380d92ba2db4fcf81c566093276dbbb4ebc
Message-Id: <174838608278.1808984.4752226789540854393.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 22:48:02 +0000
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: torvalds@linux-foundation.org, bleung@chromium.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, tzungbi@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 03:30:54 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git tags/chrome-platform-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d48d8380d92ba2db4fcf81c566093276dbbb4ebc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
