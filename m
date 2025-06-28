Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB922441B8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 22:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751149182; cv=none; b=DaytxprcYYkFbo93p0JK8By3l7r8FsOg1EKeH6ddQbRAogfAZ7JdKYZ2h4bkQ7jm7K2nObYlT/q9wrBmbxhslvooHg7OIgXihEONWq/TEcz8h6vnuUJabGPSMcWY/htiWCmxr4hiu+XSAAhSvOKaanY8t81s1SRzBlrwPgqJNJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751149182; c=relaxed/simple;
	bh=ydRmzyfMjffkZj5jUSXVIkG8paXXNyoiJgV/8KIPF1A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VZg9funBu7rC/fDHK2z4Vnn4ba2D461gBh61LackRFQI3SX7tIZjO+DYhP2Z3rEib9yD3/yvb/Ea3UjFX4wJxjQ5DZisadVGuavBfHlOHlF45ylGVcGSz4Ei5fTRWrsQAPSm3Io7/m4Y/IJ3x3uBpQqvk+FrZILc3LcTkEUGV4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RU78kocc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RU78kocc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCBBC4CEEA;
	Sat, 28 Jun 2025 22:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751149182;
	bh=ydRmzyfMjffkZj5jUSXVIkG8paXXNyoiJgV/8KIPF1A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RU78koccdp4llR7dcH/jde+C/rULrMTlVNtiVO2tCxY8FvjXFNZbJtXMQVTWCdOn9
	 5qg+t4n6NlKLnIFVIQGUoQf/PeEydxnMnfUZKtgMe7z4RakaDq0yVPBW1rUlWNZIbv
	 MHcDFewO2c4bURACilBHMvF7xqWoAbgwGIy5Lkn1Iibk33qYd18u0jTHo746dOZwDv
	 t0LEF7uzyBVy3Omt7442jYNEMf3yMoLDB33ZvDfGA8Obn4ieH5U90ZjI3CFI0a39mo
	 A9waA2HvBq8LYuBuRcW3BcMaAPvdsZ4dnkH6Dg/eMufar4qsH9RPxR2+Tq9oAiPsQe
	 UMvmAxZUPYEMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE7A38111CE;
	Sat, 28 Jun 2025 22:20:09 +0000 (UTC)
Subject: Re: [GIT  PULL] tracing: Fixes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250628094947.6d5d88cc@batman.local.home>
References: <20250628094947.6d5d88cc@batman.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250628094947.6d5d88cc@batman.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16-rc3
X-PR-Tracked-Commit-Id: 6921d1e07cb5eddec830801087b419194fde0803
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ded779017ad78fc9df3e9d9ae0e39d2e73865851
Message-Id: <175114920836.2297926.1588306047614526561.pr-tracker-bot@kernel.org>
Date: Sat, 28 Jun 2025 22:20:08 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Edward Adam Davis <eadavis@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 28 Jun 2025 09:49:47 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ded779017ad78fc9df3e9d9ae0e39d2e73865851

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
