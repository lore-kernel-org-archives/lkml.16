Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5853274FDB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139881; cv=none; b=r56y64VXWvRpGB3MyoL+R0pvMVKwz076B3yZVL1wfkTJGQmyom3s7s1q8NIcvgGB/yD3RR7o7u77pF6qbj50njbprtj3QK5VU1UiwgCpoGU+Fcei0xg5UqB+QGxkSbkpz6a5eUFAHx9sl0fSRBmhAQzdDRsj8YgiPO02/c6O74E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139881; c=relaxed/simple;
	bh=wFKyVyFvKSmEW9LcHbUZ92arYav/2lspYOFvTwVGH9g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=e/9E2KIloYXApJ5pjsJX0MmG+/zMFUf6iPlgeZ1HiJDt9w4Ki3XatNTr34CA8SzGJNA4B5fuMm09z9a+mnvgOPO64RMgIjFpp1i3SE6sGanyXlILBm8MQTy1vDGj36QH1fwILgwQrg+9M2g3o7lGZAIwPl/Bd3Ij9IgvnC+PEd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enff0KT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enff0KT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879A6C4CEE7;
	Thu,  5 Jun 2025 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749139881;
	bh=wFKyVyFvKSmEW9LcHbUZ92arYav/2lspYOFvTwVGH9g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=enff0KT1wgDNGauSSC2zwmIt1/PVsfKDacPMwOC5bnBfbun0ZUzNzqv0xvAblt4hH
	 ejd08FDaK4polmdoBDEPdiKIgDjhWo//ucMEIncX2EQKiOwg9eFEOGL17Vm2nhmsmu
	 SCmBDntvOE3qVG1kEhrNbbP+d1iodU+o4tZWgD36/yIeAFj9oIL2XJjoR1qIwCYuzf
	 LkKGQJ3WMDgo+JALjWyRVcfwZTi16r0eAO5zAEMKux2egxfnqygPqiXlpvr3AftRAQ
	 SJ0RiWigPX8wkrGM8c4aODL7wmt7ZOqLnGi0qRfXs6GNU494AIihXEkb5YFMrjGQOq
	 zhyTley2Pir9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDC138111D9;
	Thu,  5 Jun 2025 16:11:54 +0000 (UTC)
Subject: Re: [GIT PULL]: Generic phy updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEE98PP0Mpz4a0v+@vaman>
References: <aEE98PP0Mpz4a0v+@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEE98PP0Mpz4a0v+@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-6.16
X-PR-Tracked-Commit-Id: 0c22287319741b4e7c7beaedac1f14fbe01a03b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d12ed2b7e1fe5c9e4a372a95fb7635a7f81eff6a
Message-Id: <174913991339.3131347.17402651245446558591.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 16:11:53 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 5 Jun 2025 12:19:20 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d12ed2b7e1fe5c9e4a372a95fb7635a7f81eff6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
