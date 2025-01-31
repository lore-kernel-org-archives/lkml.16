Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1921F428B
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 23:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367308; cv=none; b=PbeybvE3tqVxuVD5taNQYix6qMGTFHHIjwHqltIvlUQE/zVr5eVGF+RZXnUIqy7WbXgAY833EQ6trmdz+y33DSZGA+QXYU0tttRpbuNmlpuDDc8eux7rRFL9LPknnkGsxjG4zOvM4+Edp7LrjdKhF6FdtaXG9BeCKMxcRT51KOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367308; c=relaxed/simple;
	bh=u2OybdTrTFJJeATfmnGixfpzVqUWWqbAZg6yJAb9pA4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=r3lTbfcVZkrR/jb90bnWFGld6FRwTA3DEWFFxzNGeXISbW9nznpM/rVH6N2aMNy31lWYiQMY3p6AZmcXLTnrFaC31hOn0OtyMa5jBoLORtI0J3DtIYUr3qC5EBRgECWClj1MtjBsl6/FbyaHS/oYHQH1dJx29yvV62ITxgzozgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t69v8Ler; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t69v8Ler"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26CFC4CED1;
	Fri, 31 Jan 2025 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738367307;
	bh=u2OybdTrTFJJeATfmnGixfpzVqUWWqbAZg6yJAb9pA4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=t69v8LerCvvRW3DKUIWpnHmwzUICfU3h6rPU3zDPQyTNEIP/i7JnPnJSCkF0uAVGf
	 Au4dwBZk/p6TjXn/Y2IivdxH6suYmbVJUdRuBFnpzaeWB1Gd8z0X0PqKohbZ8jFRjC
	 0zdSWpaZxtFeUtv9yRJY0qbDlOoyS1RyyLpFzVfLPbP/oNterzcWLvXAp0iny59+lj
	 h2UCDBh9zOf1YwwrbWA5V76EQ0aLf7MHodbUHuI+0MWmn0F2hwAhwEnvzDHAOYBlRy
	 aHvXVQ4zstbWNZypZWJR80bpg8FUiAU1QYGSNPPVYYQqyuICZOcjUCsrPbCw44GgCJ
	 gaX9wr5w++T5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE46F380AA7D;
	Fri, 31 Jan 2025 23:48:55 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
References: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-02-01
X-PR-Tracked-Commit-Id: 8dcb26b493d3bab90851f93ae1c127af5cb2dbb5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 851faa888a523f74f9796c2c1cc7b3f7626f0e25
Message-Id: <173836733414.1763875.937968975075308162.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 23:48:54 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 1 Feb 2025 07:31:07 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-02-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/851faa888a523f74f9796c2c1cc7b3f7626f0e25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
