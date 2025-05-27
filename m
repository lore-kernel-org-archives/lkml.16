Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E1B27A139
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359953; cv=none; b=a9Q5qnSq23AY4+fS1xwR6fIux9kCds3ewqwDbec5W8KUwaZrnDMaEa0kplt20UkpHx2Ztw9XkYkzjDSjorx+NBkt/2bySwKmdf1vdAznJopEbyqLO2QEe+QlX38QT1Dz/CGlNAEzDzor0E2UcAoqJYOYMoCJCdGWbn5fkT8Bxpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359953; c=relaxed/simple;
	bh=jDlWueEOLaOtCScfLhPzbniYw1K/Fj97OVuoCvHE3Y0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GeFxhiCA+4bs4gAfMDbuaB2p/W08MwkKzZUufydfMwU/ZETyJfXl7yhcMprISSG4H/p86FNT+OATg5rC7mJny12hhI8Upk37uHQa7RNoLJtZ3wovTgcSazrVLWSp8KxOyct6o8fe+N80IvvSn2cRVlcTsWa3l7eGgMpHXIl1dRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRcfpQVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRcfpQVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765DBC4CEEB;
	Tue, 27 May 2025 15:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748359953;
	bh=jDlWueEOLaOtCScfLhPzbniYw1K/Fj97OVuoCvHE3Y0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QRcfpQVjk4TCJ+mWvxDBBBJGUMNrU3/OFc+gi0Q25xMp8F+mwiGawARQXdZoo2JuW
	 qfIMpLF6RiZcdItNU6qve9fJfVL9c90u/BIzewJvfmYMqlzcvNKewa395V5RbJBzy2
	 boK04Enaw8GL/T6mhnlMYmhlqDKFVQpEWccWlWB/X+iKYNzca3SGwHf1wp3m5pjx+4
	 xPb9EkFXDEX2F1SgjQOapKyqqrcYwlSi6YAwuKHhktuTmFBz3o43S+UJVqLp9AreTz
	 OEf3s27+QrdjwvK2XJ3FFIwcmYWnPvGTRAe9qlMNWlM6HfwQSnp4nJBisJQqibQETY
	 csgeVMXYa1yAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACF8380AAE2;
	Tue, 27 May 2025 15:33:08 +0000 (UTC)
Subject: Re: [GIT pull] irq/cleanups for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820637636.238682.4962254861955790452.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820637636.238682.4962254861955790452.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820637636.238682.4962254861955790452.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-cleanups-2025-05-25
X-PR-Tracked-Commit-Id: 38c1e73fdeb37962324a3265ef95618dfa4552ab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2bd1bea5fa6aa79bc563a57919730eb809651b28
Message-Id: <174835998750.1680652.2238029747592099328.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 15:33:07 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:40 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-cleanups-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2bd1bea5fa6aa79bc563a57919730eb809651b28

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
