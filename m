Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42457288C2D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 19:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751828598; cv=none; b=WjMcxcpCuqf+iRttV2tG9u40AkgP7vCr2GMOk6MVi4EUcdSjx1oh23ZKPiBcVOB4i8tXBdCNrEM0zUoc4QSX+tLRyFlChUeojCsRjYdaJ/N6+lL5oVUUL/NCM5+dCzgQXIO2RBe7T1WZGAGBeovjeMmjyqg7NNokobzng1RUnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751828598; c=relaxed/simple;
	bh=huVPTBgfQ5GxIM5q/oe0dVhbp13pABngEmuXHPSyXg8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UUl+a4QXSNmIVENd7XukQTojtLwuYmsPOFd4ddZhSTovnd7aNSorxAEdAyHrXiSP6+CZbjdykqdiDzAUt1PTsj4cobavMkSLkRDhikNJsi9GnCKob0nVfsUF352B4i6MTzDfdv5eLkTZuETV8CUwZaanzGTJv+ebdpc40dzzrN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tryVc25e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tryVc25e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB5BC4CEEE;
	Sun,  6 Jul 2025 19:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751828597;
	bh=huVPTBgfQ5GxIM5q/oe0dVhbp13pABngEmuXHPSyXg8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tryVc25eNKHut52I0Cm5Ufb2WJtpD1TG9OaNlK1Ov5KG56UpN4vrQzNhEGrqY4HQx
	 bk8YdYw0KWc9+fI9lgOP6t+Jzlm3F0YgplddwiKIWHO3Bmi+OKEWcb+ewcjAqrTruu
	 HVoKhVGfPNDAqi3z0fbcXjuKMjjD/mJ6Q7iNZLqID+6WXUA6ny7p8MgerJBX/N2OIH
	 dPoCYncoNZ+JrAXREGJNdffvoJkw+dbBRHk+x8WkzQHir8xSvXUwSENAkZEq98TIFL
	 3+ac7+QRHNxitqLIZuJIszIMs09Ao2K9c4atmIlw26Mxk9lQsJ1+Qr0FJggoDv5k3I
	 +esh1t4/HHE7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B4E38111DD;
	Sun,  6 Jul 2025 19:03:42 +0000 (UTC)
Subject: Re: [GIT PULL] sched/urgent for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250706083033.GAaGo0KbMDFzyQQLmR@fat_crate.local>
References: <20250706083033.GAaGo0KbMDFzyQQLmR@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250706083033.GAaGo0KbMDFzyQQLmR@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/sched_urgent_for_v6.16_rc5
X-PR-Tracked-Commit-Id: fc975cfb36393db1db517fbbe366e550bcdcff14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 772b78c2abd85586bb90b23adff89f7303c704c7
Message-Id: <175182862112.2712443.14495615527785771252.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jul 2025 19:03:41 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Jul 2025 10:30:33 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/sched_urgent_for_v6.16_rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/772b78c2abd85586bb90b23adff89f7303c704c7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
