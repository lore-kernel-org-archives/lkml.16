Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71C27EFF9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282313; cv=none; b=afSllhlISR9CxrVaZyFQ9cu7s29GqD8IkF9P0fEgqBu2KiCMMI9ElPh2S8G8TobDA8/Om/Ej7iiEph5KMSJQtIikqBuTHG86ywcF9535HDL5jRHpGuKIqoniEwYPlMNymOWfA/EA+TZ68/PX5DKRZBEl64aRbhiJ+UU/PAWFe2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282313; c=relaxed/simple;
	bh=jTx8+xPY9VOEbQeAIDyP9pgLyC7W1OHhXl44vSWQTJQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SVoJMkdmpfvvqJtar+DQFLWNOE6cPp+hTl6Gri1q/9dou4Mbwog4O/yxh4svvxjQO3U0G2NwpGp7FAzLU2DxO7bHMLpS4F6VSWpbuHYyVBVwDF/UFi5hw3EesE0cqsZLhLpnptITLxEyV5NkDAIAO04TZOz7Nkk0v6WOk2jpYv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOMyB0zC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOMyB0zC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D074C4CEEF;
	Wed, 18 Jun 2025 21:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750282313;
	bh=jTx8+xPY9VOEbQeAIDyP9pgLyC7W1OHhXl44vSWQTJQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qOMyB0zCI8hmVRU7qmpxVRZCbdAgfo27WIP5ZTY1kbuwhdykYaqsFOgREpvWFzAm8
	 hZclCOFGsLNWzqTF/s4mwG04XtS3nQhdSzupYjnI80M9t9SfnDOjh5mryXiPQGR6mb
	 p0exZUkuO30IV0jXfaq1p+vIsojOUYP19Vvu6cNfSvvGUkfNT4JzlvN/iYdxowXJeu
	 qmFVnp6teUjwliFByb7pqZk5lJO3EVp6WUeVVXKb+FAMDMIpyYespp47qSV9ah3BRn
	 eYay3ZPf0xPAdoj3vaHZ6kcw03GBZ9QEFEr8EJPAVVeie61kcqjHXcMeY5HHS2/4nR
	 xbWuXm85KJb2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC0D3806649;
	Wed, 18 Jun 2025 21:32:22 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: A fix for v6.16-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aFMfOlQ27hGNas7Z@slm.duckdns.org>
References: <aFMfOlQ27hGNas7Z@slm.duckdns.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aFMfOlQ27hGNas7Z@slm.duckdns.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git/ tags/wq-for-6.16-rc2-fixes
X-PR-Tracked-Commit-Id: 261dce3d64021e7ec828a17b4975ce9182e54ceb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0564e6a8c2c3152783906534d5767cabe1b05930
Message-Id: <175028234156.264355.167962489047730006.pr-tracker-bot@kernel.org>
Date: Wed, 18 Jun 2025 21:32:21 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 18 Jun 2025 10:19:06 -1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git/ tags/wq-for-6.16-rc2-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0564e6a8c2c3152783906534d5767cabe1b05930

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
