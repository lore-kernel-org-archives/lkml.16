Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A1239E7A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837869; cv=none; b=h5aDlyOjrxMZA2w/JqcHSTPbrTn5GZ8wPSWj1Y0EOLC2Zqdv+8h9gTdA1ZKL0yOqNgGBRmnJJUrjvMOKxOqiouh9DG29u5izQ7zkR+Zwn7VHhbgYFOGmWsxZnUecc95ySpHajx+xd+hAYsRDxnBaCIniyo/pVXACWmrYD/HGpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837869; c=relaxed/simple;
	bh=Qy48y7H2DCevEKDju+D8MuUeOu4fA1AhCpAKqyQTbyQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YSiXyIjAc1Jhjem5XV4ea6w1QVzJjCQlDUPd5Ap3AabQyzsZ31qElqOCllTD7vUyV0aIItlIr8KG8rYZ0F3PWdKu/h8tqmnKqmiB8l3tCH4Hi+KC2HCFTQZZhCsxUIkmhLeUkhmZS6CfwpR6GY4E8CTrnrveAARcOgnJ+A7OBk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rI/xLP8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rI/xLP8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D139CC4CEEB;
	Fri, 13 Jun 2025 18:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749837868;
	bh=Qy48y7H2DCevEKDju+D8MuUeOu4fA1AhCpAKqyQTbyQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rI/xLP8t0XPV/d8vxP9+6o6PQpEgs9QKAk+34T6N17k6RO7sHMr9+ktkn28FQq90O
	 mxN1ua4rg9foUNs3K+Vo/DhPZHLQHQYMSRgycKdTLKRiDRtsA28yTJWMwZ2gEnGsNN
	 0C+GxGKErglKKgT9LvKTa93EsBUJ5xI4Awkki7OhJ3ltY3KGwrug/dUeB2yzE0SaiY
	 htN7reHsE0h1EQiRcKru7/sqnJoOhyM5gtrJBDK6cyHFwRO6j1cr135HgSg0ibsvva
	 hHC2A2+e+h0volSS5jxzJY3oNni0dppBCjqdlshOq8dF4mC0FQ96M6hFYv4c8AKc/j
	 Wv98jOTH/gQiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC89380AAD0;
	Fri, 13 Jun 2025 18:04:59 +0000 (UTC)
Subject: Re: [GIT PULL] regulator fixes for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ef1d8afdc37fb1279dfe0d367ffafb56.broonie@kernel.org>
References: <ef1d8afdc37fb1279dfe0d367ffafb56.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ef1d8afdc37fb1279dfe0d367ffafb56.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc1
X-PR-Tracked-Commit-Id: 06118ae36855b7d3d22688298e74a766ccf0cb7a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 601dddb6c5d6bf63c63b2efba98231db5f861696
Message-Id: <174983789828.834702.14788356232417026752.pr-tracker-bot@kernel.org>
Date: Fri, 13 Jun 2025 18:04:58 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 13 Jun 2025 18:23:40 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/601dddb6c5d6bf63c63b2efba98231db5f861696

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
