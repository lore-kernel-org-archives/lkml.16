Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9FD242902
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748300310; cv=none; b=qK34bKapGpZG9B237WzEfPww9ClQEWtJGrh2BvEzlUtKd9+FKrXh2e7LQNUROffEa1Sp9H5JkM7UDTVBuIuhx3t0W11Ykdi0Ja1yb8R82iw4TaeiPeKeL07jhU9jO93P9UqPoCtL1/pRhUevrMz6+/vFyXh9vQiw3kIgNP4EsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748300310; c=relaxed/simple;
	bh=ZWXBYxCBvjnzBXyS2SWy8s2Q0uGExvjhZs0wh68kQTc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FocvWOZ/ZMPCdoitBUc9JfLTo6Jfl5bX/6rdHezh4jbrhkYrWoi0/eHSfa+BNlui/8H97HZ18uceC3iKJsASuEi+lOIIshslGnt9Wx25XMUHAMQMqPsLFreU2PTdMatz4Pxji19es9iTNa0hizGGcsgHOTjHLD9/wsZdTglBQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNSr1DnX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNSr1DnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A8AC4CEEF;
	Mon, 26 May 2025 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748300310;
	bh=ZWXBYxCBvjnzBXyS2SWy8s2Q0uGExvjhZs0wh68kQTc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LNSr1DnXuOARQhrKL/OFpucrFQHO6RU9O9qbwaVdwwFHCSlp4FSUlvuXa8EKpwkO7
	 p/n7wxUDAymy5A7MqN56yC6Gmo7gmxyZm2O4x/YvYnoXn/Xwq6/6E+l1saPHeH6Msj
	 lkeDmci2dxURs7qYhWiv+J8RLlPdaT9Vc3NDmv8w0OpZCwaqU8iAtGH0ZiFIkv72eP
	 ZN6biv2KqSy6w6frLMSjc3e/eFBzu67Ck1SU2FHLtQWbEUTp/Q2xBpFQFA5Hz9YhcD
	 evWgxI+ZM23ytj5a4TCjX4JbBfE4PDG9ZijXSAkIS7WVtb1buNR/Wb2SiwXtMfZ7/D
	 g6CqhkFVwTTJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B9C3805D8E;
	Mon, 26 May 2025 22:59:06 +0000 (UTC)
Subject: Re: [GIT PULL] objtool changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDLd3_9ofvEyYXb7@gmail.com>
References: <aDLd3_9ofvEyYXb7@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDLd3_9ofvEyYXb7@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-core-2025-05-25
X-PR-Tracked-Commit-Id: 4ed9d82bf5b21d65e2f18249eec89a6a84df8f23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3ba121c9f36f0c2734147365e5aeccf759a40b63
Message-Id: <174830034470.1082063.14217300540035703239.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 22:59:04 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 11:07:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-core-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3ba121c9f36f0c2734147365e5aeccf759a40b63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
