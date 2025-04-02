Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020921F4C8F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616078; cv=none; b=FNR1pMQc4+7ceIOS5Qbn1NN7d4n9VZG/IciUPDne2fOYUxd4zxwUGS+MQCK/nAQJeyYmxvpItYeiI0deCQcqMl0lPagf2kQj8fE7Q5plXaB+ryZakSttGKCV2OBP0JUmxnI2rcEuFtGUGH5/MelukwWW5w8BoBCRStlL1XJXf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616078; c=relaxed/simple;
	bh=SgQsgbehy3qXkIAfzsbSlsQk5SNa0MZDmEiUUCq2IMw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Wopy4KWnHuhQecBeserHbWomxAy6e7TlAI0WIytkjvT65M0TZlM2ylR6qRQpFrTbyv9K8RHNked6gxxJXfdZGrFuOoGIDKD0uwBSb/wjP1tlGQLHsu6G9CiTDPLq1EvhouG6hyrfo5bHcm5h1UpdcwchGxX6/v5peKsrf5jrvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0JZ4ubw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0JZ4ubw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D716DC4CEDD;
	Wed,  2 Apr 2025 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743616077;
	bh=SgQsgbehy3qXkIAfzsbSlsQk5SNa0MZDmEiUUCq2IMw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o0JZ4ubw30aWrTGv0bXb9mpwGZy+1XqbisAjjwiUQw/KJrKJeyEjIeUe90rQJ5VHS
	 3hpBnL8GHpWX90ZyumeVtGSdK60p3erL/+QiaWhgwsePex8NYJqq8e5UwYVS6mY2nK
	 Wq0TKnvwj//Dr4XW8UAtzZfbHWvKLYBYSXEG7TbbDAV43cSGgcrAcIRvkZblI7FbU6
	 Mg+82ukNvbnxYCSac3Kta0nrxr4U0L0HEMKcsIYFvZDY8PkzrKOxT5a+TLvtl2Sbjj
	 b8HyDvLtk6chvVl3XxH9ipKNXFEwdDPKQtWzd9YbWfchoduN41WVdjN9n+tNwS9NLL
	 vjB0ZJK0GeN/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFFD380DBDE;
	Wed,  2 Apr 2025 17:48:35 +0000 (UTC)
Subject: Re: [GIT PULL] more printk for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-00cAEKkfvyNto2@pathway.suse.cz>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-00cAEKkfvyNto2@pathway.suse.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-6.15-2
X-PR-Tracked-Commit-Id: bd67c1c3c353b6560f2983bdd23c665e26cf83f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af54a3a151691a969b04396cff15afe70d4da824
Message-Id: <174361611452.1617726.12787051376271668169.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 17:48:34 +0000
To: Petr Mladek <pmladek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 14:58:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af54a3a151691a969b04396cff15afe70d4da824

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
