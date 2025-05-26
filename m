Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C66242D7C
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748300312; cv=none; b=Wvq0caayrnWfsq/Uqvu/ifzC7OQjfL2T/w01aOt5HDWE39FdjocvxeiPxY3suJO7mNCoKQ1KI1AdzrXL1kgJAoNX1lG8hGomj20EzUAXuhHz9hstSKv6Ha2XUW7vOOsvbmNXVmtoV71sG5SU6MxZ8aHMA7fMwuqKOojqN2G7Wz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748300312; c=relaxed/simple;
	bh=RXzVPdqjLipL5ScUhbFFlYdBU0p1YIK9hyfL2GFiJLc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NwSZsvs+783CBpE+5jO0SoL3YaZL/9BNPogbfz3LtN1Q/y3BMcaO16nahMRGreP228/JJMOa7M7jdsCI3ZeR0IexVDWkHyBvZOKP0+gtC9KkEz+aYYoqjhhIVKXXJSCwdqstxyJFubQ32iMrI0b244TF4gnSqlpGoKR3uhBIDbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWHCmBF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWHCmBF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BB3C4CEE7;
	Mon, 26 May 2025 22:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748300312;
	bh=RXzVPdqjLipL5ScUhbFFlYdBU0p1YIK9hyfL2GFiJLc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EWHCmBF+PlnaR4y+qZ2prfrQbMjE7ZmvtiM5YhSorWg+CdlQj5x4b0V8dAynzJCoL
	 FsoC2tbxCuw808BhlZxHxx0sl74n9PhVD0eYfSwIgiv/vn/ibMp3KMIQdr7fiWCgiu
	 PMpp4tcVXxtAEI3bXbuE3RhtNVejXYoeRAB0pjKx9SO+rvTjmxNgqDAHr5KvyuYwsi
	 CgSzqGHJ93DLsbZ6v446EJrmKbSMGqzLld97h361alyofQbVBY1Jk7e4f5YOgcINIj
	 bTBYBTjqSOpT09TISdiyPDv0nuMsa+y3ZX+2QFKYG2O76ZJNO/3XOfZJqsQOLWbDui
	 pg++K88zI+xaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADA43805D8E;
	Mon, 26 May 2025 22:59:07 +0000 (UTC)
Subject: Re: [GIT PULL] Scheduler updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDLnosxcYAyXpeoQ@gmail.com>
References: <aDLnosxcYAyXpeoQ@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDLnosxcYAyXpeoQ@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2025-05-25
X-PR-Tracked-Commit-Id: 90ca9410dab21c407706726b86b6e50c6698b5af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eaed94d1f68c3476834e07409f5fc9bd8efd6395
Message-Id: <174830034649.1082063.13410998130229379554.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 22:59:06 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Shrikanth Hegde <sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 11:49:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-core-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eaed94d1f68c3476834e07409f5fc9bd8efd6395

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
