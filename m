Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552D62D836D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650583; cv=none; b=Q4R3I1hR/Fn2uMEq7NHOV7MzVmKcSpCQTUZdwKs5x65oBx+eM6bw+Y+GJpeJo2uGqWt5APRi0TvwtvRkxV8CtpPS1+10Jgc0tZnt149mcxiFq+zg6MrL9LnxrIm8biwwM1PCzsEhM9wgA/Xwh6goDqoMXemOKPEjWGYVLl+wXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650583; c=relaxed/simple;
	bh=4Upodeo892knj0wsT4qrNlw0BNsDNLSkBc/DmE8Kg9Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WNP9hrX6SFHIrbBgqsyS3ooUxKEYdB2u+72uj/QMMRGjcbM29QqkEhP/HWaKQoc1AXVHO+JCLSjZu0LUb2BPnzLWxRZrZN2wbbDMW9uDysdF5OouCd+WkESvOxpawABX/AecHmkuQb31m4Gr2F6bk4V0XVXiolrNN/B95wsT5CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDarDRJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDarDRJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E67C4CEEE;
	Fri,  4 Jul 2025 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650583;
	bh=4Upodeo892knj0wsT4qrNlw0BNsDNLSkBc/DmE8Kg9Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CDarDRJnl7a85Uv+LYz1MjBLjBVkzNaxGSc6bk7HTZ9Enb+219Rrxuvkm29Hd0dKL
	 2PrtsJUwJdLhWlxzTN2q3edVRYTbheywa9lK9HxQAEp6vWwbuFQVHeutHfCQECFOWZ
	 3UE1cbKhlh/KjevMXfzm5w/ay5lJV3S4yhZ3oBTBziuc0mj+m+ZJv5sQ9BpdMN1bFc
	 bMfIGyVT3DOewyfAkok0tcP0QEEvB+icxNaoGAE1HM2lIKVKdrDJ7nG7sPvIYvzfk2
	 JD8IYIJ+KfvWITPmGzlTRv+vF2YL5NEp1z+Z5zqDni8Fdu7plJhN4+rW2FYPOj7k7c
	 rbPK/KDlgz/Pg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C04383BA01;
	Fri,  4 Jul 2025 17:36:48 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <29572e6de29cb03ebdf8b553a11a800e.broonie@kernel.org>
References: <29572e6de29cb03ebdf8b553a11a800e.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <29572e6de29cb03ebdf8b553a11a800e.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc4
X-PR-Tracked-Commit-Id: c9764fd88bc744592b0604ccb6b6fc1a5f76b4e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b02ed4ab721f559e843251564a3ea6ae1769a83
Message-Id: <175165060713.2287194.14292846623908909725.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:47 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Jul 2025 16:06:59 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b02ed4ab721f559e843251564a3ea6ae1769a83

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
