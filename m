Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B585D223DC1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981358; cv=none; b=ZNdhlQrHzoInytR8EJ69cJbCcbhITQ6MFWIBn438XdWGlFlk4h7Vcl32L+pr5I9R/GF/eOe6BgMlRDpTPsjkHAb3XRX1FFukFrNVumLG6SexO4GanNu+Sii7C5e3J1BJfpGlBIk1LGl6rkLJAQJka8X7e82BH7u9mHgwvO64kjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981358; c=relaxed/simple;
	bh=0bxKRePaJ76DmCOlkBf5ASQOrVX65QAPINdXqvjGUNg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VNoWIniOLqkrfJ33EYKd5gYAzzwnZbuxgRywYh2apuS5zqSqvEfeAjAVLDqHCOjiktnbDMeMNIEn+e7ekCDlGadu7RWZlDLdoheGCFkh6+KK8TxBtyXOhsr5JhLe+ylv1+JclLqEzvg/fyJ50WmQ8m0A2eV777hlMwoSi3vfhXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjkrZb7b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjkrZb7b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB51C4CEEE;
	Tue,  3 Jun 2025 20:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748981358;
	bh=0bxKRePaJ76DmCOlkBf5ASQOrVX65QAPINdXqvjGUNg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hjkrZb7b95vdFvdcIYfEq3DtPDA8t7F/OpKO8SiX1ILur0dlAQffH2yF/98ic3U3g
	 ycnFrJJF8GAVpf5UMoALv4kxXj2cvwMyeB4zy0bQYtafL3BrS0rOw4RmwkCtHZQAbI
	 NReFpMSO4V4B3d/I0Ugwvt2BwMFZCE5j7Gw1jE3BHNzsyCUlzsm8V4snsxINZPApno
	 Q2GU/abUyUOIZ1GCSQvFr4Nx78ylRnEljOl0IwN8ReHh3UjWLggSv6WbI+0OvgT9+z
	 hThw0Uk/OXDQFj3cRe3GsRRyJuboCb4ys/i+xUNbGJLiiTpYjniGVQMi1g6ubmdJTA
	 mwGAdtETcaC2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A73380DBEC;
	Tue,  3 Jun 2025 20:09:52 +0000 (UTC)
Subject: Re: [GIT PULL] Backlight for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250603100234.GE7758@google.com>
References: <20250603100234.GE7758@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250603100234.GE7758@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git backlight-next-6.16
X-PR-Tracked-Commit-Id: e12d3e1624a02706cdd3628bbf5668827214fa33
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9dfb7db96f7bc1f30feae673aab7fdbfbc94e9c
Message-Id: <174898139082.1645326.15626767185611506216.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 20:09:50 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Thompson <danielt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 3 Jun 2025 11:02:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git backlight-next-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9dfb7db96f7bc1f30feae673aab7fdbfbc94e9c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
