Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413C620E6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750294306; cv=none; b=LIbhR4eizceRssZW6OyEt+mXxLR17mCXB0lTKoi+4nYSoONI9Ne6RcWxu3dEm5BCfV7zueVRMqLu20FeKbIj6GrkvtH+wctDu566QwdjGJWJRmHMBMkPeU+fba+qcwePwsTBpKCC/5cCiXEy8H6lqVLSCcKQc/JXdjXIw1Mhowk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750294306; c=relaxed/simple;
	bh=YYAAVnUJun7wXm/Q78Rqwh+hn4IyK7gg84jzU92RQyY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GdDqiMcBzdZH8x8Mxt8iYF6TceFE+fsHLoGwQna0xnkBnJdcCtUa5vIL03ZbwGAWOHH2Moa9eh6Lh9veb5vNCgORmHYFDUA6cATdoM47taEqI3FUPQA+9ZVve+qlX/RBIoegX6ypHcUfkZK4vgOk7hQDpoC8vfwsY/MR+/++pQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L96wqF2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L96wqF2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6402C4CEE7;
	Thu, 19 Jun 2025 00:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750294305;
	bh=YYAAVnUJun7wXm/Q78Rqwh+hn4IyK7gg84jzU92RQyY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L96wqF2lFvcUIBXKVoDsOS8ndpKEF69IO+FsKMPcEF0g6bAadbyMx0EIOH+J7rKWf
	 +U78Xb2cv3R3Yr/NvBm6IltlYfyeerDIypvq4vEr12zU9CxWtDtmAupxDNdH4+VWZc
	 zjf+Xmrj1D4tBOH2I3lCgbrRg+RU+JlGBw8+X4oKmyYRT3s9ANBDMIBldt0zdvVgie
	 lk/WKDWkzcOXTwAwKhO5khDywEYtd/d+ozeY3XkWLm44epMww17P44tTmIzxrYf4pe
	 Rc9z3AGv083wPWIe4HbuQCwRofB8E7UBrvJ+w25VqFpfF7Abv6MihDsLe4BMAOmV57
	 M7xnHQUVp1umw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ED33806649;
	Thu, 19 Jun 2025 00:52:15 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aFMn9I0c7Pt9YDKu@pollux>
References: <aFMn9I0c7Pt9YDKu@pollux>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aFMn9I0c7Pt9YDKu@pollux>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc3
X-PR-Tracked-Commit-Id: eab9dcb76b9fca47402c9e93afca243e745a0f02
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 229f135e0680da3dd0bcce515c07be87858f1d12
Message-Id: <175029433380.307467.7305287180057229820.pr-tracker-bot@kernel.org>
Date: Thu, 19 Jun 2025 00:52:13 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 18 Jun 2025 22:56:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/229f135e0680da3dd0bcce515c07be87858f1d12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
