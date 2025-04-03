Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A760266591
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708832; cv=none; b=GtC/l9KcklDRsThG23n7kyRlZs4TxGaO3+pI+6T39DiOW/KUF4XynqfHsQAEjByjXcnZ4rWd7uMV+dCpir95fPONdKKNRKfnlRhhwUyIiRDEse7gKyr+C2aj7IJS7jfTNAd4G8shucJShY7YhXmAgOKncrKVRYTdja/O+/GAYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708832; c=relaxed/simple;
	bh=/qsDzI2BiGi6+umdh2z2MoLNzeCV+8VCYvEDI/O2oro=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Gm+BV6HAfexQOgL5Ex5RUt5SRw9NV1JgOtkK7pe39heS0Gx5/dG+AJ+viAqZfaZ/owMiZy6UBQJfL0EpCClLhN95M8Bz8fIDgAecbxWUcHy9yLZAdmzBLql2/3tQabPW8mQTuWg1V5ceP5R1EKROQlnvkaMY+bLpPMCEHS9Dm0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r83br1bM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r83br1bM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C31C4CEE9;
	Thu,  3 Apr 2025 19:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743708832;
	bh=/qsDzI2BiGi6+umdh2z2MoLNzeCV+8VCYvEDI/O2oro=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r83br1bMTCUlEEMPmq8NB+XKhqXMJfJal61y7PW4YB1fcDbKwKvf8VSJxpU72xlcp
	 P6v/tgpf49czVmsrs1iNAvkD2uiPmQiqagtJLTB0yLLtaEx5yyqPUfVbKCAp9bsrOc
	 +SButKlttB7tPTlne4z32TNTrYFxyMAZ72INP+q6b2B5ea7GFnVIKHUGyjiPKkXazQ
	 2YfX6dV2bPkZNwNcBVtpu4ROHu2wkUE/iJ6Pyqk1NqqRnSsSZFiqaRSBETYqeGl/6k
	 D/TPMy+7NHIxbng1jHZDj0gKAzF4BWbaA5hUOL9dAr4c7hFT7z+lAyHTG4mDnnC6dn
	 HwHIl3OFuXvYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE8A380664C;
	Thu,  3 Apr 2025 19:34:30 +0000 (UTC)
Subject: Re: [GIT PULL] sched_ext: Fixes for v6.15-rc0
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-29_RUhhuUhGLiv@slm.duckdns.org>
References: <Z-29_RUhhuUhGLiv@slm.duckdns.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-29_RUhhuUhGLiv@slm.duckdns.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc0-fixes
X-PR-Tracked-Commit-Id: 2bac648dab395be0ad0d55b9c2ae7723e71e233e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea59cb74234c8d658a4299b57156265f59977494
Message-Id: <174370886935.2657822.12418273127561234726.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 19:34:29 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 12:45:17 -1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc0-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea59cb74234c8d658a4299b57156265f59977494

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
