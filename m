Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08790224F6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743129511; cv=none; b=ZjRup1S7loZoSLVJJHHHPMIEZKnGrl8ndwI91hE+St6BP7OCPuvQeHrg8wbOnfd9GwOlrDp8QKaHrNKZdMXaTAcNn/CITbw2UHFUDbxnn8nMt4yrxSDRzWb6JfTrkO3o43rbCTv0ebqkSJ3wWbpSS+xJBgrU486hYQdkKhMeltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743129511; c=relaxed/simple;
	bh=ubvd53CGAr0IIjdwcdj7JtmnEXkb4DloqbGr0/jCMW0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IINWFdl/DJZqa2slkCwrPTueEr7McWbIN5qPzNodcg5cNYxWWITOQBcPA+mlGvG8i9cPsFDoQ/iMZZyLGdzyfcLinth8y4FuT03ps6hqleG4oJ/6/eP8StACrjRZPu68tws0TmwIbYyeEaFrZdsi5QmhuLpAThwaryAUGY03ZkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDvCY6wU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDvCY6wU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786A6C4CEDD;
	Fri, 28 Mar 2025 02:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743129510;
	bh=ubvd53CGAr0IIjdwcdj7JtmnEXkb4DloqbGr0/jCMW0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CDvCY6wUavwQNXf2CYKrafBzFaK1Wt7gCSB3YJLuzIPva1l7ROTHHOKuz0uY9fdpx
	 3z1PL1OrA/wniQxfarPvRhcGYJfDEdRT648EfWb2FRgCm0Ctdsen0lh/gcPJtJx5qT
	 eTpa6ysA4qVN/hpoJiuEx+ePA7hQQaA6qC9JIH6ztckXyLrXm0KL7OYRuku8j8FPMA
	 W6Lu6eiOfqGXZtU2O06IFg5m2VoMxDrcmmC8iQb/Xc8yVUJOmlJCCuBildEBB9a9Cx
	 0UXykpbNK0A/RGkv3gCN+/RIDR13FDRkPH1RqWaBcb+MloE1s/1DewHtFlnQEpXcoF
	 +zMSXokLBcNKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE953380AAEB;
	Fri, 28 Mar 2025 02:39:07 +0000 (UTC)
Subject: Re: [GIT PULL] probes: Updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250327221357.bfa54d31c9f8b9b1e68ffe3d@kernel.org>
References: <20250327221357.bfa54d31c9f8b9b1e68ffe3d@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250327221357.bfa54d31c9f8b9b1e68ffe3d@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-v6.15
X-PR-Tracked-Commit-Id: bb9c6020f4c3a07a90dc36826cb5fbe83f09efd5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7e135fe59a516b2a981fc5820e7a1e2118b427e
Message-Id: <174312954653.2324629.16631039113736761358.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 02:39:06 +0000
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 22:13:57 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git probes-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7e135fe59a516b2a981fc5820e7a1e2118b427e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
