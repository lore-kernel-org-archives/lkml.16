Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A517210185
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537880; cv=none; b=p7myU0tyNqHgqACiBLgso34tgzLI6Rnu83ZxkS/5TelPndxcpH4CpfyTR96+WOThYjmp6OH1A7SvF69dZD3+I2VoGvgpW9rN3bQtfsrQPH1PvOPiLTUrjIl2GKXbwNjx5EH+wfPJdse/AUHavU2gqt0lVDLw3sYGNGHU45ek7wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537880; c=relaxed/simple;
	bh=ZRs7wTtrd8wpc/oWkIhzDRIOgMMtNSnNvG3HVCLAz1I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PRxZF38ZD5AR4WgvE0nnp3B4fZNE52IpMtSWoUbWWiHfpq2Q5qzkjBGpbE1rNj9dpOFmV/sN4oSdMSr4Dfhr9en0sGMgXdcCpxlLA3Tp7/SuEe373YkLRP4gV+xYE4B86sNahpBwx9qyLhf1nc875FwKj9ftrP1s0Kqs3x6wdlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFq67gaF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFq67gaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC1BC4CEE5;
	Tue,  1 Apr 2025 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743537880;
	bh=ZRs7wTtrd8wpc/oWkIhzDRIOgMMtNSnNvG3HVCLAz1I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tFq67gaFFOGBDenXHCpPlXiEYd1B76tbiYuuD6SK5y8S5ey5kEBT7rQQInBMEOBFH
	 v51vSg0wHyvSytOuzgeumil2cLCBoNH0jMT03bv8dbWBa47BAL5KGThQZcbu/lQm7T
	 RbnsAvsUnIjtODKMAXdq0uBkn4A8JBj6vTg0/vsI+7J71upWjvFcbwS9DZ07Y3+M4o
	 +BckrOI3g5o9mm3PyJsM0GGz+4gu1+CQy0s/Yily/c+0rrs69vXgyGWfr9Pt1SVyeH
	 IzSoPG4Mw2xfRNuFZmBa5Ahms3VuIkdL3s3dP55qjZD74pG8JJnR0/e1rhKRdEDZp6
	 dKsIjGYCbozzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B26380AA66;
	Tue,  1 Apr 2025 20:05:18 +0000 (UTC)
Subject: Re: [GIT PULL]: Generic phy subsystem updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z+pFou7KOQZJ1iy4@vaman>
References: <Z+pFou7KOQZJ1iy4@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z+pFou7KOQZJ1iy4@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-6.15
X-PR-Tracked-Commit-Id: f13bff25161b8a0a9d716764ebe57334d496c6d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e63a165308468d0dce39e07c97279152b043875b
Message-Id: <174353791666.898575.16747496892369523594.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 20:05:16 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Mar 2025 13:04:58 +0530:

> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e63a165308468d0dce39e07c97279152b043875b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
