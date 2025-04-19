Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D821E5B9D;
	Sat, 19 Apr 2025 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745098669; cv=none; b=O+SPDLCg6MOWZ1oE8H860cS7skYaldpqtIGFTylZ8bwAbHbXNgsA6Xbv45i5KKHgQrbjbQUZuLCEe6KGnCw7sU3xnlo5ylV04rizXGRqj/7B1AiLI1Zg5qkLybjQeA7k43VdD/QEF/Qsv0tazTLK93mkQoUL9KuEVmRI372hiJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745098669; c=relaxed/simple;
	bh=tbe5UjY1sv1PmjOryIY/S23wDrGxf9Y9s0mMexo1/Tk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cuYV/t0tr2JXAJpI34GuJflv2ZFCTSHbDcBm+lhCiExft0hsNV68b1L8rKVFN+zbRcW+fH1D0VNg6Mw9a+DRLLtJAY1ifFUkZnc7W6vFHtrJ2PphqNeSB3HZDnACwMusRiYHHTRCH6M8mcTNH2rQIaPc9a69jfpYyyOwlNUopiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0SvN7kq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0SvN7kq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369EEC4CEEA;
	Sat, 19 Apr 2025 21:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745098669;
	bh=tbe5UjY1sv1PmjOryIY/S23wDrGxf9Y9s0mMexo1/Tk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O0SvN7kq5AxQOmgOPp/hNIS7JK5e2fLBZYjY/R32c/vOaDOAvkhy3kvPo7/ESLL1h
	 l+TAqw26L2nJ3oPXsONegLTVNu3mSJl+Dni/jBWDV5k8wl+vFLCEeXbMpPG6HdZDhk
	 WuOq5Ss5PVpZeU9419Xlg6a3STmw43/cr78tUDqcVgIpnsmz89uGPNNmkelPRCUYGa
	 gm6PzWfyJaM2mYYFxWwxZ9JMEiREnf9OXsQ06Mb9cDmQNOn0gFYe07dw2ctibDRhH8
	 KDBgQB8XhMjdLUD2/STlT7Opm5ZJyYWYJPapuTaZ8B12OEhxl07nupOT/9xqHFQKd+
	 3EYdAZUksU1sA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD243806642;
	Sat, 19 Apr 2025 21:38:28 +0000 (UTC)
Subject: Re: [GIT PULL] vfs fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250419-vfs-fixes-627259052c9a@brauner>
References: <20250419-vfs-fixes-627259052c9a@brauner>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250419-vfs-fixes-627259052c9a@brauner>
X-PR-Tracked-Remote: git@gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs tags/vfs-6.15-rc3.fixes.2
X-PR-Tracked-Commit-Id: 408e4504f97c0aa510330f0a04b7ed028fdf3154
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 119009db267415049182774196e3cce9e13b52ef
Message-Id: <174509870728.540479.15996369817632938600.pr-tracker-bot@kernel.org>
Date: Sat, 19 Apr 2025 21:38:27 +0000
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Apr 2025 23:04:04 +0200:

> git@gitolite.kernel.org:pub/scm/linux/kernel/git/vfs/vfs tags/vfs-6.15-rc3.fixes.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/119009db267415049182774196e3cce9e13b52ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
