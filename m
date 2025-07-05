Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2421DF759
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 23:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751757472; cv=none; b=lKv/J9yOCWHZbZRaYdgJxJZpwG4HjyRBh3i790sCGtTzI5y7IH3Kzsu4MYyQlaNRUILkOzfBoV8S75C7dsJDpQXoNH1vnjZySPYRmWaSuklMZ/z8N25zxi3iTzxNYGINlhYbcSIQt3Oc5AHM0AMdKiFBDcKDFzZ++qta0yaooN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751757472; c=relaxed/simple;
	bh=RUcmqa9eSQXopeqW7gmfIVNlKoiwR7TUXZK7lUwHzVw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nPSOePUXPehLLQUoJLrOzOuVHrRhXL3BGWHwRRfBYEphF4rrdqZbuveKyWGzHp0OtMxcWM68PM0zAaN+6AKKap0oPXIQ6HvayWdWsLv7bsMzMxnSGbv8WU4E2ANxGIEMlVgH+UZ6YbbeIrT58ELsAv16uGRaplHlT1Uao7e7060=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZAwM3v9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZAwM3v9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10014C4CEE7;
	Sat,  5 Jul 2025 23:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751757472;
	bh=RUcmqa9eSQXopeqW7gmfIVNlKoiwR7TUXZK7lUwHzVw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fZAwM3v91354c6hu3kKGiBmgvNjd6FKn8G8FYyKLQOJVGSh3rs6XW28rzWg1IYMFT
	 kW0Y2mgMtuZaCFcBsAP4SvZ2MiSh936rO7PogI4543mZNAhpwHV48YVRZvtxmxYbMt
	 vI/l1dcyB+RAihWv+1ueLK+WXCZiBTNhW5qqOWvvpJnUgTKzxzY5GFfJpImX5FvmEV
	 unB7Vw1OzafHusQXx1T2PwutntG4haZSu4YnBdHTbtd/erLrMUSF6zbuIr4CXdUT1M
	 tTb20FlOXKeLYG/rIrDoqR3Y5/JNBbb6wUyHhF8+hjsW7IoyyelzYW5a1q+6WOg4Na
	 PDJCFJRfWLW0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFB4383BA08;
	Sat,  5 Jul 2025 23:18:16 +0000 (UTC)
Subject: Re: [GIT PULL] HID fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <77r6soqn-3s01-8863-0n17-1699qp728038@xreary.bet>
References: <77r6soqn-3s01-8863-0n17-1699qp728038@xreary.bet>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <77r6soqn-3s01-8863-0n17-1699qp728038@xreary.bet>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025070502
X-PR-Tracked-Commit-Id: 38224c472a038fa9ccd4085511dd9f3d6119dbf9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1f988d0788f50d8464f957e793fab356e2937369
Message-Id: <175175749556.2550644.17287580147722318071.pr-tracker-bot@kernel.org>
Date: Sat, 05 Jul 2025 23:18:15 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 5 Jul 2025 22:30:18 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025070502

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1f988d0788f50d8464f957e793fab356e2937369

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
