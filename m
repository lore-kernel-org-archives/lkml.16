Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D1728B7F1;
	Thu, 19 Jun 2025 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750350277; cv=none; b=ZHcZKACR0g/nGtBe2hb3BgUFy2HazQemS8cxXZW02Np9pn+yUmPU67abyGiCoc8YDwX15J8+KQ0+K42ocEqCbGwMVFdost2ui6fzg1ntb0Za3wIji9l18eRnLl+0kICZoV6tDeSoUDEGB1TuEKFpQCHJpvqZPTTkz/PGQW0zf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750350277; c=relaxed/simple;
	bh=kKrI2jKMPEkcb6jlgSGSYZjHHZ4eWR3Gzo8paMkNgVg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=US0EcqiFDQg2v+irOIYcSRtO6HQdcFwQO73aS5MczO2Ad+USSEWQCuvp0cGcYWc6smWzdR6XTYwOMLY6OGauHv9iTSqBPisb8ZOEOnz/cSLQZYy0V873Q3/9KQO+Egm1aV1uCmjPWjLKFG5uPgwl2T0Kl0J9krA0Onl1jD+T0Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLhNKyoq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLhNKyoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F1AC4CEEA;
	Thu, 19 Jun 2025 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750350277;
	bh=kKrI2jKMPEkcb6jlgSGSYZjHHZ4eWR3Gzo8paMkNgVg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iLhNKyoqvbApkQeej4mwz9aUHZ995g58NMnUlFiExdhMH07prou9vlpQY6XquSyS4
	 wOyUaITo2S/QUkTyegNsf6J9Kt/ZWXwy+VbFmFGQu9zPTmpqagMfpr7M+gg3BnEJGB
	 oR2ENMIGEAGb6V5l0lB+qSQdC7v/OG/fPcfenkoWKBS5rCH+9y4hf5g04rUct7dSCe
	 7p92uyK0WEC0pkEVGl20k7LiH3HzeSymeW2CLKtWwGFff79oZAJghYXdoeXem4yKIA
	 otie1Sdkda76MK4C9VrQzfMeAe3JYHSrLqKxiSzx+i97mgN3uXazPF62y3b5PDsijo
	 3APY8IXLlRVYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710E838111DD;
	Thu, 19 Jun 2025 16:25:06 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250619134658.3618113-1-linux@roeck-us.net>
References: <20250619134658.3618113-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250619134658.3618113-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.16-rc3
X-PR-Tracked-Commit-Id: c25892b7a1744355e16281cd24a9b59ec15ec974
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 24770983ccfec854d89da9d87ca5f2c9efc695fc
Message-Id: <175035030517.920710.1330674896893377472.pr-tracker-bot@kernel.org>
Date: Thu, 19 Jun 2025 16:25:05 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 19 Jun 2025 06:46:55 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/24770983ccfec854d89da9d87ca5f2c9efc695fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
