Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D7E1DDC3E
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746372149; cv=none; b=UAQq76F6AVJ9wT8nxNx74p9+dliJ2/uQwNXcPMq8pqgzjwsHzw2YhzZPTvzPW8xgF6bNpw90gPjMNCRbR6AvwzOrkD/W+S4dh1Ia6wM5tMSO6Xbvl8JjLGNAglMZd6KGGr5O8SmSmXd+YV5qi2i4IRLfQrTMI/N5LGDsH3v3muE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746372149; c=relaxed/simple;
	bh=v61jXKTnO5PfTXjXNoFncVIymGmK/Pi4Y7aOpBaptiU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bWQ4iif9rwRWXiEsh9Ot25qAdXJFj6rzwmEeG5xyAICPjNSNEZwF1zAYLwBcF2EtcjJI17C3Xh0zqYuXp8oF74wuK+6CDGsYNhfjLe0BINXwEWLhe+Qvk8StkdwFUWCSZbE8YrmfopqdadlOw2CfEdl1wGfmp5r8YQy2IQZorhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pajluiGo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pajluiGo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376FBC4CEE7;
	Sun,  4 May 2025 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746372148;
	bh=v61jXKTnO5PfTXjXNoFncVIymGmK/Pi4Y7aOpBaptiU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pajluiGo2A61kOuV834dnVK4sSTRF083Adfoqr9UYCkOKIguTx7qegp6mexeqGIou
	 d+Zq0J4s6mWgrcnG3QcuU/JveCfKJt5eKK3xTBSPQxLcWo2vdjazg+hPu5k8bOIVv9
	 5+OS+jT1wV+Wwk687BEkLBn0aPWyXyacftFu2Alp5apOoys+88MNZtSx5ToVrWZVX8
	 zUj2GQkZdMqL+TvOPdIgrxl+7hZmPiJURIrWfr8i5kKw9cY5ahYzUF9cHCYlfD5UsB
	 imGzXOTK9lEpA6ZQWL0xbtpX7DpjRCFemm3auHF4JWeZwbT3mxK5LlE7X1dh2gUPnu
	 cVp8381/ts/tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDCB3806659;
	Sun,  4 May 2025 15:23:08 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aBcY5onhP-kyuJuz@gmail.com>
References: <aBcY5onhP-kyuJuz@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aBcY5onhP-kyuJuz@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-04
X-PR-Tracked-Commit-Id: 8ed12ab1319b2d8e4a529504777aacacf71371e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d84c97a8df80a7fcef8d051c24356e4f005b1be
Message-Id: <174637218751.4049463.11462602822356199693.pr-tracker-bot@kernel.org>
Date: Sun, 04 May 2025 15:23:07 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 4 May 2025 09:36:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d84c97a8df80a7fcef8d051c24356e4f005b1be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
