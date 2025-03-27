Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156FD1F5E6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037044; cv=none; b=gXzyvCymvnSCd0vTC7/irk7pSnGxW3yydRZcirRyzHoYu5RSJWNL7P0xWrwP8637NirnWCf/kbFFc9uZPRlRxDEKGe9CgcQU6gjWiw5Xi8p2pJ+UqSyCvs5LMdyEJ71YIdqDlGyEO6Y130qOFWQlLVUKMmjsvLY6x+I1GYVFpZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037044; c=relaxed/simple;
	bh=WjnVrYsYMMD06DxRrcWnTqUCgw+Ii70dQyQDW0Jfkjk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cYZmh/lXD0GHvJfQtAuM8sJwxem5eJVaneM6QnoDYgoz2gIbQtIxwWor71yDsTIqxhV2IiRbUa9IyT8i5mBbQp98drieXgTLQS1F2Vzi2JHVgEMexQw4n0LkoU9vxdnqwnOs8HrUs2cJjShvNKiqiSvHz7RQjpWCcoK3an5Wseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHCV/eaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHCV/eaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DB9C4CEED;
	Thu, 27 Mar 2025 00:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743037043;
	bh=WjnVrYsYMMD06DxRrcWnTqUCgw+Ii70dQyQDW0Jfkjk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WHCV/eaDgm9PgmrEr+fF4C0q17xtutMbqkNwYgKY8JPzVNxy0ScjAbAwl9xAR7Ee6
	 of9Qc8Q3M2PfROqqfB3TXbUWiOIgn9aIBP6KgW1MwLb41sm5rAjj9ogGBmx5bDaf8Y
	 Ai/HVAiFhcThBd8uEfEEBTMgxBZ73BAbkjO1gu2FpbhvrCucp59ymHNiNF6ADe8gx7
	 sgBZWsPyPJz0VYYdmDWlPKbowyHDdcKQOCff5ihj01InO9Y/FXfsg8uQqwUTHQzkyB
	 Y7oCMJWwpbCspILntvk/9FgedwRF3NG6JIxwSJJO1YMpyWyhHFcaasihZKbrVhjnCq
	 YXTEs5pvkKAGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70ED3380AAF5;
	Thu, 27 Mar 2025 00:58:01 +0000 (UTC)
Subject: Re: [GIT pull] timers/clocksource for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: 
 <174301899918.1664839.7260897179786919327.tglx@xen13.tec.linutronix.de>
References: 
 <174301899918.1664839.7260897179786919327.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: 
 <174301899918.1664839.7260897179786919327.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksource-2025-03-26
X-PR-Tracked-Commit-Id: abfa6d6fe2e9539a6e080088a6e5762f4651017b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e1ba8d23dae91e6a9cfeb1236b02749e8a49ab3
Message-Id: <174303707992.1518172.1362753612347586074.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 00:57:59 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 20:56:48 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-clocksource-2025-03-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e1ba8d23dae91e6a9cfeb1236b02749e8a49ab3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
