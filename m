Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC33E23E340;
	Sat, 31 May 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705416; cv=none; b=YFWQaYyInyGfUjayF07+P/IbaWAdp/q3HStknxHVMgIZ8180V3dmhpoi9MBRwId26d8RRStkouCok6Gkly7z5LNrhnRAz0uOQtDqA6ykCUyar+W/OBZNwspRKcen27mVkrxKkmxEA6dnMCzGGNLg6sFs6LfW93m7NEFHjDjH/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705416; c=relaxed/simple;
	bh=QZs8cZpTJY2GYyXFmJ1cbxgzHKLLlva4Qev0J55Op7s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Z1gXPOu7ag9s7OGoDjar0jYfQS/lnabFwIFO9dJ1DAeng3xg8/KH5YQxgzBMhUTwFx6eP2KO4cuvTGNPeT5t9BHdeeMgsRVO7AMn88XuB8d5B8JEAOYWqxHXKkxMgALlAWMbs7UNM7/8DByi/TT3+j1qdpYuQ9KtW9vTp6b2UPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr+NmFCM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr+NmFCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDFFC4CEE3;
	Sat, 31 May 2025 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705415;
	bh=QZs8cZpTJY2GYyXFmJ1cbxgzHKLLlva4Qev0J55Op7s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kr+NmFCMehV0biK5Tk/hYTvrUWCfaRfbB6pR2M32fEEPwPKGvlv5SQnUk78m/VKMM
	 NR8bnHd47rrCysdN57DkNNPiQv4l9HN/jIVpskyTJaBuo8FqIfghcUf0hj2yAkODZB
	 XIB8nOGwyR2Ts1l86LvrBMRLrhNnxYzz8vWfhD2ZZz54cjjMy5gUOPyhQrdFohoVeE
	 yqpoEtTBNDalgh5++XtYpBS7E7fZeMeMqHMCLI9Hf4KGbV7r+Bi+dAGKykOrrU71s0
	 mVU64Kg9RwXkMSJCn+Jvj5/8wzpHXos2ecwthnyH+NdgPANq9VoN/a9VWKzX2yaCyn
	 w80lDZYDzXBgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DFD380AA70;
	Sat, 31 May 2025 15:30:50 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] soc: drivers for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <f44d3ad7-b518-4679-8f7b-949680b26ef7@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <f44d3ad7-b518-4679-8f7b-949680b26ef7@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f44d3ad7-b518-4679-8f7b-949680b26ef7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.16
X-PR-Tracked-Commit-Id: 5963edd98a2159f2114b08e402a7341c1e7dd293
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 297d9111e9fcf47dd1dcc6f79bba915f35378d01
Message-Id: <174870544866.163157.4319179356868633377.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:48 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 31 May 2025 11:01:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/297d9111e9fcf47dd1dcc6f79bba915f35378d01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
