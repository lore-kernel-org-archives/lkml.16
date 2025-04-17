Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D88F2571B3;
	Thu, 17 Apr 2025 18:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916200; cv=none; b=V71nhkg5a+YZZHsJY5SdkpQrdpOCVbMcWCrZ5lFgxmfIDAlf+2Yj9kg8ybOYrXhKZnkmRn3wl0gC0zRvwEJJ6ihmTl7XDsms5EPuyA+3WiQzsfOruuW8VuZf8QAeDV6K2cV1Suev+6+U3/Kq+1d6iYAmxDjNfom4USBh09C/a5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916200; c=relaxed/simple;
	bh=6wRWRa1/y7doVZiJ6NVdsM54ji6xrJ2w3I5J/XsMqro=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KThH9W1VaBo5Rm6G8MKKW7PmNwxs925pcNss7JuWIRMfyuAqQh81P5CGh24zDzQuvP1VP3667N9Pz3JgA8/Yi0le/el2RIGSRMCCtN1FbpsgMLlJLDAuR9R0uuMtNJkE1HrENAX1aC3se3o8xmC8+yjUazrl1i59Y0wWAVFDPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hf53StaC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hf53StaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF52C4CEE4;
	Thu, 17 Apr 2025 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744916200;
	bh=6wRWRa1/y7doVZiJ6NVdsM54ji6xrJ2w3I5J/XsMqro=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hf53StaCtOvTAfRnhl4rry4spuPvm6lbdUUxbvrjzsVK1b6cIjJXg3HkQoQVZYM0Q
	 DKXTMJupbhn2s3MCqE49e5pXQMb+NSj/zNUo6FVPMGg53kKfchdKnJ4EFYxmLk6FN6
	 3SkAvrhsvdvilRX0gR3mz7r95TvFX6vxjTwpxSpw0dSvQ91IV+s3dbaqeXglzEiRc9
	 +WJG5EAGRM0501zDMLlwTCylJMj/WETIin28STGv8aI0DfnA/M37BbQApbUR2kXQbE
	 1ws9VIPMlTmZx9uodbJkeolai6QE6woXgR1VcHZ8+Aj1GQr7Jrxa6pxPpevGIuvt5V
	 D/ReQxtZRgwsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCE1380AAEB;
	Thu, 17 Apr 2025 18:57:19 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.15-3
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250417141051-263296082@linux.intel.com>
References: <pdx86-pr-20250417141051-263296082@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250417141051-263296082@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-3
X-PR-Tracked-Commit-Id: baf2f2c2b4c8e1d398173acd4d2fa9131a86b84e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8499899816fd79aefdfa923ed3fb5a15b0a62757
Message-Id: <174491623815.4184086.17116293743419496707.pr-tracker-bot@kernel.org>
Date: Thu, 17 Apr 2025 18:57:18 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 17 Apr 2025 14:10:51 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8499899816fd79aefdfa923ed3fb5a15b0a62757

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
