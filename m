Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4231A23A4;
	Tue,  1 Apr 2025 02:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472966; cv=none; b=X8+CgMLuxZeTL5/bcFmNAYsE2ScaCigKibX4VZqo1XF+ZFPRlH7Qxxe2J6pzpNT0a9tIt/tyOift8QabrhmVWRPgdcK1I5ULzWD99xIgqu4IGD639jSdiva9ZMwsIm98wV40lImBb6AdUAfVxl6ZrD8sv5Y9dxLAWdshlFX8q4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472966; c=relaxed/simple;
	bh=oE70ZTjzwL17/85K3SzEQvCRKdgmoVsWPv3g2Ay9fr4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PF4FsvCgrE+LpJBve1iNFzlBadv/QCW9E/pSfDnCCUgLSeDN+wZU9IT4oXPqmyNJvQeoGjNi4M4jy6KZ8t8aJKpZdW/UnfKCPn/xavky20NFIfu0XPhrytXyjED4Hs1nN6iX0VD3GlNEkT4JOJDu2fljpETh+JVB70DB++KCIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nl48a2xs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nl48a2xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4069C4CEE3;
	Tue,  1 Apr 2025 02:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743472966;
	bh=oE70ZTjzwL17/85K3SzEQvCRKdgmoVsWPv3g2Ay9fr4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Nl48a2xsiCy6IDQ3QbM/0GDYoD2KRQ0zfPKOJLeG+aSLYOIeDnS74AmFmhD58PMXk
	 UuvOO2q+DtoNpVL2NoDoUB2xCyrVA25uto2Qo0EMElv/45+p6l+hB9h0I0qJ3KjUVY
	 BRmlVeuAXMhkFCPCe2UqWyU0nA2CKj3CWGgz4DauCVUSGsUNj4Rp9MuNQCJs0eTB9a
	 Tm+cC0TvDLuJHxRhhq0GHcbgkU1pt6ex5vwsX3C1d4hNbXNUYjlL0dkgr5rLsYHo2E
	 XdM+WgbGzPPbq7HeBJvCzftf0FL+ZOiwrLGeIXxM84qawq1tv9h4lOZPj9WhCkF1Pt
	 LflUL+3vzvM2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB104380AA7A;
	Tue,  1 Apr 2025 02:03:23 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.15 merge
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250331122926.607374-1-ojeda@kernel.org>
References: <20250331122926.607374-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250331122926.607374-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15-merge
X-PR-Tracked-Commit-Id: c1f4534b213d7be41b5d8b815a42d201a8f2978f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 08733088b566b58283f0f12fb73f5db6a9a9de30
Message-Id: <174347300247.206397.16459471732303562714.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 02:03:22 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Mar 2025 14:29:26 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15-merge

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/08733088b566b58283f0f12fb73f5db6a9a9de30

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
