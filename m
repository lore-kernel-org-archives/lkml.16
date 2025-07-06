Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB81C5F14
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751828595; cv=none; b=BabOFEtx8fddgY2lGRZGmVNC/pMWy1gBBkXEj8klj0GFC1MqZc3WKtku0XEVnxSTmSrsCdbjIzpGPoUeLWNK9mLJfi2sRessLNb0UVs7C5e8sHNeC6i4jU5VGWFC3K7MMDaKkf9pFRcbkz9jSGq7npFYJLDcygsUKCw1Fv+F/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751828595; c=relaxed/simple;
	bh=jQJ7i3cpBYMT+BMQpCzcEGt4mb26jYk0/gU03DwAMYM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RkjziwFE3CLi0e3lItufkTrMyv8fSjIRqdw7907ArStfdnj1FZoK1UWsFGMswUXOGrp7JDWKAekh1Gq2z1nUS8ogm4ISAk4hU44FM2G2y70dGL4tIlBTELoBK5PfeguuqU1CAV2MB39+e/jrfRosBRCE0B1YmQ5LgseP3wv2ZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9pp2/AR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9pp2/AR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3112C4CEF4;
	Sun,  6 Jul 2025 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751828594;
	bh=jQJ7i3cpBYMT+BMQpCzcEGt4mb26jYk0/gU03DwAMYM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D9pp2/AR2qwCaNohrFUxneJdNHacYkTaXCOMcsRjHmKEzfsCMs5NDoW5QWgy7yom/
	 5ziQErye1A7sxC/E7yi7h/NNyzOr6iINzxbA2q/sK+1rG37rdFRQdGmlrhbgGIuyDB
	 e9G4ZYyQhV8aEX0Lm1kxdvGNzkAKm3HBpMEb1Na6OULIajSBnrOZzcCYTN3xJj7vrw
	 3ukXr5MUott3zkFFoHPqgcg9wFh1C156ptmw6jcmJq2vXH71Du5QFAkxzT/Dfpb5Qj
	 KKnn3G0Ou4n0eEiYH3EppJRrGJoJhR+qUqykM1HaO7y4sCWEzEk3pmC58p1WwRu7fE
	 O37tXsh6T1hXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C1B38111DD;
	Sun,  6 Jul 2025 19:03:39 +0000 (UTC)
Subject: Re: [GIT PULL] locking/urgent for v6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250706081812.GAaGoxRMTfEshzatY7@fat_crate.local>
References: <20250706081812.GAaGoxRMTfEshzatY7@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250706081812.GAaGoxRMTfEshzatY7@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc5
X-PR-Tracked-Commit-Id: 46b0a67e8f22d2dbc679b37b26c5ff0f50424847
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 463b1b2af83866e6369e7764fb65f1d57449fb5b
Message-Id: <175182861787.2712443.14689003161043192655.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jul 2025 19:03:37 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Jul 2025 10:18:12 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/locking_urgent_for_v6.16_rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/463b1b2af83866e6369e7764fb65f1d57449fb5b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
