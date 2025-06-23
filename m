Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74F222A4E5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716593; cv=none; b=kWH68qZ76DV424SwV3qdnwOKCXC/8Anftcj/SW+M91rpNu8A7AWHYfr+yevK1yu1U6nDEiHlJN5HxGk0sAeDqEj3KX+TW6qvqNpJzRfFIzTMNNRp2DLnc2ioVj8EoW6hnSnF+8JEU1bCTmCUHgpXJseg4xgJoxSEFjknwWeTybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716593; c=relaxed/simple;
	bh=XHJhIO+Sq7wskSiBWJWy7xT3OdEvJ70rAZtPX8g5+PA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mZttUhbKcsabYUd5vvprGcYDFcu+r9ucVMctJqvMB5TRj/7JZWP2x93P+464+pGkOirVU+XDYCxnair3h8xtY/TLrF3g0vjjZ57+W2pbaZQuxjPhoU64pT8HqXL2XygzeQgAb7ct1Fkydel7vT5Rz0smXaKFFrRYQ775zETCDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTozAnqg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTozAnqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99613C4CEED;
	Mon, 23 Jun 2025 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750716593;
	bh=XHJhIO+Sq7wskSiBWJWy7xT3OdEvJ70rAZtPX8g5+PA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PTozAnqgfWMHcbEX8p4aR5vC1fadB8uj3WGhwdfDUFGN0P87Kv/KSiIwQAgyc9D6g
	 /6/GKFH7S2LUpTwEWc6E6zDubgz52D7NpUtpBM7MCSQ35S01XscZavOBvS3pFN0arf
	 yIw4DSbps2bIAspHnTeGsmonDyRY+mNHrBpaFRYQ3rmT7NK/D0WWjGdL6+pRtk9FY1
	 KNqZwitayUACfF0A0UKVsHh54JFi31IjT8JSgjygIRtUiqLOOhr6TiUGU2X/+mu+v1
	 N3NivpTYBvikv7pEQEwVrt73imadBZWddEv2VG/91fDM8j4Cnf27HHx0S8HstQKK3C
	 MR3MgYt5CXERA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E794B39FEB7E;
	Mon, 23 Jun 2025 22:10:21 +0000 (UTC)
Subject: Re: [GIT PULL] f2fs fixes for 6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aFmZKyrDBDzTzs4Q@google.com>
References: <aFmZKyrDBDzTzs4Q@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aFmZKyrDBDzTzs4Q@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.16-rc4
X-PR-Tracked-Commit-Id: ba8dac350faf16afc129ce6303ca4feaf083ccb1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb0de0e220d2233a84a2ff1afb8ffba7597d02fa
Message-Id: <175071662074.3311076.9481880447185959769.pr-tracker-bot@kernel.org>
Date: Mon, 23 Jun 2025 22:10:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 23 Jun 2025 18:12:59 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb0de0e220d2233a84a2ff1afb8ffba7597d02fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
