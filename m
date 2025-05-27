Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C8514AD2B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366752; cv=none; b=VdgXZr6n3+3UbjX7w+GhSEwBp+Au+HrfPcCRCQ46X/rUgSUaWuOHmIQYn/x1EwfJL+mI7rjglJRoOoWnlkb3+eJFyEWGAOCkl9T4AgxB8Dg+DRIiXQ8CvdFXvXTgJ6goMfnxFbWLLxkZma9wLm9w6LHrtK4RM1Y9+BbVI/tbhm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366752; c=relaxed/simple;
	bh=16fM0Ys1h+PWNic56xUBdwdjMy4Zvo3ud6vx8vfNdQg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZVuDTd4emoyjwtAiBOP/GN11XilepLLCqXxn9zBX0ns2spLWPYJnYFhLcj214+eXE6JEuHgWYZbbdJHBysQXfxS3zfRi+WGmtnIhF0HY2nbF6QRcPIiVvspeh9riRgANftfi64g8trSpG0sHb7M/Xwmv31guHCcl9jjswl+xwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhvcKgND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhvcKgND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EE8C4CEED;
	Tue, 27 May 2025 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366752;
	bh=16fM0Ys1h+PWNic56xUBdwdjMy4Zvo3ud6vx8vfNdQg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JhvcKgNDuOlev7x+EJf96i9orY8w/lriGJrU0h4u4eMC12vyoubrScyK8+Wp9DNY1
	 8FoXsMEev2PaFnqs3QKJTYt1VSV15wmMA8/HpECh0aEEsobP0hsQyNliyUCdpnTh3S
	 /m0Wov8BJ1o/OR3bEjjrDDaf64O7yyFsZ8+duKibcMUjjWy/R2e2lYq0DDE+8zj0Ng
	 jOCpso1XchGUWk+xJHmCykC7xN1ai01aM75BsT13bSJGHnx4yF1wyqegAUCGtq/CEi
	 /H7WpgucRV/ICQP/TdGdwfgss5dMJra9RDXofGSoFuq8OpQCDdrCAGS4rxGksqdFe9
	 P+5IZ10XgT4Cg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70ADD380AAE2;
	Tue, 27 May 2025 17:26:27 +0000 (UTC)
Subject: Re: [GIT PULL] x86/sev for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250526194634.GAaDTFGr3LAfeGdCxe@fat_crate.local>
References: <20250526194634.GAaDTFGr3LAfeGdCxe@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526194634.GAaDTFGr3LAfeGdCxe@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_sev_for_v6.16_rc1
X-PR-Tracked-Commit-Id: e396dd85172c6098e3b70b17e91424edc7bb2d8f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd3922cf9d4d1421e5883614d1a6add912131c00
Message-Id: <174836678601.1718433.15080191044484454943.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 17:26:26 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 21:46:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_sev_for_v6.16_rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd3922cf9d4d1421e5883614d1a6add912131c00

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
