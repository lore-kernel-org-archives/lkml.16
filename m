Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA350EEAA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120563; cv=none; b=MFS5EQdPRUXEi/wcOK0iOVI6XfG50s1vm/W91C3O1yeUvZyY7/XsDSv/IaKS2J1bNeKvcKkENNlr37YlO0GxMtCbKMf+YfXbqLu6uTecZNnV9bK3Bo2tS6ZcxSThGRrnvM89iHB2IuG3OP/W0OWQ9JlUp4VUESg0/c5GgFpWg0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120563; c=relaxed/simple;
	bh=MMANPBd2XGYDdv9Xf8/7azws9fraFO/3mpK2U37JKLo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nS3gpYyBebYLWLac0f2Ei2kx4yDqzB8b+J/4h+bRBDcCWyJq9sE/Gkq/nrE2tyudA7WNM6fQR4feD3vmBYBsbf1pboIEYRrQM2ajvcFp4hm85w3cFN4Nn+LL23azEqEU3/zjcBxsf+hjFUCjD0E41lquusjNQl86eU5E7z3Z3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGZcbpfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGZcbpfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C28CC4CEE4;
	Fri, 28 Mar 2025 00:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743120563;
	bh=MMANPBd2XGYDdv9Xf8/7azws9fraFO/3mpK2U37JKLo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BGZcbpfD3EjKtJsXMpFKEnAgqZaTx7e9aRloeibPp1kHyrKyoqTHfbYJdJKgpAX94
	 TYqq715Wb05eXAOhyT4zJYEUzsTv+K/hUgOejVbU8QIk9n7ha8DXVj4gKCQ5w7TMT/
	 vEA9AqXPp7uVQqQRnw7umAO7MJD4btdCGJaZw3TiWhQAdinY7q8VJSKe3oIYaFrEHl
	 HE3CbglZ0pgl0x5svUv9P2Ps5RxzxL38lotej+QF+E42j0+efusaWOKnBVm0JfCjGf
	 I/WckzkfROtGvpbxeHHGB++AuMtn+EAIFZDlLvWTGeWOvGXx8SbqMtN4tZTvF1gWjX
	 dy7aDFLCYsV4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AC7380AAFD;
	Fri, 28 Mar 2025 00:10:01 +0000 (UTC)
Subject: Re: [GIT PULL] latency tracing: Updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250326115109.32b69701@gandalf.local.home>
References: <20250326115109.32b69701@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250326115109.32b69701@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-latency-v6.15
X-PR-Tracked-Commit-Id: 4ffef9579ffc51647c5eb55869fb310f3c1e2db2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88221ac0d560700b50493aedc768f728aa585141
Message-Id: <174312059978.2290382.12230471687475560732.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 00:09:59 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Gabriele Monaco <gmonaco@redhat.com>, Tomas Glozar <tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 11:51:09 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-latency-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88221ac0d560700b50493aedc768f728aa585141

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
