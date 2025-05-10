Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53955242902
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746894509; cv=none; b=kygYDZO6WGUBZPs6AyYmx82Ro1FbIoMrWnHEalUmP8HyDQVUM6IihvU0tOoo8KpoY0iX1wMxCrRZ9XUTnCTtzMb4pu+G2v3fFPUJ3yoa2nMEFoW+3LMDnC2tUu9gTPEAF+LsV0H8hJGBWy9DPh3prRhAlc1IB2k9dhubNKwOQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746894509; c=relaxed/simple;
	bh=mUUccUtRE5PX3yjhpqARt6/BnocVZWTSZFSRtFBwDEg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VYHNJT478WpnYZW5/ZDA3djaBvxMM3TeJA69a0u4bcLYjA62JZde2IjJcvqE6f1vGj1waIivxcPYPBynFVB70kugd90zyxJiAuQ4ViHUUv2OyZ6chQFd3wu46dhzTAPRnIc9rLzOieqvUGUKkGlTrQrxcSA5LBv0Ort0IahVbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6ruUwlt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6ruUwlt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D68C4CEE2;
	Sat, 10 May 2025 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746894509;
	bh=mUUccUtRE5PX3yjhpqARt6/BnocVZWTSZFSRtFBwDEg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=B6ruUwltgpwOsH6iFzSqLnXPOLRqjbemh79DeDECof1+sSKgpXzD/0kPeYbXy7D9d
	 3kWiA6uFIh8CtDXrNf0odD4/QwRCXTYFv1Gi2Zhao9T+825h31twugDYu/HYutopyJ
	 x5zUCCw3hj1CULHCNZNO47Xx8U5y9q+ZfV0OxP+wEY/HL5JDF2CFiWf271NcOwI1by
	 iFS6McgmCQYxcayVXWXyNREsGp/3qabzJREqec5ky16aOeNOqPlpKIofqxBFQR99qF
	 A0CyeM9PeXEbDJEHNWo1clrvBtm4NYPr1FfeS5OUpKmXnIcP3+A8GMg61jI1gjcoWr
	 VKeLUo0O1yqiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB443822D42;
	Sat, 10 May 2025 16:29:08 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc driver fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aB9aNLzpdHsXMfBU@kroah.com>
References: <aB9aNLzpdHsXMfBU@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aB9aNLzpdHsXMfBU@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc6
X-PR-Tracked-Commit-Id: 65995e97a1caacf0024bebda3332b8d1f0f443c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 914a1fe5f818bff5abb0e792bc0addf0c7c274f4
Message-Id: <174689454735.4001425.6141498049924281293.pr-tracker-bot@kernel.org>
Date: Sat, 10 May 2025 16:29:07 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 May 2025 15:52:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/914a1fe5f818bff5abb0e792bc0addf0c7c274f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
