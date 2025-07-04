Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685A30E85F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650584; cv=none; b=EAlzDCc/Ta5YTKax/Wt+H5wQ7mD0HDzNDfKXeKU233kC36TZEEXQhE4VV8/MvZFwMDsBtCroGysOK0rMjHPBgMo3ktaVARXENqztDCuzB/E1nfnVO673EFILI0UmT3Ah+8Es6KDVIBUbSDigjTHpDkQcrEJNfItlTbUlFz03Ry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650584; c=relaxed/simple;
	bh=Bq79NU/8E8pVje7lvnbP9wWY0gzPyfZKzzvZkJ5XYrM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jhWmfzIjb1UnKVrPs4drUXlvZfNqU+6dzhChdfCR+uQk3PBDjlECWhJaiKKHsNTkw/ME6vU72+cEgxnok2CXun8+Me33+mrXR2I7oCDbZSkQmPi2C7h5CKw/aTA83Je/p5hz/wHY6tEBC28CUnXdBOqVX/EXAx7LDqb2A6TCVU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzmJJ56V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzmJJ56V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0A0C4CEEE;
	Fri,  4 Jul 2025 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650584;
	bh=Bq79NU/8E8pVje7lvnbP9wWY0gzPyfZKzzvZkJ5XYrM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gzmJJ56VaEP47cU46sdxvctBmiHXvYlsfcNlcpJ6I4VHdlKhump5BukDApyJgLwVO
	 9i1v39v4AEKLBNusbeOiFyHLMrqwOwTpJFIpuGRUgi694cjJ87QleBU7N7RX15LQfE
	 MvtfWQFY972vNXLDs36/rctNA2icHc6nKSv41h2HtEqCGgFr6OeSUXuq/gQu2cqY6X
	 FwhwDOJ1bI+n2AkXl1RnfaojitUWMKV4014dcgoN1eOE6eMhnB+FQNI4oWsHbRbBr3
	 lsBBcFowbMjfmuRLvonnvoyBNzeRym4fHiXw3w236CMhKYvSZ2Gh3fyyike61Is7hH
	 /7Az/FCrc6vBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0F5383BA01;
	Fri,  4 Jul 2025 17:36:49 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
References: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-FBF637AD-7989-4E79-A669-3212608A491E@palmerdabbelt-mac>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc5
X-PR-Tracked-Commit-Id: 5903a7452e642f1475f274373633522db168b60b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c435a4f487e8c6a3b23dafbda87d971d4fd14e0b
Message-Id: <175165060863.2287194.7557328427443226609.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:48 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 04 Jul 2025 08:43:50 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c435a4f487e8c6a3b23dafbda87d971d4fd14e0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
