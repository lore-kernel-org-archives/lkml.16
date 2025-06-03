Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB671E5B94
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748972733; cv=none; b=IzorjBV97YMuF8tzP13ad59Jfnuu/GsLcFiVieaaeS43bqS8u2pXppUyFIoTbJa/OeKanfdRookraxQFFshw7UBi+sgVQHQ1y7GpIXMCZbyabFuIIVhmsbNUD3COSJjwZ4ljkyRZhQZxM+RlTgAtBUvpXqXmu0UKh70Bft4ALHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748972733; c=relaxed/simple;
	bh=H+TresmjAp6DkF1nsSoeqv73gw3MtJLFPuO1+ufGoJ4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CbrwvSmC3o1taeHxn5Vz59Yptbbdf6bkai4YI0ChFEZH9x7WORlAIj6wnr5FXWF5JNh3Wf+up+hltAvs5kNt0k30J6bSnSNK6FDrsTueOxhmRkCvRIn8SzfNaw23g+BSrrkBtK/EyNC946CZqUmv+2MHPFXWFA2X1/Ku4+IcszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCj8cxw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCj8cxw2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886CFC4CEED;
	Tue,  3 Jun 2025 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748972732;
	bh=H+TresmjAp6DkF1nsSoeqv73gw3MtJLFPuO1+ufGoJ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MCj8cxw297rdHn2hh46q0GMNEXVhZ/PbhApr3mULA79TGzsGW04AlReW1RkKrN0Xb
	 PniHJWbEyVl1QtMD+/WZJd5MXS5imvlhptQMzKPAlEh0Z4G73CJ/SC8SFZIc+srZBk
	 5HFV6A//Z6pol1dQJ0eiBatz8pIyl//DZ2MhlkVKJEufUzdDHBF5S9GRjRqznHmkPj
	 V1Y1V6hV6S1BqNWREiBb5hLrhOcJmVwyEzey4tU7223UaTZrrD1tJRo+WvLyd3Ii9A
	 Nb3ZeOVbNHraR1v0Nbgpg3Kt7GDAcrmtYOd2wvbele7ecshGKw4u0q3aZEENPNO3Ls
	 SandPMbOBx5iQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C5F380DBEC;
	Tue,  3 Jun 2025 17:46:06 +0000 (UTC)
Subject: Re: [GIT PULL] HID queue for 6.16 merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <922s61r7-7ro6-o865-1o89-nr357r7rq70s@xreary.bet>
References: <922s61r7-7ro6-o865-1o89-nr357r7rq70s@xreary.bet>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <922s61r7-7ro6-o865-1o89-nr357r7rq70s@xreary.bet>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025060301
X-PR-Tracked-Commit-Id: c48228c476ffe35ec99af6660af602956ffaa12b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2043ae9019e0f75c7785048230586c3f3ca0a2a4
Message-Id: <174897276485.1603771.10560739461150264017.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 17:46:04 +0000
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 3 Jun 2025 09:38:27 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025060301

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2043ae9019e0f75c7785048230586c3f3ca0a2a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
