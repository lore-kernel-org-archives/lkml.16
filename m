Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A721CC4D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749240662; cv=none; b=YcJEzV7HMzrILXH38+9MgfREdA2K532maLlQAxLwOu3GAPIJRmWy5Et+mZ1/yk+WoUEk50EqHSB4rosLjJXD4gJ5mUoQ6qyqeQvY2ty5h40TSgx+bj/hSLjDqGJVkMObhFfYa+CwYyxRjdDmF2y0i6oCv6Ablv0t86OzjnHFzvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749240662; c=relaxed/simple;
	bh=clOkOoJzn6rZefCGSVHw8GI2BsZpIvBCusr9MlQ3Jr0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=K0Dm2iwNQu/Mktj75sj6PzrAkBizCTJMbD6Ce5bPlX83mrDY2LKxuRGbSyQSuRIJ2y1HzrnQJr6dOmphsv/ZAZ8dicxkWK1+rrjgyhIBDPhLnzSVKempl6iiiS4NFO+99z0D9Fb9K7P9DQakCjvut3V+hEFStWk2RiTdBeHrYfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+Gciyf4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+Gciyf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA749C4CEEE;
	Fri,  6 Jun 2025 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240661;
	bh=clOkOoJzn6rZefCGSVHw8GI2BsZpIvBCusr9MlQ3Jr0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=i+Gciyf4wN1uHXvzGTAVypaWj8siMr+5R9pLQ6P4x7kFihf0yrJtY5xUp5+5UOi9H
	 uBjcJ5lUMxGvm2q+wlUQK1agtkS8IvHhbdEji3sHJ+k5i51uhGw40bDbMaIyj6mkRM
	 yfR3e2F+p7oyjyE20ipkkqS1Aw/rSzI87r4FaeluJpvD4hM6DI3o9ZuA4f0sKKzHYJ
	 79MBS8n9DcunC+BV4JOokjUPTUe3z725IOjLDfGROzD21+gJ/ojPc9p3Vzeh2qYlSg
	 lb35tJBJHMMEi8vtGWkJeJUJ0sapxdhrRR5zTdbU84CQrsBTn+SrDEOPrsbxUDosuX
	 pCyUlQdXKMpwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF953822E05;
	Fri,  6 Jun 2025 20:11:34 +0000 (UTC)
Subject: Re: [PULL] drm-fixes, yet another one
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
References: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEMI9P_NF-K-_sLv@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-06
X-PR-Tracked-Commit-Id: 6f7e234f74caf5f8863bbca51b1b135d0736b0b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5fc6c6f258b34fd0d2ff2a63b8a407a4dcbca750
Message-Id: <174924069335.3964077.2712700761982540484.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:11:33 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>, DRI Development <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Jun 2025 17:27:48 +0200:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5fc6c6f258b34fd0d2ff2a63b8a407a4dcbca750

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
