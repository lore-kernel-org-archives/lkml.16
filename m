Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E526FD9E;
	Tue, 29 Apr 2025 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966131; cv=none; b=ggpWxGAn8bt7WRl5tVCKGURbFYhHk+KwbCk27aa2Qwm+NFV4WCnReUqDWrogdpekv/7AGkLmPLtljqePOWYx3JoVfss4QiNkx+rStH+ogkBBC/I3mDscaObhKdboOI/gw9WghflEs9vAadB8lyxhvsPM0IfYJBvobsNBGQArsY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966131; c=relaxed/simple;
	bh=DF3IzHwYlHaa1RbwxrNLks0dkoiya8ORTRXT6M0PCNU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dkwx4+L5YEoMEcdnvhc5ewNCoNbrSY6a1Uk/GLsO+Ra8VMq8HWhW3dDHSCLpeZapJeCrtmHQmhYJVYRUC7WMtyV6YHxcQPeLOXA6WkqwMf2K8kVEJGlBcz0YqYCerXVsvyqcwp3Y2oC1U4kdVjC0wlGlIEg70wJnGMO5e7C0SKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRv4iQjc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRv4iQjc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6F4C4CEE3;
	Tue, 29 Apr 2025 22:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745966130;
	bh=DF3IzHwYlHaa1RbwxrNLks0dkoiya8ORTRXT6M0PCNU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mRv4iQjcY3IbF96Xpnld3jE9bq6AOa4C1RpYw8cvy2KZyPZJUfMvmOvy0R3rD5j9L
	 NEplz2oFItc8AeHtS9D1A42HRuMGUfCbbuI3CCGUUxDi2Fh07leYTceuWMkMr9oGnB
	 XWvp10dg0BWYYT19tIdoT2BETzjUGo5rX4+Y6XPjw/QyEH2bqZo2ft9LRWJwTth77w
	 TXsX5HFVZmomqvdnDfdEntZ86NHXMGl767UPi+mQiSXq+lpsNpNrOV4ZpNG5n4slVA
	 4Qpug6oe43+IfjWf1HwMcZb2AgNjVLCQe2VSp/JU2c5e8tshx0/x8uckAoKDND/1i2
	 GMx/TolUMF3wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0563822D4E;
	Tue, 29 Apr 2025 22:36:10 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.15-4
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250429112434-323291040@linux.intel.com>
References: <pdx86-pr-20250429112434-323291040@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250429112434-323291040@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-4
X-PR-Tracked-Commit-Id: 02c6e43397c39edd0c172859bf8c851b46be09a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02d40046243fa6f00630d93f67651c4f741036c6
Message-Id: <174596616922.1816670.8800118304733555398.pr-tracker-bot@kernel.org>
Date: Tue, 29 Apr 2025 22:36:09 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 29 Apr 2025 11:24:34 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02d40046243fa6f00630d93f67651c4f741036c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
