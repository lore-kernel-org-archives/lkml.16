Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C992627E7
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988776; cv=none; b=r9f31BxM9gxM3YTUdcf/XE5Cs0e7SzI3401zwbNsNWjYB2FoAWmcI2scPntL5smQlc5oOVgUMGICXnjrE7Ne8ayzR/V08oFvOx9CIHdvirP4paRQi55VFrMIKU8mShLP+sT0Pt/5d0cOsJIXFnhyGQ0gd4zc9cc2FnITj7bbTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988776; c=relaxed/simple;
	bh=JIQXSFQZQnO9VBWmQLf+yq1X1e+6ZhsL/f3PdhGWaWU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BLlKvti1TqHwsKODiLJx1KRjusUVaeEhAlOUjzD/AvjJfW3d40ZFIxO/FbnFNrfARvWzbRYUqKgGZHxQdhs6D+gBt1elcpOJA2BzUE1a7pWdkypl6fXN8B4JzHwqjUEFKMt7BpkTV52TOnM7fcsaPEGUUEuYYO3hskO46B1l1i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kxl+4NqB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kxl+4NqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75210C4CEE4;
	Sun, 11 May 2025 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988776;
	bh=JIQXSFQZQnO9VBWmQLf+yq1X1e+6ZhsL/f3PdhGWaWU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Kxl+4NqBQvvmbssFBI4vHQo6uMJJexnAaqBeq0t288It3ThQUJXPYuGmlXQlU0RhD
	 hiWlcUoBETAJ1M7A//VTKG9kOLd7tDjZY1HMI0k6eu7MlwNi1aGvSvUKmmWgsmstj+
	 3/CANZVl+dnsI6r+YfjGgZmUwVkay+Wi5jb81k2tm72YWzanLHMaVrgcc+iWytYztC
	 0zSOIcwihIhfe4VDXCYw2xX8SZU/pzfyTmm68K425xW1Hc9KLyDSh3N2CYOLkCryVg
	 Y6NJ1oTLuXhC3lTxU+0yiv37rcpjkCDZcYi7SZ3vpj1tz6C7Hz+329b0207tpu+gO6
	 oJjkm7BlRCvUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF073805D89;
	Sun, 11 May 2025 18:40:15 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCBXl3x1VSU7fCzu@gmail.com>
References: <aCBXl3x1VSU7fCzu@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCBXl3x1VSU7fCzu@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-11
X-PR-Tracked-Commit-Id: 5214a9f6c0f56644acb9d2cbb58facf1856d322b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b9e62a2b8ffd2bc39b5838e163c41d8a08dae19a
Message-Id: <174698881448.21126.18259765605480768233.pr-tracker-bot@kernel.org>
Date: Sun, 11 May 2025 18:40:14 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 May 2025 09:53:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-05-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b9e62a2b8ffd2bc39b5838e163c41d8a08dae19a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
