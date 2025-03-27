Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26D21A43C;
	Thu, 27 Mar 2025 19:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102612; cv=none; b=Zr/HoXtNIqWGcvF+p/pZBQmoM7d29ykNeQcZhE0Hx/82pU8BZFsSgLEs9NtleOagSaMPPvPm3QiyAI9mzeJebb4geo1vCki8EVgOjP+ugj0YyaZ+NEWseIuhGz4gP2OeXN/r8nOg27mvyzJa6K/ej9U0nYhzCaL9bSlpXYdQeR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102612; c=relaxed/simple;
	bh=oIkeI2nu+rYMrOqcqasUHBP1QTKIQUNmf2tbBOB+x7g=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HC+0HuGrBE9eTDMZtz6tZXrpZJ7OKxSl+w9Z8Jdjsm1xSONvjqQ9OZc4swBNTt+c2CqC1IteZgdGBnfk0289Uy+mKGGwtZ0/l/U6pS0vEFN2i+B7HhSjj9QzCr0hEGR3a3+3mOahF6T8AalgVo0XJZDoJHZlYqFaUXM0pkIRxT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzyxDvVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzyxDvVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FF3C4CEDD;
	Thu, 27 Mar 2025 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102612;
	bh=oIkeI2nu+rYMrOqcqasUHBP1QTKIQUNmf2tbBOB+x7g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bzyxDvVe9/r2ZRAJhdCqhrIkO3mBSeW26HnKOUvCNy7wL34cSMe9IgaYWO6L120sL
	 GGCZg1GYeaR9q2VUMZWQ0eF0EUgj4i+km5BPsGQlNdfDL+YV8+qgZG3WXUtJM7RSJn
	 Qdn2AWeKV5D/QWRz5HUt+mZok7tL38S7O+tQnwgxjOSjhc+L3qP8E5j3MSqzuKa3G/
	 OdlQ+j58Rd0/mOyvRm4kzeCxr8Mna4mTUA4SwvZpB2kkE91MM2djE3qtIdqttP8Z3j
	 SlyKQp2n2LfA4aW8iEisejEjJVZ9xJtqrEpp55TqjzpaeCm50nKUprADXbUdgbaX30
	 IOltKf3DyH47w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34A75380AAFD;
	Thu, 27 Mar 2025 19:10:50 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <9a65c188-56a7-4e0a-ad3f-350d67d854b9@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <9a65c188-56a7-4e0a-ad3f-350d67d854b9@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <9a65c188-56a7-4e0a-ad3f-350d67d854b9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.15
X-PR-Tracked-Commit-Id: 8ce2a15b1e6464a8681fb2f787602fc78f8e2f39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bb3396d778816ac7618c522c4cd180273edeeaf
Message-Id: <174310264866.2176831.12484995763614596622.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:48 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 19:03:04 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bb3396d778816ac7618c522c4cd180273edeeaf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
