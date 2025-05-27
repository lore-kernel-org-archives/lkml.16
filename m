Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C13127B4F1
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359948; cv=none; b=cvO5D59aFaKBGR0CdRmJvM/MQj+Qht9HKCuyWWylSA7GunGlIllsDY+ZpvYS294nbuAtg+GIankq94m2BKROIRi02IIdCqp0VSDfIMLpZQ0mojklSEZVoOhB7l6Yr4kUtUa5xy/INZFu/RDS7KRyb2L0RjijUUw1C3fqWhz9IoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359948; c=relaxed/simple;
	bh=8QNCyYM+c+LS9g67dnHpq/tTOVoxHJmi8oLQKj6Oxno=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=F7MYt0lEmF2BZVtjH67k2V8RkXx/vDRhLiOLYc56zJ+wLZvC2tDU1TCV4bSt0wy/+8DhRLNA7JLua84YZeQ/vQ+J2lnjMvY1y2ybghrETTRFBlIC5famCWl8DsUTpXO4+ilHVSbK+sYBPqJ11inyOVuvZ1pXfHLQbXED2By5fsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWPDlv2v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWPDlv2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5BFC4CEEB;
	Tue, 27 May 2025 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748359948;
	bh=8QNCyYM+c+LS9g67dnHpq/tTOVoxHJmi8oLQKj6Oxno=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JWPDlv2vdCM25DueLbswTDgzeM25QqEWg/ogWm+P7sSW7GsX5fdRkqtRDGgJ2wlL3
	 sPzEVpkm/zrF97kwOFspzrbclqmIX7icAL57Wsop6t41ecggXAhG0FjwECsIOYsviw
	 Qphxv6oDL95Fta8ZJ8zeH6MGEYPuqxwaRUek/qw/x2fWeEk9YDdkJvtbloRwunoWIk
	 7VaRQ2N5LtO1+KGX4Z81H97pIzhGuWCaehzObvEzTUKGskkHnnbOsuNCjgu04KGKcP
	 r40gXFD7JlypnF7xg/CaEIzjHWYjsBR9LAOaKqeRwfiG6HdBRqDL5VVcIxDWZCpKUv
	 4kXtRO+2kM41w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE22C380AAE2;
	Tue, 27 May 2025 15:33:03 +0000 (UTC)
Subject: Re: [GIT pull] irq/drivers for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174820637812.238682.1039624619620049695.tglx@xen13>
References: <174820637262.238682.1985899398053030312.tglx@xen13> <174820637812.238682.1039624619620049695.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174820637812.238682.1039624619620049695.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-drivers-2025-05-25
X-PR-Tracked-Commit-Id: 3e402acd5c4f9d447849b9bfb5a5c61f10668b7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c0f182c979cfead8fff08108a11fbd2fe885dd33
Message-Id: <174835998223.1680652.14862899614733624355.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 15:33:02 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 22:53:42 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-drivers-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c0f182c979cfead8fff08108a11fbd2fe885dd33

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
