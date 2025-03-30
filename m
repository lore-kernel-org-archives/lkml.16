Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC47DA9C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 02:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743302321; cv=none; b=iFBjE12fSE9acFPUugiwsRqnzyUB8vt+SaqlQue0/uXAf/uQWttl34DNQFpDA8aIao4vG2gZiKJAMRZ/TddlrvEt8A/6G04+7dsVo9jTIUh1JXXp9aMXkBD6p8Xm6jfPPG6kaKu5loEYCyODYdg5JyPjEE7OblSSDEoCqj8Fyaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743302321; c=relaxed/simple;
	bh=jVzXXtFsZs1LRk56YDRAZzdfKR4hNfDqQYweu8Wq3QA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tnnrkYvJBNaBFyZIcDRb+yRIktKa2Q3Ij9DD2+1p+yLZg8Skj0SdPwV57vIdo1CAzobuUkf9G58Sj8DYggNqiy/pYGed0ZpOR/JaC/OxWACDIzRMRGdtpU4xgc2vNCb60cxalbT9ckN3LKqY2AHcjEYxsKtzaC3A2wF8f4tkBX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ur7rOYMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ur7rOYMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C900C4CEE9;
	Sun, 30 Mar 2025 02:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302321;
	bh=jVzXXtFsZs1LRk56YDRAZzdfKR4hNfDqQYweu8Wq3QA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ur7rOYMAJq9IeXfhioYQQ5c3c8Tkka+seVmmiEOsmp80s1Q2YqZdfM1ihXAYkrqzD
	 lxiTWBFVe+E5ScTHYqhXA2wrVsY+yoBV3LrOmJC/nMJp3T/j3X96XetYZPMliFK6A/
	 uI7VkWsZZ53JCscXEd8WS7+RZmgTcWvI8b7kIjQq5TgBd6HXBhQ/RhyZ4/O4gohgXE
	 mNuf22fEnOSrCWAvkgKNmmKIKykfh/JfgSbnmvA1CT3+Bs7Qu9wXq/GzvGzJ5mkTqN
	 0JLRuM8x42MvuyQ9oeUDa5T27+bBzzg1ykO9SeS5maXgESw68be0deBOC1PPU4flld
	 D+YsJWsbzVesw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C46380AA7A;
	Sun, 30 Mar 2025 02:39:19 +0000 (UTC)
Subject: Re: [GIT PULL] hsi changes for hsi-6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <qfwp3ydt4iu6cwb24bjmwakhfyw4t3zhbdew6zw7wdunes6ndg@qe6gtjusgln6>
References: <qfwp3ydt4iu6cwb24bjmwakhfyw4t3zhbdew6zw7wdunes6ndg@qe6gtjusgln6>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <qfwp3ydt4iu6cwb24bjmwakhfyw4t3zhbdew6zw7wdunes6ndg@qe6gtjusgln6>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi.git tags/hsi-for-6.15
X-PR-Tracked-Commit-Id: e3f88665a78045fe35c7669d2926b8d97b892c11
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91481c4ad0e532e8459372fa91306de8c02f2fc1
Message-Id: <174330235767.3338213.1051717106111324331.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 02:39:17 +0000
To: Sebastian Reichel <sre@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Mar 2025 01:26:38 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi.git tags/hsi-for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91481c4ad0e532e8459372fa91306de8c02f2fc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
