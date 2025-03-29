Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF361E1DE4
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743285117; cv=none; b=hlNc3uebdCU2qp20V0a+5Bv2AS2EzjYe9vV3fSWrnMywJFiqd5eO8V6pVw/C/AEPfhLVR1ESs6xTTcIdYAPNyVWb+CPklw0CJp4LsUnSftvYipTzZoAn7gRezaEUtDyfgqN0cOsvbO87U/iO1IzaCrZt2j4OPPXOQa9iJIaVacM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743285117; c=relaxed/simple;
	bh=p8QS6CoCoiJxGmc690a+yK/KAyQJ9cjs9+/fX1m1LiI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ls/GWNcrxVAklUncWE9J1n9mfohASG1yUXQqH3hbd3SuMvIAGUvUrEuxNJh+u3bPoYCK1B1ma3TnKOvGVxbtB0SK7AaCSye9pEUtFaKhYueqWYCE+9Eis87eiNlzVX+qAjSo+i0KAfWAYt9F2O7HB7lIkAGtOOAEnPVvzlqhiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jD8GVXhW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jD8GVXhW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0107C4CEE2;
	Sat, 29 Mar 2025 21:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743285116;
	bh=p8QS6CoCoiJxGmc690a+yK/KAyQJ9cjs9+/fX1m1LiI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jD8GVXhW2BsqT/h6xLKM1ng7yXuya8HYmw5jklSbRaNmkZ6ynMLcZk/trS1dBXaXN
	 RI6DYZhn8G0lY1QMqlQD2sqBIXemb0LidnWtqQUvOYBd4tudNs0Z7TQI63mU/bvsbr
	 xIF0togHwSyDo0djAwecpmKCTFW4uABihGzYgoe5YydTUGwRG6yH+SeP50LaJwfGTI
	 sgrld3UlwMbLTeVpcww8YotNQpIjs3g5DyG5x1q+ri3JtKjnZ5LONATV/u6xVU49C3
	 quDlAfmcCnepRe5Cl3Ou09kR7kOZVNCe7XwytHLuhZTrrJPH/C5xP7F9usmm1Ia7Y/
	 9ov83lK4ZAwRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE8C380AAFA;
	Sat, 29 Mar 2025 21:52:34 +0000 (UTC)
Subject: Re: [GIT PULL] Backlight for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328141215.GC7190@google.com>
References: <20250328141215.GC7190@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328141215.GC7190@google.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/backlight-next-6.15
X-PR-Tracked-Commit-Id: dfc034a0494b8fb8ea881aeb41a0c4e2619ff1e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 93d52288679e29aaa44a6f12d5a02e8a90e742c5
Message-Id: <174328515341.3286170.5550884548225729416.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 21:52:33 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Thompson <danielt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 14:12:15 +0000:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/backlight-next-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/93d52288679e29aaa44a6f12d5a02e8a90e742c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
