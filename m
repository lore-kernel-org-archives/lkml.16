Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC4D44C94
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743555712; cv=none; b=O7NxnhSqg3FXgTK9gx4blFGfGN9CivU1wlLDhIGVeNwuhvHEwhnZYGdVjGXaBbVczPAgN0ObDnnAh4EcEy7a0dELKsLMrEYjlXbGQhnMre7/FKymzd2zz44jKBCnIrSkNuCUpFTnBv84qrqJGjHlXuu9xypb/fv30lO6U108E+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743555712; c=relaxed/simple;
	bh=uEj403VsMafiAqrX4LjB/XUJUb87tBGkIqbaSQ77DsM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gIL6IWTeR2TMIhHv5clCwNSKnyJBFik4QBIlOA4fRmRiJvxDMmmXayu01a+Fd9lerzcP28hOPWvQl0UHTP/jhQHJ360eYNoVT61r97eaAuXo2CpxIXypzmJIaymkiJXbosSlhQTpBApebDqiBGztJVbKY0ZKDQCc6DCElkUqdd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZBGQH2+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZBGQH2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C55C4CEED;
	Wed,  2 Apr 2025 01:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743555712;
	bh=uEj403VsMafiAqrX4LjB/XUJUb87tBGkIqbaSQ77DsM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BZBGQH2+mncXRSLYzFe2T87rqaQChMhmSWAebP1sIfub0XuwFWdA2M3XfptKIzb8t
	 ZLCjbzwJDEAoYe7+9qVEI7JYJnMHmKNofhpg99U2Zfk2noeHQadUMt3ebTZt35TZO8
	 6udAvSU5qkfAVLAej1t5oic+CfLgg6d7OYiTr3dBDYhtXnBHVK31/cK5RDy0DOTy9A
	 zIZgkPor+rzho85O6IVOfykeG/jgXOckGH8opPJPCxkTzlL1wV+T/ZjyWCKBqOVTZI
	 cb7OCFvJXzBGSGpQjdZ4VJ3vSxyHUGWPUQ6ERFTbs9S9p4ywmxEf5pImeRAfk2HNSw
	 hXQ9LEhguPzgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DE5380AAFA;
	Wed,  2 Apr 2025 01:02:30 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025040122275143b58a41@mail.local>
References: <2025040122275143b58a41@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2025040122275143b58a41@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.15
X-PR-Tracked-Commit-Id: bd496a44f041da9ef3afe14d1d6193d460424e91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1df7752800b41de14dd268bf53d854bc81017973
Message-Id: <174355574883.978371.823968678918188057.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 01:02:28 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 00:27:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1df7752800b41de14dd268bf53d854bc81017973

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
