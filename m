Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B68F6B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748464859; cv=none; b=Z9hO2OWuvqSy+gBwYspzRETYLPkojyU8eXCD2MQ03/E9VIYQ3Cqeu19TFRtmmEpmVA4PLUXfcGWWJzFyrZiu7KJN2djeTYGWxTFJmBvOa9YRgEMgAVzv3DrW/iy9oxh5ZbZ6xl2H2dwnXTq3kGpdB7snNGqct87TkSX/lBNevMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748464859; c=relaxed/simple;
	bh=lqsQF1t3voVLgwBz6PS1Skl2KvnQTvxGw3jOo3ETkPo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JzwR/s9Pp3bzzHxUgZmczi+MTpyYqV3MSiNAJjVmUcHIm4K0P0Ns8+BKkakCniLpDkOqCoZOHH81HaAA1jyQUUa1A6cwjfxwwxTrG0GESzeY3a+/P51OdARVdCaouDWE+GOCL3Q+ZBJTdNk9hNyfMdRlQK2F7wkeY5SVqBBbBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmLcFuZ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmLcFuZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F689C4CEE3;
	Wed, 28 May 2025 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748464858;
	bh=lqsQF1t3voVLgwBz6PS1Skl2KvnQTvxGw3jOo3ETkPo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PmLcFuZ6ZT34Z7HvUg9xyNn+ErLL1x6DQoiz6xU/5XTSUZ0d4eze9yiV85gRi9Zeu
	 dLY0slHrn6NAOJytmaR3iBkTW4kiY9pgz/MIu521nRRFYASDboSqJl5NmmN2HWyfSQ
	 9093oS4drd/dZDWanez8+SRwes5H1lCqy4GK066CviTmTMTqjbL8xAgpC8T/7BuHg2
	 2ob/EG34H+Otm6W42nNLRFOry3iT5HjTTMYxfRrhIZYm4ZU+hQqrstmd4x2txg7EWA
	 iHMAYSL6cgXgFikDYxhlH2d1A2uvmn/bLwiLYd8hI6YTN1ZbWgyV6MZkgCS/Mgg+kb
	 OYad1nQvtFnKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1B63822D1A;
	Wed, 28 May 2025 20:41:33 +0000 (UTC)
Subject: Re: [GIT PULL] jfs updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <ebb6fd19-0c06-4a71-b900-b99b442a4b8f@oracle.com>
References: <ebb6fd19-0c06-4a71-b900-b99b442a4b8f@oracle.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ebb6fd19-0c06-4a71-b900-b99b442a4b8f@oracle.com>
X-PR-Tracked-Remote: git@github.com:kleikamp/linux-shaggy.git tags/jfs-6.16
X-PR-Tracked-Commit-Id: 5dff41a86377563f7a2b968aae00d25b4ceb37c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1cbf99e47fef5a0a8cd421487e642283092f07b0
Message-Id: <174846489254.2577663.632807314466377796.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 20:41:32 +0000
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 May 2025 14:51:41 -0500:

> git@github.com:kleikamp/linux-shaggy.git tags/jfs-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1cbf99e47fef5a0a8cd421487e642283092f07b0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
