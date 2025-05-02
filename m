Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59BA19DF41
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223363; cv=none; b=S7c1kzttyUXAWKTzuA5SyWq9k3vUph1P6/L68baXf/ye9DG8W/l3Rb0Nq0UNAOcoP7TIb8jwJtzJUg0ufFVQGEI+6xthjxz3wcniJpcXpQqPpHt+CEO0dnjic8FxBumtBrGwCuQSWepeLijQqXEfn8cIcqG5KYwdIQxr6hBgR4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223363; c=relaxed/simple;
	bh=tvSeCPW9J+1MEZEYnoVNTNuF5VlbB3kil8DoNBx1K+U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ldm3w2BXJvYwTEip2ZlyJ1ADIBx1xuaEIdMfo92LJ7rQbvvcgugKUwE0AksvPdkl4iCAC2rWXWK+dA2S8uvLLiGiQjGVJiA7b7NF6nSXwUwYJ1gYUonigDzpzsBBFGg+z5VCqrepk4U1AtpD6bd6LMs9/oOX0C8R4krjHiaLTPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hghjGKS9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hghjGKS9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F16C4CEE4;
	Fri,  2 May 2025 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746223363;
	bh=tvSeCPW9J+1MEZEYnoVNTNuF5VlbB3kil8DoNBx1K+U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hghjGKS9VVKh5m7PwKtAQz1PXs2Si4Fkc2lKWUSLDiZ8dkOTU5rFZEhLI5NYAR13a
	 EZuVv8Phv5yi2XJ0jYQaT1nOipxy1MIVmuff64C5SGUpHeWwkG5CP+rKTrWXYKZGl4
	 abE9vzhVx+IqS4jZBrjguiOxZDHz6ROJ3jzgMLuAzFBAbu4Cc8OkGfFo8B9z/aKK1g
	 1+fqaOTvfthlGyAYECg8hadkm73F1wzXTkRcQ6q/hgDDZGeQMpUHgnQInZoNk7XRQ7
	 TJhD/bV08xVXj2ww/lhZG73jdQ66CZVxgO52d6HMlnvEvAMnm+QeZLNYaJaQYGNEbL
	 IOolxR2HTHViw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFA4380DBE9;
	Fri,  2 May 2025 22:03:23 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
References: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-03
X-PR-Tracked-Commit-Id: 4e6de6b8f0d5181fcf546ee98b908372fa3cfc0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6de6674c66bce543c6ae62f49eb35a1ab9bb7425
Message-Id: <174622340263.3739591.10860387119656823373.pr-tracker-bot@kernel.org>
Date: Fri, 02 May 2025 22:03:22 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 3 May 2025 06:13:49 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6de6674c66bce543c6ae62f49eb35a1ab9bb7425

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
