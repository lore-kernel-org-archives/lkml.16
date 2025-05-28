Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13D19B3CB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748392203; cv=none; b=T1S1X+u/UfmRHasZP3mL34Q/7oWIYkhldxhaHfAiHkjUZRqHYBxEjswh+7Wd2MdUVxSB735o4pbITeB40l7xdXeGmydCyVDng8Zy6EUWG93kylBveBq//rEPBkWPYNTizHlpI53fFHuaWCx0yl1t4Uwcex+6MQ66hX7IyHDtYq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748392203; c=relaxed/simple;
	bh=a6OmCGu0jdzkOtKsrnIuPAVy75jO7ZojeqVkL4y93xw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nisAM5UgPHhwRB3m07cNtFaxHXHloRygpvap4qnpiMDv0y26eKQGE9fQ8ZFNUE1l3vXVItV9F8qoCX5kOuRqaM/sLLpwA7UPAQ1o1aX/q5bLJ6ldgfJOflgr3IvX1Epn6/9DiHhK4QNoX0B2Tw+6BcwMi0RxaP8LHDsLSv9q6CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+EdSU9o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+EdSU9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C58C4CEF3;
	Wed, 28 May 2025 00:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748392203;
	bh=a6OmCGu0jdzkOtKsrnIuPAVy75jO7ZojeqVkL4y93xw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p+EdSU9ow7RZTMGYK+HYJA+Vz7S6OlOPsv4L61w0wpubRQWZKAVRFkVJ9LBAJ7uqA
	 o5qbbBZ/xW8Kl33i1zepCAAq7xawrbKkrkVdAxfcE5kj8GzdWpXrmlT3Y2e5VuR9hP
	 ahUZQUCow1hARqNN7OVLEK0L8VI/8BYCfTODMPHHCfQlhTPd/6MRMW0K1B4Hwqpa3N
	 CTptWiRTNGJ026Ol0+oRpappshYfaGcItM5utKdQhE3l9S13Ki4pBqMzGlvF4TV4BB
	 oYhwtJpuYRk0DkDKB7YDShb4Lpx+6FwmlSdieFHegcDUPFD3oOIqYwn6AoHTZchMpZ
	 fi+rMt2AMg2Lg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC2639F1DE2;
	Wed, 28 May 2025 00:30:38 +0000 (UTC)
Subject: Re: [GIT PULL] regulator updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aee0fa6dade74217ddb19cabebbc8d75.broonie@kernel.org>
References: <aee0fa6dade74217ddb19cabebbc8d75.broonie@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aee0fa6dade74217ddb19cabebbc8d75.broonie@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-v6.16
X-PR-Tracked-Commit-Id: dcd711021389c4d19b3310cc37f09813659dfee2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 350d9ab73654c47ea3cf6214ef2ccd159bf134ad
Message-Id: <174839223741.1837144.13923210379622052013.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 00:30:37 +0000
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 11:30:01 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/350d9ab73654c47ea3cf6214ef2ccd159bf134ad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
