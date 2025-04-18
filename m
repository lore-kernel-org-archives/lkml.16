Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612E24EF6F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008041; cv=none; b=i3kbO/9wiq9cuUS9unmqjnCklPeW01FlGwM4vg3zm/VcllaFqTqPRPllR5qOMYvWFKp2VSj5HEo77OyYqcHCAz+xuD682tojQ+bzf9tb/JeJBHyKwd1ecuiG4vcbaHS7K7Gd+wQe5fz7bD2XhW2aLa0rzi2c5CAbr56PqfB4CTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008041; c=relaxed/simple;
	bh=zB4JD/utzrx4JucPzJnLPw/gegfQGf58iSb9rLuvUwM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oY7ylZiG2pCQto51yosC0S5DD0ptD/TcePzhLIpkUbA0A8NjVtr3gVfLhVpSdYDfCiXoen30eeP4hFx2ikQ3dmJgAHUC3AYGpBgQjXOGKcxGzRg9+5NDqPVdO283axR161u629JmVf0hxINhgIT6zZzXC8FsgvAxi/zKwYh4lRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0ImqSZ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0ImqSZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479B3C4CEEC;
	Fri, 18 Apr 2025 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008041;
	bh=zB4JD/utzrx4JucPzJnLPw/gegfQGf58iSb9rLuvUwM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=C0ImqSZ56hbjPUFrtCzxg3t2u8qkXZs+acJz6dDMgccFX3HJ5zcRal95A4WqDEq4C
	 Pn/TIzAqKzFAJJLY5fcrtf3hCxZ16mdHPDqrgqERxqL9akEUhQQKKYW76zSSV9o/l/
	 8MbgEPrRHRYRYjxuS0bPgHifIZdYmS2VPUnPvSCrjNtkfBbHnCHRNCrXsQkQ4vG5s7
	 EmfA+/4iZEo8SSu5Wwgkh5kqrBRwW2Y5kdwkqIUBvduoRp4hRHws/DoWHGjkWpNLd4
	 vE8PePWIY9D3+UzaZjhH/JtSj3OAzuv8FunnOFYlutkoDN5t2wziAVNrb7RbjLxSY2
	 qgYJWauHbtYWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC3E3822E09;
	Fri, 18 Apr 2025 20:28:00 +0000 (UTC)
Subject: Re: [GIT PULL] RISC-V Fixes for 6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
References: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc3
X-PR-Tracked-Commit-Id: 615e705fc8c7bdb6816faf09b5b16a0441f050e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b828867b3949d8e9dd698b906e2be5b7eaad4a5
Message-Id: <174500807936.316726.7073678550748667980.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 20:27:59 +0000
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 10:44:38 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b828867b3949d8e9dd698b906e2be5b7eaad4a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
