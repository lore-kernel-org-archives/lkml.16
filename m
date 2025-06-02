Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965363CF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748891835; cv=none; b=HJmjNCjyicRuASoPcBCNfSktqYah8c3Ge57Ufo6Kaw9dIEGPCNq3qZrmuCGJRjNtDwroerCFszx6ZC3xmK+iQCsDO8wvcHAeSUlXnZ6UjkvznkWGv1C64geTyKBtW+9X11xzqBTNY/dVVOif8HNlo68PzmlcDtdyBzrbeQvrXLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748891835; c=relaxed/simple;
	bh=prQElXY00R5kGao9KP7Dlye0Bfm3lAWat0EFphPfEMk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=g3HqMZOsXV0pXUPyEFa3j1wOyVI9ZQGKdOi4euWL94ZxiL0u2TUSyNJYIYzSAqKVZGvGjO+dZUSEOKd+Kw7J/MCrrNaXLsV7vSFv1LMeuGwaeL67Xf44IKod0uhXzBu056cVJ7hyMkygstRn18CGZamx65eNq1Rh2fdca2tv1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRj4hwPU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRj4hwPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543F1C4CEEB;
	Mon,  2 Jun 2025 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748891835;
	bh=prQElXY00R5kGao9KP7Dlye0Bfm3lAWat0EFphPfEMk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YRj4hwPU8MVr4zswbZY76qwB1WY9b4rfEfnwUAJaNHo7z43vPnpbGHs5xSsyW5AiX
	 iMeurL9MWlOUEnpHj8K4Teeprmn7tnRk9RLCsi2G3GBqBctP867KrZptvaNPDrgOEi
	 c6RTBa/fxYD1CrEhCFbqJvZToVMk0mQG8/cijqdRTMddZThuPiCMDCVa2N8LXIMyRj
	 8iGMTI75AzMU0OLCezT+2i/a7l+vZgxveCkJX8VMCimL5Kx3iQrq+6Ugv6XxRcpr/y
	 b9V8K4Uq4Xy/c5rXFvkQgAi8jB0FQNIwkdllHXD9Xpio1tsxD9GZ0Hd1JcXuAnJpRf
	 QhRZpBl8CFTGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34065380AAD0;
	Mon,  2 Jun 2025 19:17:49 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
References: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.16
X-PR-Tracked-Commit-Id: d0b497df02e9b2ebcb5771c7b16e424c0614a366
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a06079511167984f7d25ff09fdfeb2f1582c85dd
Message-Id: <174889186788.877155.2445061992752318425.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 19:17:47 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Jun 2025 17:25:07 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a06079511167984f7d25ff09fdfeb2f1582c85dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
