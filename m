Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5C2FCE31;
	Fri,  4 Jul 2025 17:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650581; cv=none; b=LU4cA/MlQVrkxKkDhICM1KebdXcX/nxkuzx8yuEjQ/FZCSTiGIChEb+lgPLU9QGE5sjJysAvv/fdb64h89Z0ilGRmFG8lIuXjPYiaRz21rSOx2lZDnWirC4mQYwEfxQ05DKf+IceMG67G6JZi5vHRZ5PxFp4CIBOEEBxdiBavLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650581; c=relaxed/simple;
	bh=6XtZnU+Dh1NLoj01HoC86n6XVwrPyDYWAJf4Jgw1Ye8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QUu1WQyDt240U1hFoHxFqaQBIqPmQsJjkCdBJ808WL/XckqLdixFnQmqZnzSxqV/7gyhJA3xrHBHM34F321s0oZJrYwEElC11DHiFuaHG71DhndEyNwCBUTE2n3hspzV5ScazFWSEERuScJPU7HXUN66Xk0agdKIyPSgvkLYJpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsYY57XJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsYY57XJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5389C4CEF2;
	Fri,  4 Jul 2025 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650581;
	bh=6XtZnU+Dh1NLoj01HoC86n6XVwrPyDYWAJf4Jgw1Ye8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZsYY57XJ6jy9w/sZR1Pju3KLOYjA6hwHtU2H4e36J6MrMi9SI0m+CnBuRO8pEdYq7
	 Lec8izHtYT/bIum3Vz3tFeiSE9AsAMHxt3vbBJj0FKni/MQ1LIQ779gW3lwG3B3KO6
	 sWUFmecP20N2uZe+j2TZz4UYD1Ijh4DctuWLIsoYds2VU4hUddYt1Y2BBPxDqHi8YQ
	 wMyrtfE4Cp/2GzrAo2XTQc4eKdnZpUPhc0H/2ltxUHKDhPU72xZgk2QK+X+4/dQS+C
	 l5Y61bMRQZu5AvpULfg3IGqm0gnXsuAc0D34iFi788uxte2czV3w6jAYi8/6FAuxMY
	 V0pyh0eSdHSBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE17383BA01;
	Fri,  4 Jul 2025 17:36:46 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-3
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250704172633-53246370@linux.intel.com>
References: <pdx86-pr-20250704172633-53246370@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250704172633-53246370@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-3
X-PR-Tracked-Commit-Id: 4f30f946f27b7f044cf8f3f1f353dee1dcd3517a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: df46426745ac58618c822ce3f93d2bb25b9a5060
Message-Id: <175165060538.2287194.16879797866877825112.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:45 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Jul 2025 17:26:33 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/df46426745ac58618c822ce3f93d2bb25b9a5060

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
