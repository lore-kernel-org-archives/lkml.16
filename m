Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2602147F0
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747511879; cv=none; b=nGz1iKXX6Pqpn1sW5PPdq7QMaxX0O4v8l7C9DmI/6PBJpta/gu6XOE0xWB+NIzhBozZqgERt9XnPG36EA0+7QisPotheE33wS4kgkHe8LK17ir35P+Bj+jcoPKPGaNLDvr9aQdZSo39GUcJfhTJ3jiIp3f4mqYH8KDBouXNXpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747511879; c=relaxed/simple;
	bh=M04+vrCoHJwmVTOoBVKW8kd8+YqTLO7OKxbJBYs0y+s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KxjjMeLTN5pTlp/4iNhoV9BNFZa65NmwECSSFZF4A1vI3/uBUX99pntHBtx2izOEhj216KJ9XIUEMZtKdMwkfmXNdVHokDx8b8sL/10UL7S36in89PQxhFk0m66vDrYO0rB5al+OdQkDMYxvuss1POe6XIicTCQpVMKFDtdfpVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnDjA5Se; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnDjA5Se"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF4EC4CEE3;
	Sat, 17 May 2025 19:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747511879;
	bh=M04+vrCoHJwmVTOoBVKW8kd8+YqTLO7OKxbJBYs0y+s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KnDjA5SeHdi5CMDRJckSt6ynEjRZngvq1W+oE0lQNCXA+5TJQyiFynOCWM2Ne3zn/
	 vMXv3mmL3kc+ejo4D3hxFk7ca7Pg2LPiR1c5seU6IfUw1qPhnCvp5Y/FM1duOjh3aq
	 jepPBvCXELH8sWgXPwZQqUFIs8i2kUio3Jilab6+IipipTt2keET7o4Fzk+uaOe0cx
	 N1GaiO3r2f4cpGvcr1oa11H2/1bMy9g4DBUy5g0htpvweS+PKJICSPyVgDvLRz1X3w
	 oSXSso0w/lzieT3b9HYtR+HSiAdpEoXqvIHdtLu4yUf8hxJkr1qrUc6M5iia+p7/+e
	 6yTWOd+wmknTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C30380DBE1;
	Sat, 17 May 2025 19:58:37 +0000 (UTC)
Subject: Re: [GIT PULL]: Generic phy fixes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCi9nYPCxxtrO9g5@vaman>
References: <aCi9nYPCxxtrO9g5@vaman>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCi9nYPCxxtrO9g5@vaman>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-fixes-6.15
X-PR-Tracked-Commit-Id: b2ea5f49580c0762d17d80d8083cb89bc3acf74f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 21eeefe76919c904dd50d543bd6d3eee05d97e15
Message-Id: <174751191608.138654.3079387194320606473.pr-tracker-bot@kernel.org>
Date: Sat, 17 May 2025 19:58:36 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 17 May 2025 17:47:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-fixes-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/21eeefe76919c904dd50d543bd6d3eee05d97e15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
