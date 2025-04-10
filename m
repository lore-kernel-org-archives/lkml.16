Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B11D5ADE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744325485; cv=none; b=D8MUF7ygelfPZau8Dgsk4Bmhsj44/oF8lvyVlFso7sklCtJrgKDZ2633hXRvAYdK7EWY49j2eZzDy54cBAqKLb6WPirAuyxf2TmX5C2elM9i/oTJSDIG5ZY5rHK5Ra6r2ejgU2ExiCNr5KxohMHtiisL9GjWAT8ZQo9ISXErO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744325485; c=relaxed/simple;
	bh=Ug9WLwlJeRwqilcFUM5UvOs3MgA+hQUuC8+jSXObsH0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WP+8llYVXAyKSqHMAoEAliimv6uuc6SZGmD5GlFt8TWVhsAIJjGkkpGaoH+JvhGeAnpmr/ckmo7mLER1Xa5ewtEZRTU6Fo72J7eJS0F46AJv5tobqU/Daquc3XuFK06UJscJ4280jIZeFrK/JlVhWN7ZefthkjD31MQEc0FVD5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pa5xStZ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pa5xStZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9404C4CEDD;
	Thu, 10 Apr 2025 22:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744325484;
	bh=Ug9WLwlJeRwqilcFUM5UvOs3MgA+hQUuC8+jSXObsH0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pa5xStZ60dxv9JeE/qb4ZatL2X8yCiC4rbl7yVOV9lZenGaIvhd1IrKkiJBveyj71
	 YLvm4BwWSTAGM3qnjahmH8p7Gg9wGDCK91mGkuf9uIJYrJr3XfEV8TzkVEXN5ttB3f
	 FeC9clIJZzQddDXErSeikiXsn52IixTJQiXDucJgkyE3rYaMERZlsvKKZeV6OETKVT
	 PYdgftFpI5E/h+GKF/zqzVIyOi0bcwdorgL3uUwoo6yM0cjuGCqs7M7W1XRJ4Eigsp
	 ggpnU2oVvCg81EUs8uOXcL0Z6oUWOfkHF5ZQa8xPQlUr7qQjmjcO+oNYo/ssE9xDah
	 8LkWIBVjh2lKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7123D380CEF4;
	Thu, 10 Apr 2025 22:52:03 +0000 (UTC)
Subject: Re: [GIT PULL] objtool fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z_gyLithD84kC30H@gmail.com>
References: <Z_gyLithD84kC30H@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z_gyLithD84kC30H@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-04-10
X-PR-Tracked-Commit-Id: 87cb582d2f55d379ce95b5bcc4ec596e29b0a65e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54a012b6223580c74b77f3dc2a7c6b3c29084d18
Message-Id: <174432552212.3849546.746624842195787097.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 22:52:02 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 10 Apr 2025 23:03:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-04-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/54a012b6223580c74b77f3dc2a7c6b3c29084d18

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
