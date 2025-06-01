Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619671F3FD0
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748793915; cv=none; b=TJM2YxR4ogJqi55HbLe+t7xOrgan+nWhkLVWwIEc2/qrrSN6EVPMSTE11W8O3c9i/QTjt3YZgMR1HD7Nv+4apoIX1rAmvISmlaRPK6s4GpRbBhAu3ihkQRzxt1HNs4MtIQqljlNlC4uIJr7c3qrFYg/5krb2URj6iCN2IQpI6dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748793915; c=relaxed/simple;
	bh=lVajFAdCI1KPJxrQZROS4ycsSzNRhfdxSgvxED1eXCk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dp2V/oetnue95Lcv88hxetoNOk3TvB3oarNtUr7IUxmi5h36j9uPTNH7dUYs5WrgYLLdp/RS4SwA+NE5c+ozgAosX6XphhrQfSyIJNDsINs9zS46fPl5WfD3SfCNqEGNLqNnPcLkw6/kIKL3YJ2egR4I4DxaHhQh3TmDE9jNnaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfZuKzeY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfZuKzeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CFDC4CEE7;
	Sun,  1 Jun 2025 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748793915;
	bh=lVajFAdCI1KPJxrQZROS4ycsSzNRhfdxSgvxED1eXCk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XfZuKzeYuf54dkpSqRh+KfF1HHO46vGMQS3P8nMN5OJbDFu/WOdT9AkyNGpIFoJmb
	 ZER3r1uK1xYR5i1A/fV5BiksqwIGI3aQvRr9eN7HPLiXSIxEKpwsIgShinXGkuINm7
	 Rm4rOFJGM5+P/zVbUeNN1b02eCa0tJb1joYAYpV2PQ7hhHhFKiRhDHuvhbUASpm+56
	 nbcWGMKErUxmQg9TGezETNjhC0lRbzdkKZ3OmMs9kalae9MDAn0n5Mkfac1Fnl5tjz
	 VMUewi3H1F5aGxVgZuICWQaDesqtzQi0o/TVI4G8s0WGiJPVo1cgUUNnPEHqc9/6G5
	 mAXxSJkszM9gA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB5380AA7C;
	Sun,  1 Jun 2025 16:05:49 +0000 (UTC)
Subject: Re: [GIT PULL] I3C changes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250601092038f33de29e@mail.local>
References: <20250601092038f33de29e@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250601092038f33de29e@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.16
X-PR-Tracked-Commit-Id: 00286d7d643d3c98e48d9cc3a9f471b37154f462
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2604f8d43bf414db54c42ca6ea52803ce1c0b2f
Message-Id: <174879394805.436212.5089571301362760312.pr-tracker-bot@kernel.org>
Date: Sun, 01 Jun 2025 16:05:48 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Jun 2025 11:20:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2604f8d43bf414db54c42ca6ea52803ce1c0b2f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
