Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC95D25DAFD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745687123; cv=none; b=Rv7P7TSJzM69VUFUGOmZbLrXQSMJF+H5Fd1YMyMPBa+cqAhuPWg4s2qMVPy2zuF/pzMZgmGJm9vSrzVKWyzfZ715D8amOjEWRJmffGGMxRlXOaNwIr1fR5lzrc5jOvEAnUxG1CeFTxFeaIo0S5KCyeZvG7DT58XK8xOYUresHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745687123; c=relaxed/simple;
	bh=feuIqtjKtnvcmEUtaRGQiarA704LF/fIZ9drZXuWapE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hoJrp7w4sfXwhTsxdTmhyFLj6oqZjWyqY5SHa5V1WOyKVrcO+TeSrPt8EW3kmiaZmdvd8cFRJniL/09EUdlG4xC+yg9yl1+FGKSxntGP7cXwKvUv6NeON2e29+Gg9SoVjexlU1keET7uW6zrt3KDC2ioD8qUSurZXpgD5f/gvpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8SHXxGy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8SHXxGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19E7C4CEE2;
	Sat, 26 Apr 2025 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745687123;
	bh=feuIqtjKtnvcmEUtaRGQiarA704LF/fIZ9drZXuWapE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L8SHXxGy+XgLL+nOmBSgOFYJX+IgVkuYypVGiKeiP2DTtV7pfJSlqN/h/3dbeH+Ps
	 M3UVmA0yYUZ4dlKLnSkeTAU9MiOy+59KZOZ13QWyFh61ff6nZEzRqbhjFaR0Wq0jD3
	 74Wqk+bJxjTVMySm8HwsUQng2NA+tqkMd+SBp8pz4vP5GfLpR8w7h1syoZavsr6ijM
	 q1C+whCUr0+JQ6EauqZhPMtzuBCmCpMxcC7wpS04NDGrVzKU8qP8UbaCxKBsMZ5i4W
	 DkRoRw+Gmnl+EKqiMnzZuROszcN4ES+WLxdXy2+iWg/z3FRamSm/oiNrPL+CRN+OXB
	 8J7HCIGXeZzFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE00638111CC;
	Sat, 26 Apr 2025 17:06:03 +0000 (UTC)
Subject: Re: [GIT PULL] scheduler fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAyeTUAkDVb9usoI@gmail.com>
References: <aAyeTUAkDVb9usoI@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAyeTUAkDVb9usoI@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-04-26
X-PR-Tracked-Commit-Id: bbce3de72be56e4b5f68924b7da9630cc89aa1a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d23ef05c32464dfb1b010301e332c0dfc62e282
Message-Id: <174568716244.4031081.4088102367249743820.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:06:02 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Apr 2025 10:50:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-04-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d23ef05c32464dfb1b010301e332c0dfc62e282

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
