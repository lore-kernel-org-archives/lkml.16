Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D82475C3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745010889; cv=none; b=RVa8aD2bajG4Dg8srqHzjnw5SkBZY8L4AghndNwu/eG352AbyQWVC5GMX0M4uX+kvXoquKAzFiIy3Y47V5NLACcjAezEwPQqOIeGjYvQfElcKQaSY2o325+fujhRgntPR06aGh/A7A3lDDzrjSbhb+k9111SWNN74XSIUR61pEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745010889; c=relaxed/simple;
	bh=6+mNx7OXVaNZ2ODw+4aDwKoRTEsj/i5YD2qiDC1EV+I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=biUclNC/RUHMUJbIb3jZxuOAY1iosUw9szyfXizh9w5qFH+rK1hGbOmOMKGA2MipjJm7XWEgSZOq0C8KTblridoC2p36sLjbHlAlCIBpfMgHy2Fa10wftOGNFVpBUtVJ4ZuTQt8bkEYPO3neolq1hR6kvyusrEHtyAbGY5qeX/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lw+LyjoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lw+LyjoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBDCC4CEE7;
	Fri, 18 Apr 2025 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745010889;
	bh=6+mNx7OXVaNZ2ODw+4aDwKoRTEsj/i5YD2qiDC1EV+I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lw+LyjoWiFUlEBdzyc6UTKWQavMbsrL568DIdTko8mvJ0GCO+eC+KcM6YgRah1GtB
	 9bQhJl7TVItFaK0fs7PG6ZZWBiNi/6Dur2L0krEV9ZvId3fCxhYWimWJ7lmUBhsg7D
	 yWlCBJgitoSLM2MTHLCVCtpS2RCMBDeE+6cUG95F2Qfyjix75+oeDQV3qh7Qc8e76x
	 m5IZNjs1kW0D6MxYKpDTuVHnPsXevTLb4x5xpiq3+kwGjeHPy8+WQ1/q7jJjVJoUpX
	 htEadK4UM7bGz13Ae3bKxCTmC/3ozv576AsVIgSOH9uPxQO1Q2MuAus6dnR+Mt9GhL
	 2w6WujQf+h2Og==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD303822E09;
	Fri, 18 Apr 2025 21:15:28 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAK5sDBMS8jYcsiz@gmail.com>
References: <aAK5sDBMS8jYcsiz@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAK5sDBMS8jYcsiz@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-18
X-PR-Tracked-Commit-Id: d54d610243a4508183978871e5faff5502786cd4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3088d26962e802efa3aa5188f88f82a957f50b22
Message-Id: <174501092726.328197.1366730769113587416.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 21:15:27 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 22:44:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3088d26962e802efa3aa5188f88f82a957f50b22

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
