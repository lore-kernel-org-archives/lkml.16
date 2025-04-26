Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70625DAEC
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745687120; cv=none; b=GQAB8bUaAyk9UKRsNB7ZzLn8h94J2D4KbUsZX2uUR2jxeAlsY8wnCLQtq/yaCk67e3qY5sFc2LshOkUwS6EP4k1IJs73OJFkFpdKENOgZ8BJETCPYDI6FQKOpUN4J9M70lsYPYCu+urCGI2+cOf3ZhWa55s8Us6/2/ZmQodf+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745687120; c=relaxed/simple;
	bh=Mi3INWklMPho5/cPWCcNBT+UIRWJL2Bx6LW/e9Upw78=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AlHlKWvUZeO107Q8qX9GRmQUeU9HEwctpgGh/DGZ+BL8qjCpSNPTMz5PDqwrPiVBQIkow4t9pBqhzzjCT1aGqQg5LJHsl9dcvIph93cGCrut7mslId6Q48nQGmTsSKNNUVHAXXNAkgQ8V4NHxozA3+JenP+3qPJ9ZbcuCoPy15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmVkK2Fr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmVkK2Fr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D85C4CEED;
	Sat, 26 Apr 2025 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745687120;
	bh=Mi3INWklMPho5/cPWCcNBT+UIRWJL2Bx6LW/e9Upw78=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GmVkK2Frb5SYvGqWxzffUxGszcqrSpfZZkmHWV0CVw41RJ+jBDy7qATOYXZaVaGjK
	 viKHe5Yvv4JfijMiD1R+80dDk2P45NpTTC7pPvDgeihCmI92piQUADr0Ot1Blq0YAC
	 hIoVuG4CK1uIWBbkxgnHgwuDJQN7dmP3dG1bMlUKBoCJNtUk4pYsgOOZeV+NbB5/Y/
	 dD5xX2igc9I44zXv9nz1ooD10R4wmL0YFfI5sQNYWYsdxV1ZtGiEAva63bSk0GGa97
	 xSnEjV9wCFkSZZyFS6J7yGZ8X82LRLLLlmLX3D2r0OXqrQaDYDAV9HqD63pMpkmbex
	 DiFyetvnIdIVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F1638111CC;
	Sat, 26 Apr 2025 17:06:00 +0000 (UTC)
Subject: Re: [GIT PULL] IRQ fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <aAyZO1Yq3llkm89a@gmail.com>
References: <aAyZO1Yq3llkm89a@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aAyZO1Yq3llkm89a@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-26
X-PR-Tracked-Commit-Id: 3318dc299b072a0511d6dfd8367f3304fb6d9827
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a226e6540b0a1872debbe9d8f2b3d72c53d90de6
Message-Id: <174568715895.4031081.572486958187292687.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:05:58 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 26 Apr 2025 10:28:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-04-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a226e6540b0a1872debbe9d8f2b3d72c53d90de6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
