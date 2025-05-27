Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A38218ABA;
	Tue, 27 May 2025 22:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386050; cv=none; b=o6yL8SkoWd/yMm05WbUTcywqdFGELHdI7r7tSjVL9eUzSBVhJ+AurqDzt/0be93Oui8at5LuXK4GX2oEdOmVunbtCwrQxjjvRTOGDJI9mThev7lox2yZkpHTM7aL9Z54qLS8utJ+m5TZdPHRlNaEnh5Eu4Ymk5pAw+W+cOt7fq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386050; c=relaxed/simple;
	bh=Bj/B+eHgK8jLTw/ryurWaujwqzUSlu8t5yRFa6LPuf0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BiUykg524TASXaFhjAvEDYVMz6/sxOKVnTrHuCMZwFnUvNBN8egtnFDjaBnsRAjw3t8/7l650+kQlwy139qE+YVzTSHs7sscGj61CTM39imtOzgo7zpW6/oRGxrhybVqS26iqFanWHkO+QbOgh19wFXGqTeBjoYvK/gVBQEQuEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRCP2LJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRCP2LJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E4BC4CEEB;
	Tue, 27 May 2025 22:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748386050;
	bh=Bj/B+eHgK8jLTw/ryurWaujwqzUSlu8t5yRFa6LPuf0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XRCP2LJOsaCvwugIx2Ik09OSCzQV7m8o1E8vW9wQLCIri8jOIx0Qde2SqMdHjJLTN
	 XLMPq3dHuf8bDgfrPoNMNcyqcFF/StjWHP7BC9ITknS2mNe0NIbrfwlQRb7t6dt9dZ
	 HIP75Z8fYO76XNAkV+Wzb3nPYF1drnzcAvClEjQ9h95E2JXpyBFf6mVeaqbqwjhAGY
	 ZikcJica1CJu18uOWo1zXJt/OlCu3nQt9j4HSE7VSMnjAyNXLp5vrQKiB9ZZe+3JFT
	 l+o1gsv5uqNyvynTLdo3XiX5z93Ay0S25g526g9EJ+x3Dcof6lrDSOQ9nBsIr649p6
	 lUwmRAskVOPuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD54380AAE2;
	Tue, 27 May 2025 22:48:05 +0000 (UTC)
Subject: Re: [GIT PULL] sound updates for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h617rbsq.wl-tiwai@suse.de>
References: <87h617rbsq.wl-tiwai@suse.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87h617rbsq.wl-tiwai@suse.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc1
X-PR-Tracked-Commit-Id: 534e9cf3782f1bd6adf0bd7d17ff414ea12a6bf2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9e6060bb2a6cae6d43a98ec0794844ad01273d3
Message-Id: <174838608466.1808984.16655015223263099038.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 22:48:04 +0000
To: Takashi Iwai <tiwai@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 10:55:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9e6060bb2a6cae6d43a98ec0794844ad01273d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
