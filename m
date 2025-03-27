Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080661DB158
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108454; cv=none; b=l/61IB4w0ZvBU1iu2h1fF+77C3IkxedS7/hsFbr5Sd4sSu6ZmuvXy745vO11pYgxs+kvVMKXMsbIORcA7zXdzeWWauNuyMhDGmFKgLLqiAZtCIKOOC3FVRGMzmooD0PC7uPBJybgYdcmbrynzx3+kqkFX29uL+i5mEiRYcsEpZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108454; c=relaxed/simple;
	bh=SSqSR2X3QA5PuAbVG1rRSO63kEdL1Kgl815d31E3FgE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hNHd7ycLypf2QCOqQgfOH0u00AfZVufwnlXH3c1+v6ER5vcc5bqEEMBM0+6/MQZuaTkB54JEqMUsnrSfzg01cJakMTzFA/m/zvfzOds0cXqjTbPrWweilqNgYKz61wAeWxJCLk7CzJVa/sV71aP9jRgms+gcG3GhyibEbG+KlNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snS2yRYA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snS2yRYA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6BFC4CEDD;
	Thu, 27 Mar 2025 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108453;
	bh=SSqSR2X3QA5PuAbVG1rRSO63kEdL1Kgl815d31E3FgE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=snS2yRYA29QZFTKsfBmPg3E1/um9tfEwTODkHByHcrZaPX7l4T3UDV5X6ij5C1H8x
	 r2eIvaykXTsSsUSHkjbF87pnfk5Eqankh4zpQV6UfwYBz6Mj+Lv63MGrWUB70SXQ3D
	 XvkYtHXOz2rcP7xFk3hBfV4edGpzChejAFjfl8S/YzbWZrR/4zrE6D0GbSTOPNPci8
	 rxe5iO1I60MZJBg9GdYY1duIdxXCbB2cgqZ7SjtGhhlb5SGiw/5HTBV2XbrtXya8Ov
	 gNox/Q/VPsmRyTbKO6Copk8sU2jvRfzu3rLhfmCMmENT4GwZpzOSnikNDa/oFntXbV
	 on/XY4jhH+73A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EF4380AAFD;
	Thu, 27 Mar 2025 20:48:11 +0000 (UTC)
Subject: Re: [GIT PULL] erofs updates for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z+A9XO3+rPjpLUa2@debian>
References: <Z+A9XO3+rPjpLUa2@debian>
X-PR-Tracked-List-Id: <linux-erofs.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <Z+A9XO3+rPjpLUa2@debian>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc1
X-PR-Tracked-Commit-Id: 0f24e3c05afeac905a9df557264cc48f3363ab47
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2e7b0ffa56185d04871c6fe317b36d30ce2861d
Message-Id: <174310849004.2212788.17116773693429135615.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 20:48:10 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Bo Liu <liubo03@inspur.com>, Hongzhen Luo <hongzhen@linux.alibaba.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 24 Mar 2025 00:57:00 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2e7b0ffa56185d04871c6fe317b36d30ce2861d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
