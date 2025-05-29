Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762661F19A;
	Thu, 29 May 2025 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748540892; cv=none; b=kuUPRo8SUQO7Kn1rdOcoVhul1jN5GZ5o0tpiCDRYvo88zOJeRP9w4zg1ltb+iDBgwe5wPakod6TB3wt1g2ESVjkI3Ir/qlaGdoOyNPaUHyuPSFogMX3mpGPhmlEjeMl9/Oob5NnsnpTXhmPrbGQvtBWqKGOnwMn+hGGzj5czGI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748540892; c=relaxed/simple;
	bh=cBzEdsWGNxKvQ8QfkXlbooqOBKVN6kDeOz3Ad9cZM94=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NyQ2J6dqEBiyWtcyaNqIc1AupccpOUrPyIJEHkXg4Q0+0RjUpd78ckXR3d37vTi4UWS5Iq6LOYPQEIbtz/ziLCsaPElj79AxfV0KjbzICUuH6TQj6hghFQHeowUqjswsr9a3+vTyXU8pq003ozG+eBk5DVnVtbHIcmIKkjdJ4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZ8Y9CAv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZ8Y9CAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D5BC4CEE7;
	Thu, 29 May 2025 17:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748540892;
	bh=cBzEdsWGNxKvQ8QfkXlbooqOBKVN6kDeOz3Ad9cZM94=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pZ8Y9CAvKkPdnWL1cKq9aTvhL8RXf3gbVam2rYmjH13HqmcEUO0IUPnShM1BbCjuG
	 e9aMpPgfWR3n0Tfu85Wm7TCtfiOZMirf0G4Ai9GDjR5GIywNcy6LFPkslkskUDpVsg
	 pRVECfyFSU/6+xR7F1pA4bye/TBM7mH62dxd1ZuIcrwNYCD1GQJ1+bRwXwAfwBmfP7
	 dUKKr5jlo2C4M8975Tc2RM62gFTsnriXYhkVqNavvLxeDw78sh6cXPQyGGAV8Clh0X
	 V6vS0gkzAcEfatDVTO+KSjQK6eiZu+p877ECYY2pSWLUPjeR5dRkrNovqr2FUlRnFl
	 GBJu2U7kOsyQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F7D380664F;
	Thu, 29 May 2025 17:48:47 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
References: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-1
X-PR-Tracked-Commit-Id: 9c96808f10d84156b5e98e16176b725ec5a1386f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1193e205dbb6feca917dc8e1862ffcdf2194234b
Message-Id: <174854092578.3342178.14645201863716783567.pr-tracker-bot@kernel.org>
Date: Thu, 29 May 2025 17:48:45 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>, Guenter Roeck <linux@roeck-us.net>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Sebastian Reichel <sre@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 12:44:35 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1193e205dbb6feca917dc8e1862ffcdf2194234b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
