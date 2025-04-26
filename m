Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7C25E808
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745687125; cv=none; b=HxGDmqvgU2Mj5YuVaMkKQXRKeD6ouDoz39iuHhpqXmdten+0P7t7bGX/dprVepgvfB2W2HZ8itlkLhfIERJOvYHqjp3VOVi8tPVrQgAofFdEyV4D86kiMf+JURfFrkLY6OgLZbPWeBdAnRN9z+Lz/xT6EKaeGZOrmHxmkulU3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745687125; c=relaxed/simple;
	bh=szAvpW7npQknlu0shDXwnklH/smzKtA9OkVbHn/POT8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=j1+DJw4LGGZvEynymFhm4EJDvDzxoi+CCIOUHIFZtxqp6tL2e2s5Q6XarsXHv+hdGFJP26j2ZIykD9lcuYFWa4zEeVYd18Tzn31hWiQXWsx9wuRjIvRPQDktMqL8hNmAgJi0txgbj5efLQg2LSOJM92rhCb9LOTyXf3TNiXfuq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laxr/knW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laxr/knW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDFDC4AF0B;
	Sat, 26 Apr 2025 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745687125;
	bh=szAvpW7npQknlu0shDXwnklH/smzKtA9OkVbHn/POT8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=laxr/knWZIqdjjyZYnWTf1S9ymERuWIn2DYXNJzsFw4thLwdIMWeO5FqmOn/OXM1N
	 29kXE2ej1lwbCfFt8Wc5tWuU3gus8lWAZPNG2E8eMtyfOUaCvx19XTcoJ9bZgUgERz
	 KJ4E7RPTRyzq60OT6Qudi4u/ORaigmv6gXHgEPKuIJVzps0auTM1JhZkDUWg6Wo0n6
	 DDGhc4thJy/UcRLx85WDh54+M1rT+d0VShZaKPr7HiOC0nnimlmPYfpp/X44InhK5t
	 ufyKiPoKjc9+cdB8bICy8e0KYPgxec6lLR0UZUH4pm717ybTK29nGg5THW3zykJkgi
	 aFoXpuAn19yAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EE338111CC;
	Sat, 26 Apr 2025 17:06:05 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAyf1K5VDFjt0rsN@gmail.com>
References: <aAyf1K5VDFjt0rsN@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAyf1K5VDFjt0rsN@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-26
X-PR-Tracked-Commit-Id: 85fd85bc025a525354acb2241beb3c5387c551ec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06b31bdbf84990c60adba7185fe4a340473120cb
Message-Id: <174568716401.4031081.7812013020128323924.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:06:04 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Apr 2025 10:56:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06b31bdbf84990c60adba7185fe4a340473120cb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
