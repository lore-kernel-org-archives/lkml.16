Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7923E32B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815411; cv=none; b=Jk8/sRDcb4qu/nrl4Z8ws/N7ftbmPtQGwlRwOH5n3dMHC51QaEGX0FjgiaJ37WgTT2Ygo1vwLYmruPLAeJ/wKwH2k5O/Nez+W/trJHCGdIpKmVlg6ydcXJgmguwmxyjl6fhh2NVlf0bD5GMknmeM6KuxaSpYQQ699fEasvYLW2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815411; c=relaxed/simple;
	bh=udV99osEjaUccUjVGvCSpuxdG+Q+f3OQGs3zgzs0Ydc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BjNASNhE+TOANK7QbVqzjk8flyYZF2Om1H9nXxMtwPwX7tITrgiE22Mi14nXlUyXahAja3i2ksH0EDzFp6RcriPBCtzRT+aOrUIt16fu/USnyNkhumLikBYBfGc9rTt7qwHACTLhgES4KhhPse/G4gBoSZFRh+PyEqwL48irlJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI3f5wJ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI3f5wJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0892EC4CEE4;
	Fri,  9 May 2025 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746815410;
	bh=udV99osEjaUccUjVGvCSpuxdG+Q+f3OQGs3zgzs0Ydc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mI3f5wJ4ozjvWao+2h3woPXhYxcYYo3molADljwwSxuppSjkQSr+pY3Nso5f/jI73
	 77KFnjzzRkRb8DnIYsEGDpkyGEruGbJjDJtTXF7h8rzj89ZCW0/TGRCoHzYpgBJJ6a
	 c7jwEiJkvk5aQbgLB3WAHIdvvyXb0J9SluNEaSFjOZC8l3C5eQWhLtqvpA9GY5mIH7
	 RcCF4YBjantihNg8CDsPKSGvzC0nJMgyV/7yVJ2cQjtITTEThlteCfVR0+SiWXgEBB
	 Dcd7xFR+qU4qOKwZaNw1onhQKfg6y1tu2rXAKzRIIBGpSs/F4psldG2kfKCRRZrOCe
	 VKH4OI0d+fS4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE119380DBCB;
	Fri,  9 May 2025 18:30:49 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
References: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-e96a9b93-7daf-4aa3-86f7-461467c1ad5b@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc6
X-PR-Tracked-Commit-Id: 01534f3e0dd75e27ed03e5542f0c7bf6aa7130f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3013c33dcbd9b3107eef8facce0e4c69f3b7f780
Message-Id: <174681544827.3713200.14256955835077534513.pr-tracker-bot@kernel.org>
Date: Fri, 09 May 2025 18:30:48 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 09 May 2025 09:11:24 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3013c33dcbd9b3107eef8facce0e4c69f3b7f780

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
