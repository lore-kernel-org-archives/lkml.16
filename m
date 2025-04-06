Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C02221703
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743955321; cv=none; b=rlanJI6Oz2nINZBTvP8OcQOrQMywzYqY7lSAxzlc3Fvkn4G0hYhrbMEN52zEmnUYd9ivGEcS2zTBkTY1aFa5x4wgbqS4o+zNDshyic+vAYvoSMX3CzLMC/RkzQQKQ3BhGmM6ilTbvk3GS79FtzyYcrAJTxobztzGhOHbxv4ISu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743955321; c=relaxed/simple;
	bh=7vk5kGP7qBD5BOhJxhonlqDKEz3dFlD+Uv/jUbIOPOY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qMWCK6Y1fJBK28Z7ns3nAnTypznnrzEa2Vcls064PwOnAw+Qw8O91KjH42VYPpNJQ71pp1nJUWAQVcWCfsgypHzELBUIsoFbPLmGkpav3+Ojq3pe9j6fDLnWrXW0x/vAdCXJrRbGs/F62JRDH6BfEzBcEBjy1Nw3K9lmrIJkA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6pNb6Fu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6pNb6Fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACA4C4CEE3;
	Sun,  6 Apr 2025 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743955321;
	bh=7vk5kGP7qBD5BOhJxhonlqDKEz3dFlD+Uv/jUbIOPOY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f6pNb6FuRqKq9VMzhKRWnF+wYROVlPWP4/MT2ZWy9LrNBHgpKgu2vHq+rneeFm2j9
	 Yqno0Me9JpAExol+jB0fLwxbxLp0wFVP4EtaYmIeVyiBZ+L5D/YoebO+45vA+1iXnT
	 mB9MI6HsIVtZzwrKhfOeZDtfOojbP+obfza/m/uLHM22OqT7U0sch1WOz8E+UePiG9
	 Ok7NSs/itS8QVp+hfbAM+EPTL2iDh9LxqGXnegwgM7VFZG6hziUIcIsZQj+BXcRf2s
	 DccBPvzZzsE2TNMK+cnsxwvvTSD+mDl5xPacLLa6Iusfnr8PJtDCn8v6wZfuet0YEP
	 K9d/Jd2OH7FyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B01380AAF5;
	Sun,  6 Apr 2025 16:02:40 +0000 (UTC)
Subject: Re: [GIT pull] timers/cleanups for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174393725364.2346949.10226564772591697824.tglx@xen13>
References: <174393725364.2346949.10226564772591697824.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174393725364.2346949.10226564772591697824.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-2025-04-06
X-PR-Tracked-Commit-Id: 244132c4e5777fe0a4544ef23afba0d9a50e5ec5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16cd1c2657762c62a00ac78eecaa25868f7e601b
Message-Id: <174395535889.3904920.7999073790773759875.pr-tracker-bot@kernel.org>
Date: Sun, 06 Apr 2025 16:02:38 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  6 Apr 2025 13:01:01 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-cleanups-2025-04-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16cd1c2657762c62a00ac78eecaa25868f7e601b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
