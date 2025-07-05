Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A656153BED;
	Sat,  5 Jul 2025 00:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751675637; cv=none; b=kfXsDgwlFfYTpl0rS3KCnhEVgH838XqhS4v2IC0GXdi/8xRHL0rprsH7hxowNuPgJ1NUFb4/93JskZcSQd8jUNRAtF225h8foNpf1pQVEgfOnHdVqNMq2e9msjE25uXAQMDSGruvPbeH96UBw1mRRuDaFtWD3IHWixEmevytBq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751675637; c=relaxed/simple;
	bh=Tr5iJKgiT0z7XojSEiCQJ6l4nii6Ybq+p+mSjtCiPPE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SXMQ3SGkOTjCG5ghXcUV7UnPK9B1+OR/mg1QkI1D6U0eQjENuJPCV2YsiQO0u7FK1ujYN7bni1inZ/UZmQ3i/H46Elc2T81JdGb45O/LgJnPTnwlFPXADlLAmDkIBCvqrX+go+jGTa+uvbVifqbHsObiJWhbsl5/lgLlg50weVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A75Uxm/x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A75Uxm/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B63BC4CEF1;
	Sat,  5 Jul 2025 00:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751675637;
	bh=Tr5iJKgiT0z7XojSEiCQJ6l4nii6Ybq+p+mSjtCiPPE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A75Uxm/xDnMTEyLAqDffVeFrgSSzivyx4oLKgRRSKLwL8jUBaBFxnmjloEOua+vDy
	 gGk+119pky8NO+wnTfESVBuh4PO5sA4fBVo8rUdhpvzgXkhWw439plmr/LZbtcMdVU
	 YXyIUdH8Og9oXYuu0hN/vZLxXyEXFQSeFydhKwinWR1B/3IAdSd0zOlCParUlHKnpq
	 s9UkMLSjaTZDvecB+ef1/5D1PhvWVJgI4pWC2gJIYp6E8SWeQAn7UWTTER0eGRh9Ia
	 UWUDVhpKc+Km4WOfV60LCnqxd0OKwujiLcTCGpk/2VXqnCAIqhTlNw2pEL+FOqjU5W
	 ZHY8txcfa0BWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F35383BA01;
	Sat,  5 Jul 2025 00:34:22 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <01889b2c-3a49-4510-9e25-b4becc0e4a2e@app.fastmail.com>
References: <01889b2c-3a49-4510-9e25-b4becc0e4a2e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <01889b2c-3a49-4510-9e25-b4becc0e4a2e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16
X-PR-Tracked-Commit-Id: 3f3fb97374308993dbe8884f44c2579a81b90bfa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1bf2ef6259e6aedc3f952ebd9bc056605563b74
Message-Id: <175167566071.2360325.16244358644323018769.pr-tracker-bot@kernel.org>
Date: Sat, 05 Jul 2025 00:34:20 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Jul 2025 20:13:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1bf2ef6259e6aedc3f952ebd9bc056605563b74

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
