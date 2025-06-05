Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA81DFF8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149573; cv=none; b=tghy6G81+MpsFR7L1i4HzlifUj3glLA94BiZPClxbJTl2qTXD1gWn/OvOiHFwzQwZ4vv/r4O6AElbYNuuyErtxEHOrwzgV3Gk9oAMcA4E0Ph1T4CnxI7Az4m3qSdl+Gy19QAYDtBwVLbVXMYIFA5sdCOqczMphRFh5Xf8sIHbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149573; c=relaxed/simple;
	bh=nyOTJpThVJsfUYv/oE5C1pTn08Qj95h5whErxwTkch0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Tz1WH3mmHFfiRUufyJrUAu+LE8jstfkUSvtS8n5G0joTegPecj2cTq08J4pJw+/1sVpMQfCMrrCyHyuJw77O8/ozE7mh9jgu6JN2bauJgFNPpB++lO73uCTZ6P6Kaz9wt0KTGCdOgnlIFnLoUQRNF6nlItK0Fc6WjF3CzE8IL50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbbXAkzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbbXAkzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DBBC4CEE7;
	Thu,  5 Jun 2025 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749149572;
	bh=nyOTJpThVJsfUYv/oE5C1pTn08Qj95h5whErxwTkch0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dbbXAkzLbv6mgraPk9/kDdOEZFy53+4Lgm7vvBw6ZXvVXde7DPIk0bLhdDsM6lqv5
	 5LB8VI61vC1S3u2hchEU5cTEdNWFNtZ23tUTfTwRqOP3mSvxM2ar3FsXzya7lAQAy2
	 sBAVjhEzO2RCW7ylnkE3N9GsZO4IUeUsk8T3+Hdit9o5s+oBKaciDwZuVfCm64QDAf
	 GxSpDlXuGDowpll/Pbjv/f44efXjLaanIt/3mpZWwmIbfitCUhv+7Q3aU5RCLxkE0c
	 06lSRH7euiv+vYnX1n/X3OsB/0552k0kVWMP+/rZEhz99JqIUFmN0O1wc+10Ml5OQc
	 nlGZp5WW1SW7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB33739D60B4;
	Thu,  5 Jun 2025 18:53:25 +0000 (UTC)
Subject: Re: [GIT PULL] uml 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250605092423.14973-3-johannes@sipsolutions.net>
References: <20250605092423.14973-3-johannes@sipsolutions.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250605092423.14973-3-johannes@sipsolutions.net>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linux-6.16-rc1
X-PR-Tracked-Commit-Id: e56a50ff7c12983aba710bd02a2c2ad401379e91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cfc4ca8986bb1f6182da6cd7bb57f228590b4643
Message-Id: <174914960462.3197273.4053353076250915287.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 18:53:24 +0000
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu,  5 Jun 2025 11:20:57 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linux-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cfc4ca8986bb1f6182da6cd7bb57f228590b4643

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
