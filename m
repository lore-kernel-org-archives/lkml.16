Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7E1CB332
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743375825; cv=none; b=cxUGNafAhxul2Zg5sth9JGcbzRG8xuKe4SMyFvKSkzoeXM0Dr1lcRIlJmEbWDUAb3tmeOPiSJMBGDpQg7B55kBNMCgxYFdTB2ryMCbA3Cqw82oXbeLiiGyXs/uzxzZMr1tA8D14EOG7Rh4h0pbe6wzqAIcwPabcMLkmSA+FotRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743375825; c=relaxed/simple;
	bh=YnhBiEyGG4kUKGDoXuqKLxcMpcf/K6WZiM6Ja+AnVm0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rMyJ5idwWDVf7OYFxRbIDZJH+SBvRdc4iTmsLX6HAKUYLLZrRY0EVFhSjCF2ywKJJUIYvmm7bGJlTRlxqIplUbZLZ8JSuCeLvVF5MqwO8iAL56HWlmwgpSVGHn3aeYZeDn1H/vP9OeuN8YyhMbSfAyaHJiBlaavXcbOf1uV9TWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFEXDATU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFEXDATU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB642C4CEEB;
	Sun, 30 Mar 2025 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743375824;
	bh=YnhBiEyGG4kUKGDoXuqKLxcMpcf/K6WZiM6Ja+AnVm0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gFEXDATUqieCc9p3+YIKsXzYhVizzIP3DIRSfxzhdTEJPGcnKUd8fsLMudikK4vtJ
	 9OzfumNcqaQ1TVAIaCj1cW7BaqBEseHCiHvaucQn9JZV2xz+mk6md1XbGBxhmwI4iR
	 PLgXo8KDIT4vQBQMoEkD9AO5QO+mojdbzBe7MVbOlhNdPdzxMdFBrv43Q9ciyke9su
	 fOGpFLrpeHQl7aeMwpgAuG2aZQy+HeWsdJuBdW9QY3tgE5HYyDOfxNf9axvEh+fZ11
	 C1emckPsityZljPo17mewKzbWIFS1T1vYIzNsMqgWLO2WjlR+azrdj5RZaHxSmiL0w
	 96f9RRxWnsFdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC57380AA7A;
	Sun, 30 Mar 2025 23:04:22 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes and updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-cU8qfH1dd7Bmmb@gmail.com>
References: <Z-cU8qfH1dd7Bmmb@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-cU8qfH1dd7Bmmb@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-03-28
X-PR-Tracked-Commit-Id: 31ab12df723543047c3fc19cb8f8c4498ec6267f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7405c0f01aa281e20d9f9f34ac450537985bfb05
Message-Id: <174337586132.3614380.3023408428702632812.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 23:04:21 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 22:30:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-03-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7405c0f01aa281e20d9f9f34ac450537985bfb05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
