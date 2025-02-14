Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D021DA628
	for <linux-kernel@vger.kernel.org>; Fri, 14 Feb 2025 19:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739561351; cv=none; b=X+UKawK+etYhcsOmMvDf4fkxrDMZPVoVy6KxIDAKlEP4123B3bCAAIhw7FvWmOY+MXlf2QA3XxGZSoe6A1CwTr2eK3QNe0fhhbKpFePgBfnWHCw1aPzyWdoCbqrsz+NxWT2bElZ/Keu+AmlFgDIPG4obf80FVnIs0/S6/M53cnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739561351; c=relaxed/simple;
	bh=wI4SycQRHQzMRaAloeN/a//1uK6hnRaGshqS7OaTC4o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=h4BmfuQtHYyjzmg3ys9yRNi09vp13NQRws49i4rnzo4AxaYZnL3jJVn4ly93WbJ8ku+faEoWnqMh+SEtSV7qiz2v5dTGL8LlCNZ4qVVw/hY0sevGc9h9XDHbBaLB45aK5+U6naXqcsXEOCvxzIU2PxspWoF3uAkHhdhpwiwaa30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lv0bLb/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lv0bLb/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF27C4CED1;
	Fri, 14 Feb 2025 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739561351;
	bh=wI4SycQRHQzMRaAloeN/a//1uK6hnRaGshqS7OaTC4o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lv0bLb/SRMUyn8gSZoA/+eyN7Co6qcUEoostEVclXnyuz2VYNT0KLYQJ5gCA8Uw3J
	 2xMTd0+QR8tKlJtXe7UelhMa/eU503Z3f6anpejY+LeUbSr0DDykXJ5Pxq6LYCGea7
	 B7Ifya6Q2vbrmNr4VbDBLTJhxMfnodViXBHmD3Ec+FH65uln2eoo+o33XrRpVYVP/1
	 xlo8hV9aYVGg6gTjfpQMEzj5UjTyhD45+g2BMjM6fRehJAWhdj9tM9ARduo8s55Mu7
	 4VKmhWt5bW0s0DQ+rFrRoRWpImtLes+dWEsyvY5g8583BO7BYaCC6XJXugYdgCkfhD
	 fIxHgfpLJUmag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB617380CEE8;
	Fri, 14 Feb 2025 19:29:41 +0000 (UTC)
Subject: Re: [GIT PULL] workqueue: Fixes for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z692OY2tsm2GWeCM@slm.duckdns.org>
References: <Z692OY2tsm2GWeCM@slm.duckdns.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z692OY2tsm2GWeCM@slm.duckdns.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git/ tags/wq-for-6.14-rc2-fixes
X-PR-Tracked-Commit-Id: e76946110137703c16423baf6ee177b751a34b7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4d4680965aa3be2b2bf392a54fabb244fdce46a
Message-Id: <173956138056.2081923.4567742656400925208.pr-tracker-bot@kernel.org>
Date: Fri, 14 Feb 2025 19:29:40 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 14 Feb 2025 06:58:33 -1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git/ tags/wq-for-6.14-rc2-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4d4680965aa3be2b2bf392a54fabb244fdce46a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
