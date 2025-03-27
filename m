Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C283C2C8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037042; cv=none; b=Dhx7nCd/yhAJ121aPci+DAF63d8r1vmeht6cBAWtaZ/P17hkDjYPouvObna9FKo5O9OXbukwxW3mDT5BkjacV8nhvk4g2tDyU7XGZGtqoUbpX3nzwjlIa00sF3fLE0F+mBNQ6Er42QsOz4jj5XsoOPhdHNgjM0U4RLTGjpBj7fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037042; c=relaxed/simple;
	bh=XF/laps1zN9Z73SYme5+CyQpHVsXvrCYjTQ5V2mKrCA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=e+MT+U6tyPnHX+WM5+/5H+bY8vDK30DDIqbcwfqjgkf11ZaHN30TG3OR1zBbfB9yAE06Akd4KSmqDN+RT/3jv8qlkq0v2lVhG+W7JXoEUXVwbgtHgo5+PVzOADMnghzdu4sY1YasU3cKlUiPVcEo9w9y69KtFDOwU99atUNcz5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNd91+ez; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNd91+ez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7230DC4CEE2;
	Thu, 27 Mar 2025 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743037041;
	bh=XF/laps1zN9Z73SYme5+CyQpHVsXvrCYjTQ5V2mKrCA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UNd91+ezHh4cLkhySHrMmb3XevtGHNLoUcs/G9xPYfdmL8TFJdw+iY1oNuAD9i2/O
	 7dCwfkssRN/z+ZdhuyXESlHcnVZQCk1sQOX7x3jHYr+FhvObRTjLOkXyRgBLqbiEuA
	 +hld85Qd5zeDceet/zxAmeGmQ3HtrDb42xVD++SCfDmo3+ohsEHLYi289i5uUruUYJ
	 rrNp5L8z5hYKMOSxnp50Spte5npQl93ZUnGrGJGzptD9ACylBsZNx06fNLBUa/y/WQ
	 kgFaQ8TjWbyGuRYyASt1NSXWmFVR5Ox4byX2PFXOshnMu7CJ+4sSdSRsbqTJBxov3x
	 Y3CovHJFFfzCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB76F380AAF5;
	Thu, 27 Mar 2025 00:57:58 +0000 (UTC)
Subject: Re: [GIT pull] irq/urgent for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: 
 <174301605628.1660948.615494869949872320.tglx@xen13.tec.linutronix.de>
References: 
 <174301605628.1660948.615494869949872320.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: 
 <174301605628.1660948.615494869949872320.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-03-26
X-PR-Tracked-Commit-Id: 3ece3e8e5976c49c3f887e5923f998eabd54ff40
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 87dc996d56b7871da02ea6047cd46bb879443974
Message-Id: <174303707756.1518172.12089643840578271736.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 00:57:57 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 20:08:16 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-03-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/87dc996d56b7871da02ea6047cd46bb879443974

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
