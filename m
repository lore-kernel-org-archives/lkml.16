Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91F7464;
	Thu, 27 Mar 2025 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108450; cv=none; b=h+/Fv+XGxQ/ibwYEJ9fDYVt9sHUzh7vy7cLeX1p4IVPWP0a9g+qdhBxmCtQzwtl7tbnALyLXV/VzHXvx6IrXqtnZl2ReJ/ay9Coqci1tzt+1yvKdrAaijTPPBNT1XeIOWH8QpWvFXl0QMYgnAXcqyheRMLW+fA5atoyt1UBy74E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108450; c=relaxed/simple;
	bh=vUOXVo407MvZjGupGUNMfN4n//UaFxJ/ZNzxfPzbxFY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jRrP9eomZ27i/+Gj2AZ5o17YHH/a04CxrOnbAsjuz+UQ8JeGZDVIUeHB3NyYQUNx0mQUt6CFiX0n3rTa5WZkGIWod4Sxn3EeXDOJklVX3OiSlTyANkO7eOpWcfpQlaJCmfxMTHm8MAt/kVPdWDW09NNb0nvUNbMdgxOeQZOyyqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evmXixT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evmXixT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E06C4CEDD;
	Thu, 27 Mar 2025 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108449;
	bh=vUOXVo407MvZjGupGUNMfN4n//UaFxJ/ZNzxfPzbxFY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=evmXixT/k6NlwxNogd/bHFp47dTEQ1ACv9z8i9lJ7Wj+J8yiWFviFrV9NNdRbqVY8
	 ufF+FAigoohZvscjfUULHi/PkOO0qCIxtzWChdxbPSVHkPpZRRA+rvKZBJ3Kni9jCh
	 WlVtpHFnCOGZ0fnEq0V9HFvIuITh/e8/rP57sy71J4Es9nUBjbXzVE0izyWqhoT0NF
	 KqiLJHg7i4L43iN3X+JFoE2Rngt2KC6258XGYcQzOZFW60/Z0DYFpyEh0TcC962oC1
	 YirWQj+5JfBPfPhZcMCLp4L3w5yr79s4fDaTJZVY/cawKlzxZwcnY/hqK8v3XKSNL/
	 YS+QRCxVTjfaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71424380AAFD;
	Thu, 27 Mar 2025 20:48:07 +0000 (UTC)
Subject: Re: [GIT PULL] gfs2 changes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250320203048.2483603-1-agruenba@redhat.com>
References: <20250320203048.2483603-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <gfs2.lists.linux.dev>
X-PR-Tracked-Message-Id: <20250320203048.2483603-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.15
X-PR-Tracked-Commit-Id: 8cb70b91b20a591a543394a7ee1d792b830e2dac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef479de65a700437159d59c00ee5cad6cfc2a89d
Message-Id: <174310848599.2212788.13714545617909166708.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 20:48:05 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 20 Mar 2025 21:30:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef479de65a700437159d59c00ee5cad6cfc2a89d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
