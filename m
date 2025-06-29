Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CD7239090
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751215199; cv=none; b=gurcj1SlU5LO2BSrRVcXG0IPDAQML0t9BD8oT9ntw3e3UfelOKDAcJmt7jOaf2EabaW2ud5qNKY0xdGe6zoP4VYuh2wFBZPLEJ+6w2JIRjeHyFvs9BAIKJwGTUOz2asWqLGoLByJ9tk5jL1GqnzPaA8Xt5hGC0Trq60jSPlomQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751215199; c=relaxed/simple;
	bh=7TN7omCQan52xewBhOkXea/87ElIUkvddRDsEYxl50Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mjhNwnZQIcSGlM+chvWV0dbggIIJMMbHOEap82UIhbDvl6FOfVLIBJ0axzHyrzyfH4XFTuNHOPgiI5nXNwmTsuGw/7QA+9btOWFJcDy3pLPcxeSE4It3wV9Qk20ikNDhB6+Z7t+cPJdpRs3103ZlwrlLJJ6/bLOEYRGMaIraT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Us955aD3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Us955aD3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE94FC4CEF0;
	Sun, 29 Jun 2025 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751215197;
	bh=7TN7omCQan52xewBhOkXea/87ElIUkvddRDsEYxl50Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Us955aD3V6O9+01UnREsYPoAuwSigJRfx/1DIZpf0Co5dumlUalEbj0HFfeA8aZ1r
	 dPrhQ6yhq2LKGF1QLY4niU0juQ1Lg5gE8rSkuuC/nhYwediBqfGmsrzr4X0Z5B7CSt
	 gEdty+ubKa4IifMQQYjdoSbGuNw9XfFioI8nrU96H1Nv44ydTC0qKjwO+2Ag0m6zUf
	 kJrbg9loOYLsOd7jRstwzMzayPccqylFo6s12oFGE8Btdx7pQyzYxYod1i0issERkx
	 fnX+F02UbZe0+Ni80Vr1MlfgLWlZnUdKQefB0cgDuiNnb1CG9suqIDT/wO6n16s4iW
	 6cldmgvycQRAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC8A38111CE;
	Sun, 29 Jun 2025 16:40:23 +0000 (UTC)
Subject: Re: [GIT PULL] x86/urgent for v6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250629084630.GAaGD9ZoXfbOG272mA@fat_crate.local>
References: <20250629084630.GAaGD9ZoXfbOG272mA@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250629084630.GAaGD9ZoXfbOG272mA@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc4
X-PR-Tracked-Commit-Id: fa7d0f83c5c4223a01598876352473cb3d3bd4d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc69ac7a65820dd96c48fd2988255f8acc2527f2
Message-Id: <175121522234.2432237.5757432293852182861.pr-tracker-bot@kernel.org>
Date: Sun, 29 Jun 2025 16:40:22 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 29 Jun 2025 10:46:30 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/x86_urgent_for_v6.16_rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc69ac7a65820dd96c48fd2988255f8acc2527f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
