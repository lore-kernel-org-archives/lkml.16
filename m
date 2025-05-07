Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA371C84AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639054; cv=none; b=FcPi6akRxH4iJyKu/Bf3CF6d20OC3EY1Rozp57HDbHi8ydbU2j7KJBYt3k8qIz3I3XJjwm6L4nu0l5lgcXs/+uq3t3edJZyDGG4mQLip4zyrahpeXCN0Z7eFyZVPA6FJGrHwF8A6jjBBAWudui+Wb609dde4IlxoHRVBsXl5Jvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639054; c=relaxed/simple;
	bh=vDoLSsEGBqiwZ4UyTZJM831Y9USsC+8B3Lf5FH/G3PA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CJwUL6DCEr9MYPOskvUJfjOni7vKKvitxoIGvnvZaeIX5T+Q1WOgbTNp/TLsM8V3EeyPVFxXc10qMJYiupOki1INL+1TECd1vJLTrihsHXxuAHzFN848af7R5OT5tXTiBPldKUw11NWkK7nk4XSRJNorGai72sIgyFS+b7GT5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0PivgCe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0PivgCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC6DC4CEE2;
	Wed,  7 May 2025 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746639054;
	bh=vDoLSsEGBqiwZ4UyTZJM831Y9USsC+8B3Lf5FH/G3PA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=n0PivgCeozcKwBKR35SQ2Ev5F9Ww1+JLBANUurjLf0akbpLPkjfaAOV/eTJ37kYGb
	 9TaIzHJ/bDhvi3mivBFVIThKiLXKJ/+fDVxqT/YFd+HTjt5LRjXmBEOYvIW6xNgmUw
	 nNVDXIAA8FOLXDMJ/9/q32z13S3IXS5j5e4lLqPXv6w750oYcTojnTtEzmxxAMnvXy
	 Y3AVBVsKmR10qyqSvQM+eX1u0oR3QF7t9taGl4fGIozdg748HKClgsacnBjV8nv8+V
	 5lixAkY/pS4tldF5AyG/v8vrA1moKYWQt3NR1Xzh2B+J16DM/3vg+N0Q7+xdKs1Udr
	 Y9CP88O0XIWFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710E8380AA70;
	Wed,  7 May 2025 17:31:34 +0000 (UTC)
Subject: Re: [GIT PULL] erofs fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aBuUXWt2bnmMBR1B@debian>
References: <aBuUXWt2bnmMBR1B@debian>
X-PR-Tracked-List-Id: <linux-erofs.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <aBuUXWt2bnmMBR1B@debian>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc6-fixes
X-PR-Tracked-Commit-Id: 35076d2223c731f7be75af61e67f90807384d030
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
Message-Id: <174663909308.2310785.16255285179931253199.pr-tracker-bot@kernel.org>
Date: Wed, 07 May 2025 17:31:33 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Hongbo Li <lihongbo22@huawei.com>, Max Kellermann <max.kellermann@ionos.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 8 May 2025 01:11:57 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc6-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
