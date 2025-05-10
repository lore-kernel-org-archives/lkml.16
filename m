Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F53F51022
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746897615; cv=none; b=hV6oErJ6ZH/+ss164n9hkI2e5q7t4CvQRszXo9INkbaZUlrKkSE/kqfuXgFUuewbIIkqu+2gwtuLpPe/aEqV2OBwzB/RzsV0RbRk2BW8Q3484EHUnA64DhUxFMWCB2ZQXyr1ePVEaaIr23hsZ34VyxBfEbWE5FWaVNWoHmBuiws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746897615; c=relaxed/simple;
	bh=BCSajpTSTr2za8Hz07FCTg1m9BTIe/jI8SMmaUvJVqk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qO/+YZRwFpLBpHGJ442qOfUZDiZaEH2c5dO5JLlDexYso19zVJq1Uq074opkKpg6/q4QxmiDTVmnXacGmx1Aw2NC6HJ5V5yH/lHwvXP2veXO7sQ4W2yrtu9Fmanv1sJQsA2pf+AfHNc/SLOK4PkeU5a7GsoEWbyTHkRP3N7cl+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz2bc3H1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz2bc3H1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF54C4CEE2;
	Sat, 10 May 2025 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746897615;
	bh=BCSajpTSTr2za8Hz07FCTg1m9BTIe/jI8SMmaUvJVqk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gz2bc3H1OMR1m+5cpX9a3wOBRQ5d9esqwOqDGkRD5W76/dXWfdmgfafNIEIXJwndF
	 0QRP3yrvi+k044lwdfAkwTC/SvdwqHogogSjJ2AiM/7pjQsXBxGd6BHbFEGFLjjQF8
	 5O5RSVdIMWJOvQXTExG8ttg0xYcp3DJJwBFjSUj3kiEdcn1z7j7gIPiBWHzhm9bDUN
	 7jAV3zdBzn2ijiqDDzEuRfkxVzWgYPlZOgGNU9tVlfoiUpgwaIxS6Nb3isas+xDA9m
	 CFrCl3jI6sVuoCj9lRM6ESmeyEb/DdajaEWvqndg38wkDR40NdxtjaytfxaSWgcdcQ
	 zuHjEXT523s4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEF33822D42;
	Sat, 10 May 2025 17:20:54 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fix for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aB9aTNHuSV-5U15D@kroah.com>
References: <aB9aTNHuSV-5U15D@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aB9aTNHuSV-5U15D@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-6.15-rc6
X-PR-Tracked-Commit-Id: 95deee37a12364f410d22c6a8383f59738a2fef3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 345030986df8f7712f9e4c00fe61e145c8984ef3
Message-Id: <174689765320.4009354.15466356083587638023.pr-tracker-bot@kernel.org>
Date: Sat, 10 May 2025 17:20:53 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 15:53:16 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/345030986df8f7712f9e4c00fe61e145c8984ef3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
