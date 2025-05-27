Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2BF27990B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359946; cv=none; b=fvGXS24lBrMDePY1g0nvqfCvaN1QndSxj8QnbhFPk68dJ+lrJmiR17Y5NsvpFw60/KxanMxQmSk+f61wlPEH4GQ5RX++YhgbIA144CysbogS9t03LtPlrdzsVWD6R76IB0wg2Nguj52uzm7RPOuDDPGrwb0ZZbNKGaEeDgzWsg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359946; c=relaxed/simple;
	bh=sUpQjgjyN30O2GMVEcZASix9sD2sbod1n7mP/T/Aa5s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=icNDc9jW9cX0isXZwqAMzIEAMuZ3WXRmN7euBHNXPQ+E3W4O1hxvX0J8EV3doZwP71B+HMAYklTKHZdsi7Y0hpM+0xMfgNAIlAzLIoszB4ZGgu0Fux8wJHHQYWjbUnuzWmfXtmzFBl2/M0NV0FgpKnofygflIbs9RISb+viu4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlOnvryc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlOnvryc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301ABC4CEEF;
	Tue, 27 May 2025 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748359946;
	bh=sUpQjgjyN30O2GMVEcZASix9sD2sbod1n7mP/T/Aa5s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NlOnvrycx/9ms9Ega1f6uiYMhujAq3J5e4sTAHxf9ibjjizykE26y0ZjT8q153pCs
	 /zoq8/VwZ25DRvYy09HIvyDwotQelWfpnhzIwGE2CgO8q/z2tQyPg2f7FtgmxySYZT
	 gKmPRK9JV8XbcSWFfKs64+miez3xYszRmbZqGZCiegPQUGPtyVuIYPfcQmG62iQC/T
	 vVfhvbxVGk7jlrK3kBPintQNTXP3OOsN+rEu+I8rs/93eQ7JcwZRO9CVGuyBoVJ0qr
	 c8jBPUPFW7p49Bj1EVxlATMbTtvoTf6LodGmjqlGM+hCe19pMWpLzE8G3C6Hegvi6a
	 tKVP3JJnQcQ0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEBC380AAE2;
	Tue, 27 May 2025 15:33:01 +0000 (UTC)
Subject: Re: [GIT pull] core/entry for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820637262.238682.1985899398053030312.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820637262.238682.1985899398053030312.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-entry-2025-05-25
X-PR-Tracked-Commit-Id: 8278fd6006a02e3352d5230927c4576f53fb3b06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c1494015fea0935fbf6cd9d99c008fcbe1e4165
Message-Id: <174835998027.1680652.601328967780791394.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 15:33:00 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:36 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core-entry-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c1494015fea0935fbf6cd9d99c008fcbe1e4165

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
