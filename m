Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200BF23FC5F;
	Sat, 31 May 2025 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705418; cv=none; b=CDHDL3QsaMGYxnCGeWnuXHWrPa7yfsq03K/ZH1w9NSP2eMFdKWgdlak5G5Gmas0nOZ1XNP3/0O3/y9xiy8/pSIW1wEcb5jAQl8sIk1A7U2MreGCNvx2BI8/mOG71jeDNu0F10u+EucZt/GPpHjxnF9y3gtnwTuwVZzBtYfpMuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705418; c=relaxed/simple;
	bh=/aV+mxMZ3EDv8/MoJK4yjwQOt7JNJvr+1eK2NXFLV78=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kKu+uqvlHinUQX5wmP9fxXoICib9DceIA+V3Ux3Tyw/bkDWyVP+JpOcPQHORHlqlHBzHOxqtk9Qe0bG/rQYGk5LW29nWtBCyhl3hD5tbPuRl2CNPYaOf3lu7cVPr6TlUNTd5G8hCafivsIf+ZGPZlQgzkDUqI7E41OZAEYrcaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rumRNEui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rumRNEui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BA6C4CEE3;
	Sat, 31 May 2025 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705418;
	bh=/aV+mxMZ3EDv8/MoJK4yjwQOt7JNJvr+1eK2NXFLV78=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rumRNEuie4jf5TuZ5ntFi/P/iTU9qILW2oLhJBITJ75rtqQa4loDUPlwJNRK1H+eS
	 LRJRMkWj9HFSBI4+tUO7mEWlxifnIB5cToGrPEq0oRVeewaTEwXpNH0Siz2sCKh+Gv
	 /gHt53zahTdbi7KUPtyB1bOYlMmRdQc82cutK93dSsbr0jcQIZCMm+Vdk20jAj+CRC
	 5WRq167X2NGkpnIEyhZP61PYmbD6plGGGBRgNAJj6IWYsJibhZtb5YfyeY/LY4sk6i
	 4be8NR5j9HZGUzgPlXaPNTPmnX+arQt9X6SSZ+DmUxDmiMITdfT9/x3Cn/wMieizpU
	 x430Gb9uhXcIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DE1380AA70;
	Sat, 31 May 2025 15:30:52 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] ARM: soc updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.16
X-PR-Tracked-Commit-Id: 16066e29d3f5a45cd1ced62dacfce45c9560be1d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 500af1defbcbb6113c9a958b791517d0562b8d6d
Message-Id: <174870545090.163157.3390188665573038835.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:50 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 31 May 2025 11:02:50 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/500af1defbcbb6113c9a958b791517d0562b8d6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
