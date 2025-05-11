Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E165B262FC8
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988777; cv=none; b=s+sLN/i9awitQFF8ZZjoaN26JfylP9GYlZWjixGSGF/+NCDJcHv38T2bN1euIL0j51j3ON55gCSHysYk8ArKDQsvGkm79mXkMoFBvfeqeKX0OilHMzRnEm+6XP89h7UJ4bQpwPDKGtpVPZLBngysP70T89lui31GTgcAFD9+95w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988777; c=relaxed/simple;
	bh=JIQXSFQZQnO9VBWmQLf+yq1X1e+6ZhsL/f3PdhGWaWU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qroH6BJVMXFtrA6xQZgQKbeODap/J+fN0eNjKb+2kPpcX7dr9OoJTWTS/en0Q98kMredR5zd1HOuvfISEyjmo+zuX3fm2t3S/A5gVvtds4TcVkbSXttZz7UnNjroOKyOtaxGcaSY/lgHtV3G7CNzAga82TjPzQjih7ch3R93Dq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svW/7sp/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svW/7sp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42304C4CEE7;
	Sun, 11 May 2025 18:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988775;
	bh=JIQXSFQZQnO9VBWmQLf+yq1X1e+6ZhsL/f3PdhGWaWU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=svW/7sp/Sl0scN/F4prnKGmtauTgaVih6QhF3KkWNnyxdw7jBewhB6gO2T+ZpQbCu
	 B5JF6bOhPjrfxZuWS4Cyp/gn9GyObfhoQGorLghuIWEABpJRqVLyFUpk3V8BqwJeTG
	 Tu8vSLbW48SIfhwBXTtyRM8qU+EyaEglkMlD3d6atuBb4W/WjX6Zy94tn89vEuXEy7
	 jmEKGavFok7aVjkkLvdL5C8qLL5YfMYQUEzd0udrVHoGl1hnqdmPaQ0alLIvaMc1N3
	 KrskifigU7MqEO89AxCokWQQ1ouoVoMowvwJBi+6dNmtR1F3CDzUKe6W5UPjuZ8QKT
	 jH4vSGCQDuBuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7781B3805D89;
	Sun, 11 May 2025 18:40:14 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCBXl3x1VSU7fCzu@gmail.com>
References: <aCBXl3x1VSU7fCzu@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCBXl3x1VSU7fCzu@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-11
X-PR-Tracked-Commit-Id: 5214a9f6c0f56644acb9d2cbb58facf1856d322b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b9e62a2b8ffd2bc39b5838e163c41d8a08dae19a
Message-Id: <174698881330.20988.7882755965131110437.pr-tracker-bot@kernel.org>
Date: Sun, 11 May 2025 18:40:13 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 May 2025 09:53:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b9e62a2b8ffd2bc39b5838e163c41d8a08dae19a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
