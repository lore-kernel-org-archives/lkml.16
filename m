Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772C41A9B53;
	Thu, 27 Mar 2025 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102608; cv=none; b=AUjU7IqTl+Q89xfaBLV2TDXZDfHScOMpOuCR9W+O7Er4ONdg1uHDzScgnJ+oWQtn5ojtLED3b3pKMldihAzGPrVmrC4oQAIaKgSe0LSGqtc9UlQsnSkW00PBruiJlPxQwrkmyHUOpw5gLX4mf95VqBA+PR7QJK7dLjW0ihsrF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102608; c=relaxed/simple;
	bh=RAMEZYMN0fhU9juCLYu0gwCyHolq9UhNycNWv/OYy9I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OzDyZ4UHd+pEaO86GKZeJRbAhzESK3fX+InZCbrQssSLAVmyPco8Afjpdmmsbn5UxJ8+mOdfgyLxQ8tlTiAVMLxsGCiYihboFAnJKsudhwzJCHSatgGjiWImTtKdNyD6ZMLfNjEPVxoEOJEkHgd/5xXMDvUI6xmMYL7fT3V8v4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuLFIOv1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuLFIOv1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F3AC4CEDD;
	Thu, 27 Mar 2025 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102608;
	bh=RAMEZYMN0fhU9juCLYu0gwCyHolq9UhNycNWv/OYy9I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LuLFIOv1UGdoZLK8p5CMd8KhTEXVKtIxxEZ7z+rmDNvZaEOdASCVJvu7JGYB3qrdx
	 NLysmq5sS4vR61qXy0S4Iyw4KKeTWChHD2a+9FmpvSSuXC5zXjHwL1Mil2SH9miCIU
	 1rfNuN84Xc96AXWYuqP6Z+Z0Uk/SZlO+TNNm3nQklY88R7g99aTNjXwFxwgtBzZT1x
	 W6wa4oe7F6enwrPo1Vw2hUEeUppRndz5lyAJnfZzS5P7e+dtMh+NZDpjCqaoOLnGv6
	 lgPIeoM07k747lkS6+7Bv6s4xyNhO8i2q4qPJKJS5b3VKN3/st5SMlebtywM+a9FMS
	 quon4Bc1ZoHRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4DA380AAFD;
	Thu, 27 Mar 2025 19:10:45 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <cd6b28a3-7e46-40a0-b846-8b44031eaed9@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <cd6b28a3-7e46-40a0-b846-8b44031eaed9@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <cd6b28a3-7e46-40a0-b846-8b44031eaed9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.15
X-PR-Tracked-Commit-Id: b82310b5729ef3ca0aefdc0cf0c575d52f227235
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f24482304ebd32c5aa374f31465b9941a860b92
Message-Id: <174310264465.2176831.17533773837336548574.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:44 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 18:59:28 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f24482304ebd32c5aa374f31465b9941a860b92

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
