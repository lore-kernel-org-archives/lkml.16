Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6111F0E25
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536899; cv=none; b=lv0442noqB9z7GbT03QQOrZgJwXJj+LpZzfUE5M+z63RMC6q1/NUf1tOdHuNems2mYiSV0Bs97C/Uixc4fPmrJFZrRvswE5y9fp4exqpwjHQbKhBBxfD5vXZ4RsQISv8m+OyrNI1bTPdJwb+nLiPBPHP2hRZXTY4BaOyRT5bbl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536899; c=relaxed/simple;
	bh=D0w3RCXmmlVRyFHa9Vla8s7ayJI3VrPdJ4JsY1gVeOM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=rOYKlM9Ore96uv1yQNllnrvxEmkk1G4AjQaSDLa8zG/INetZzRevQAYpsZ8N4cjC9q+BxKlcpcfgjxf5y5EMqsh0+DK3sjytuS2Z07Dc5mLo4R4zUi14dgL9S1fKWrBzeUt04jWfCj41jGYUZxbYiFsu8Fxmmsh9KexS+/ot+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YN8mJU8e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YN8mJU8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BACC4CEE7;
	Thu, 29 May 2025 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748536899;
	bh=D0w3RCXmmlVRyFHa9Vla8s7ayJI3VrPdJ4JsY1gVeOM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YN8mJU8e7uYQVD9av7IQXTdnObNJC4sr1JGb4bgIy5kKpCI+yXgEEy7i2h/g2VLcL
	 Ix1TI1LL3wUfJSMV6zi3RIJ1vkO9oBF4X8gAgLND2XIuP2DekQt2NOyd26nGhUV8Gc
	 Y6KRziVnzUuNq6Gq6SsTp7Zdv+SAX3ybESlleP6pDdg7Wd97yHiEJbyKP6/DeIFs4b
	 rP+c/KPJfoSA5qmO6hW1LbRteu4TGVEsyk1QMSzXvLO4nKQes5K75H8mzNJcQti3Fg
	 MhzDOQN2nfCKS56eN4y2N7hbDAxvTMw9BK3CX5jLafctIVPbyjghVALspWAqrjgHmf
	 Ajo7SiKjcKLDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE0A380664F;
	Thu, 29 May 2025 16:42:13 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core changes for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDcyRMojWUbAllVX@kroah.com>
References: <aDcyRMojWUbAllVX@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDcyRMojWUbAllVX@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc1
X-PR-Tracked-Commit-Id: 071d8e4c2a3b0999a9b822e2eb8854784a350f8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d230d500b0e5f7be863e2bf2386be5f80dd18aa
Message-Id: <174853693269.3320073.15764367237946119539.pr-tracker-bot@kernel.org>
Date: Thu, 29 May 2025 16:42:12 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 May 2025 17:56:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d230d500b0e5f7be863e2bf2386be5f80dd18aa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
