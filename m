Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4E227C17E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359950; cv=none; b=Xw+ua+Jxl5IQklfnADXpQepRxKSTmhIBSI5F2gzUCgE7UBd4WsVK2zCfrawDRjxi0yVwHX2Z+LnB+5RPSZyrAoNa3R51jNH93gHj8847ADwues/nJvhqshLVj6cxAM5Ovsq5rglY+h2we7S1JD+2cWIJHZeCSuBOhGLmWcUDHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359950; c=relaxed/simple;
	bh=Fr1AGw4QLG4T9tsVUVSMFltWJQZtG68D4tCGGHwZsWo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dO40oJhf+8qECTpk6aCDTMfBGTCJLRMwDolulXFGhGmRHpwO1W1jDpSrFyWCWq+zw5IqRafNjrVfvwtNs9zsWCwZSNHu1b7jIDpQu7tGUe6QEaTNZI6Okvixd+hZAMoj16BUIxtkSUsuHJYKy35g3Sn0FKbj+Udie5OnMZ3kIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fM4yL8hf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fM4yL8hf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3129C4CEE9;
	Tue, 27 May 2025 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748359950;
	bh=Fr1AGw4QLG4T9tsVUVSMFltWJQZtG68D4tCGGHwZsWo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fM4yL8hfv2GYYAtnU13t6Gg3UFs/xjHjcdIE4ijJu1OikVGsMMMFpmLMntHPdDtlI
	 ZOIT1szRaBOkA2OkEz/e1KvROSX8Wj1gN7G916iYUWMbKaUzD2dANyTHOsYgHfhx8Z
	 g8Z0FWpQs2AVt8lOOwlUooKc7htkWZa1kqmgyAM4vna/zC36uN3ntPW2RvNpvMvlNL
	 BkzMXlxvHVtF3ZEUk9Q7FeNEGfEOdLSh07+CNb3YN/SoMKImFNmCr7nSe6vCwgc60/
	 pF38Kec8O7SlvXUdwBS/rwh80xJqOiOo/Jbzi668j5tTZAAkZ2YXbyw+orFaGSq2iw
	 6gsHjNi4kIvZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C7E380AAE2;
	Tue, 27 May 2025 15:33:05 +0000 (UTC)
Subject: Re: [GIT pull] irq/msi for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820637979.238682.4349646136552270664.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820637979.238682.4349646136552270664.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820637979.238682.4349646136552270664.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-msi-2025-05-25
X-PR-Tracked-Commit-Id: 4e7bca76e3fed58437dcd7f747d1c8d98507379e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44ed0f35df343d00b8d38006854f96e333104a66
Message-Id: <174835998400.1680652.2182898578544722294.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 15:33:04 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:43 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-msi-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44ed0f35df343d00b8d38006854f96e333104a66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
