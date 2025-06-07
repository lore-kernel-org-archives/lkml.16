Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AC7213E61;
	Sat,  7 Jun 2025 19:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749323206; cv=none; b=P9WXn6rshncGqnGfv2v0i33WbIXpR36wxq3zYOhkT5LM0m7I1qbmbf8hJfevB2Jo7WXQsoOGNTsE5u7HwOjz4UV093i1WenlGhCHqVhyx4t36RXeitw15D//tUylmKHoSxEaEzDNlCnrXIqGBgQzJJe9JnK8xk3GUUqHUEmGU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749323206; c=relaxed/simple;
	bh=8t+lcB1KYzlmCQEeH2dqILvshtis6ZBhuqQEnBWttnw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AdYgULzfZ4rGRNzgkKyFBh6o6LVgwzJGLY/DSmlMeeBhJu7Ag9wm3+JJAXW/ir7PjpoqGBJ6EMbkFIWrUi6PQsMaA998ll7mmPqvS6QcGb4AM+48hosFzY3bC8YRsQjZKQrtQnl8L9YGcND9rAFu4Bb3/2EX+FC0CgP9LEEPSOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzxe+k2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzxe+k2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D2CC4CEF1;
	Sat,  7 Jun 2025 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749323206;
	bh=8t+lcB1KYzlmCQEeH2dqILvshtis6ZBhuqQEnBWttnw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wzxe+k2dhbNTyHJIM05EfRnEaI+b/fRFeP+XTqbTvtra72Fp2jzv8yQONKQFnrFQ5
	 XvnKPKxH/H0fkgUgdqQU/Z6y2ZM2Pc4toh2i0Du9NEKoq8UVvzdtQnDNwWBjos+6Mm
	 KrYvgIL9p8ZymRdfxTo0UtNeICHbZqNWX1OwEfI6DCLiHqLxCrnt0JvK9b8tJS2e2n
	 2GeivaJ8msIsnWDuZww5gYb3KyAuN2A3WcoSzrVCKuMaRvz7SR4e/VjSNZt1JD0yd0
	 G13VDSIuemuXCS0xpa+kMgn5vCILZ4MZoFRDIAa+fxFcdbKhyqKnnTnQE0ObIdjp5h
	 nKlrkY3vZwmuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACEA3806649;
	Sat,  7 Jun 2025 19:07:18 +0000 (UTC)
Subject: Re: [GIT PULL] sound fixes for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y0u4hsp9.wl-tiwai@suse.de>
References: <87y0u4hsp9.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-sound.vger.kernel.org>
X-PR-Tracked-Message-Id: <87y0u4hsp9.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.16-rc1
X-PR-Tracked-Commit-Id: 10db95285240743e7b288272ede140aabce5e631
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af477f4d5a6c183e2dd44f49dd9a7950bfa7bd50
Message-Id: <174932323750.115837.4243001094875396382.pr-tracker-bot@kernel.org>
Date: Sat, 07 Jun 2025 19:07:17 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 07 Jun 2025 10:16:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af477f4d5a6c183e2dd44f49dd9a7950bfa7bd50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
