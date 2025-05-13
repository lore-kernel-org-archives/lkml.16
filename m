Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF58D529;
	Tue, 13 May 2025 03:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747107175; cv=none; b=WLWhiOs/EaOm5ZZdFe24AB2JWZH9cLm1apBAD/S4AIKcroKyqBx09ZpZTMb2x1hKVBUCaJ7yK/2WykeOk80rg9f6VwqB4ZZP+njh+5nEW8nWluyGnldCjVvBVdSBEKqo/js/j3yjgep2LrfxR7QeDTruLEtobUjRoK8cmrSLv68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747107175; c=relaxed/simple;
	bh=qxFEx8YSHSmwhYRKJUlz0KYTm6gvCnjZ8IEyvKYPhAU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hZ3jl717+jVY6/QmA22GwTvOfvSSYzMfRdG9Yly5Q14T0BObvjd1fKdXg03WScxRN0uNj1jQg2XwRFTFgZ0vp69Ev8MJVtoowbbTlosx9fikxWU31tq6H/+HUTKKrLyq7GN8q5dIojzRD7Tu+nq9epc4TE2fONQ8kRkK3r+H21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPKAWVtG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPKAWVtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509A5C4CEE7;
	Tue, 13 May 2025 03:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747107175;
	bh=qxFEx8YSHSmwhYRKJUlz0KYTm6gvCnjZ8IEyvKYPhAU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PPKAWVtGg/xsaKQdBGEEk/21XlxRs3FiHsF9BrAbsbq3jhdpSNZ3a57zeMrf5tgKQ
	 KlsptYP1nxOrXJXQ/S898Q/xdi66UsLjoXaraTzIzQVEkbazZTRu9CbDFnVHuikDJS
	 CkOrmYzZ6EyV5BKm1ca7bHLu5L5t+CwkrOEjyzvq4wiFY0XWgDRZNLknCewubh6t4g
	 0KEBdSmUD4dPeI/1+gwHpzn+2MLkcS++M+gN1rf4eizgeaBHdpTniu7G1jEz9vZCNX
	 1P4/nrSLZISrwDnwA5H/a+e9b1lkjyAvVdquug+5w0xN+AUMXyKmIp6VwDtFARXSl5
	 WlTuNyKMBGSPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B0939D6541;
	Tue, 13 May 2025 03:33:34 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.15-5
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250512141246-1833516743@linux.intel.com>
References: <pdx86-pr-20250512141246-1833516743@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250512141246-1833516743@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-5
X-PR-Tracked-Commit-Id: bfcfe6d335a967f8ea0c1980960e6f0205b5de6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a8bdc7fe0a7a6011de68c5ea483de7ecfb2d833
Message-Id: <174710721263.1163096.4321814483120947740.pr-tracker-bot@kernel.org>
Date: Tue, 13 May 2025 03:33:32 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 12 May 2025 14:12:46 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a8bdc7fe0a7a6011de68c5ea483de7ecfb2d833

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
