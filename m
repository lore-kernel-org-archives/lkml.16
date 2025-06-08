Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ECA1EBA09
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408788; cv=none; b=HJQBAdkkft7HRWNwj9M0Rat9E+PrKYUjbndPvIpaXUqK1Lf9SBvWvUG2DMmMvjDl4fmCDtb9ULkL4PVohgLaESHZh2t0VeYTt0jyK1jTuU7ppz4dm1NLS8+S3AIxsg3LrHb5LF1pLh6mS6fxqKOivF8TSDQEla8foYbvtqSgPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408788; c=relaxed/simple;
	bh=jCJZ3R0t0NIRE6MM0sl4WBBwXdsSDvawjeKjZQL10Gw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VGX9likCe7thpTXTvZ2TbVd3Jw5ZM/E9AbO7HbKpzp9BC8/wM2+VJd/guNyc7ntJ/Ohtb98hHirhFZ07pggGveFnSgVdoktG+5hIlwwU2mw8WrUbFyi6FywXIIbyfeA447gFl9R5OuK+bD8OjAcjx3wg7UDhRqEgPJuaSe/bjy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyWlABsc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyWlABsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E97C4CEEE;
	Sun,  8 Jun 2025 18:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749408787;
	bh=jCJZ3R0t0NIRE6MM0sl4WBBwXdsSDvawjeKjZQL10Gw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KyWlABscwyaLzC1mWSuNp4WhmMuKgy+GjUgPW6jTlDW6gvNSbbPmumUIa8gWy5Uiz
	 DhktUo3wimfScGlsqGX1A3KTrwuSX39cCozMmFwx7yYVowgH3xRyvjojFMeJfS0YHi
	 t3Bor8Gkzy+Jqj2Hj5cpNbpCZmMqF75lilTe0WtCj+tFln27QBpHhGnKeayXTp5xOd
	 EAObzSns+nTt7aPwCEd4AqTf4jqtaARz5X4lsHkl5ir3/AtQ2p+P1HK5j09rBmRyda
	 WlW3+Hn9RSpMbJVyRmZJ87qWWFQf7Y/S0KQK/yZ4NKFe91HQfAQAqglDCGN4gvuoni
	 2rkXnSpFD1grw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC66380AAE2;
	Sun,  8 Jun 2025 18:53:39 +0000 (UTC)
Subject: Re: [GIT pull] x86/urgent for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174936765455.749406.13707130091819875670.tglx@xen13>
References: <174936764731.749406.17114868218275391074.tglx@xen13> <174936765455.749406.13707130091819875670.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174936765455.749406.13707130091819875670.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-06-08
X-PR-Tracked-Commit-Id: dd2922dcfaa3296846265e113309e5f7f138839f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0529ef8c36d74a05e929ea4adbdecd2c3393b0bb
Message-Id: <174940881854.385950.4943306528641569093.pr-tracker-bot@kernel.org>
Date: Sun, 08 Jun 2025 18:53:38 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  8 Jun 2025 09:28:16 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-06-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0529ef8c36d74a05e929ea4adbdecd2c3393b0bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
