Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE3921ABDA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749240655; cv=none; b=OxZwivWlzClLBbm5fFabAoGAZeYDMx02mp2TWtbTO8l/sfXcmbpJLR5jsTuMXaJdolqyLDl2YoM8UcrEVxvbHjpt2Q414aH9cyahgDsVnuT3h99kwlOoearNKSNzRI5IgLvfWkzsf3V+jeDHX4LakqeP62sV6eMFjZm6IQdBYdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749240655; c=relaxed/simple;
	bh=1RqGxBjdtIN1NNfB5YTkmxKHI3ny+7mKuYv6WOixdEc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HNqZudbu8F5so8tYgeUZWUebB57cr27gF4zqldOg+ssO0OhxoSXsbg2c/joLr66RT1fuFfex9oWKBOp7OPZZyqS6UOkHyyWxg2ycovPIpB071JDiJ3BWrUsTI2T+jwkRk3Dudr60E9RdlZRxW7cJqmG1aKXTlhdT06S6vb6ZPmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W06CQlPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W06CQlPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD73C4CEEB;
	Fri,  6 Jun 2025 20:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240655;
	bh=1RqGxBjdtIN1NNfB5YTkmxKHI3ny+7mKuYv6WOixdEc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=W06CQlPi5VQEnqfHlms2QlAAvDi69Fxknentl3UF4ghnPzI4ExSe+H2/Knk/SfRM/
	 XLj5nzUeG3c6k4Xq3sQytZxmBfmlP34VAVHpiG65Asuzas051y0RAeGaBjTBQZAiKl
	 6PRu6Pru7rUskhlmQkuoYXt5KtJcuyLPuGc/bK9LqlSw3XtHhmsc+aSFGw6pKw6xYi
	 VnuJhXIgox8UOMkj9hC91qbYc/3la60HZ0PPfkZO6zDBZqKc1Z8xfRl/powXvrjmnP
	 6o2+IfZCGkLrp8lv7sIN+DXLfA5q8gUCJKwYknf++PqO9zd6Hj64dCG5qEiUqB/gXS
	 gSkS66PxcF8Ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BE43822E05;
	Fri,  6 Jun 2025 20:11:28 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc/IIO driver changes for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEKpBDC2WB4HgaJ6@kroah.com>
References: <aEKpBDC2WB4HgaJ6@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEKpBDC2WB4HgaJ6@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.16-rc1
X-PR-Tracked-Commit-Id: 9857af0fcff385c75433f2162c30c62eb912ef6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c26f4fbd58375bd6ef74f95eb73d61762ad97c59
Message-Id: <174924068703.3964077.3494959638947050233.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:11:27 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Jun 2025 10:38:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c26f4fbd58375bd6ef74f95eb73d61762ad97c59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
