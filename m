Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87562475E1
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739045220; cv=none; b=R5cP99vgMa1nZZRa38B/ZexwSKk7V/mLlepCsKYj/a3SSaMGYuNI+xPp0vmpnVx2xcx3tffvpLfz0UQcSNZKgT8rUbHv/1R7G7llRMHpQflCsRITXXskWuFKGKaQ6ERvRxlX+VQDp55FlmDhanjTGwjdeCldYrInQlm7phV8NjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739045220; c=relaxed/simple;
	bh=Rw5r8dVzrK71sJWfFpRdAbYQu97ugkJnuUF6w1gpITk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KnBuyl0e4fSrqoE1sNr4ozJ+NzWUOnUdsUGClhJA0tz/3Gc5S+ICdx3mJqOtoSsd+jhGLSl5Vy8ilbZGU1lqVA1om9qIU4lvTnCHYQMKKMG/yHXilbOeKYMu9S5RKdRNLNU9tJhUXoL6ayNzcrwwrdX0Dq7nz/w1L9thgSQ8j68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPVF/duh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPVF/duh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74CBC4CED6;
	Sat,  8 Feb 2025 20:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739045219;
	bh=Rw5r8dVzrK71sJWfFpRdAbYQu97ugkJnuUF6w1gpITk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hPVF/duhue8aLT2Jjb3g3B0CBYpUXML0JVnwYH/KA/5mBDRm9qydhacvcE/+q5r6e
	 pIuC4fm2OFiFpFkojy+X5A0lLbckppwpYmn0xBR0pqvnflFxXqhd3XNqy81nCLJiET
	 BwyrGpHiVlp/ROzRhwDoPd1eTDmb0WYhNmAX+bJHUf2KIJ5byqmAQ+XONslnMc0tVa
	 2xi0+tLMA/CpGjmwIt51WjYuIbki2fLUNDEyDsvAmrRCHKoATQdlooveIZPzBkq0dC
	 JQE1LZO2M83w48GpKhDwjbE4Oa4b0bXipeueswgKBWXricuQ7YGvGJfJTtI2Sqr9h5
	 FLzKToWxwuKrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ADA380AAF5;
	Sat,  8 Feb 2025 20:07:29 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z6ck1Oab-St6zfoX@gmail.com>
References: <Z6ck1Oab-St6zfoX@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z6ck1Oab-St6zfoX@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-02-08
X-PR-Tracked-Commit-Id: ee2ab467bddfb2d7f68d996dbab94d7b88f8eaf7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5057ded6e882fc7a5f26de592259818ed07d397
Message-Id: <173904524784.2649139.4012499822542350712.pr-tracker-bot@kernel.org>
Date: Sat, 08 Feb 2025 20:07:27 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Feb 2025 10:33:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5057ded6e882fc7a5f26de592259818ed07d397

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
