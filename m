Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658BE22F77E;
	Sat, 28 Jun 2025 22:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751149181; cv=none; b=Ho41jpe8a13uTJO4Oc6BRRpDpu2Hg/SPRE+LkHrb+7eD57sNRfjDOoHZqAjkO1Xlwcb5X++O3Dht0Vve0P/DBYTYETbcYkPuuS7ew3YlxpW0nffVVZOO21wUQH0JOrcHhXdzZk3aaug8NgAyOOHZzqQ4B5Ra9rS7lEcE9TiJKg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751149181; c=relaxed/simple;
	bh=4NUL35LaKl6ZAfqGvSCgdE63CSkio/ZuGChZ0iaqzwc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UpuVP1EsDE/Y13I4RUV57Q09u2HOMvF4F5iwqtFPFtJQilqPgmiUZ8JQwoVNy3XedSC/wc2Q+bhsRCIiXKZQINwTbLu9afPr8BMWrH7sT/Pk488tsScgypEtwrcmCES4zj667qV2HG166kIjEBMQ9nvpH80s8yXdCxZrXwrVHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHzg1iXR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHzg1iXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBBDC4CEEA;
	Sat, 28 Jun 2025 22:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751149181;
	bh=4NUL35LaKl6ZAfqGvSCgdE63CSkio/ZuGChZ0iaqzwc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nHzg1iXRnlBCOcmflDqvmHhSB1YGf9y4C3XwEbKs1vcyxhmt6sokP5H6pVBuzJjZ4
	 NwCveuzH5LBj1y4NiaX0+zedRvrycZiQHeKl+SuZKuOR7+YhP4e61l4aKfSLfTQj1M
	 An/de0mAhIm8QMsnaeofr0bhMgLrH+OWkP+g5oN2oVybzAtGX1i4RwZxiR1mdDfkZY
	 f1VvxA+Kbrvl080Pcqa87Z0j345wLMstwMAFU981odqdKTT5bXWKGV4KTDWrjJrhX5
	 uLyvOLHN6J38UNSjAiZtajWJvp+4tfGWlXH9080x+qTcHZefBVN1OLY88Br57dINpE
	 jABHep/ApkNjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3420538111CE;
	Sat, 28 Jun 2025 22:20:08 +0000 (UTC)
Subject: Re: [GIT PULL] LoongArch fixes for v6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250628103719.3741195-1-chenhuacai@loongson.cn>
References: <20250628103719.3741195-1-chenhuacai@loongson.cn>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250628103719.3741195-1-chenhuacai@loongson.cn>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.16-1
X-PR-Tracked-Commit-Id: 955853cf83657faa58572ef3f08b44f0f88885c1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a3de75a68ff8d52466980c4cfb2c16192d5e4e7
Message-Id: <175114920694.2297926.6533989769598451375.pr-tracker-bot@kernel.org>
Date: Sat, 28 Jun 2025 22:20:06 +0000
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 28 Jun 2025 18:37:19 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a3de75a68ff8d52466980c4cfb2c16192d5e4e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
