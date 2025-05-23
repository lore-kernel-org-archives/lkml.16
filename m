Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58D625;
	Fri, 23 May 2025 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013655; cv=none; b=nJ/1qiLqNiul5E1gs+xJwvnKbGYGKdP9DrfjcTnAb2BowCRBLKr5D+fkYUKfbcuTUO9rPLWBYm07A1vRg24QoQIaWK29oahAX5dE5NWNxH1jtUwGA5Zc7s/cJSjPqVKFW2TrkqSPv8lQXH8+sqgoEZdSjoOAS70xuC0kizyr0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013655; c=relaxed/simple;
	bh=PQuo/LXNwLjuizc5ub5UK4kECO+8tQMNfONXffGvB70=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dCsM3pSplv2xDL6csZfxGphpxpTZlG0cqmCThVok0CIvrsHK4x21KIWGXaeDEZoelZxhbPrDXG1R7DZYKuSj5cnRy7zG6dzdhkxSTI+rn2o8EICLXQVZuop2xCk5bAhIUJNLvnB1VBxuDr61B8zsrxS4OSRS9jSBqpJqbKUFE1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaAUvveT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaAUvveT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44961C4CEE9;
	Fri, 23 May 2025 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748013655;
	bh=PQuo/LXNwLjuizc5ub5UK4kECO+8tQMNfONXffGvB70=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eaAUvveTZimdlOCwFw8CQkm8xTX/uybsuatRnp0EuwPs2wQsKsBEuPEIbMUBYXv60
	 FjgTJBcYfNt41nb6Pl7OD92TrX4ktUVebaWSiyzpzAnXrsDrElXg8y3gjhVSzqf0bd
	 Gw7hNIBkNjUcmpiP2izot1usPynxz6YnWNGgLX5mIJVO9LFoHx//ymK/1rlzxYXVK2
	 9hERfa3CsIPraxRllW645tUSOSPg1iDSPx4LaSgIp0ck9iVSXW//8350Au3BQj+3bi
	 iTOd+QRuJsg28+5ejcCrg4bdczi6slpjCOKKq/Bj5VgqMYnXkhsBEE8NjrL1+ndXbQ
	 CKmVWWunecN0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE05F3810902;
	Fri, 23 May 2025 15:21:31 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.15-6
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250523121019-62803604@linux.intel.com>
References: <pdx86-pr-20250523121019-62803604@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250523121019-62803604@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-6
X-PR-Tracked-Commit-Id: f2eae58c4428bd792c8e91e3666ab0718d87b44a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79cd89207c028de7a57f00537d0584b9c9e5322b
Message-Id: <174801369026.3634038.4067925322010414165.pr-tracker-bot@kernel.org>
Date: Fri, 23 May 2025 15:21:30 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 May 2025 12:10:19 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79cd89207c028de7a57f00537d0584b9c9e5322b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
