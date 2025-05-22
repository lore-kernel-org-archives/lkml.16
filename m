Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5664C36B;
	Thu, 22 May 2025 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747874648; cv=none; b=bxQIhHJWher1K8cmFbgeN6jFi1yQQRz53332v5ASDJRRfAzGkPN3mB9qpq/FQRMbIBLWffktg7O70eXuEOGRgvxLcVDqn7L2FFZqiVHMg//LIobSwIWuIivaML2QaK94komKc/AX/Zu/B64cImKJdXkJMMwWPvdLb8Dk4o48qGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747874648; c=relaxed/simple;
	bh=48s2RaX/WnCgVXH4B5LLHthSl+K94O//Nsv9mgP9TUw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TvdN0hKoNgE1VokPZciRUpE1nGGAmZTVkA59UjblKFaDCY34LFM254B/PGgS8NrOLOPPsxX+0fG+6RK497/X8AjwNsne+9jriag6NOKlv24uLcT2zqm5zDEbWu6SImUPVrKvxdkyS2swWuYy47RCNBVpJpvG6chZKqzFoGSMjv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orSWVTMF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orSWVTMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA7DC4CEE4;
	Thu, 22 May 2025 00:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747874648;
	bh=48s2RaX/WnCgVXH4B5LLHthSl+K94O//Nsv9mgP9TUw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=orSWVTMF4L7HFFDvPNRKkjyyMLWPvitkE1vT97e8U1t/p5aWUnwUSEpMZZm1tFwQi
	 epQVbdx8hjiBIOuY502rN+uWwDRNfTfNNsA5Gt3w9sspPy03MzT3gPCS8EY5UCPo5x
	 x+xWhxBg+oE3L1/oUkzOLum2ID/OEgBgakdMAN/eYgPElWuiPFEzCt1ApKHwl2ZQJj
	 jWC49AkwqgPpih7fevcHs3skMNMaEI/gkzQ7rCdzqBXaAnsw1hocQRQkMno+WjbzXb
	 ZnriFh8s72fwhftlSaMRnH0I5wDSPEMP4erybFtKn9Tb1vUhOJP/o+t8ULiY3Yfobz
	 yB0vPKa+Yg6pA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB22B380DBE0;
	Thu, 22 May 2025 00:44:44 +0000 (UTC)
Subject: Re: [GIT PULL] clk fixes for v6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250521214133.1193304-1-sboyd@kernel.org>
References: <20250521214133.1193304-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-clk.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250521214133.1193304-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 6a56880562d470b7bbdd1d955ff3fad4ad73a74f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
Message-Id: <174787468342.2333889.4818983198382528923.pr-tracker-bot@kernel.org>
Date: Thu, 22 May 2025 00:44:43 +0000
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 21 May 2025 14:41:31 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d608703fcdd9e9538f6c7a0fcf98bf79b1375b60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
