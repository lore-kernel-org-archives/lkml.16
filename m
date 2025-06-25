Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72771CAA7B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875807; cv=none; b=TWou5oQbCimcAUE4xfrV2JJ2dENC78alqnO3KVf2DZ5a/GO3k3qO9QthkXTAQP+Bfu1NdE5YMAent3GUoY/erNikl+VObmq30lEb2hEFcXGU2dBJqaNy8dMQNxxrWe93KIFP6+9c4JxwArVAdEYGHvQqTJINA1cPwKazqc/JF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875807; c=relaxed/simple;
	bh=KHcyik54sU9a4F3g4wWfhr7Kb4z9hKrHHqcQm1GxpmQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Wr6fa8Cap11fAIe6u+cGLCh1v2UwAZBkQmorefUwM9cICx80VhY40P/CuzrJ+rUIprDWBO3I+7mkETq0wzYShZVfKlehAUQnnBD++ba5QBi9a/PaCQ/Jp+E/Cz045Mv8yNZrvqV3PBnkTOfgvlT1XSZKT4kywg9dodlWX/j8FZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9jukwkI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9jukwkI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70983C4CEEA;
	Wed, 25 Jun 2025 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750875806;
	bh=KHcyik54sU9a4F3g4wWfhr7Kb4z9hKrHHqcQm1GxpmQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q9jukwkIx+EBDWouZnjzi4pW94qojZ5WRAsSV8EyBRygapqlUp/mn86smOPdaDfJ6
	 t8F4s7/pBZioc7nEATRn83w8iBzqPo4oc13nnLV6kW3ElJ979p3y/QVUPpK8cTzW9n
	 gZF6rX9dXLdnLLeYlUUWnKoQti0dAqmpeHo1KiCj1QKVWla5rbvDPaes0LzC2vMLvA
	 Kdc4+x6D97ZwxSCL3KdsP7mBi7STpp36Wdvg8vdPtg9qZLVd+njdkXygjSMQ/3xTyi
	 bg5u9M8I4bwY+m/rMf6FmD5e2Ru+Q5bmtSJMRzWywzai08AaKKgc1WeUeKyqRNc+du
	 wvvS/99orZkRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C133A40FCB;
	Wed, 25 Jun 2025 18:23:54 +0000 (UTC)
Subject: Re: [GIT PULL] uml-for-6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250625121529.42911-3-johannes@sipsolutions.net>
References: <20250625121529.42911-3-johannes@sipsolutions.net>
X-PR-Tracked-List-Id: <linux-um.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250625121529.42911-3-johannes@sipsolutions.net>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-6.16-rc4
X-PR-Tracked-Commit-Id: 2d65fc13be85c336c56af7077f08ccd3a3a15a4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2dca89df0d1116f722b4be100e4bfcff858058e8
Message-Id: <175087583272.574995.9982017889434110296.pr-tracker-bot@kernel.org>
Date: Wed, 25 Jun 2025 18:23:52 +0000
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 25 Jun 2025 14:14:19 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-6.16-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2dca89df0d1116f722b4be100e4bfcff858058e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
