Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78342262D11
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301273; cv=none; b=gUbYcFc+mFjd9LdLn2PbYwjU0v+NNXyjigV6SojsVXBTVSmzSiyMMq0RryB04M3lt6lQa1Bg1XAdxyct6O1R0FtzVyS6rB64KHAzhnuiYPG82Gv3T0HwuNOrwQvVDoMn3jxP56AWUdmjdNkwPw10vg5rqiUzP+WBenn3UHlKDg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301273; c=relaxed/simple;
	bh=vyTBcmYfrrYkIm6Dk87/cDEK50YxjOkKi6v4tKwOVls=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SqrzwOli5U5DyQmipu1f0ykhIVGBoDk5jFLqmGx+/IBhJlBgnFzjBPPNJuG2ozdYiv7+8QX5tmyRootOHvIPwQwI3pD/jgsCifxzPGcFJiVez3PAYjCfLOSqhlz+baLmNCqw+EeQ/OBSWEPP7SX0CPF9SbciNbeAu1SV7DDnYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNz6GzbV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNz6GzbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED768C4CEDD;
	Tue, 11 Feb 2025 19:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739301273;
	bh=vyTBcmYfrrYkIm6Dk87/cDEK50YxjOkKi6v4tKwOVls=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LNz6GzbVbFiG059p/Q3KT6t4TxwSUidZ6ujksEnB1BtAxAIcwlUVj0Q+dY9LoMXvN
	 1CrfSu4fpGwKuoK4YUtb+8FQFnBI8M/gTbaQPOHFYE8veVw3/KVZ5SAzuYo6ZPBymn
	 Xc1YSW6CYhlOl3pF8HR183opjf4fsiUsg/zMRzdxxvbqDGJvDHkVIdSNA9N7Tvaxqj
	 MPlaHMb8ihzBSXwaYFtzoDaeraEVwQupWyPQuBAJdLW6Kg0Nz0hXkxgdr22El/2oJQ
	 uDyOhgn+9OqbI4VVqU0NQfXY0paIOOFwiZ7EgW/gN+KVFTGGG/XEQt61pLF7QS7PlL
	 0Wx8iuKZ5SwJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB21B380AA7A;
	Tue, 11 Feb 2025 19:15:02 +0000 (UTC)
Subject: Re: [GIT PULL] tomoyo update for v6.14-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <48a5c8af-c447-496c-a4cd-85a5698e5a1a@I-love.SAKURA.ne.jp>
References: <48a5c8af-c447-496c-a4cd-85a5698e5a1a@I-love.SAKURA.ne.jp>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <48a5c8af-c447-496c-a4cd-85a5698e5a1a@I-love.SAKURA.ne.jp>
X-PR-Tracked-Remote: git://git.code.sf.net/p/tomoyo/tomoyo.git tags/tomoyo-pr-20250211
X-PR-Tracked-Commit-Id: bdc35f164b0f60480b2f5e098bb8f3c0cea05cd2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09fbf3d502050282bf47ab3babe1d4ed54dd1fd8
Message-Id: <173930130149.4156803.9340963539697647565.pr-tracker-bot@kernel.org>
Date: Tue, 11 Feb 2025 19:15:01 +0000
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 11 Feb 2025 22:01:28 +0900:

> git://git.code.sf.net/p/tomoyo/tomoyo.git tags/tomoyo-pr-20250211

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09fbf3d502050282bf47ab3babe1d4ed54dd1fd8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
