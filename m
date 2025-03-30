Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C5615CD74;
	Sun, 30 Mar 2025 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743302319; cv=none; b=P/1KK1Quq2GqbBF7hHd4FWL8DXdLdoAVK3ryOvequsbTFN7bE6cOpLeOKvWJxpQciN25Lay6DsQz2nDsKB/O3e175r+KeFC7maYnhe/ogQ5wutzb2tUdn6mYHgwsq8nJ68uDRqVogxVcnb+TyXH9Ar9MxBH8aFda2eM5g5Hycek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743302319; c=relaxed/simple;
	bh=dke4H65iNtYLLArfFWbzpc57FSu6foQxXO/8yU99wZo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bTmxbW/e05bFnCbWIIZU1K0GY3tB6vW5HEVd04wHvBvNk9SID6wkbIpsRLAystNB4tHeQ82lfWgrVcOLe1Sw7oKmItKhbQEXYFKgLHtCElFvgtD7oFYk+V1hguUyQWPqr1ps9CdyQMAtAOQ9EkSpqrEjE6RIi14w8NjM0XMStf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS2vVyuk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS2vVyuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1DFC4CEE2;
	Sun, 30 Mar 2025 02:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302319;
	bh=dke4H65iNtYLLArfFWbzpc57FSu6foQxXO/8yU99wZo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YS2vVyukzQZMIGI42JcvXP8V/CdibJQQW51g16RQepiGLdukcwnK2gA69QNye7cW9
	 bxPR3EciYdIOirlpbwqgtltuIazJKDay1CYEaURjUeg2IKt6mJMMLqBfNmMEdlEOTt
	 nVgAQl5a5SGYNwG0amEN/ysrwUtC84I/mPGz+iKghhATFouxu0spB7FYII5irtKvcL
	 lD48nKVXlBlmfwo6NimTYEIZPkSuKhaJmVGpEzHs6Pz2V8wEruP350NstogNotZ/yl
	 3FBTSpLh3btuWGj/nDWgB0z9ON2xPGV/AJq1txjey2X15aAT0pSzAbKPb+Q2SVojLy
	 z4ewsvOaw0jsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3438E380AA7A;
	Sun, 30 Mar 2025 02:39:17 +0000 (UTC)
Subject: Re: [GIT PULL] clk changes for the merge window
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328205354.2342175-1-sboyd@kernel.org>
References: <20250328205354.2342175-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328205354.2342175-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
X-PR-Tracked-Commit-Id: e988adcb5dee697a046f0270747c9409c41e8e2a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59c35416f4246aee66b5f5523fdc950b83325d82
Message-Id: <174330235566.3338213.1959809525205204235.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 02:39:15 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 13:53:53 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59c35416f4246aee66b5f5523fdc950b83325d82

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
