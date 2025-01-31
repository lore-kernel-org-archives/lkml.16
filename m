Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93791B0424
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 23:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367303; cv=none; b=Gg/GUyKiQ0Ru9zgwHN07mQy0qVuqhyklPVe4apxhbzDNh9mMJxAssobOsVIfst8D10aw67hzKXGowluO70hq1NxgH63dSnHYXMDxaZcIClKeZBdjQGA5OxgCzmWQaIrE/pH+yOuczLpze5bL08o9Arkx60HNrcfO9ZtOgQUnEhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367303; c=relaxed/simple;
	bh=/lTg9RXsjupqpBSfKJC/jK0qjh3t1trdN6qvQpo/DAM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dGJsF7cRlNyixOUtJsUj4X/QexIEfMu2ywXL19K6PaqSU8rO2gAwAVe3zEvOXCtrtlJRIoW/k2Nz3R/+jCCHqGvMXNvDwQesiBglc9SBu75+EZNWHJmXgwzqO1YXaLz95IEKs61xvxM7EOPkFJlcgjMiix4m/uDd2P0uH1c2go4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFnpwGvN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFnpwGvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88E6C4CED1;
	Fri, 31 Jan 2025 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738367303;
	bh=/lTg9RXsjupqpBSfKJC/jK0qjh3t1trdN6qvQpo/DAM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VFnpwGvNXdbQwZM+tzbUsTiTRLMkWnuSExk4xmSpVj7QNISfZ5LoT5Tj++K9yyqgw
	 MG5Vdn5R/aVMkvy6avyOTyrgklTnbSB3kRtzdWfzKGrk6XaP7s+7pZu2kZREhR2JxU
	 6eYwaDMx3ZSeq8obTyaADGQnAcnSiBvVEemTQm/IArhyjnhfsYtgIE+6TK0u/1XytP
	 21aaFm3cTOnofNHN4KA10L3LqAlZm0vim9L9gQHT7bt3KwsvBvQBSSbVAcMivd4D9L
	 tgYD2ZidNs6i9pKHyBs+SUDhWO/zImRnS2ygm+63m3l1rqw+7t+l2s0WieRMlnXTg6
	 9xahUOUnu4Qww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7102D380AA7D;
	Fri, 31 Jan 2025 23:48:51 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
X-PR-Tracked-Commit-Id: 101971298be2aa4706c8602bd81066a0f6f2ced5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b5f3c51fbb8042efb314484b47b2092cdd40bf6
Message-Id: <173836732990.1763875.667378817259432059.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 23:48:49 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jan 2025 12:08:40 -0800 (PST):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b5f3c51fbb8042efb314484b47b2092cdd40bf6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
