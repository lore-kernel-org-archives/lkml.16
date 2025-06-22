Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4182E20E03C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750622130; cv=none; b=jFWCh28oZtCNVhQwycFmlUcTX9N68Q7kqVAYGCDvbWFwoTbUIyE3iHKecbNxh8fwj8uBm5+jmvy75OeJ8eYEv4X2fOMHPjzK0VXWcpEv0H83+yualau0+ANf02tM3n9932vMbwd3zb0rZWV9EBOvmtrJ4BjqYqt9ISGVKDNu9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750622130; c=relaxed/simple;
	bh=gWnJogyNCHEIqMwO77KV+j7PtHS+BHBjSf3me3ZWmRk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ag1VuvDFGJoN9iusUYN/EyzV8K5F0om5/9a1WSH84f2jv9bhVI8Io1AKix9Ni22r3uMT/kwztpJpnyh4Wig0EhelptT30NZ4Zo3EP9grEZ1/PCGTTiLvoc4d09OrAJb/0qh6O146O9wU1jnfUMkN7jMOyJ6mrMgiKKLzBgfptpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pif1RDJD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pif1RDJD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EABC4CEE3;
	Sun, 22 Jun 2025 19:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750622130;
	bh=gWnJogyNCHEIqMwO77KV+j7PtHS+BHBjSf3me3ZWmRk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pif1RDJDCFNz12+xpJTlU0J+r+e5FC8kVeukt3SyTPgK/O0fP2ldzmCa8wzdQJpdc
	 tlV3WPSj6HbtlD/LKZzjN4qSXp6o66f8L+iI9mCH3idJDftiOzyzV8tjjyyJb0Tlu5
	 QZaRU7uuKx7IVPCuRLtSe4DbGksZxT6uI++u+Yspl/UwhkjIzTEITnkWAUaGAqrYHy
	 D9qfZsLllvcSOJl+IIDmAr4I+93a6tIlWNVrhQvrAt3jFA3mfP+limoxunZv8BN59A
	 5AJdLGkYeWr99tXTz4K4YcUwIBvloMjXLk8L0v7ndMpWRnjSwypiW/Bn7RFGMqx1f+
	 8qwawzQGRnv0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBC939FEB77;
	Sun, 22 Jun 2025 19:55:58 +0000 (UTC)
Subject: Re: [GIT PULL] irq/urgent for v6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250622085320.GAaFfEgGlh6MIZ-1Pa@fat_crate.local>
References: <20250622085320.GAaFfEgGlh6MIZ-1Pa@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250622085320.GAaFfEgGlh6MIZ-1Pa@fat_crate.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/irq_urgent_for_v6.16_rc3
X-PR-Tracked-Commit-Id: 3085ef9d9e7ab5ae4cddbe809e2e3b8dc11cdc75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 33efa7dbabcf62491c2eac9631752d52b8e159f8
Message-Id: <175062215732.2132065.6451831499099362604.pr-tracker-bot@kernel.org>
Date: Sun, 22 Jun 2025 19:55:57 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 22 Jun 2025 10:53:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/irq_urgent_for_v6.16_rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/33efa7dbabcf62491c2eac9631752d52b8e159f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
