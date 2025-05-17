Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5B4B1E77
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 19:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747511878; cv=none; b=BpXeSsP8ELqMtclq5y3ycKzNZVoZXTebeGTiMAEqseSxeCbKWaYoLLgkZ/yTyeNJkO2Hv+AreYXXLU9kXxJ7SvGOByF6ePAX2prLoeRIcRzIRuwHSBx0UEu8EiX05awWvHXXVYp+H0RlTB0YKkOWJ03DXHuqlZSWKnKMrXWGCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747511878; c=relaxed/simple;
	bh=Rxu5F2FGHW97Fnny8XZiV86WwxxyIUZRJ+KcXFGpo2Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nb5hB9Il6dx1iLNB6f3aQ0tXaqh2C/HrcQlzh5UPjomA/snZdLwB2avZSoJWbyMtK8UlwjYP36BByfjj3VDTB0eRLT7Yq0qfsUKCCCs6TrPVRj/lJBoiY4uOd/I8Yfeg5iRl7HGO3bZLUXt3VMiAseou/YWvlpZhhYe4/YjGKzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJnFIr20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJnFIr20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF96C4CEE3;
	Sat, 17 May 2025 19:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747511878;
	bh=Rxu5F2FGHW97Fnny8XZiV86WwxxyIUZRJ+KcXFGpo2Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LJnFIr20nEWiVgEYyDNF1/vgQpPDuIx9JzOZbxuSn40JKZrcep869gSmDh2KrOE+P
	 /TiMnDOJEEGh5oXodjCech94YugAZ+yrfyz7CQcbZZYZ/87HDQySsI7saURyFZNsFY
	 8anpau58nXHdsrKDEyQct87prGACrjHyCeYPGlyNNlxtIiOuf8zKKSG9Mq2ZZAO8LS
	 pW2rLkLAJEU6aXmuy8Hl6EGlos7PGkaeK0el02QUMPXMosWzkbKO6207hFT7FFy1af
	 sc2MSU2mlgtoSeAUsNCOgJ/KVLhC1SbgvdOxSIy23ad3zTJzkyd0MK8sGXyMygAi4I
	 nBIQoyjlgKnpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF54380DBE1;
	Sat, 17 May 2025 19:58:35 +0000 (UTC)
Subject: Re: [GIT PULL]: soundwire fixes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCi9PijlCQGpWjXF@vaman>
References: <aCi9PijlCQGpWjXF@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCi9PijlCQGpWjXF@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.15-fixes
X-PR-Tracked-Commit-Id: fd15594ba7d559d9da741504c322b9f57c4981e5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6aa6f8ca08c780908acf09df556a4807a10c2af2
Message-Id: <174751191456.138654.8219520444931356245.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 19:58:34 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 17:45:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-6.15-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6aa6f8ca08c780908acf09df556a4807a10c2af2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
