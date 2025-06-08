Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E61E7C16
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408786; cv=none; b=WTRTeDzQCR4FUThaUyjv9eHZKdW7CbfqJ7vuCCzOCRL06eaNjvK66R+pvJBZn5woKtBdVLDASQ0iaqiWEBLX0kH1Wr1yhbJWXsTis9jeqdls6oPuH41ZMWf4oOFrs9m8tYV+mmKi5IcBUND12bm+7m7i/Ef7BpVDHq1/7ulUwQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408786; c=relaxed/simple;
	bh=jOIeedqHln8YzkmmMMsPYJjIH/S3b771qRI3rqEL/pk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=j0eNnuPmo0fMAaW+imF/3yn7GzMyBs7c9xb7vnB4GzJBsoKpokCGnbNGG3WM0ELdBOHRwjxYuQYgqIWQP5YMNEXGyHXsLvoOxn4u44mKKBeXTbSzdbv7Hny0L5nJ2kcHBbxhJdPKp4Ji6dpF2pkJZlUsnybDg9VoT9mJ/YEaTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFmxCwG0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFmxCwG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD03C4CEF2;
	Sun,  8 Jun 2025 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749408786;
	bh=jOIeedqHln8YzkmmMMsPYJjIH/S3b771qRI3rqEL/pk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LFmxCwG0lwJN0rPmwjhtieatb/yWwITSf2wq4Sz+EovLtGuT3BS4RkDsBGgUg8WPg
	 FpMZI+vXKRPvSrqEVcA+GfvixqznhaPd4Bct28v5cdp0xx7lltvxDrbgmiy2iW1/Q6
	 hghD+illxirAL3CNKrqQUql98JyQfwgrDadsTsCcokTpkze6JI+kF/JFG/F9bOFeme
	 A1PtTMWGC9+tDZNHykfZGGtpW6FysWHD7R+qTXrgecwVISpme/qVnrwliv+hdjSZjs
	 8H6Ezi+j3+zrB4baHfHJtBw9/PoFoQVrNyeu2kANc84fN2BDeWm1abRVWw10AmZH0i
	 4lAWX9PTmpvig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C10380AAE2;
	Sun,  8 Jun 2025 18:53:38 +0000 (UTC)
Subject: Re: [GIT pull] timers/urgent for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174936765291.749406.6511905103929149348.tglx@xen13>
References: <174936764731.749406.17114868218275391074.tglx@xen13> <174936765291.749406.6511905103929149348.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174936765291.749406.6511905103929149348.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-06-08
X-PR-Tracked-Commit-Id: 434d7f9b0e24e1f0166d05f10881a8ab386845b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4710eacf8daef2c6bbb18fbad95ef60603b685ac
Message-Id: <174940881702.385950.11812188494457572859.pr-tracker-bot@kernel.org>
Date: Sun, 08 Jun 2025 18:53:37 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  8 Jun 2025 09:28:14 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-06-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4710eacf8daef2c6bbb18fbad95ef60603b685ac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
