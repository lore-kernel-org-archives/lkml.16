Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58934C7C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055015; cv=none; b=SBKYnjBED6i9TqCtx0ZrAZ6c5FJ8FKPQikxkEhTjcW9+qkBoNQF7L4n0W0mWo8eKsMETSH6sEV7ap0EUAJNR88/O0r2UHRM5lwBaQWg+H1LJaWRBAxYbGKAYz7OdzeZLz3e0/rGLHhMNoe8lf4gw3JlLlyVkkMjJnkFIRCvares=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055015; c=relaxed/simple;
	bh=8FvrIvwVR8DvP3z82rscLc7TuW8jO6+WpmOxo+bXGFc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aIYnN30a+rTEcmE90TLBKp0vTdFtdemGRD7rwoxkiSjtlzhFeqqyDC2trhtEORO9rn8cSF5QJSw7j+vaPoxAx+b2m8oWV8LvdBCDwyeASR3fjdeRKR0XAILpCY0+UtY4ZB6OYgNbaAlQzO7s2upmt5jKpgYTFfWfTQ2z7bSld7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgKo04ol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgKo04ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C11C4CEE4;
	Wed,  4 Jun 2025 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749055015;
	bh=8FvrIvwVR8DvP3z82rscLc7TuW8jO6+WpmOxo+bXGFc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DgKo04ol7E7ixevKUuklIgw5Xv5VgoGDYgzdmClvG55DtY9M18CWv+vjS/tRSVKlE
	 9kGCBvejxRIkPLHtKjBUlSRF9rwjzIuBxYkroR/sEAvjFL46BAgg0kROBXmm4o7qCI
	 DEYoqhcaTwjHWAq18s/7Bjr34FOdJ4L2rQjV4cJqmvp/8gKIB7lg71vDPeDEZ6P/SZ
	 AArDn47vaavwrhCLrdpdPDMzvfS01bK55WSVXZyPEfYns7yB4CbNRvDs5CTXvW+pLN
	 leRpsmpHMFgqRI6i/qjir+BGvBvBtgvvPOYiGKu5lOBqcbmKbbH/OWsDfT+xvzymtw
	 MVlzVVRVX6T0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB13238111E5;
	Wed,  4 Jun 2025 16:37:28 +0000 (UTC)
Subject: Re: [GIT PULL] slab updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <7f9a7fe2-da23-422f-a5f1-14fa99eb38d9@suse.cz>
References: <7f9a7fe2-da23-422f-a5f1-14fa99eb38d9@suse.cz>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <7f9a7fe2-da23-422f-a5f1-14fa99eb38d9@suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.16
X-PR-Tracked-Commit-Id: 354ad60e123dad8e231e7443735020806f3c57d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1af80d00e1e026c317c6ec19b1072f81ba7af64c
Message-Id: <174905504751.2350857.15253248105981984997.pr-tracker-bot@kernel.org>
Date: Wed, 04 Jun 2025 16:37:27 +0000
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 4 Jun 2025 11:02:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1af80d00e1e026c317c6ec19b1072f81ba7af64c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
