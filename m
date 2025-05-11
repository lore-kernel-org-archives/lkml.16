Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E444925F7B0
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988770; cv=none; b=EYZHGT6OCzPAt+1Y3ul0ktNLio68aDFu8TIgZ9HagG7bPR9xal36WNpVXN06cbw+chObE1DgMp4Pblf+VM5zy+lb1952qisi6iMBSwgYJED1AtOdQGmBvY/XKPYtpcypmxS5K6JROmJRDmQCDftDnzHdZZNtDCYzD1xkV0KoDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988770; c=relaxed/simple;
	bh=IWWa/Qu4AaxP07CgREg+BWP56g1MTm4QOepNSerhwZw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=I/iT7UFuHcpcHmfcm5oOEPZ+rrmkwLJd1XeQ84LRDkwg3V3HLJnG1UtAL9Eb7jAsGiUVZU3QQL9WnA5ODUMBQGnVzUJKBB1uMdpc/4gM5TIeVFwTc9tUfNuyjovtd8b5VXmu6ADCUv/891Zl0AqMaa1zkolvdjK9QmhNuSd/vKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnQjK1SG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnQjK1SG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F47C4CEE7;
	Sun, 11 May 2025 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988769;
	bh=IWWa/Qu4AaxP07CgREg+BWP56g1MTm4QOepNSerhwZw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lnQjK1SG3KSahTXxC9H67WcrWAqqMqhf23KmpvIZ1kY2ciFZtgOvZKU0sJMh/npJD
	 K/K+txqp0LV9f22nf1t3mws5kOI0NAed0psJgPdRVT1whGafoVYepMDeRIvu9o0Tct
	 RNm4YD/ckCb3lvMedR8o5sgNND8DPiLgLhLdO+Nb87Zi0CLHfVNzrlZn6ZBgrDz2kW
	 ZZ/2Kvp2/8i+14Y/W76LwNCNn7Cq2y32UZZRGriodqD+RgBFRXl/bvJr3xHI8/wqv0
	 Ri6PC5j1WFagVT8kMaQA/cS6RVZYbhDW75ZKK/Pk0DxHybX6byXA306H9ZUQfkKi/e
	 kvSfDYZw/ngDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1BA3805D89;
	Sun, 11 May 2025 18:40:08 +0000 (UTC)
Subject: Re: [GIT PULL] memblock fixes for v6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCA2NKxG7r8QsJpw@kernel.org>
References: <aCA2NKxG7r8QsJpw@kernel.org>
X-PR-Tracked-List-Id: <linux-mm.kvack.org>
X-PR-Tracked-Message-Id: <aCA2NKxG7r8QsJpw@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock tags/fixes-2025-05-11
X-PR-Tracked-Commit-Id: da8bf5daa5e55a6af2b285ecda460d6454712ff4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f717acc6e9977287641c84af4e397754c8403838
Message-Id: <174698880734.20988.13199790595233514567.pr-tracker-bot@kernel.org>
Date: Sun, 11 May 2025 18:40:07 +0000
To: Mike Rapoport <rppt@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 May 2025 08:31:32 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock tags/fixes-2025-05-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f717acc6e9977287641c84af4e397754c8403838

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
