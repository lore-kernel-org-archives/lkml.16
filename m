Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974626462C;
	Mon, 10 Feb 2025 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222849; cv=none; b=NzpKaFYOKw+FSeQri0H/yKPipXuGiu5y0RdTQI6Ug2KHbXBS+UKnv1yIzSiaO7ZSDY210JT1iaOH6kFv5I+EDMPkmROFFOz0KGJr3TRtx8JYBTRM/RfkgteMhEZZ1SeECkGgW4lrpdco2LTzBMUURHPkBNy0i30bq2J+saG4Wqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222849; c=relaxed/simple;
	bh=cNirCx5bTP7gkP8Wo0RgrlsXAGibqS0Q6nUiXBnhN3s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SoBplG38wN5bz5N2edWXEtijh4aWPNgR5amvTWn0H6siVYtfOeJfYU9b0eEpj14E1n9FwuUFz1gjMquoCxTPZ00iXcQX/MzhaRY8cDcFx/SPyJHHSTh12qYu4zkqNBqgSZGQo3f3J52RxST2bNibA9CSyVD5276g4vOC83O4uFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mf9Ku8TS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mf9Ku8TS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2262AC4CEE4;
	Mon, 10 Feb 2025 21:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739222849;
	bh=cNirCx5bTP7gkP8Wo0RgrlsXAGibqS0Q6nUiXBnhN3s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mf9Ku8TSRur718elmZ5ovEeT+G90mTTwTKwVMxVu7fAWQzgcFdbzQ3fjVB4oSMTN2
	 iXAxy3aJPYkwL+Jpx5cEe2y1jof+m243Eg5XxXsto6kWr+GNV1gDRsXRenJabnsTUn
	 zFRNCgT9NH7Of5p4Of8L0YtW8rBx+lkC+y+U4HuQ25fT3eb03rEMLsO9A+OtJlkdRr
	 c62xEhoUxzmS2X7seEXrJiGsSdA9yimB8GuNJvkxnVSGhVhqxFlIk30m0c5FFy4oY9
	 v9q5R/8mzuudeZ4i8+piFFkc1qvXUhJahYugnSiI22tySqG20ROlQRtTf088eKrVGN
	 Jimg6IzihsbNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB28C380AA66;
	Mon, 10 Feb 2025 21:27:58 +0000 (UTC)
Subject: Re: [GIT PULL] pin control fixes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdZh-=7qjhmjDwqLGLnuoD3QtKyt27Q0qAZAP0Xw23-o8A@mail.gmail.com>
References: <CACRpkdZh-=7qjhmjDwqLGLnuoD3QtKyt27Q0qAZAP0Xw23-o8A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdZh-=7qjhmjDwqLGLnuoD3QtKyt27Q0qAZAP0Xw23-o8A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-2
X-PR-Tracked-Commit-Id: 0af4c120f5e7a1ea70aff7da2dfb65b6148a3e84
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c581f8c240f57a19c857da3e0eec24285354fdb7
Message-Id: <173922287756.3879151.12119629319101234071.pr-tracker-bot@kernel.org>
Date: Mon, 10 Feb 2025 21:27:57 +0000
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 10 Feb 2025 08:23:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c581f8c240f57a19c857da3e0eec24285354fdb7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
