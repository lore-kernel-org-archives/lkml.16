Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4331B24FC0A;
	Sat, 10 May 2025 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746894511; cv=none; b=i2ZMcsWl6TVmscFmaV3bKtoiJiimK2FH8ym7W1MZV+la3rn3ArClEErpgZU/qQRazwqYyQBmaBLh6pqb0epQOb0E7ET3AuoK9wchInXe2d39gBwTuWkmyrXWVy0xfgMA/hk6DDxL7z2HI+F57PX0U140dZ46vzpD/sryci6ZPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746894511; c=relaxed/simple;
	bh=MTgz+G3IFi88VnVg03v+aPDFMc2yjIwvqN9Huju3jug=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=u82AaJjOPGI+XXsotiwA3z6CX/7B/1TZxzBdoL9Wm9+QgH99G8e0zB23npVAA52XaponQ/fUhemqBJRzAAALmXmj9er0hy73DLVKZarVOshL7mgIglQd18Ad0ym6wk0Opaau93mhxAxCYlE0Wvmq8MOSpDYWf8vovPO5rWsMFVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb0MtYKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb0MtYKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE593C4CEE2;
	Sat, 10 May 2025 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746894510;
	bh=MTgz+G3IFi88VnVg03v+aPDFMc2yjIwvqN9Huju3jug=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Hb0MtYKR+K4c9VgQUxuhjT0fFGzMmgDSN2aarrzWdz6h8svy1yPNr7Bn6ZNC8S26G
	 A5qy6/ZuA4dPzPqzO52q2SLD+tTYhI9I2CKTf7CBsDaV1MrMiptTsvA3Dj7wYsEtKx
	 yh6abny9cccisz18vyzt/mhz8oYK6PZzNlJQ0dzPxpzPkSiPs5R2CAxL2SdxpM3s2Y
	 5nIIJ9E3/vk0aAHx4LLQ0uHKTQIkaFqJX2cwemKNPCpLLN0Ni1THCizyv7Fl499+Qt
	 jL6AD3icqW2uK97h66hKd977bazJpl50W5jMjhnzqFpdWpkk0HXwx+NTIp+Fax0xwF
	 4cPCYfZa3YqEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A223822D42;
	Sat, 10 May 2025 16:29:10 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aB9afOnb3zQRbIPs@kroah.com>
References: <aB9afOnb3zQRbIPs@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aB9afOnb3zQRbIPs@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc6
X-PR-Tracked-Commit-Id: cab63934c33b12c0d1e9f4da7450928057f2c142
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bec6f00f120ea68ba584def5b7416287e7dd29a7
Message-Id: <174689454880.4001425.14160070049772115994.pr-tracker-bot@kernel.org>
Date: Sat, 10 May 2025 16:29:08 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 15:54:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bec6f00f120ea68ba584def5b7416287e7dd29a7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
