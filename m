Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215271DE3A5
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746372147; cv=none; b=HneacQj0YV7/EM1+QYCjbck29m1cv0C2JQpE8sIINbHDbIDqobgJhWnmBgxlnp17DE8b4JCYkOnN+1FhCG9PWXdqk7DkXaetckOJIqfvHsJvvithL6DrN6ZtoN4DE6XC8bVLqMJb+Uja2t6TxVLzK65VpJnXWPWghONTK2TmaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746372147; c=relaxed/simple;
	bh=IvOvO0QJ8vFzVwAddpH5LMm3Tpwc9DGVmM1CpJg4BLM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BGC9+inGiDi5M4wK55DikE4Njt6tRJFQOIQOP+iYgtUdf8aqpkurxPnAa+dNIDjprsx8a8QctuwXfxk/wE2Cg/eC2wfSgVrqZhaoIKWrFOV4EL5JaQGobkZCGcu1N5muNYYxDpzw1OdEnyen2O5EZwNBvZ+fO1byju0eUqhZtks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EimJIpfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EimJIpfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8B7C4CEED;
	Sun,  4 May 2025 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746372147;
	bh=IvOvO0QJ8vFzVwAddpH5LMm3Tpwc9DGVmM1CpJg4BLM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EimJIpfTXxAUfAXiCxsSRBZs9BPDBXgbR+ieNZzX/6MB7WFlyXVW0TOeGNm1tpD4e
	 Vtqf8Nu8TuaNqMJV4mxpa6ycWke01zuHTZ14t6DlBAJhtfyk7GgtHVg/mJAESxCmaF
	 PfPoAYVpy24D/jGzAJCENg4XSg+c/gxz+nYNffhwwdM6u/7jS4pKiwIxgK77CsXVQL
	 UnAM68wObxpKqrKlpSRpVWhhCIm6ebPMFPQl+fbhloX8vNvLD/R+Byh1rpg9pNXrbR
	 q9K1XxeeKh/ZjUYC00KRCqBtQn9XlSCX0WQWbTa3EsGe7r5TY9cQKVGTMEyezNCHom
	 Csjuu7wYHtTSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C333806659;
	Sun,  4 May 2025 15:23:07 +0000 (UTC)
Subject: Re: [GIT PULL] perf events fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aBcUfPw98HOpq61B@gmail.com>
References: <aBcUfPw98HOpq61B@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aBcUfPw98HOpq61B@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-05-04
X-PR-Tracked-Commit-Id: 58f6217e5d0132a9f14e401e62796916aa055c1b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f3041b9e48084f9e82b9c949bf14bb7bcf214c4
Message-Id: <174637218601.4049463.8560965635331425423.pr-tracker-bot@kernel.org>
Date: Sun, 04 May 2025 15:23:06 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Kan Liang <kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 May 2025 09:17:16 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-05-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f3041b9e48084f9e82b9c949bf14bb7bcf214c4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
