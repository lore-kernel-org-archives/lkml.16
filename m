Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B22367AF
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751215198; cv=none; b=rhrW057uufYXded20EpMHlf8sPc+P3L4zyKvSpR/utmN7o49c7xp8BLjwmD6Gpw0fCno4v/Mu5o/oloXnLq3CbwF5AODFmw84Zz+4DGhucyNQg/FD/wQQn1ArKYXWGUzzsOsp5lzOq6/Ev7KmPGhboCKXAGg6Z8o9vBKDFe5Yhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751215198; c=relaxed/simple;
	bh=tr9j2Y0lFeiO9TxMTjmBx2/fxKiKEi7FjtiHdISgoik=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=f1BJ7R3ZKzNv+Omt5b7f5j5YkqJ1EWH5uV0qcSa1O3LY+TyGVNLdrxO9PCrevTpvH4L0hjTh+a+SNa3zk0ePHDzcI4sVck8ea2lmJ6ZFX8DByZo5JqT+7S5BRzVqyFNDcjoefRD7WT9HguNsfzhVA2uKHU+URy3E1Dmfd/NzBr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvdVm04a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvdVm04a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A719C4CEEB;
	Sun, 29 Jun 2025 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751215198;
	bh=tr9j2Y0lFeiO9TxMTjmBx2/fxKiKEi7FjtiHdISgoik=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MvdVm04ajx3tvNf/3QJ3mtPk4JALaPflf3ZsuuBsK5/2L9yHIpyfRRDhVtqbapkne
	 o4p01UZ130Ihw9BtjQ5nV8OwQ9u3uD1rYhJB9a/H8oLf33LtiVKNUcAq6wrTOGe2zn
	 tVNKLN5S6quZaCVWZPRXWDkHNm0DeE33+bh+27mBxGCpCsWi7No4Fu2TecvrUxTQUL
	 OBXWKdWGZqxhSF/JCMwblzBcNBWDA3JO06IdMBIxQlnv7JcGA4zXaFjTdYLh+a5cIr
	 Bdc84YyiLxbhQEJqjqOyXlM7gKypzg2QsnqOF7vQEx2mjLHU16vCQ8GTpRMMBQXMMY
	 kKGl+3EBM8r6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B0938111CE;
	Sun, 29 Jun 2025 16:40:25 +0000 (UTC)
Subject: Re: [GIT PULL] perf/urgent for v6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250629084953.GAaGD-MUAKHnWlFNiW@fat_crate.local>
References: <20250629084953.GAaGD-MUAKHnWlFNiW@fat_crate.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250629084953.GAaGD-MUAKHnWlFNiW@fat_crate.local>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc4
X-PR-Tracked-Commit-Id: 1476b218327b89bbb64c14619a2d34f0c320f2c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2fc18d0b8958dcea74c7357ebbc6912d0d6e2936
Message-Id: <175121522384.2432237.16268404570744037623.pr-tracker-bot@kernel.org>
Date: Sun, 29 Jun 2025 16:40:23 +0000
To: Borislav Petkov <bp@alien8.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 29 Jun 2025 10:49:53 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip tags/perf_urgent_for_v6.16_rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2fc18d0b8958dcea74c7357ebbc6912d0d6e2936

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
