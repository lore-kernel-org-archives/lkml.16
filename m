Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF39217715;
	Tue,  4 Feb 2025 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694360; cv=none; b=p0929JMq64xfNyEs+ap3iHugpLAqSHwWwV4/KtRnFwGsxw6W+2RH7Gd5ZZhVcTdBqOdW17nvVqJdorpJUVQ4VaNKdYigD+WlxUmiPQIa4fU9uzV2x6AUTN7VjOc7SMf9gLaUVdu2vJLteHzRbyghacXG12qhhaMuNYZQykfWbe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694360; c=relaxed/simple;
	bh=DJk+IMCtm789I+uHk9Hw/YuUQBXDoupzw/+koEsxNNg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=l2B+NgRHcJ7nbUgGljQ695XA+4u349N53M6gQofp8c2iRSe9r+DNzXAaMQBfRF7E70NtbiB2XggoZiqTkNHW9JpTeXpr3ub9bbqpBzCtLmSUVT8OcyzeeZi7qRE5RJzWq4/XMxbVpYahXfdwLS7hRNK0zLaLzcJxHQloJPgXrsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ8ybcxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ8ybcxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CABC4CEDF;
	Tue,  4 Feb 2025 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738694360;
	bh=DJk+IMCtm789I+uHk9Hw/YuUQBXDoupzw/+koEsxNNg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CJ8ybcxealHSTmDdcXaIZG/MSs2a2Aat/L7viYYQ9oWWTHPQO7DK9dS9MFxKNgjyt
	 SJwnNlGyOl6Oh1H0NKR2N8xn4GoBzsBa47peF58SjiAeCJZnZLNrLq2/ID+usoybUU
	 vHHW/RxGb1zIbkAgc8sNJatvIMxTnDXIoqPiAyI+mxvPUmFQuI2NnNoETPgFFbJoeg
	 moJ9kwOorYPvt7oKDozFyv3PEnRF41T3tCicmjFpRFR5WYnJxXG6FHlYj+TCgUaDYY
	 MGUf0fMRLGWYMP23K6WXAilYbrRZcW6tQR/IsUOpIWV6fxx9UciaS/sLpF/J5/SJBy
	 8b8ijN90qSijA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE17E380AA7E;
	Tue,  4 Feb 2025 18:39:48 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.14-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250204103633-1857020998@linux.intel.com>
References: <pdx86-pr-20250204103633-1857020998@linux.intel.com>
X-PR-Tracked-List-Id: <platform-driver-x86.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250204103633-1857020998@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.14-2
X-PR-Tracked-Commit-Id: a787ab73e2e43c0a3df10bc8d9b9b7a679129d49
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5a2601378af1ea1e2a51d613e49e629159dc956
Message-Id: <173869438737.99131.490078309556739538.pr-tracker-bot@kernel.org>
Date: Tue, 04 Feb 2025 18:39:47 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 04 Feb 2025 10:36:33 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5a2601378af1ea1e2a51d613e49e629159dc956

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
