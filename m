Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C021E0AD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743955320; cv=none; b=nnbDiMwQlFyl2agWOWZ8khCQM/4UxTr2q+WCMb1xnjBgEnjL/O1UUBNTiVnG07i+oGmYTrrLY2T9tmkhg9VUpU1vVvXgMu8oIaxw6BuNf8LpXFXGvIECeoK7oJwHY7/mrAqFzIz5FhuSnI56ZNlWVOSApVWTYmmizFDkNFV6TYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743955320; c=relaxed/simple;
	bh=ZkVDPMn1xFVcdkrNSQu9Bq531CXGKWQ7NB2YqE/rY8g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lzs3NO3vjdqowouRSK/x92r3HWxpsDcAThquvEC55OC2gxpKAYBNEbBrljoXUzyMyP8ziG+ummKK13T4EHPDX4li2mIGep20rL1q6+GIT/msagP/Cqv32AOnJRYyWEwwEP+jtfN7bLiIm7yq00PVeiUobFcr+k+4Us9GX+xONME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6jacwSu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6jacwSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FD2C4CEE3;
	Sun,  6 Apr 2025 16:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743955320;
	bh=ZkVDPMn1xFVcdkrNSQu9Bq531CXGKWQ7NB2YqE/rY8g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=B6jacwSuLu2ma2b1iRn5fYq1elaban+3Cpcwcj9w+cwHrTq1oZy3/YmMEfEgRwTch
	 lUfTWr2oGxRP8k8V5vYA86FmKsdoatd4b7f3HLN2nLqxmZ2jb3E1hfq6hkvBTqUUmT
	 C66q+ia7W+xaew38ucdnmS42XQR6Xvqiv2RQi7BspmoslxR+RBq3h6LtOkPjMHv6pC
	 T0vwvTtbZW3XzpQ1kXWMYHh1y8mBMNoXYAWVHBzqMduEpPKU0SsjUAlZG2OMN7yGLM
	 bzi4Xe4wCzf6vNXVgxCyYzql/LLdz6hyhZGwgV6HI3YEpMAXBc3exHrU2v90LxijEy
	 fYMM1JMnWZsSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B56380AAF5;
	Sun,  6 Apr 2025 16:02:38 +0000 (UTC)
Subject: Re: [GIT pull] irq/urgent for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174393636520.2344834.9509649399595861197.tglx@xen13>
References: <174393636520.2344834.9509649399595861197.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174393636520.2344834.9509649399595861197.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-06
X-PR-Tracked-Commit-Id: 9b305678c55dd45044aa565fee04f8d88382bc4d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff0c66685d93659655886fa61750947bb7733ba9
Message-Id: <174395535710.3904920.14081184755383166975.pr-tracker-bot@kernel.org>
Date: Sun, 06 Apr 2025 16:02:37 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  6 Apr 2025 12:46:24 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff0c66685d93659655886fa61750947bb7733ba9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
