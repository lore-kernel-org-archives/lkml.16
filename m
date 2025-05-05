Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83717C98;
	Mon,  5 May 2025 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466309; cv=none; b=SUmL2XV5pkO0itDsQGRQXl4mrutLlDAtodWG69HX1G7Zd4cWV183Zy15SvaJxPbIxj/LKdIgbTkCq+2PGYGrElzb3Rn8HKmkniXACWbyijEwOw1ceo/793DGZ/jEKmczNbj8a+Xp+OngXUCWe51npospdJRn8KjfXoM0Qse+tVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466309; c=relaxed/simple;
	bh=37EBSYnJhSDNKR5eA/742Vcx7GlwTRaQ5a+NTfpjbbw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GTB0Dy7mVwlFOjN8wXyfsDXeBRKGxbdyoZu5ehTr7ycGeHRjPGsPet4z6sFjbXTsCWPUx/R1LdA1Qb6DPVlGY/e4Dx+gDGslwyXGJsCYZU6zJM1ct4nxmQg/k1ghMU9ffEFTORgFeHa87wQjSkSnejGDEjJp7yYSApa+t+JwG1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qu2rzynJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qu2rzynJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7CDC4CEE4;
	Mon,  5 May 2025 17:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746466309;
	bh=37EBSYnJhSDNKR5eA/742Vcx7GlwTRaQ5a+NTfpjbbw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qu2rzynJsq8EoygY2OMTrZIRkSMtIMrCHk2u8hghIwmWltlOSwny00YpotNWTMoUq
	 U1LvuMZEHL0j0vTFh6QUlba2pu4LC4tsY51GHZKFcXC9hvsDKIt8NY6u2dynvUzQwt
	 KCwvaVaWunYvkq/H/X5+2ee/yzwg80uv3r5mqOgLNys5ePI4zW0rmxSTyxRfLC1WID
	 058woiP8Ca7DkMz8YGDvcz7yOWWxhBjIM861Zdonnw/8Kaei03sNZ5kCAstamM5jl1
	 MBW5cMKLaDybT9NgpBQqgudzk2SsflX4noj+J29INzMQNuuHnxd+unNkk/h3VxyhMO
	 eUGvxeNBHKKQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0C139D60BC;
	Mon,  5 May 2025 17:32:29 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <a080c802-52fb-4601-8178-990494c87e5c@app.fastmail.com>
References: <a080c802-52fb-4601-8178-990494c87e5c@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <a080c802-52fb-4601-8178-990494c87e5c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15
X-PR-Tracked-Commit-Id: 2ef5c66cba6171feab05e62e1b22df970b238544
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b26feb436d2ef5db1e8ba82c7ecb4c1cc869502
Message-Id: <174646634824.836049.8124169295654735620.pr-tracker-bot@kernel.org>
Date: Mon, 05 May 2025 17:32:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 05 May 2025 10:03:30 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b26feb436d2ef5db1e8ba82c7ecb4c1cc869502

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
