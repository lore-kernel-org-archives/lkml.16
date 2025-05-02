Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497125FA2B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204038; cv=none; b=W4j9X028VOksqFX8RNBv1IMyN4Fiv/2750VaMNgCOMsI4jrv9jwJGYorVOCk6qQ/bDVk3L6ztgR8svVBlM/JGudRHtXzrqwr7omshchLraFfd0ZrHB56uNeasK4bUgwvcMdxp77+iWLLw7ggl80Enl6J/uVG0HvHyzc/1tM6UnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204038; c=relaxed/simple;
	bh=E9VSpFVYuF64GBmBG6WKfjAwa3KFWb4ra0Z8fGUkrbE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Qz+60YNGy5U25IFcmbvwqqHANJHzL5wUMihQiuV9nJB4vVbfHLJAY+NLwhcOpVAjC/LZ7zTa+2FrXo3L5YJbtXMP4cglB8W3jHsiq1zKm1ZvJCPFt0pT/xPWZt5Zt+oS0g+uiEBk774rorSH3il8UQ72NKJnlYRmaZCiO0Xbalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFIjDyQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFIjDyQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F100C4CEE4;
	Fri,  2 May 2025 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746204038;
	bh=E9VSpFVYuF64GBmBG6WKfjAwa3KFWb4ra0Z8fGUkrbE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BFIjDyQ966uKE6sgy+xZGcu95cafVRWFjV3fM7uyMQXfGJABDpz+Op+OKowHnkcVi
	 9DyHx8OkIE9viI7n1cb3Lpt7AXfLiKT1Kzn+zRoFckiJKYTdopIw78+NhbAOxpPlXm
	 wwWeoV4zHc8qCUBeCFeoNLSTmNkxQHY7BvaQ9uzkemSrm9cgJY/E1z8kMdhez3zsR0
	 btCwve1BNt1szdJtbcZb1Zx2jlIb5EKoI3y7r9cIMPridGHxOtWTvy/oVSqyyN8nHb
	 sE44X7V6oxsQOXyeEmqRTWfuq8UUSrdVNL9XXuBjv0fH3Lsmw1Dn/zGz4Y9pGWN4MN
	 6Q3tknr24Rk0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C96380DBE9;
	Fri,  2 May 2025 16:41:18 +0000 (UTC)
Subject: Re: [GIT PULL] slab fix for 6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <7201bb21-3eba-40ba-b71b-6cd89ed0d76c@suse.cz>
References: <7201bb21-3eba-40ba-b71b-6cd89ed0d76c@suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7201bb21-3eba-40ba-b71b-6cd89ed0d76c@suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.15-rc5
X-PR-Tracked-Commit-Id: be8250786ca94952a19ce87f98ad9906448bc9ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9910affec3337668f354c5513462b6c356414681
Message-Id: <174620407704.3671706.17277511047720647451.pr-tracker-bot@kernel.org>
Date: Fri, 02 May 2025 16:41:17 +0000
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 2 May 2025 09:05:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git tags/slab-for-6.15-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9910affec3337668f354c5513462b6c356414681

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
