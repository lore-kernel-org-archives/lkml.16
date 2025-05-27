Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBD81E2847
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322181; cv=none; b=sFYVQvOD/JdPohxQkMmdr9KniwVrRDiAkgNLlA2Zmcmkvvwf/9LDAbyOk7rOCfewXZAt9UVZncNXyVEGKZTH7iRFfZU6SkSaIIZQvFAA2kwwVaeyS8iHKYONHHmUf+qxddDlafn/PjvEn/MRCeBDiaBop4t3A3UBef3vLJ250lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322181; c=relaxed/simple;
	bh=VZlAPTs3ewPeH204QEVZ/E+D9qS4fAz5V5V6Kgn84aI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=is+BZp2KlxmYpl2W4F6uG0tAa/c7WKnGOX0idpSsiDua/SIT5mRXcLtkZIknq03sm74MkmV50TxBpRFDiXBYlu8ZLdk0S2AXBakREWFPnhNTjydY3W3fIa4cO2pWA+6tYrnvkXJGIMUHwyGlCkmLh/U104aAPplZWqVHi1UmlYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFrnHOwi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFrnHOwi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68883C4CEEA;
	Tue, 27 May 2025 05:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748322180;
	bh=VZlAPTs3ewPeH204QEVZ/E+D9qS4fAz5V5V6Kgn84aI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lFrnHOwito4ZFzi2ulKyrujIQgcJHf0VjJk+JNiuaaIH0qRYqrM88rT0JpXPOXYES
	 BwnO4uxOG1wiudxN/j/rmVtBxNxnLYXNHKd+HB1SsvzuL2ENTnuM37vq4Nl4vHjLi0
	 Wo4z8oOhceLLE4V9jcYi26VI1W+u1XF77oeBIBzjfRkQQBT5gHFoyi3nNaYED4vUSm
	 ufQxheZ8tbEt1DNSSBfACBs0HRaCTwPS9cbQE//elViK6ENOOUbUobvdRTKzTtP5v/
	 rEZEb0+bCI1NilNc4tDEuu9BhFAzuCVkQ94aDFQo3QEPaJen1m70RwM7IImsBGHCqO
	 aiJM/vMfG7oVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB364380AAE2;
	Tue, 27 May 2025 05:03:35 +0000 (UTC)
Subject: Re: [GIT PULL] x86/entry changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDL567pdokwxyYlm@gmail.com>
References: <aDL567pdokwxyYlm@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDL567pdokwxyYlm@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-entry-2025-05-25
X-PR-Tracked-Commit-Id: bdb30d565f4b53e91abaccf83ecd718e5ba0f7c1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 24244df067c5514ad72b8ad371208b1139dfd0f0
Message-Id: <174832221447.1158362.9461046228143799544.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 05:03:34 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 13:07:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-entry-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/24244df067c5514ad72b8ad371208b1139dfd0f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
