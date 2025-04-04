Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BEF2135C9;
	Fri,  4 Apr 2025 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785998; cv=none; b=PV/ol/fLDpRS8ixBgIUaXpapNzo3GR3usIimvM2MUaKeNGNSQ2CpifKnPfDPHpRM3ZK3E6nA3nxg+7xfLs4uGMkAwyP8o+HyAKsyS1eNb8DhUnDa5OOEcY3zPF3GqZI/Umm9RLAMOntWghCMB7ZfqF9QWGtDytDNDQv5ND6fFAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785998; c=relaxed/simple;
	bh=dfIttBr1UBv1XFNCaNT+D9E45dvWVGkJ4fwbbwmxtlY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qfGWe99HddKXZYMQLguARYBA6G1dPqccppOilV2WJvHRqdU4cbOSA63WT5JrD+1U//DX53JgyCtM1XfmRV+CL976izW5snibTXqb/Dpa69Q/MiawhWfrDkN1zNsPglWUqstNSaR6OhlSMgVCFj7U5eqTSmMJ9eM5sjYnOAyVkLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WclBQcBD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WclBQcBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9410BC4CEE8;
	Fri,  4 Apr 2025 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743785997;
	bh=dfIttBr1UBv1XFNCaNT+D9E45dvWVGkJ4fwbbwmxtlY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WclBQcBDFqtTubjvXxw+Kpg3f2FSKObSD1fAOYFtOhuHU23c+BXV4Lnjuy4B9sXKA
	 W81nXUKhY+QpqRzf32hyd6mu0lpHND90EB3H2yA5iB3j0o/XocG5fbhJuyy575kdF5
	 WAbB4Mz0/bsd8BUMIYUakXbFgdq1KVD8KzIK31p9wGVVqNDNzrJgWmmoLaMtAxNbIz
	 5DJeMYBLLT7m7liuvmob4EKejx9JtBAMPJjN35rNo+kq6lNIWb7Vryy6js4XWGSK4N
	 Q8PNIVdikC+Rz1OtdvMy4pfgrlK4TWxP+7QhENIUgOlebLc8jrVWP2FzxSZ1rI5lUY
	 JA3EEsIAFwsiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4BD63822D28;
	Fri,  4 Apr 2025 17:00:35 +0000 (UTC)
Subject: Re: [GIT PULL] soc: drivers for 6.15, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
References: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-2
X-PR-Tracked-Commit-Id: af34290cdc60a289e43f38a87621a3e9dd63c67b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a05c6e6694c1601bdefd160332d3deba8393644f
Message-Id: <174378603455.3328120.9533370932633245120.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:00:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Apr 2025 17:09:35 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a05c6e6694c1601bdefd160332d3deba8393644f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
