Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D112422069A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743532634; cv=none; b=VrpeF2e3FrgTL+fy5ETGdBVj8xaLEGLO1usyU1HDwoWOQL3apmvZw6rQq5j0o5EiGnM4V37cnbHJfIf0au6tukQO+uhfuXBHlUlhytY3m2A1wxlEkxIShsjsXaCzyiMZUQVInNHaRQ9B3/FbIaYK+IFZ2rBjxS09BtxFGaS8R1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743532634; c=relaxed/simple;
	bh=0sCVXouL/W7ZdMCS/MwIuEVli8CGWRpCu91Cs3CO8AE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gimIPL2VFIwAtKLKuWbHEBfPGgCfp0k7U3kHUPr3HhutIDZXsE7Xeu60NHlZNNP52sZaU9vfSLunlnLrhMCSR33heM2lbnPcGZv+PFsQGp+Gs60wqxi48fKsp7Y/q9YiSF01IPRGQXT67cmAe3pgx9jTozQKPjqT3KRUmUXo2sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpLTmsMo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpLTmsMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B073CC4CEE4;
	Tue,  1 Apr 2025 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743532634;
	bh=0sCVXouL/W7ZdMCS/MwIuEVli8CGWRpCu91Cs3CO8AE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jpLTmsMoJG6J6gdCUJq1S/MSvqlfViS8tKrOjmWnfuPThwaegapWCS795U83AMIqY
	 qimDBB+k9O1ewcczqeVJbl47OEjjh1FO5AuBRQZbzipmR8mCJSJTtKkIx+2hioRR89
	 UQZp63jGizcJ5pSSfShXQzaA+/WHjtkMXg9c6jB2ApuSc0Nnel7emSdvmG+UDXgbRN
	 YPK8MQmwjnJd7q3C5tQXrplrbFU8E2+j4XAlR0s0h7uAmbjs4AGsO/Gw0wLZHoSAGS
	 2YYn2vgaZ9ICE9wX9YQryXdq992ORluDUr3rPY1RzQoUJo2t5Vy4adIIoaz+LghXWs
	 zVglJYmMPnGgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCE8380AA66;
	Tue,  1 Apr 2025 18:37:52 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc/IIO driver updates for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-mNmFjLhY50cM6S@kroah.com>
References: <Z-mNmFjLhY50cM6S@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-mNmFjLhY50cM6S@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc1
X-PR-Tracked-Commit-Id: 5d1a5c4f121f0ec50327e899c9450978505f1560
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25601e85441dd91cf7973b002f27af4c5b8691ea
Message-Id: <174353267135.872225.14643376253894354669.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 18:37:51 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Mar 2025 20:29:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25601e85441dd91cf7973b002f27af4c5b8691ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
