Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D524111A
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739045212; cv=none; b=F1cUKeq6zPwvkidrwxj4ELfkOCshL7s1cQACPX15yJkLvP4799CHUJmIzdxZX1Z4gWueF5bOhvYmaH8F7ymg8qJIsUk5I8oczeVDQ1UTz2HwtFP76KetXoX3BPh60aAFQB9L8BApAtEyp2BHpQE0lfmsRbGutEAii+UYVVTbjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739045212; c=relaxed/simple;
	bh=ktUJzPJSBYlXfwlj44CsfYABf15m9zTeyIfjxiOzjmg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JwLCxrdJabdrtRdiQYd1Fiv5GVtj7XtV/mANngx6vzXpt4nWje0QxFZa84++wmNXKLfmFLL297pYWwP59iHwsWu4E4+yQrerfrigKbLZ+zZT+ucGjXOM8Mn02uLqm+sBMVd8Kgc69Q+tgyfFX4Wh+/w0E/7gdlV4VkQ0a7sh2VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEjmmlg8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEjmmlg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDDBC4CED6;
	Sat,  8 Feb 2025 20:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739045211;
	bh=ktUJzPJSBYlXfwlj44CsfYABf15m9zTeyIfjxiOzjmg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hEjmmlg83PBoW/yCdP6XGEsnaCigxgJW0mmqQas8nKz14pOvtj8j4ZHKjNXdRq0XP
	 u6ZMUq3BO+xkW/TH9j3aYWPA0yuhhW00fIVtINqQXqJJpD0jzWRj3bDC7uwSlNOTVV
	 g9o1Lt2is61krShL4gQNAAmYBWQQT/6nsx+LaLRcU57RK52WMSX0WhcAdY7+rUquie
	 98OGZSW1YTE4PomQG8Q3ITmBSXNFbvR2pl++YO7ebALlurULdbrrpO2Ic4R6CYgumy
	 hmYeixouUxVbT/f0t7k7dV1tCnSRXKHVkdkLqeJNa5tG2ZalXH2g+9/epgUmvkDTIU
	 q6AZicravwEuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33EFC380AAF5;
	Sat,  8 Feb 2025 20:07:21 +0000 (UTC)
Subject: Re: [GIT PULL] locking fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z6cfJwb7THMU5A90@gmail.com>
References: <Z6cfJwb7THMU5A90@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z6cfJwb7THMU5A90@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2025-02-08
X-PR-Tracked-Commit-Id: 5e0e02f0d7e52cfc8b1adfc778dd02181d8b47b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa76887bb72ae11347730271e6a04c147b7527e6
Message-Id: <173904523977.2649139.3647497957772288409.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 20:07:19 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 10:08:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2025-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa76887bb72ae11347730271e6a04c147b7527e6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
