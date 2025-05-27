Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEF4280A4B;
	Tue, 27 May 2025 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748370613; cv=none; b=HNdCnep8d2c05HHvmIvFk+w4IMk2QU/tC4oBP3hesL0d+bUbkHkJYYWGRwH5imG0FDh0jCPmKQECFoPTG9/q7Md2kS9eg+PO3+QhjPBc1g/737Ooh9lMafox8Lx9aFFLQmAfa9k+SYd2aiCQFfFTbcw7exhKi9cIIvWA6PKBlTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748370613; c=relaxed/simple;
	bh=OhscU/fptDKfO2e1S8VTUwu7IqLv5KwjMioi27XGDEQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=spvX28OS47jpxS2HlTL5fGR/3s4PIbfzuLKZh7xFM62av50n7S1TSHNbjmx9/LCMDk88abw1MDNdQJq3fJsju9v6GjficcszMs7Q0q5u3eWYryhItYJZTv0gFaHlCA6StpfnDPat4wKkmNnh6t89EiJghyqEaNnbC4tkYhIECJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rYPYSTT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rYPYSTT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3214C4CEEA;
	Tue, 27 May 2025 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748370613;
	bh=OhscU/fptDKfO2e1S8VTUwu7IqLv5KwjMioi27XGDEQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rYPYSTT+p4jfDvIT7p8pgNHBRIv9klbRBq4Vllfw0PszWWeoJimf0zog2KHZjarEN
	 BKaPTVd5/+iDYFq3tgSWqM24vvT98aQn0OjZfR7Vw7ExEwUUA6POMOkiagzYi0qqXU
	 G8q2aHWLFklbEOeajbFP25LFoZXArFfBt2z31qMEep/TqEtUY3Yd1phhPWdJo9rzXA
	 eBnTlGxeHdKFpBG3kSA9PTEx0crjwf2d9y0iIbPnJUwi/EbtF3TIQCWuMJYyrWRZXD
	 VH8fNk9tdCEG2aFEi5Zr8OVFfj4Cc0E910DfX47m8vF+HQGGPJk4U+QzKKzmufyn/N
	 XKfpBuf5eapLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EA8380AAE2;
	Tue, 27 May 2025 18:30:48 +0000 (UTC)
Subject: Re: [GIT PULL] Documentation for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bjrekpp6.fsf@trenco.lwn.net>
References: <87bjrekpp6.fsf@trenco.lwn.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87bjrekpp6.fsf@trenco.lwn.net>
X-PR-Tracked-Remote: git://git.lwn.net/linux.git tags/docs-6.16
X-PR-Tracked-Commit-Id: d6d886005d32e4380cee3d1095908875505ac2c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e443d167327b10966166c1953631936547b03d0
Message-Id: <174837064704.1737688.1908442337069181721.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 18:30:47 +0000
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 10:01:41 -0600:

> git://git.lwn.net/linux.git tags/docs-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e443d167327b10966166c1953631936547b03d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
